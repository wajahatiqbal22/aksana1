import 'package:flutter/cupertino.dart';

getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getFormHeaderTextStyle() {
  return const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 2);
}
