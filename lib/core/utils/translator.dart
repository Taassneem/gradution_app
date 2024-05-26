import 'package:translator/translator.dart';

class Translator {
  GoogleTranslator translator = GoogleTranslator();
  Future<String> translate(
      {required String text,
      required String langTo,
      required String langFrom}) async {
    Translation translation =
        await translator.translate(text, to: langTo, from: langFrom);
    return translation.text;
  }
}
