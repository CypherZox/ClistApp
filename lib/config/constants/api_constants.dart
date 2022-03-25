class ApiConstants {
  static Uri uri(String startLimit) => Uri.parse(
      "https://clist.by/api/v2/contest/?limit=100&start__gt=$startLimit&order_by=event");
  static Uri uriResource =
      Uri.parse("https://clist.by/api/v2/resource/?limit=300");
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
