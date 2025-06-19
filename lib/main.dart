import 'package:auvnet/core/services/custom_bloc_observer.dart';
import 'package:auvnet/core/services/get_it_service.dart';
import 'package:auvnet/core/utils/app_constants.dart';
import 'package:auvnet/firebase_options.dart';
import 'package:auvnet/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.settingsBox);
  await Hive.openBox(AppConstants.authBox);

  Bloc.observer = CustomBlocObserver();
  runApp(const NawelApp());
}
