import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowWeatherWidget extends StatelessWidget {
  const ShowWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Text('Temperature:',
                    style: Theme.of(context).textTheme.subtitle2),
                Text(
                  weatherModel.temperature.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('City:', style: Theme.of(context).textTheme.subtitle2),
                Text(
                  weatherModel.city,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 20),
                Text('Condition:',
                    style: Theme.of(context).textTheme.subtitle1),
                Text(
                  weatherModel.condition.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                Text('Air Quality (1-6 scale/Higher = Unhealthy):',
                    style: Theme.of(context).textTheme.subtitle1),
                Text(
                  weatherModel.airquality.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ));
      },
    );
  }
}