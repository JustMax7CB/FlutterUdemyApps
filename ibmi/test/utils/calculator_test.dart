import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imbi/utils/calculator.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  test(
      'Give height and weight When calculateBMI function invoked Then correct BMI returned',
      () {
    // Arrange
    const int height = 70, weight = 160;
    // Act
    double bmi = calculateBMI(height, weight);
    // Assert
    expect(bmi, 326.530612244898);
  });

  test('Given URL When calculateBMIAsync invoked Then correct BMI returned',
      () async {
    // Arrange
    final _dioMock = DioMock();
    when(() => _dioMock.get('https://www.jsonkeeper.com/b/AKFA')).thenAnswer(
      (_) => Future.value(
        Response(
          requestOptions:
              RequestOptions(path: 'https://www.jsonkeeper.com/b/AKFA'),
          data: {
            "Sergio Ramos": [72, 165]
          },
        ),
      ),
    );
    // Act
    var _result = await calculateBMIAsync(_dioMock);
    // Assert
    expect(_result, 318.28703703703707);
  });
}
