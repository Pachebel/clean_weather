import 'package:clean_weather/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';

class AndroidHomeView extends IHomeView {
  const AndroidHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Android Home View'),
    );
  }
}
