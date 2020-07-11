import 'dart:convert';
import 'dart:io';

void main() {
  String jsonStr = """
  {
    "basket" : {
      "apple" : 50,
      "banana" : 10,
      "grape" : 5
    }
  }
  """;

  Map json = jsonDecode(jsonStr);
  print('$json');

  Map basket = json["basket"];
  print('$basket');

  basket.update('apple', (value) => 1000);
  print('$basket');
}
