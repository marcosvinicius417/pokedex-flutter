import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get baseUrl => _get('BASE_URL');
  static String _get(String name) => dotenv.env[name] ?? '';
}
