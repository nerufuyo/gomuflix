// Mocks generated by Mockito 5.2.0 from annotations
// in gomumovie/test/presentation/bloc/gomu_movie_watchlist_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:bloc/bloc.dart' as _i6;
import 'package:dartz/dartz.dart' as _i4;
import 'package:gomucore/gomucore.dart' as _i7;
import 'package:gomumovie/domain/entities/gomu_movie_entity.dart' as _i8;
import 'package:gomumovie/domain/usecases/get_gomu_movie_watchlist.dart' as _i2;
import 'package:gomumovie/gomumovie.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetGomuflixMovieWatchlistCase_0 extends _i1.Fake
    implements _i2.GetGomuflixMovieWatchlistCase {}

class _FakeGetGomuflixMovieWatchlistStatusCase_1 extends _i1.Fake
    implements _i2.GetGomuflixMovieWatchlistStatusCase {}

class _FakeSaveGomuflixMoviewatchlist_2 extends _i1.Fake
    implements _i2.SaveGomuflixMoviewatchlist {}

class _FakeRemoveGomuflixMoviewatchlist_3 extends _i1.Fake
    implements _i2.RemoveGomuflixMoviewatchlist {}

class _FakeGomuMovieWatchlistState_4 extends _i1.Fake
    implements _i3.GomuMovieWatchlistState {}

class _FakeGomuflixMovieRepository_5 extends _i1.Fake
    implements _i3.GomuflixMovieRepository {}

class _FakeEither_6<L, R> extends _i1.Fake implements _i4.Either<L, R> {}

