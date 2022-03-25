import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  DataConnectionChecker get dtaConnectionChecker => DataConnectionChecker();
  @lazySingleton
  http.Client get httpClient => http.Client();
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
