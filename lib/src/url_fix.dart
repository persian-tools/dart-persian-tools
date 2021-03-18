/// Takes an URL in http/s , ws/s as String and fix the Persian characters in it
String urlFix(String url) {
  // Ensures the String is a url in http/s , ws/s
  var isURL = RegExp(r'(http\S+|ws\S+)').hasMatch(url);
  // Decode hole the url even though includes %20
  url = Uri.decodeFull(url);
  // If it was url, whitespace replaces with %20
  url = isURL ? url.replaceAll(RegExp(r'\s'), '%20') : url;
  return url;
}
