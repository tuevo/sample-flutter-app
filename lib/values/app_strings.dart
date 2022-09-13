import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  static final String appName = dotenv.env['APP_NAME'] ?? 'App name';
}
