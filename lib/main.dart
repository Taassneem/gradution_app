import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/flutter_tts.dart';
import 'package:gradution_app/core/utils/local_notification.dart';
import 'package:gradution_app/simple_bloc_observer.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'core/app/gradution_app.dart';
import 'core/utils/servive_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSreviceLocator();
  await getIt<CacheHelper>().init();
  Bloc.observer = SimpleBLocObserver();
  FlutterTtsMe.configureTts(setSpeechRate: 0.5, setVolume: 0.8);
  await LocalNotificationService.init();
  tz.initializeTimeZones();
  runApp(const MyApp());
}
