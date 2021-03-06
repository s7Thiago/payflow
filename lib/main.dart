import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app_widget.dart';

void main() {
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  State<AppFirebase> createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Checking for errors
          if (snapshot.hasError) {
            return const Material(
              child: Center(
                child: Text(
                  'Não foi possível inicializar o firebase',
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          }
          // Once complete, show the application
          else if (snapshot.connectionState == ConnectionState.done) {
            return AppWidget();
          }
          // Otherwise, show something whilst waiting initialization to complete
          else {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
