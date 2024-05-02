import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather/views/home_view.dart';
import 'package:weather/views/search_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return GetWeatherCubit();
      },
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                ),
              ),
              routes: {
                'SearchView': (context) => const SearchView(),
                'HomeView': (context) => const HomeView(),
              },
              debugShowCheckedModeBanner: false,
              initialRoute: 'HomeView',
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.yellow;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
    case 'mist':
    case 'fog':
    case 'freezing fog':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.lightBlue;
    case 'patchy snow possible':
    case 'blowing snow':
    case 'blizzard':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.grey;
    case 'thundery outbreaks possible':
    case 'patchy freezing drizzle possible':
    case 'patchy rain possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.red;
    default:
      return Colors.blueGrey;
  }
}
