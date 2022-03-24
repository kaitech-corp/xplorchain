import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../locator.dart';


///Initializer function
void projectInitializer() async {

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: dotenv.env['apiKey'].toString(),
      authDomain: dotenv.env['authDomain'].toString(),
      projectId: dotenv.env['projectId'].toString(),
      storageBucket: dotenv.env['storageBucket'].toString(),
      messagingSenderId: dotenv.env['messagingSenderId'].toString(),
      appId: dotenv.env['appId'].toString(),
      measurementId: dotenv.env['measurementId'].toString()
  ));

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);

  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // Bloc.observer = CustomBlocObserver();
}