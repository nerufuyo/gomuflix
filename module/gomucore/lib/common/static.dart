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
