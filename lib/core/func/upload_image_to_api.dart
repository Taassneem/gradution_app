import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';

Future upLoadImageToApi(XFile image) {
  return MultipartFile.fromFile(image.path,
      // contentType: MediaType.parse(lookupMimeType(image.path)),
      filename: image.path.split('/').last);
}
