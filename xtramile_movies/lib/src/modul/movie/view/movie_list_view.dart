import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramile_movies/src/base_class/app_router.gr.dart';
import 'package:xtramile_movies/src/base_class/base_view.dart';
import 'package:xtramile_movies/src/modul/genre/model/genre.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_list.dart';
import 'package:xtramile_movies/src/modul/movie/viewmodel/movie_list_view_model.dart';

@RoutePage()
class MovieListView extends ViewModelScreenStfl {
  const MovieListView(this.genre, {super.key});
  final Genre genre;

  @override
  MovieListViewState createState() => MovieListViewState();
}

class MovieListViewState
    extends ViewModelScreenStflState<MovieListView, MovieListViewModel, MovieList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    viewModel.init(widget.genre.id.toString());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      viewModel.fetchMoreMovies(widget.genre.id.toString());
    }
  }

  Future<void> _refreshMovieList() async {
    await viewModel.loadMovieListByGenreId(widget.genre.id.toString(), reset: true);
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      // Add Scaffold widget here
      appBar: AppBar(
        title: Text(widget.genre.name ?? ''),
      ),
      body: Selector<MovieList, List<Movie>>(
        selector: (_, data) => data.results,
        builder: (context, movies, _) {
          return RefreshIndicator(
              onRefresh: _refreshMovieList,
              child: movies.isEmpty
                  ? SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height -
                            kToolbarHeight, // Ensures it takes full height of screen
                        child: const Center(
                          child: Text(
                            "There's no Movie yet",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        var movie = movies[index];
                        return ListTile(
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                            fit: BoxFit.cover,
                          ),
                          title: Text(movie.title ?? ''),
                          subtitle: Text(
                              'Release Date: ${movie.releaseDate}\nRating: ${movie.voteAverage}'),
                          onTap: () {
                            context.router.push(MovieDetailView(
                                movieId: movie.id ?? 0, movieTitle: movie.title ?? ''));
                          },
                        );
                      },
                    ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
