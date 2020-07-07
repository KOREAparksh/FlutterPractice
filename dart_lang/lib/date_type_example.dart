void main() {
  String str1 = 'flutter';
  String str2 = 'google';
  String plus = str1 + ' ' + str2;
  int len = plus.length;
  print(plus + ' => lenght : $len');

  bool a = true;
  bool b = false;
  bool chk = a && b;
  print('chk is $chk');

  var strLen = len;
  var text = str1;
  var check = chk;
  var variavle = text;
  print('$strLen, $text, $check, $variavle');

  //variable = chk;
  //print('$variable');
}
