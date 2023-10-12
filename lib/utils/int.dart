import 'package:flutter/material.dart';
import 'package:gojek_duplicates/data/services/navigator_service.dart';

double orientationSize(double landScape, double portrait) =>
    MediaQuery.of(NavigatorService.navigatorKey.currentContext!).orientation ==
            Orientation.landscape
        ? landScape
        : portrait;
