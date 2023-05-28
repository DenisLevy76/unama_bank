import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unama_bank/models/currencyResponse.dart';

Future<CurrencyResponse> getCurrency() async {
  var url = "https://api.hgbrasil.com/finance?format=json&key=df4d2660}";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return CurrencyResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Request error');
  }
}
