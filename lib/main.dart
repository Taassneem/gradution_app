import 'package:flutter/material.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';

import 'core/app/gradution_app.dart';
import 'core/utils/servive_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSreviceLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}
