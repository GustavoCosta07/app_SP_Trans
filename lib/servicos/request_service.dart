import 'package:http/http.dart' as http;

class RequestService {
  static Future<dynamic> post({url, headers = null}) async {
    var response = await http.post(Uri.parse(url), headers: headers ?? {});
    return response;
  }

  static Future<dynamic> get({url, headers = null}) async {
    var response = await http.get(Uri.parse(url), headers: headers ?? {});
    return response;
  }
}
