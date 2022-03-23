class ApiConstants {
  static String uriString = "https://clist.by/api/v2/contest/";
  static Uri uri = Uri.parse(uriString);
  static String authorization =
      "ApiKey hanafedeil:90f6865484587566caee22ab1734f5a54e043947";
  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': authorization
  };
}

class ErrorMessages {
  static String serverFailureMessage = "A server failure occured";
  static String cacheFailureMessage = "A cache failure occured";
}
