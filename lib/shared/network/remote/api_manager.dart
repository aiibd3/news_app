import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/source_response.dart';
import '../../constants/constants.dart';

class apiManager {
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "apiKey": apiKey,
    });

    Response response = await http.get(url);
    var body = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(body);
    return sourceResponse;
  }
}
