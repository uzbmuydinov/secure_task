import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constans {
  static String apiKey = dotenv.env['NEWS_API']!;
}