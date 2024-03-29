import 'package:dotestowania/app/features/forecast_weather_page/forecast_weather_page.dart';
import 'package:flutter/material.dart';

class FirstDaySecondContainer extends StatelessWidget {
  const FirstDaySecondContainer({
    super.key,
    required this.widget,
  });

  final ForecastWeatherPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [Colors.white60, Colors.white10],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 3, color: Colors.white30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const Text(' 🌞 '),
                  Text(
                    widget.weatherModel.sunrise_day1.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  const Text(' 🌛 '),
                  Text(
                    widget.weatherModel.sunset_day1.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('Wind Speed(max): ',
                      style: Theme.of(context).textTheme.labelLarge),
                  Text(
                    widget.weatherModel.wind_day1.toString(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('Pressure(noon): ',
                      style: Theme.of(context).textTheme.labelLarge),
                  Text(
                    widget.weatherModel.pressure_day1.toString(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('Air Quality: ',
                      style: Theme.of(context).textTheme.labelLarge),
                  Text(
                    widget.weatherModel.airquality_day1.toString(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
