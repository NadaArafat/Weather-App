import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'SearchView');
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is InitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherFailureState) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const WeatherInfoBody();
          }
        }));
  }
}
