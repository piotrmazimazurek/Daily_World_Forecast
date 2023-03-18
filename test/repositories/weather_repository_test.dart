import 'package:dotestowania/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherDataSource extends Mock implements WeatherRemoteDataSource {}

void main() {
  late WeatherRepository sut;
  late MockWeatherDataSource dataSource;

  setUp(() {
    dataSource = MockWeatherDataSource();
    sut = WeatherRepository(weatherRemoteDataSource: dataSource);
  });

  group('getWeatherModel', () {
    test('should return null when weather data is null', () async {
      when(() => dataSource.getWeatherData(city: 'city'))
          .thenAnswer((_) async => null);

      final results = await sut.getWeatherModel(city: 'city');

      expect(results, isNull);
    });
  });
}