import 'package:clean_weather/app/modules/start/start_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  final StartViewModel viewModel = Modular.get<StartViewModel>();

  @override
  Widget build(BuildContext context) {
    // TODO(pachebel): implement error handling
    return Scaffold(
      body: ValueListenableBuilder(
        builder: (context, value, child) {
          return viewModel.weekForecast.value == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: viewModel.weekForecast.value?.daily?.length ?? 0,
                  itemBuilder: (context, index) {
                    final weather = viewModel.weekForecast.value?.daily?[index];
                    return ListTile(
                      title: Text(weather?.weather?.first.description ?? ''),
                      subtitle: Text(weather?.temp?.day.toString() ?? ''),
                    );
                  },
                );
        },
        valueListenable: viewModel.weekForecast,
      ),
    );
  }
}
