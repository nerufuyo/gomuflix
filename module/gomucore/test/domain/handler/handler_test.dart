import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    // Tv
    GomuflixTvDatasourceHandler,
    GomuflixTvRemoteApiDatasource,
    GomuflixTvRepository,

    // Movie
    GomuflixMovieDatasourceHandler,
    GomuflixMovieRemoteDatasource,
    GomuflixMovieRepository,
  ],
  // Mocks
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
