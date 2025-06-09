import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<T?> getApiResponse<T>({required String endpoint, required T Function(Map<String, dynamic>) fromJson}) async {
  try {
    final uri = Uri.parse(endpoint);

    final response = await http.get(uri);

    networkLog(url: uri.toString(), response: response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return fromJson(data);
    } else {
      errorLog('Failed status:${response.statusCode}');
      return null;
    }
  } catch (e) {
    errorLog(e);
    return null;
  }
}

networkLog({url, body, response}) {
  if (kDebugMode) {
    log("URL : $url");
    log("PAYLOAD : $body");
    log("RESPONSE : $response");
  }
}

errorLog(error) {
  if (kDebugMode) {
    log(error.toString());
  }
}
