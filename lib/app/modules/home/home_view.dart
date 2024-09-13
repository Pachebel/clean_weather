import 'dart:io';

import 'package:clean_weather/app/modules/home/pages/android_home_view.dart';
import 'package:clean_weather/app/modules/home/pages/ios_home_view.dart';
import 'package:flutter/material.dart';

// extends StatelessWidget so android and ios
//implementations can be used as consts
abstract class IHomeView extends StatelessWidget {
  const IHomeView({super.key});

  @override
  Widget build(BuildContext context);
}

class HomeViewFactory {
  IHomeView buildHomeView() {
    if (Platform.isAndroid) return const AndroidHomeView();
    if (Platform.isIOS) return const IOSHomeView();
    throw UnsupportedError('Unsupported platform');
  }
}

class HomeView extends IHomeView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final factory = HomeViewFactory();
    return factory.buildHomeView();
  }
}
