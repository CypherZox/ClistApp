class ApiConstants {
  static String uriString =
      "https://clist.by/api/v1/contest/?username=hanafedeil&api_key=90f6865484587566caee22ab1734f5a54e043947/";
  static Uri uri = Uri.parse(uriString);
  static Map<String, String> header = {'Content-Type': 'application/json'};
}

class ErrorMessages {
  static String SERVER_FAILURE_MESSAGE = "A server failure accured";
  static String CACHE_FAILURE_MESSAGE = "A cache failure accured";
}
