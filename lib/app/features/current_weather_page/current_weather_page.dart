import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.white60, Colors.white10],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 3, color: Colors.white30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              Image.network(
                weatherModel.icon_url_day0,
                scale: 0.7,
              ),
              Text('Temperature (°C / °F):',
                  style: Theme.of(context).textTheme.titleSmall),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: weatherModel.temperature_c.toString(),
                      style: Theme.of(context).textTheme.displaySmall),
                  TextSpan(
                      text: ' °C / ',
                      style: Theme.of(context).textTheme.displaySmall),
                  TextSpan(
                      text: weatherModel.temperature_f.toString(),
                      style: Theme.of(context).textTheme.displaySmall),
                  TextSpan(
                      text: ' °F',
                      style: Theme.of(context).textTheme.displaySmall),
                ]),
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: ' Condition : ',
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextSpan(
                      text: weatherModel.condition_day0.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                ]),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('City:', style: Theme.of(context).textTheme.titleSmall),
              Text(
                weatherModel.city,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                weatherModel.country.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('[Local Time & Date] : ',
                        style: Theme.of(context).textTheme.labelLarge),
                    Text(
                      weatherModel.weekday0.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text(' Sunrise / Sunset :',
                  style: Theme.of(context).textTheme.titleLarge),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: weatherModel.sunriseday0.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextSpan(
                      text: ' / ',
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextSpan(
                      text: weatherModel.sunsetday0.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                ])),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text("💨 Wind Speed [Actual in KM/H]:",
                  style: Theme.of(context).textTheme.labelLarge),
              Text(weatherModel.wind_day0.toString(),
                  style: Theme.of(context).textTheme.headlineSmall),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('💤 Pressure [1013,25 hPa = Most Healthy]:',
                  style: Theme.of(context).textTheme.labelLarge),
              Text(weatherModel.pressure_day0.toString(),
                  style: Theme.of(context).textTheme.headlineSmall),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('🍃 Air Quality [1-6 scale/Higher=Unhealthy]:',
                  style: Theme.of(context).textTheme.labelLarge),
              Text(weatherModel.airquality_day0.toString(),
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        );
      },
    );
  }
}
