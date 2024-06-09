import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramile_movies/src/base_class/app_router.gr.dart';
import 'package:xtramile_movies/src/base_class/base_view.dart';
import 'package:xtramile_movies/src/modul/genre/model/genre.dart';
import 'package:xtramile_movies/src/modul/genre/view_model/genre_view_model.dart';

@RoutePage()
class GenreView extends ViewModelScreenStfl {
  const GenreView({super.key});

  @override
  GenreViewState createState() => GenreViewState();
}

class GenreViewState extends ViewModelScreenStflState<GenreView, GenreViewModel, GenresResponse> {
  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  Future<void> _refreshGenres() async {
    await viewModel.loadGenres();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Genres'),
      ),
      body: Selector<GenresResponse, List<Genre>>(
        selector: (_, data) => data.genres,
        builder: (context, genres, _) {
          return RefreshIndicator(
            onRefresh: _refreshGenres,
            child: genres.isEmpty
                ? SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight, // Ensures it takes full height of screen
                      child: const Center(
                        child: Text(
                          "There's no genre yet",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      var genre = genres[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(genreIcons[genre.name] ?? Icons.movie),
                            title: Text(genre.name ?? ''),
                            onTap: () {
                              context.router.push(MovieListView(genre: genre));
                            },
                          ),
                          if (index != genres.length - 1) const Divider(),
                        ],
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}

const Map<String, IconData> genreIcons = {
  'Action': Icons.local_fire_department,
  'Adventure': Icons.explore,
  'Animation': Icons.movie_filter,
  'Comedy': Icons.sentiment_very_satisfied,
  'Crime': Icons.local_police,
  'Documentary': Icons.school,
  'Drama': Icons.theater_comedy,
  'Family': Icons.family_restroom,
  'Fantasy': Icons.auto_awesome,
  'History': Icons.history_edu,
  'Horror': Icons.warning,
  'Music': Icons.music_note,
  'Mystery': Icons.help_outline,
  'Romance': Icons.favorite,
  'Science Fiction': Icons.science,
  'TV Movie': Icons.tv,
  'Thriller': Icons.local_activity,
  'War': Icons.security,
  'Western': Icons.west,
};
