import 'package:dotestowania/app/features/forecast_weather_page/forecast_weather_page.dart';
import 'package:flutter/material.dart';

class ThirdDayWidget extends StatelessWidget {
  const ThirdDayWidget({
    super.key,
    required this.widget,
  });

  final ForecastWeatherPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Text('Date :'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.weatherModel.weekday3.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Image.network(
                    widget.weatherModel.icon_url_day3,
                    scale: 1.0,
                  ),
                  Text(' Condition : ',
                      style: Theme.of(context).textTheme.labelLarge),
                  Text(widget.weatherModel.condition_day3.toString(),
                      style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Max Temp of Day:',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: widget.weatherModel.maxtemp_c_day3.toString(),
                          style: Theme.of(context).textTheme.labelLarge),
                      TextSpan(
                          text: ' °C / ',
                          style: Theme.of(context).textTheme.labelLarge),
                      TextSpan(
                          text: widget.weatherModel.maxtemp_f_day3.toString(),
                          style: Theme.of(context).textTheme.labelLarge),
                      TextSpan(
                          text: ' °F',
                          style: Theme.of(context).textTheme.labelLarge),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(' Sunrise / Sunset :',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: widget.weatherModel.sunrise_day3.toString(),
                        style: Theme.of(context).textTheme.labelLarge),
                    TextSpan(
                        text: ' / ',
                        style: Theme.of(context).textTheme.labelLarge),
                    TextSpan(
                        text: widget.weatherModel.sunset_day3.toString(),
                        style: Theme.of(context).textTheme.labelLarge),
                  ])),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Wind Speed 💨 : ',
                  style: Theme.of(context).textTheme.labelLarge),
              Text(
                widget.weatherModel.wind_day3.toString(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pressure 💤 : ',
                  style: Theme.of(context).textTheme.labelLarge),
              Text(
                widget.weatherModel.pressure_day3.toString(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Air Quality 🍃 : ',
                  style: Theme.of(context).textTheme.labelLarge),
              Text(
                widget.weatherModel.airquality_day3.toString(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
