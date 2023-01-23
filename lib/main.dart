import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/movie_app.dart';

void main() {
  init();
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  runApp( MovieApp());
}

