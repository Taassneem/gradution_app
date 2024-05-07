import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/simple_bloc_observer.dart';

import 'core/app/gradution_app.dart';
import 'core/utils/servive_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSreviceLocator();
  Bloc.observer = SimpleBLocObserver();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}
