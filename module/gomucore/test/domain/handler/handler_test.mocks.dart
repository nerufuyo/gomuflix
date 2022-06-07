// Mocks generated by Mockito 5.2.0 from annotations
// in gomuflix/test/domain/handler/handler_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i10;

import 'package:dartz/dartz.dart' as _i3;
import 'package:gomucore/gomucore.dart' as _i2;
import 'package:gomumovie/gomumovie.dart' as _i8;
import 'package:gomutv/gomutv.dart' as _i7;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGomuflixTvDetailModel_0 extends _i1.Fake
    implements _i2.GomuflixTvDetailModel {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

class _FakeGomuflixMovieDetailModel_2 extends _i1.Fake
    implements _i2.GomuflixMovieDetailModel {}

class _FakeResponse_3 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [GomuflixTvDatasourceHandler].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuflixTvDatasourceHandler extends _i1.Mock
    implements _i2.GomuflixTvDatasourceHandler {
  MockGomuflixTvDatasourceHandler() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i6.Database?>.value()) as _i5.Future<_i6.Database?>);
  @override
  _i5.Future<Map<String, dynamic>?> getGomuTvByIdHandler(int? id) =>
      (super.noSuchMethod(Invocation.method(#getGomuTvByIdHandler, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getGomuTvWatchlistHandler() =>
      (super.noSuchMethod(Invocation.method(#getGomuTvWatchlistHandler, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<int> insertGomuTvWatchlistHandler(
          _i2.GomuflixTvWatchlistModel? tv) =>
      (super.noSuchMethod(
          Invocation.method(#insertGomuTvWatchlistHandler, [tv]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeGomuTvWatchlistHandler(
          _i2.GomuflixTvWatchlistModel? tv) =>
      (super.noSuchMethod(
          Invocation.method(#removeGomuTvWatchlistHandler, [tv]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
}

/// A class which mocks [GomuflixTvRemoteApiDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuflixTvRemoteApiDatasource extends _i1.Mock
    implements _i2.GomuflixTvRemoteApiDatasource {
  MockGomuflixTvRemoteApiDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.GomuflixTvModel>> getGomuTvOnAirDatasource() =>
      (super.noSuchMethod(Invocation.method(#getGomuTvOnAirDatasource, []),
              returnValue: Future<List<_i2.GomuflixTvModel>>.value(
                  <_i2.GomuflixTvModel>[]))
          as _i5.Future<List<_i2.GomuflixTvModel>>);
  @override
  _i5.Future<List<_i2.GomuflixTvModel>> getGomuTvPopularDatasource() =>
      (super.noSuchMethod(Invocation.method(#getGomuTvPopularDatasource, []),
              returnValue: Future<List<_i2.GomuflixTvModel>>.value(
                  <_i2.GomuflixTvModel>[]))
          as _i5.Future<List<_i2.GomuflixTvModel>>);
  @override
  _i5.Future<List<_i2.GomuflixTvModel>> getGomuTvTopRatedDatasource() =>
      (super.noSuchMethod(Invocation.method(#getGomuTvTopRatedDatasource, []),
              returnValue: Future<List<_i2.GomuflixTvModel>>.value(
                  <_i2.GomuflixTvModel>[]))
          as _i5.Future<List<_i2.GomuflixTvModel>>);
  @override
  _i5.Future<_i2.GomuflixTvDetailModel> getGomuTvDetailDatasource(int? id) =>
      (super.noSuchMethod(Invocation.method(#getGomuTvDetailDatasource, [id]),
              returnValue: Future<_i2.GomuflixTvDetailModel>.value(
                  _FakeGomuflixTvDetailModel_0()))
          as _i5.Future<_i2.GomuflixTvDetailModel>);
  @override
  _i5.Future<List<_i2.GomuflixTvModel>> getGomuTvRecommendationDatasource(
          int? id) =>
      (super.noSuchMethod(
              Invocation.method(#getGomuTvRecommendationDatasource, [id]),
              returnValue: Future<List<_i2.GomuflixTvModel>>.value(
                  <_i2.GomuflixTvModel>[]))
          as _i5.Future<List<_i2.GomuflixTvModel>>);
  @override
  _i5.Future<List<_i2.GomuflixTvModel>> searchGomuTvDatasource(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchGomuTvDatasource, [query]),
              returnValue: Future<List<_i2.GomuflixTvModel>>.value(
                  <_i2.GomuflixTvModel>[]))
          as _i5.Future<List<_i2.GomuflixTvModel>>);
  @override
  _i5.Future<_i2.GomuflixTvWatchlistModel?> getGomuTvByIdDatasource(int? id) =>
      (super.noSuchMethod(Invocation.method(#getGomuTvByIdDatasource, [id]),
              returnValue: Future<_i2.GomuflixTvWatchlistModel?>.value())
          as _i5.Future<_i2.GomuflixTvWatchlistModel?>);
  @override
  _i5.Future<List<_i2.GomuflixTvWatchlistModel>>
      getGomuTvWatchlistDatasource() => (super.noSuchMethod(
              Invocation.method(#getGomuTvWatchlistDatasource, []),
              returnValue: Future<List<_i2.GomuflixTvWatchlistModel>>.value(
                  <_i2.GomuflixTvWatchlistModel>[]))
          as _i5.Future<List<_i2.GomuflixTvWatchlistModel>>);
  @override
  _i5.Future<String> insertGomuTvWatchlistDatasource(
          _i2.GomuflixTvWatchlistModel? tv) =>
      (super.noSuchMethod(
          Invocation.method(#insertGomuTvWatchlistDatasource, [tv]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> removeGomuTvWatchlistDatasource(
          _i2.GomuflixTvWatchlistModel? tv) =>
      (super.noSuchMethod(
          Invocation.method(#removeGomuTvWatchlistDatasource, [tv]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
}

/// A class which mocks [GomuflixTvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuflixTvRepository extends _i1.Mock
    implements _i7.GomuflixTvRepository {
  MockGomuflixTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>
      getGomuflixTvOnAirAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixTvOnAirAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i7.GomuflixTvEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>
      getGomuflixTvPopularAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixTvPopularAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i7.GomuflixTvEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>
      getGomuflixTvTopRatedAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixTvTopRatedAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i7.GomuflixTvEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>
      getGomuflixTvWatchlistAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixTvWatchlistAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i7.GomuflixTvEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>
      getGomuflixTvRecommendationAct(dynamic id) => (super.noSuchMethod(
          Invocation.method(#getGomuflixTvRecommendationAct, [id]),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>
      searchGomuflixTvAct(String? query) =>
          (super.noSuchMethod(Invocation.method(#searchGomuflixTvAct, [query]),
              returnValue:
                  Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>.value(
                      _FakeEither_1<_i2.FailureCondition,
                          List<_i7.GomuflixTvEntity>>())) as _i5
              .Future<_i3.Either<_i2.FailureCondition, List<_i7.GomuflixTvEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, _i7.GomuflixTvDetailEntity>>
      getGomuflixTvDetailAct(int? id) =>
          (super.noSuchMethod(Invocation.method(#getGomuflixTvDetailAct, [id]),
              returnValue:
                  Future<_i3.Either<_i2.FailureCondition, _i7.GomuflixTvDetailEntity>>.value(
                      _FakeEither_1<_i2.FailureCondition,
                          _i7.GomuflixTvDetailEntity>())) as _i5
              .Future<_i3.Either<_i2.FailureCondition, _i7.GomuflixTvDetailEntity>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, String>> saveGomuflixTvAct(
          _i7.GomuflixTvDetailEntity? movie) =>
      (super.noSuchMethod(Invocation.method(#saveGomuflixTvAct, [movie]),
          returnValue: Future<_i3.Either<_i2.FailureCondition, String>>.value(
              _FakeEither_1<_i2.FailureCondition, String>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, String>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, String>> removeGomuflixTvAct(
          _i7.GomuflixTvDetailEntity? movie) =>
      (super.noSuchMethod(Invocation.method(#removeGomuflixTvAct, [movie]),
          returnValue: Future<_i3.Either<_i2.FailureCondition, String>>.value(
              _FakeEither_1<_i2.FailureCondition, String>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, String>>);
  @override
  _i5.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [GomuflixMovieDatasourceHandler].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuflixMovieDatasourceHandler extends _i1.Mock
    implements _i2.GomuflixMovieDatasourceHandler {
  MockGomuflixMovieDatasourceHandler() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i6.Database?>.value()) as _i5.Future<_i6.Database?>);
  @override
  _i5.Future<Map<String, dynamic>?> getGomuMovieByIdHandler(int? id) =>
      (super.noSuchMethod(Invocation.method(#getGomuMovieByIdHandler, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getGomuMovieWatchlistHandler() =>
      (super.noSuchMethod(Invocation.method(#getGomuMovieWatchlistHandler, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<int> insertGomuMovieWatchlistHandler(
          _i2.GomuflixMovieWatchlistModel? movie) =>
      (super.noSuchMethod(
          Invocation.method(#insertGomuMovieWatchlistHandler, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeGomuMovieWatchlistHandler(
          _i2.GomuflixMovieWatchlistModel? movie) =>
      (super.noSuchMethod(
          Invocation.method(#removeGomuMovieWatchlistHandler, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
}

/// A class which mocks [GomuflixMovieRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuflixMovieRemoteDatasource extends _i1.Mock
    implements _i2.GomuflixMovieRemoteDatasource {
  MockGomuflixMovieRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.GomuflixMovieModel>> getGomuMovieNowPlayingDatasource() =>
      (super.noSuchMethod(
              Invocation.method(#getGomuMovieNowPlayingDatasource, []),
              returnValue: Future<List<_i2.GomuflixMovieModel>>.value(
                  <_i2.GomuflixMovieModel>[]))
          as _i5.Future<List<_i2.GomuflixMovieModel>>);
  @override
  _i5.Future<List<_i2.GomuflixMovieModel>> getGomuMoviePopularDatasource() =>
      (super.noSuchMethod(Invocation.method(#getGomuMoviePopularDatasource, []),
              returnValue: Future<List<_i2.GomuflixMovieModel>>.value(
                  <_i2.GomuflixMovieModel>[]))
          as _i5.Future<List<_i2.GomuflixMovieModel>>);
  @override
  _i5.Future<List<_i2.GomuflixMovieModel>> getGomuMovieTopRatedDatasource() =>
      (super.noSuchMethod(
              Invocation.method(#getGomuMovieTopRatedDatasource, []),
              returnValue: Future<List<_i2.GomuflixMovieModel>>.value(
                  <_i2.GomuflixMovieModel>[]))
          as _i5.Future<List<_i2.GomuflixMovieModel>>);
  @override
  _i5.Future<_i2.GomuflixMovieDetailModel> getGomuMovieDetailDatasource(
          int? id) =>
      (super.noSuchMethod(
              Invocation.method(#getGomuMovieDetailDatasource, [id]),
              returnValue: Future<_i2.GomuflixMovieDetailModel>.value(
                  _FakeGomuflixMovieDetailModel_2()))
          as _i5.Future<_i2.GomuflixMovieDetailModel>);
  @override
  _i5.Future<List<_i2.GomuflixMovieModel>> getGomuMovieRecommendationDatasource(
          int? id) =>
      (super.noSuchMethod(
              Invocation.method(#getGomuMovieRecommendationDatasource, [id]),
              returnValue: Future<List<_i2.GomuflixMovieModel>>.value(
                  <_i2.GomuflixMovieModel>[]))
          as _i5.Future<List<_i2.GomuflixMovieModel>>);
  @override
  _i5.Future<List<_i2.GomuflixMovieModel>> searchGomuMovieDatasource(
          String? query) =>
      (super.noSuchMethod(
              Invocation.method(#searchGomuMovieDatasource, [query]),
              returnValue: Future<List<_i2.GomuflixMovieModel>>.value(
                  <_i2.GomuflixMovieModel>[]))
          as _i5.Future<List<_i2.GomuflixMovieModel>>);
  @override
  _i5.Future<_i2.GomuflixMovieWatchlistModel?> getGomuMovieByIdDatasource(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getGomuMovieByIdDatasource, [id]),
              returnValue: Future<_i2.GomuflixMovieWatchlistModel?>.value())
          as _i5.Future<_i2.GomuflixMovieWatchlistModel?>);
  @override
  _i5.Future<List<_i2.GomuflixMovieWatchlistModel>>
      getGomuMovieWatchlistDatasource() => (super.noSuchMethod(
              Invocation.method(#getGomuMovieWatchlistDatasource, []),
              returnValue: Future<List<_i2.GomuflixMovieWatchlistModel>>.value(
                  <_i2.GomuflixMovieWatchlistModel>[]))
          as _i5.Future<List<_i2.GomuflixMovieWatchlistModel>>);
  @override
  _i5.Future<String> insertGomuMovieWatchlistDatasource(
          _i2.GomuflixMovieWatchlistModel? movie) =>
      (super.noSuchMethod(
          Invocation.method(#insertGomuMovieWatchlistDatasource, [movie]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> removeGomuMovieWatchlistDatasource(
          _i2.GomuflixMovieWatchlistModel? movie) =>
      (super.noSuchMethod(
          Invocation.method(#removeGomuMovieWatchlistDatasource, [movie]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
}

/// A class which mocks [GomuflixMovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGomuflixMovieRepository extends _i1.Mock
    implements _i8.GomuflixMovieRepository {
  MockGomuflixMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>
      getGomuflixMovieNowPlayingAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixMovieNowPlayingAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i8.GomuflixMovieEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>
      getGomuflixMoviePopularAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixMoviePopularAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i8.GomuflixMovieEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>
      getGomuflixMovieTopRatedAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixMovieTopRatedAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i8.GomuflixMovieEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>
      getGomuflixMovieWatchlistAct() => (super.noSuchMethod(
          Invocation.method(#getGomuflixMovieWatchlistAct, []),
          returnValue:
              Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>.value(
                  _FakeEither_1<_i2.FailureCondition,
                      List<_i8.GomuflixMovieEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>
      getGomuflixMovieRecommendationAct(int? id) => (super.noSuchMethod(
              Invocation.method(#getGomuflixMovieRecommendationAct, [id]),
              returnValue:
                  Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>.value(
                      _FakeEither_1<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>()))
          as _i5.Future<
              _i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>
      searchGomuflixMovieAct(String? query) => (super.noSuchMethod(
          Invocation.method(#searchGomuflixMovieAct, [query]),
          returnValue: Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>.value(
              _FakeEither_1<_i2.FailureCondition,
                  List<_i8.GomuflixMovieEntity>>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, List<_i8.GomuflixMovieEntity>>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, _i8.GomuflixMovieDetailEntity>>
      getGomuflixMovieDetailAct(int? id) => (super.noSuchMethod(
          Invocation.method(#getGomuflixMovieDetailAct, [id]),
          returnValue: Future<_i3.Either<_i2.FailureCondition, _i8.GomuflixMovieDetailEntity>>.value(
              _FakeEither_1<_i2.FailureCondition,
                  _i8.GomuflixMovieDetailEntity>())) as _i5
          .Future<_i3.Either<_i2.FailureCondition, _i8.GomuflixMovieDetailEntity>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, String>>
      saveGomuflixMovieWatchlistAct(_i8.GomuflixMovieDetailEntity? movie) =>
          (super.noSuchMethod(
                  Invocation.method(#saveGomuflixMovieWatchlistAct, [movie]),
                  returnValue:
                      Future<_i3.Either<_i2.FailureCondition, String>>.value(
                          _FakeEither_1<_i2.FailureCondition, String>()))
              as _i5.Future<_i3.Either<_i2.FailureCondition, String>>);
  @override
  _i5.Future<_i3.Either<_i2.FailureCondition, String>>
      removeGomuflixMovieWatchlistAct(_i8.GomuflixMovieDetailEntity? movie) =>
          (super.noSuchMethod(
                  Invocation.method(#removeGomuflixMovieWatchlistAct, [movie]),
                  returnValue:
                      Future<_i3.Either<_i2.FailureCondition, String>>.value(
                          _FakeEither_1<_i2.FailureCondition, String>()))
              as _i5.Future<_i3.Either<_i2.FailureCondition, String>>);
  @override
  _i5.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i10.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i10.Uint8List>.value(_i10.Uint8List(0)))
          as _i5.Future<_i10.Uint8List>);
  @override
  _i5.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_4()))
          as _i5.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
