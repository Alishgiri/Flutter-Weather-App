import 'package:flutter_dotenv/flutter_dotenv.dart';

final dotEnv = DotEnv();
final appId = dotEnv.env['APPID'];
