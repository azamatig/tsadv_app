import 'dart:ui';

import 'package:flutter/material.dart';

String langValue;
String restApiUrl = "http://192.168.88.94:8085/tsadv/rest/";
String aToken;
String userId;

final Color mainBackgroundColor =
    Color(int.parse("#F4F2F0".substring(1, 7), radix: 16) + 0xFF000000);

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String connectionTimeCode = "CONNECTION_TIME_OUT";
String accessError = "ACCESS_ERROR";