/// A class which mocks [GomuMovieWatchlistBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuMovieWatchlistBloc extends _i1.Mock
    implements _i3.GomuMovieWatchlistBloc {
  MockGomuMovieWatchlistBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetGomuflixMovieWatchlistCase get getGomuMovieWatchlistCase =>
      (super.noSuchMethod(Invocation.getter(#getGomuMovieWatchlistCase),
              returnValue: _FakeGetGomuflixMovieWatchlistCase_0())
          as _i2.GetGomuflixMovieWatchlistCase);
  @override
  _i2.GetGomuflixMovieWatchlistStatusCase get getGomuMovieWatchlistStatusCase =>
      (super.noSuchMethod(Invocation.getter(#getGomuMovieWatchlistStatusCase),
              returnValue: _FakeGetGomuflixMovieWatchlistStatusCase_1())
          as _i2.GetGomuflixMovieWatchlistStatusCase);
  @override
  _i2.SaveGomuflixMoviewatchlist get saveGomuMovieWatchlistCase =>
      (super.noSuchMethod(Invocation.getter(#saveGomuMovieWatchlistCase),
              returnValue: _FakeSaveGomuflixMoviewatchlist_2())
          as _i2.SaveGomuflixMoviewatchlist);
  @override
  _i2.RemoveGomuflixMoviewatchlist get removeGomuMovieWatchlistCase =>
      (super.noSuchMethod(Invocation.getter(#removeGomuMovieWatchlistCase),
              returnValue: _FakeRemoveGomuflixMoviewatchlist_3())
          as _i2.RemoveGomuflixMoviewatchlist);
  @override
  _i3.GomuMovieWatchlistState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeGomuMovieWatchlistState_4())
          as _i3.GomuMovieWatchlistState);
  @override
  _i5.Stream<_i3.GomuMovieWatchlistState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i3.GomuMovieWatchlistState>.empty())
          as _i5.Stream<_i3.GomuMovieWatchlistState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i3.GomuMovieWatchlistEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i3.GomuMovieWatchlistEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i3.GomuMovieWatchlistState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i3.GomuMovieWatchlistEvent>(
          _i6.EventHandler<E, _i3.GomuMovieWatchlistState>? handler,
          {_i6.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i6.Transition<_i3.GomuMovieWatchlistEvent,
                  _i3.GomuMovieWatchlistState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void onChange(_i6.Change<_i3.GomuMovieWatchlistState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}

/// A class which mocks [GetGomuflixMovieWatchlistCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetGomuflixMovieWatchlistCase extends _i1.Mock
    implements _i2.GetGomuflixMovieWatchlistCase {
  MockGetGomuflixMovieWatchlistCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GomuflixMovieRepository get data =>
      (super.noSuchMethod(Invocation.getter(#data),
              returnValue: _FakeGomuflixMovieRepository_5())
          as _i3.GomuflixMovieRepository);
  @override
  set data(_i3.GomuflixMovieRepository? _data) =>
      super.noSuchMethod(Invocation.setter(#data, _data),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i4.Either<_i7.FailureCondition, List<_i8.GomuflixMovieEntity>>>
      watchlistAction() => (super.noSuchMethod(
          Invocation.method(#watchlistAction, []),
          returnValue:
              Future<_i4.Either<_i7.FailureCondition, List<_i8.GomuflixMovieEntity>>>.value(
                  _FakeEither_6<_i7.FailureCondition,
                      List<_i8.GomuflixMovieEntity>>())) as _i5
          .Future<_i4.Either<_i7.FailureCondition, List<_i8.GomuflixMovieEntity>>>);
}

/// A class which mocks [GetGomuflixMovieWatchlistStatusCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetGomuflixMovieWatchlistStatusCase extends _i1.Mock
    implements _i2.GetGomuflixMovieWatchlistStatusCase {
  MockGetGomuflixMovieWatchlistStatusCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GomuflixMovieRepository get data =>
      (super.noSuchMethod(Invocation.getter(#data),
              returnValue: _FakeGomuflixMovieRepository_5())
          as _i3.GomuflixMovieRepository);
  @override
  set data(_i3.GomuflixMovieRepository? _data) =>
      super.noSuchMethod(Invocation.setter(#data, _data),
          returnValueForMissingStub: null);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [SaveGomuflixMoviewatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveGomuflixMoviewatchlist extends _i1.Mock
    implements _i2.SaveGomuflixMoviewatchlist {
  MockSaveGomuflixMoviewatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GomuflixMovieRepository get data =>
      (super.noSuchMethod(Invocation.getter(#data),
              returnValue: _FakeGomuflixMovieRepository_5())
          as _i3.GomuflixMovieRepository);
  @override
  set data(_i3.GomuflixMovieRepository? _data) =>
      super.noSuchMethod(Invocation.setter(#data, _data),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i4.Either<_i7.FailureCondition, String>> saveWatchlisAction(
          _i8.GomuflixMovieDetailEntity? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlisAction, [movie]),
          returnValue: Future<_i4.Either<_i7.FailureCondition, String>>.value(
              _FakeEither_6<_i7.FailureCondition, String>())) as _i5
          .Future<_i4.Either<_i7.FailureCondition, String>>);
}

/// A class which mocks [RemoveGomuflixMoviewatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveGomuflixMoviewatchlist extends _i1.Mock
    implements _i2.RemoveGomuflixMoviewatchlist {
  MockRemoveGomuflixMoviewatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GomuflixMovieRepository get data =>
      (super.noSuchMethod(Invocation.getter(#data),
              returnValue: _FakeGomuflixMovieRepository_5())
          as _i3.GomuflixMovieRepository);
  @override
  set data(_i3.GomuflixMovieRepository? _data) =>
      super.noSuchMethod(Invocation.setter(#data, _data),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i4.Either<_i7.FailureCondition, String>> removeWatchlisAction(
          _i8.GomuflixMovieDetailEntity? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlisAction, [movie]),
          returnValue: Future<_i4.Either<_i7.FailureCondition, String>>.value(
              _FakeEither_6<_i7.FailureCondition, String>())) as _i5
          .Future<_i4.Either<_i7.FailureCondition, String>>);
}