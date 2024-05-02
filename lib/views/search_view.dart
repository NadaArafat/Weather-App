import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
              log(value);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              hintText: 'Enter city name',
              label: Text('Search'),
            ),
          ),
        ),
      ),
    );
  }
}
