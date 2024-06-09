// Mocks generated by Mockito 5.4.4 from annotations
// in xtramile_movies/test/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i15;
import 'package:mockito/mockito.dart' as _i1;
import 'package:xtramile_movies/src/modul/genre/model/genre.dart' as _i5;
import 'package:xtramile_movies/src/modul/genre/service/genre_service.dart'
    as _i3;
import 'package:xtramile_movies/src/modul/movie/model/movie_detail.dart'
    as _i10;
import 'package:xtramile_movies/src/modul/movie/model/movie_list.dart' as _i9;
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart'
    as _i8;
import 'package:xtramile_movies/src/modul/review/model/review_list.dart'
    as _i12;
import 'package:xtramile_movies/src/modul/review/service/review_service.dart'
    as _i11;
import 'package:xtramile_movies/src/modul/trailer/model/trailer.dart' as _i7;
import 'package:xtramile_movies/src/modul/trailer/service/trailer_service.dart'
    as _i6;
import 'package:xtramile_movies/src/network/model/network_request_model.dart'
    as _i14;
import 'package:xtramile_movies/src/network/model/network_response_model.dart'
    as _i2;
import 'package:xtramile_movies/src/network/network_service.dart' as _i13;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNetworkResponse_0<Model1> extends _i1.SmartFake
    implements _i2.NetworkResponse<Model1> {
  _FakeNetworkResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GenreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGenreService extends _i1.Mock implements _i3.GenreService {
  MockGenreService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.Genre>> fetchGenres() => (super.noSuchMethod(
        Invocation.method(
          #fetchGenres,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Genre>>.value(<_i5.Genre>[]),
      ) as _i4.Future<List<_i5.Genre>>);
}

/// A class which mocks [TrailerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTrailerService extends _i1.Mock implements _i6.TrailerService {
  MockTrailerService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i7.TrailerList?> fetchTrailers(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTrailers,
          [movieId],
        ),
        returnValue: _i4.Future<_i7.TrailerList?>.value(),
      ) as _i4.Future<_i7.TrailerList?>);
}

/// A class which mocks [MovieService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieService extends _i1.Mock implements _i8.MovieService {
  MockMovieService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i9.MovieList?> fetchMoviesByGenre(
    String? genre, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMoviesByGenre,
          [genre],
          {#page: page},
        ),
        returnValue: _i4.Future<_i9.MovieList?>.value(),
      ) as _i4.Future<_i9.MovieList?>);

  @override
  _i4.Future<_i10.MovieDetail?> fetchMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetail,
          [id],
        ),
        returnValue: _i4.Future<_i10.MovieDetail?>.value(),
      ) as _i4.Future<_i10.MovieDetail?>);
}

/// A class which mocks [ReviewService].
///
/// See the documentation for Mockito's code generation for more information.
class MockReviewService extends _i1.Mock implements _i11.ReviewService {
  MockReviewService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i12.ReviewList?> fetchUserReviews(
    int? movieId, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserReviews,
          [movieId],
          {#page: page},
        ),
        returnValue: _i4.Future<_i12.ReviewList?>.value(),
      ) as _i4.Future<_i12.ReviewList?>);
}

/// A class which mocks [NetworkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkService extends _i1.Mock implements _i13.NetworkService {
  MockNetworkService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.NetworkResponse<Model>> request<Model>(
    _i14.NetworkRequest? request,
    Model Function(Object)? parser, {
    _i15.ProgressCallback? onSendProgress,
    _i15.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [
            request,
            parser,
          ],
          {
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i4.Future<_i2.NetworkResponse<Model>>.value(
            _FakeNetworkResponse_0<Model>(
          this,
          Invocation.method(
            #request,
            [
              request,
              parser,
            ],
            {
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i4.Future<_i2.NetworkResponse<Model>>);
}
