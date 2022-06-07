// Mocks generated by Mockito 5.2.0 from annotations
// in gomutv/test/presentation/screen/gomu_tv_main_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:gomucore/gomucore.dart' as _i3;
import 'package:gomutv/gomutv.dart' as _i2;
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

class _FakeGetGomuflixTvListCase_0 extends _i1.Fake
    implements _i2.GetGomuflixTvListCase {}

class _FakeGetGomuflixTvWatchlistCase_1 extends _i1.Fake
    implements _i2.GetGomuflixTvWatchlistCase {}

/// A class which mocks [GomuflixTvListNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuflixTvListNotifier extends _i1.Mock
    implements _i2.GomuflixTvListNotifier {
  MockGomuflixTvListNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetGomuflixTvListCase get getGomuTvOnAirCase =>
      (super.noSuchMethod(Invocation.getter(#getGomuTvOnAirCase),
              returnValue: _FakeGetGomuflixTvListCase_0())
          as _i2.GetGomuflixTvListCase);
  @override
  set getGomuTvOnAirCase(_i2.GetGomuflixTvListCase? _getGomuTvOnAirCase) =>
      super.noSuchMethod(
          Invocation.setter(#getGomuTvOnAirCase, _getGomuTvOnAirCase),
          returnValueForMissingStub: null);
  @override
  _i2.GetGomuflixTvListCase get getGomuTvPopularCase =>
      (super.noSuchMethod(Invocation.getter(#getGomuTvPopularCase),
              returnValue: _FakeGetGomuflixTvListCase_0())
          as _i2.GetGomuflixTvListCase);
  @override
  set getGomuTvPopularCase(_i2.GetGomuflixTvListCase? _getGomuTvPopularCase) =>
      super.noSuchMethod(
          Invocation.setter(#getGomuTvPopularCase, _getGomuTvPopularCase),
          returnValueForMissingStub: null);
  @override
  _i2.GetGomuflixTvListCase get getGomuTvTopRatedCase =>
      (super.noSuchMethod(Invocation.getter(#getGomuTvTopRatedCase),
              returnValue: _FakeGetGomuflixTvListCase_0())
          as _i2.GetGomuflixTvListCase);
  @override
  set getGomuTvTopRatedCase(
          _i2.GetGomuflixTvListCase? _getGomuTvTopRatedCase) =>
      super.noSuchMethod(
          Invocation.setter(#getGomuTvTopRatedCase, _getGomuTvTopRatedCase),
          returnValueForMissingStub: null);
  @override
  _i2.GetGomuflixTvWatchlistCase get getGomuTvWatchlistCase =>
      (super.noSuchMethod(Invocation.getter(#getGomuTvWatchlistCase),
              returnValue: _FakeGetGomuflixTvWatchlistCase_1())
          as _i2.GetGomuflixTvWatchlistCase);
  @override
  set getGomuTvWatchlistCase(
          _i2.GetGomuflixTvWatchlistCase? _getGomuTvWatchlistCase) =>
      super.noSuchMethod(
          Invocation.setter(#getGomuTvWatchlistCase, _getGomuTvWatchlistCase),
          returnValueForMissingStub: null);
  @override
  List<_i2.GomuflixTvEntity> get onAirTvVar =>
      (super.noSuchMethod(Invocation.getter(#onAirTvVar),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  set onAirTvVar(List<_i2.GomuflixTvEntity>? _onAirTvVar) =>
      super.noSuchMethod(Invocation.setter(#onAirTvVar, _onAirTvVar),
          returnValueForMissingStub: null);
  @override
  List<_i2.GomuflixTvEntity> get popularTvVar =>
      (super.noSuchMethod(Invocation.getter(#popularTvVar),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  set popularTvVar(List<_i2.GomuflixTvEntity>? _popularTvVar) =>
      super.noSuchMethod(Invocation.setter(#popularTvVar, _popularTvVar),
          returnValueForMissingStub: null);
  @override
  List<_i2.GomuflixTvEntity> get topRatedTvVar =>
      (super.noSuchMethod(Invocation.getter(#topRatedTvVar),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  set topRatedTvVar(List<_i2.GomuflixTvEntity>? _topRatedTvVar) =>
      super.noSuchMethod(Invocation.setter(#topRatedTvVar, _topRatedTvVar),
          returnValueForMissingStub: null);
  @override
  List<_i2.GomuflixTvEntity> get watchlistTvVar =>
      (super.noSuchMethod(Invocation.getter(#watchlistTvVar),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  set watchlistTvVar(List<_i2.GomuflixTvEntity>? _watchlistTvVar) =>
      super.noSuchMethod(Invocation.setter(#watchlistTvVar, _watchlistTvVar),
          returnValueForMissingStub: null);
  @override
  List<_i2.GomuflixTvEntity> get gomuTv =>
      (super.noSuchMethod(Invocation.getter(#gomuTv),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  set gomuTv(List<_i2.GomuflixTvEntity>? _gomuTv) =>
      super.noSuchMethod(Invocation.setter(#gomuTv, _gomuTv),
          returnValueForMissingStub: null);
  @override
  _i3.RequestState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _i3.RequestState.empty) as _i3.RequestState);
  @override
  set state(_i3.RequestState? _state) =>
      super.noSuchMethod(Invocation.setter(#state, _state),
          returnValueForMissingStub: null);
  @override
  String get messageVar =>
      (super.noSuchMethod(Invocation.getter(#messageVar), returnValue: '')
          as String);
  @override
  set messageVar(String? _messageVar) =>
      super.noSuchMethod(Invocation.setter(#messageVar, _messageVar),
          returnValueForMissingStub: null);
  @override
  List<_i2.GomuflixTvEntity> get onAirTv =>
      (super.noSuchMethod(Invocation.getter(#onAirTv),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  List<_i2.GomuflixTvEntity> get popularTv =>
      (super.noSuchMethod(Invocation.getter(#popularTv),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  List<_i2.GomuflixTvEntity> get topRatedTv =>
      (super.noSuchMethod(Invocation.getter(#topRatedTv),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  List<_i2.GomuflixTvEntity> get watchlistTv =>
      (super.noSuchMethod(Invocation.getter(#watchlistTv),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  List<_i2.GomuflixTvEntity> get tv =>
      (super.noSuchMethod(Invocation.getter(#tv),
          returnValue: <_i2.GomuflixTvEntity>[]) as List<_i2.GomuflixTvEntity>);
  @override
  _i3.RequestState get gomuTvOnAirState =>
      (super.noSuchMethod(Invocation.getter(#gomuTvOnAirState),
          returnValue: _i3.RequestState.empty) as _i3.RequestState);
  @override
  _i3.RequestState get gomuTvPopularState =>
      (super.noSuchMethod(Invocation.getter(#gomuTvPopularState),
          returnValue: _i3.RequestState.empty) as _i3.RequestState);
  @override
  _i3.RequestState get gomuTvTopRatedState =>
      (super.noSuchMethod(Invocation.getter(#gomuTvTopRatedState),
          returnValue: _i3.RequestState.empty) as _i3.RequestState);
  @override
  _i3.RequestState get gomuTvWatchlistState =>
      (super.noSuchMethod(Invocation.getter(#gomuTvWatchlistState),
          returnValue: _i3.RequestState.empty) as _i3.RequestState);
  @override
  String get message =>
      (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i4.Future<void> syncGomuTvOnAir() =>
      (super.noSuchMethod(Invocation.method(#syncGomuTvOnAir, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> syncGomuTvPopular() =>
      (super.noSuchMethod(Invocation.method(#syncGomuTvPopular, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> syncGomuTvTopRated() =>
      (super.noSuchMethod(Invocation.method(#syncGomuTvTopRated, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> syncGomuTvWatchlist() =>
      (super.noSuchMethod(Invocation.method(#syncGomuTvWatchlist, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void addListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}
