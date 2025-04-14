import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/platform/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnection])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnection mockInternetConnection;

  setUp(() {
    mockInternetConnection = MockInternetConnection();
    networkInfo = NetworkInfoImpl(internetConnection: mockInternetConnection);
  });

  group('isConnected', () {
    test('should forward the call to InternetConnection.hasInternetAccess',
        () async {
      // arrange
      when(mockInternetConnection.hasInternetAccess)
          .thenAnswer((_) async => true);
      // act
      final result = await networkInfo.isConnected;
      // assert
      verify(mockInternetConnection.hasInternetAccess);
      expect(result, true);
    });

    test('should return false when there is no internet connection', () async {
      // arrange
      when(mockInternetConnection.hasInternetAccess)
          .thenAnswer((_) async => false);
      // act
      final result = await networkInfo.isConnected;
      // assert
      verify(mockInternetConnection.hasInternetAccess);
      expect(result, false);
    });
  });
}

