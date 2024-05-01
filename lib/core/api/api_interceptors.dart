import 'package:dio/dio.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.authorization] =
        getIt.get<CacheHelper>().getData(key: ApiKey.loginToken) != null
            ? 'e_${getIt.get<CacheHelper>().getData(key: ApiKey.loginToken)}'
            : null;
    super.onRequest(options, handler);
  }
}
