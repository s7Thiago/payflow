import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';

class BarCodeScannerController {
  final statusNotifier =
      ValueNotifier<BarCodeScannerStatus>(BarCodeScannerStatus());

  BarCodeScannerStatus get status => statusNotifier.value;

  set status(BarCodeScannerStatus status) => statusNotifier.value = status;

  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  CameraController? cameraController;
  InputImage? imagePicker;

// retorna a camera própria disponível
  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
          (element) => element.lensDirection == CameraLensDirection.back);
      cameraController =
          CameraController(camera, ResolutionPreset.max, enableAudio: false);
      await cameraController!.initialize();
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarCodeScannerStatus.error(e.toString());
    }
  }

  void scanWithCamera() {
    status = BarCodeScannerStatus.available();
    // Se em 10 segundos não ocorreu uma leitura, para o uso da câmera
    Future.delayed(const Duration(seconds: 10)).then((value) {
      if (status.hasBarcode == false) {
        status = BarCodeScannerStatus.error("Timeout de leitura de boleto");
      }
    });
  }

  Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);

      var barcode;
      for (Barcode item in barcodes) {
        barcode = item.value.displayValue;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarCodeScannerStatus.barcode(barcode);
        cameraController!.dispose();
        await barcodeScanner.close();
      }

      return;
    } catch (e) {
      print("ERRO DA LEITURA $e");
    }
  }

  // Faz a leitura do código de barras a partir de uma imagem selecionada da galeria
  void scanWithImagePicker() async {
    // chama o image picker para recuperar uma imagem da galeria
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    // pega a imagem da galeria através do image picker
    final inputImage = InputImage.fromFilePath(response!.path);
    // Avisa se é possível ou não fazer a leitura do código de barras
    scannerBarCode(inputImage);
  }

  // 'ouve' a imagem que está sendo recebida da câmera
  void listenCamera() {
    if (cameraController!.value.isStreamingImages == false) {
      cameraController!.startImageStream((cameraImage) async {
        if (status.stopScanner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(
                cameraImage.width.toDouble(), cameraImage.height.toDouble());
            const InputImageRotation imageRotation =
                InputImageRotation.Rotation_0deg;
            final InputImageFormat inputImageFormat =
                InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
                    InputImageFormat.NV21;
            final planeData = cameraImage.planes.map(
              (Plane plane) {
                return InputImagePlaneMetadata(
                  bytesPerRow: plane.bytesPerRow,
                  height: plane.height,
                  width: plane.width,
                );
              },
            ).toList();

            final inputImageData = InputImageData(
              size: imageSize,
              imageRotation: imageRotation,
              inputImageFormat: inputImageFormat,
              planeData: planeData,
            );
            final inputImageCamera = InputImage.fromBytes(
                bytes: bytes, inputImageData: inputImageData);
            scannerBarCode(inputImageCamera);
          } catch (e) {
            print(e);
          }
        }
      });
    }
  }

  // Fecha todos os recursos abertos
  void dispose() {
    statusNotifier.dispose();
    barcodeScanner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
