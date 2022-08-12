import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase.dart';

class MoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetAllTrendingMoviesUsecase _usecase;
  MoviesNotifier(this._usecase) : super([]) {
    getAllMovies('day');
  }

  Future getAllMovies(String timeWindow) async {
    state = await _usecase.getAllTrendingMovies(timeWindow);
  }
}
