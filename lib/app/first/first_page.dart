import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/first/cubit/first_cubit.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/remote_data_sources/weather_remote_data_source.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstCubit(
        WeatherRepository(WeatherRemoteDataSource()),
      ),
      child: BlocListener<FirstCubit, FirstState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage =
                state.errorMessage ?? 'Whoopsy...something went wrong';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<FirstCubit, FirstState>(
          builder: (context, state) {
            final weatherModel = state.model;
            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Heavy Cloud",
                  ),
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8),
                ),
                body: Center(child: Builder(builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text('Loading');
                  }

                  return SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (weatherModel != null)
                          FirstWeatherWidget(
                            weatherModel: weatherModel,
                          ),
                        SecondWeatherWidget()
                      ],
                    ),
                  );
                })));
          },
        ),
      ),
    );
  }
}

class FirstWeatherWidget extends StatelessWidget {
  const FirstWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCubit, FirstState>(
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
                Text('Air Quality(1-6 scale/Much Higher = More Unhealthy):',
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

class SecondWeatherWidget extends StatelessWidget {
  SecondWeatherWidget({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('images/cloud2.jpg'),
            radius: 65,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Check the weather and other features",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline5,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter The City"),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<FirstCubit>()
                  .getWeatherModel(city: _controller.text);
              _controller.clear();
            },
            child: const Text('Check'),
          )
        ],
      ),
    );
  }
}
