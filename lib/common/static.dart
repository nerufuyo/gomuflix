import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

// Enum State
enum RequestState { empty, loading, loaded, error }

// Route Module for Widget
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

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

// Exception Object
class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
