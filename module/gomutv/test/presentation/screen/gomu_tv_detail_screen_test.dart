import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class GomuTvDetailEventFake extends Fake implements GomuTvDetailEvent {}

class GomuTvDetailStateFake extends Fake implements GomuTvDetailState {}

class MockGomuTvDetailBloc
    extends MockBloc<GomuTvDetailEvent, GomuTvDetailState>
    implements GomuTvDetailBloc {}

class MockGomuTvRecommendationBloc
    extends MockBloc<GomuTvDetailEvent, GomuTvDetailState>
    implements GomuTvRecommendationBloc {}

void main() {
  late MockGomuTvDetailBloc mockGomuTvDetailBloc;

  late MockGomuTvRecommendationBloc mockGomuTvRecommendationBloc;

  setUpAll(() {
    registerFallbackValue(GomuTvDetailEventFake());
    registerFallbackValue(GomuTvDetailStateFake());
  });

  setUp(() {
    mockGomuTvDetailBloc = MockGomuTvDetailBloc();

    mockGomuTvRecommendationBloc = MockGomuTvRecommendationBloc();
  });

  testWidgets('Detail Tv Screen should display progressbar when loading',
      (WidgetTester tester) async {
    // Condition
    when(() => mockGomuTvDetailBloc.state)
        .thenReturn(GomuTvDetailState.initial());
  });
}
