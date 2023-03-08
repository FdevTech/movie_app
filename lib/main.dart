import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/movie_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  FlutterError.onError = (errorDetails){
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError =(error,stack){
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp( MovieApp());

}


