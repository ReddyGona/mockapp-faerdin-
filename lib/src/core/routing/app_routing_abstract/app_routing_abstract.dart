import 'package:flutter/material.dart';
import 'package:mockapp/src/core/utils/typedef/typedef.dart';

abstract class AppRoutingAbstract {
  void navigate(BuildContext context, String path);
  void navigateWithPush(BuildContext context, String path);
  void navigateWithQueryParams(
    BuildContext context,
    String path,
    DataMap queryParameters,
  );
  void namedNavigation(
    BuildContext context, {
    required String screenName,
    Map<String, String> pathParameters = const <String, String>{},
    DataMap queryParameters = const <String, dynamic>{},
    Object? extra,
  });
}
