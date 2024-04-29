import 'package:dio/dio.dart';
import 'package:gradution_app/core/api/dio_consumer.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:gradution_app/features/task/data/repo/task_repo_impl.dart';

final getIt = GetIt.instance;
void setupSreviceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<TaskRepoImpl>(
      TaskRepoImpl(api: getIt.get<DioConsumer>()));
}
