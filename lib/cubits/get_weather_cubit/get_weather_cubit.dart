import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeatherData(cityName: cityName);
      emit(WeatherLoadedState());
    } on Exception catch (e) {
      emit(
        WeatherFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
