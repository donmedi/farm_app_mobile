import 'package:flutter/material.dart';

class CustomRouters {
  static routePushWithWidget(context, Widget route, {Object? args}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => route));
  }

  static routePushWithWidgetReplace(context, Widget route, {Object? args}) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => route));
  }

  static routePushWithWidgetRemove(context, Widget routes, {Object? args}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => routes), (route) => false);
  }

  static routePushWithName(context, String route, {Object? args}) {
    Navigator.of(context).pushNamed(route, arguments: args);
  }

  static routePushWithNamedRemove(context, String route, {Object? args}) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }

  static routePushWithNameReplace(context, String route, {Object? args}) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static routePop(
    context,
  ) {
    Navigator.of(context).pop();
  }

  static routePushNamedRemoveTillDashbaord(context, Widget route) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => route),
        ModalRoute.withName('/dashboard'));
  }
}
