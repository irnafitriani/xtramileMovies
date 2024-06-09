// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:xtramile_movies/src/modul/genre/model/genre.dart' as _i8;
import 'package:xtramile_movies/src/modul/genre/view/genre_view.dart' as _i1;
import 'package:xtramile_movies/src/modul/movie/view/movie_detail_view.dart'
    as _i2;
import 'package:xtramile_movies/src/modul/movie/view/movie_list_view.dart'
    as _i3;
import 'package:xtramile_movies/src/modul/review/view/user_review_view.dart'
    as _i5;
import 'package:xtramile_movies/src/modul/trailer/view/trailer_view.dart'
    as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    GenreView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GenreView(),
      );
    },
    MovieDetailView.name: (routeData) {
      final args = routeData.argsAs<MovieDetailViewArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.MovieDetailView(
          args.movieId,
          args.movieTitle,
          key: args.key,
        ),
      );
    },
    MovieListView.name: (routeData) {
      final args = routeData.argsAs<MovieListViewArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.MovieListView(
          args.genre,
          key: args.key,
        ),
      );
    },
    TrailerView.name: (routeData) {
      final args = routeData.argsAs<TrailerViewArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.TrailerView(
          args.videoIds,
          args.movieTitle,
          key: args.key,
        ),
      );
    },
    UserReviewView.name: (routeData) {
      final args = routeData.argsAs<UserReviewViewArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.UserReviewView(
          args.movieId,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.GenreView]
class GenreView extends _i6.PageRouteInfo<void> {
  const GenreView({List<_i6.PageRouteInfo>? children})
      : super(
          GenreView.name,
          initialChildren: children,
        );

  static const String name = 'GenreView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MovieDetailView]
class MovieDetailView extends _i6.PageRouteInfo<MovieDetailViewArgs> {
  MovieDetailView({
    required int movieId,
    required String movieTitle,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MovieDetailView.name,
          args: MovieDetailViewArgs(
            movieId: movieId,
            movieTitle: movieTitle,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailView';

  static const _i6.PageInfo<MovieDetailViewArgs> page =
      _i6.PageInfo<MovieDetailViewArgs>(name);
}

class MovieDetailViewArgs {
  const MovieDetailViewArgs({
    required this.movieId,
    required this.movieTitle,
    this.key,
  });

  final int movieId;

  final String movieTitle;

  final _i7.Key? key;

  @override
  String toString() {
    return 'MovieDetailViewArgs{movieId: $movieId, movieTitle: $movieTitle, key: $key}';
  }
}

/// generated route for
/// [_i3.MovieListView]
class MovieListView extends _i6.PageRouteInfo<MovieListViewArgs> {
  MovieListView({
    required _i8.Genre genre,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MovieListView.name,
          args: MovieListViewArgs(
            genre: genre,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieListView';

  static const _i6.PageInfo<MovieListViewArgs> page =
      _i6.PageInfo<MovieListViewArgs>(name);
}

class MovieListViewArgs {
  const MovieListViewArgs({
    required this.genre,
    this.key,
  });

  final _i8.Genre genre;

  final _i7.Key? key;

  @override
  String toString() {
    return 'MovieListViewArgs{genre: $genre, key: $key}';
  }
}

/// generated route for
/// [_i4.TrailerView]
class TrailerView extends _i6.PageRouteInfo<TrailerViewArgs> {
  TrailerView({
    required List<String> videoIds,
    required String movieTitle,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TrailerView.name,
          args: TrailerViewArgs(
            videoIds: videoIds,
            movieTitle: movieTitle,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TrailerView';

  static const _i6.PageInfo<TrailerViewArgs> page =
      _i6.PageInfo<TrailerViewArgs>(name);
}

class TrailerViewArgs {
  const TrailerViewArgs({
    required this.videoIds,
    required this.movieTitle,
    this.key,
  });

  final List<String> videoIds;

  final String movieTitle;

  final _i7.Key? key;

  @override
  String toString() {
    return 'TrailerViewArgs{videoIds: $videoIds, movieTitle: $movieTitle, key: $key}';
  }
}

/// generated route for
/// [_i5.UserReviewView]
class UserReviewView extends _i6.PageRouteInfo<UserReviewViewArgs> {
  UserReviewView({
    required int movieId,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          UserReviewView.name,
          args: UserReviewViewArgs(
            movieId: movieId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserReviewView';

  static const _i6.PageInfo<UserReviewViewArgs> page =
      _i6.PageInfo<UserReviewViewArgs>(name);
}

class UserReviewViewArgs {
  const UserReviewViewArgs({
    required this.movieId,
    this.key,
  });

  final int movieId;

  final _i7.Key? key;

  @override
  String toString() {
    return 'UserReviewViewArgs{movieId: $movieId, key: $key}';
  }
}
