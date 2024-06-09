import 'package:xtramile_movies/src/modul/genre/service/genre_service.dart';
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart';
import 'package:xtramile_movies/src/modul/review/service/review_service.dart';
import 'package:xtramile_movies/src/modul/trailer/service/trailer_service.dart';
import 'package:mockito/annotations.dart';
import 'package:xtramile_movies/src/network/network_service.dart';

const List<Type> classes = [
  GenreService,
  TrailerService,
  MovieService,
  ReviewService,
  NetworkService
];

@GenerateMocks(classes)
void main() {}
