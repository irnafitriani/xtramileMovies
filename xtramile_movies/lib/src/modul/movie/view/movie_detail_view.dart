import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramile_movies/src/base_class/app_router.gr.dart';
import 'package:xtramile_movies/src/base_class/base_view.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_detail.dart';
import 'package:xtramile_movies/src/modul/movie/viewmodel/movie_detail_view_model.dart';

@RoutePage()
class MovieDetailView extends ViewModelScreenStfl {
  const MovieDetailView(this.movieId, this.movieTitle, {super.key});
  final int movieId;
  final String movieTitle;

  @override
  MovieDetailViewState createState() => MovieDetailViewState();
}

class MovieDetailViewState
    extends ViewModelScreenStflState<MovieDetailView, MovieDetailViewModel, MovieDetailData> {
  @override
  void initState() {
    super.initState();
    viewModel.init(widget.movieId);
  }

  Future<void> _refreshMovieDetail() async {
    await viewModel.fetchMovieDetail(
      widget.movieId,
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      // Add Scaffold widget here
      appBar: AppBar(
        title: Text(widget.movieTitle),
      ),
      body: Selector<MovieDetailData, MovieDetail?>(
        selector: (_, data) => data.movieDetail,
        builder: (context, movieDetail, _) {
          return RefreshIndicator(
            onRefresh: _refreshMovieDetail,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movieDetail?.posterPath != null)
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movieDetail?.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 16.0),
                  Text(
                    movieDetail?.title ?? '',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Release Date: ${movieDetail?.releaseDate ?? "Unknown"}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Rating: ${movieDetail?.voteAverage ?? "-"}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Overview:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movieDetail?.overview ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      context.router.push(UserReviewView(movieId: movieDetail?.id ?? 0));
                    },
                    child: const Text(
                      'See All User Reviews',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Genres:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: movieDetail?.genres.map((genre) {
                          return Chip(
                            label: Text(genre.name ?? ''),
                          );
                        }).toList() ??
                        [],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Production Companies:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movieDetail?.productionCompanies.map((company) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                if (company.logoPath != null)
                                  Image.network(
                                    'https://image.tmdb.org/t/p/w92${company.logoPath}',
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    company.name ?? '',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList() ??
                        [],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Tagline:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movieDetail?.tagline ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Status:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movieDetail?.status ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      final videoIds =
                          viewModel.value.trailers?.map((trailer) => trailer.key ?? '').toList() ??
                              [];
                      context.router.push(
                          TrailerView(videoIds: videoIds, movieTitle: movieDetail?.title ?? ''));
                    },
                    child: const Text('Watch All Trailers'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
