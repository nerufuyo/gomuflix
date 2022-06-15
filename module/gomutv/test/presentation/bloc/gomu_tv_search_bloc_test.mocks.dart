// Mocks generated by Mockito 5.2.0 from annotations
// in gomutv/test/presentation/bloc/gomu_tv_search_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i3;
import 'package:gomucore/gomucore.dart' as _i5;
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

class _FakeGomuflixTvRepository_0 extends _i1.Fake
    implements _i2.GomuflixTvRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [SearchGomuflixTvCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchGomuflixTvCase extends _i1.Mock
    implements _i2.SearchGomuflixTvCase {
  MockSearchGomuflixTvCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GomuflixTvRepository get data => (super.noSuchMethod(
      Invocation.getter(#data),
      returnValue: _FakeGomuflixTvRepository_0()) as _i2.GomuflixTvRepository);
  @override
  set data(_i2.GomuflixTvRepository? _data) =>
      super.noSuchMethod(Invocation.setter(#data, _data),
          returnValueForMissingStub: null);
  @override
  _i4.Future<_i3.Either<_i5.FailureCondition, List<_i2.GomuflixTvEntity>>>
      execute(String? query) => (super.noSuchMethod(
          Invocation.method(#execute, [query]),
          returnValue:
              Future<_i3.Either<_i5.FailureCondition, List<_i2.GomuflixTvEntity>>>.value(
                  _FakeEither_1<_i5.FailureCondition,
                      List<_i2.GomuflixTvEntity>>())) as _i4
          .Future<_i3.Either<_i5.FailureCondition, List<_i2.GomuflixTvEntity>>>);
}
