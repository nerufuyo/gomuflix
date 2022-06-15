import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

// Api
const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
const baseUrl = 'https://api.themoviedb.org/3';

// State Enum
enum RequestState { empty, loading, loaded, error }

// Modal Route
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

// Server Exception
class ServerException implements Exception {}

// Database Exception
class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

// Failure Condition
abstract class FailureCondition extends Equatable {
  final String message;

  const FailureCondition(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends FailureCondition {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends FailureCondition {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends FailureCondition {
  const DatabaseFailure(String message) : super(message);
}

// Mapper
abstract class Mapper<I, O> {
  O map(I input);
}

abstract class ListMapper<I, O> extends Mapper<List<I>, List<O>> {}

class ListMapperImpl<I, O> implements ListMapper<I, O> {
  final Mapper<I, O> mapper;

  ListMapperImpl(this.mapper);

  @override
  List<O> map(List<I> input) {
    return input.map((e) => mapper.map(e)).toList();
  }
}

abstract class NullableInputListMapper<I, O> extends Mapper<List<I>?, List<O>> {
}

class NullableInputListMapperImpl<I, O>
    implements NullableInputListMapper<I, O> {
  final Mapper<I, O> mapper;

  NullableInputListMapperImpl(this.mapper);

  @override
  List<O> map(List<I>? input) {
    if (input == null) {
      return [];
    }
    return input.map((e) => mapper.map(e)).toList();
  }
}

abstract class NullableOutputListMapper<I, O>
    extends Mapper<List<I>, List<O>?> {}

class NullableOutputListMapperImpl<I, O>
    implements NullableOutputListMapper<I, O> {
  final Mapper<I, O> mapper;

  NullableOutputListMapperImpl(this.mapper);

  @override
  List<O>? map(List<I> input) {
    if (input.isEmpty) {
      return null;
    }

    input.map((e) => mapper.map(e));
    return null;
  }
}

// Certificate
const certificate = """
-----BEGIN CERTIFICATE-----
MIIF5zCCBM+gAwIBAgIQAdKnBRs48TrGZbcfFRKNgDANBgkqhkiG9w0BAQsFADBG
MQswCQYDVQQGEwJVUzEPMA0GA1UEChMGQW1hem9uMRUwEwYDVQQLEwxTZXJ2ZXIg
Q0EgMUIxDzANBgNVBAMTBkFtYXpvbjAeFw0yMTEwMjEwMDAwMDBaFw0yMjExMTgy
MzU5NTlaMBsxGTAXBgNVBAMMECoudGhlbW92aWVkYi5vcmcwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQC8Ec+A4PYy8acf0O0ebSymr7jvuwlpv9AE4hHi
0/zpeHn+oRQcQ950dPPkiFTyxGQ1ZaaWpujOOMhXEj7Y9qX7Q6hYGv3Y2XQbErba
WG0dYZOT5LVxd6Fedj/TcyICVDU2suK6vqndug1XUqTRsfMTY994gHWf6QL2+VL0
wFIfUcbpxzRhYLOIEmPlIxPpdzDvrh3cX73U0VvDIycbmxUgI/DkdqFyE93QJafK
bD2qa+szpXicUHAGf3u+wLdEuXHwZ1hAjsheOW5+IciMKYCybSM0pm5Ik90et75B
ye8vY9sQukK6uGY5Bm9upYJhco3cTbYJTadKTZ+ukVMqRfz3AgMBAAGjggL6MIIC
9jAfBgNVHSMEGDAWgBRZpGYGUqB7lZI8o5QHJ5Z0W/k90DAdBgNVHQ4EFgQUbBJ2
pTVTIhbl/i1hSGCoJQJTUaAwKwYDVR0RBCQwIoIQKi50aGVtb3ZpZWRiLm9yZ4IO
dGhlbW92aWVkYi5vcmcwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUF
BwMBBggrBgEFBQcDAjA9BgNVHR8ENjA0MDKgMKAuhixodHRwOi8vY3JsLnNjYTFi
LmFtYXpvbnRydXN0LmNvbS9zY2ExYi0xLmNybDATBgNVHSAEDDAKMAgGBmeBDAEC
ATB1BggrBgEFBQcBAQRpMGcwLQYIKwYBBQUHMAGGIWh0dHA6Ly9vY3NwLnNjYTFi
LmFtYXpvbnRydXN0LmNvbTA2BggrBgEFBQcwAoYqaHR0cDovL2NydC5zY2ExYi5h
bWF6b250cnVzdC5jb20vc2NhMWIuY3J0MAwGA1UdEwEB/wQCMAAwggF9BgorBgEE
AdZ5AgQCBIIBbQSCAWkBZwB1ACl5vvCeOTkh8FZzn2Old+W+V32cYAr4+U1dJlwl
XceEAAABfKGE524AAAQDAEYwRAIgUuAFRBhoFIqgzBGJg12YDv26moS9xRx0UmYe
VOi3YVECIGigEG/HSrh+Jhw+pj8GrPji5zLZev/NhFbgAI9Z+JigAHUAQcjKsd8i
RkoQxqE6CUKHXk4xixsD6+tLx2jwkGKWBvYAAAF8oYTnXwAABAMARjBEAiBnWphw
CrLg7u6jOnaxRRQ0A7ESan6hbsDiPg+tUmoo5QIgOKufQRsQDiw8COBmdDKjQxcJ
Cwj0RnnE+JWKBKjD8tgAdwDfpV6raIJPH2yt7rhfTj5a6s2iEqRqXo47EsAgRFwq
cwAAAXyhhOeyAAAEAwBIMEYCIQClg2eAirkVpLAsrz7a97zxraww48oc1AnCx/07
4YD0jAIhANtSG6mNHQ3Qk85GEfyl4dI1sAJ8gjOAI4kG+ZbR5iFYMA0GCSqGSIb3
DQEBCwUAA4IBAQA+0VPryDt08DgXGPiQc/LVh2aqx0Si0wylNF7zgVtBh2nzdPV7
18Qex5uK+Z4VjnBFzLQ7wUkLh8MNi2uJmxyX0tdhATJ2sdGieHuGdcJnjZYHMXqP
AAHoVgjJSWWhy+t66cPauipX2dR0b4Ul0cz42aRlmpExJwRqm7jCtpaJU3nuxOwN
jia+Kff2MpLspB3nHmHOZ2gvwU05oiZQvnranwshboDhCDV3ucFX4IKPr74+1P8l
DUpiVEdsyxDA9Sbkc2QS57dWiD0Ju55Sxhhd1uSHi4aqKaFpAA4XZr4edUwWFE4c
4JJi1ufB/lOcf+G5uV2HrO27/FScF/8dZyzy
-----END CERTIFICATE-----
""";
