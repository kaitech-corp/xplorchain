import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../locator.dart';


///Initializer function
void projectInitializer() async {

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyC2K_TtbMatLC-VV2mdksx_48H9GN9kInE",
      authDomain: "coherent-window-339921.firebaseapp.com",
      projectId: "coherent-window-339921",
      storageBucket: "coherent-window-339921.appspot.com",
      messagingSenderId: "1097855868527",
      appId: "1:1097855868527:web:31cd4803bd10a343b9f79a",
      measurementId: "G-N3V89M42VE"
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