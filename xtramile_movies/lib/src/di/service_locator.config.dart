// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:xtramile_movies/src/base_class/app_router.dart' as _i3;
import 'package:xtramile_movies/src/base_class/view_model_factory.dart' as _i9;
import 'package:xtramile_movies/src/di/third_party_module.dart' as _i16;
import 'package:xtramile_movies/src/modul/genre/service/genre_service.dart'
    as _i10;
import 'package:xtramile_movies/src/modul/genre/view_model/genre_view_model.dart'
    as _i11;
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart'
    as _i12;
import 'package:xtramile_movies/src/modul/movie/viewmodel/movie_detail_view_model.dart'
    as _i14;
import 'package:xtramile_movies/src/modul/movie/viewmodel/movie_list_view_model.dart'
    as _i15;
import 'package:xtramile_movies/src/modul/review/service/review_service.dart'
    as _i6;
import 'package:xtramile_movies/src/modul/review/viewmodel/review_list_view_model.dart'
    as _i13;
import 'package:xtramile_movies/src/modul/trailer/service/trailer_service.dart'
    as _i7;
import 'package:xtramile_movies/src/modul/trailer/viewmodel/trailer_view_model.dart'
    as _i8;
import 'package:xtramile_movies/src/network/network_service.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyModule = _$ThirdPartyModule();
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.BaseOptions>(() => thirdPartyModule.options);
    gh.lazySingleton<_i4.Dio>(() => thirdPartyModule.dio);
    gh.lazySingleton<_i5.NetworkService>(
        () => _i5.NetworkServiceImpl(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.ReviewService>(
        () => _i6.ReviewServiceImpl(gh<_i5.NetworkService>()));
    gh.lazySingleton<_i7.TrailerService>(
        () => _i7.TrailerServiceImpl(gh<_i5.NetworkService>()));
    gh.factory<_i8.TrailerViewModel>(() => _i8.TrailerViewModel());
    gh.singleton<_i9.ViewModelFactory>(() => _i9.ViewModelFactoryImpl());
    gh.lazySingleton<_i10.GenreService>(
        () => _i10.GenreServiceeImpl(gh<_i5.NetworkService>()));
    gh.factory<_i11.GenreViewModel>(
        () => _i11.GenreViewModel(gh<_i10.GenreService>()));
    gh.lazySingleton<_i12.MovieService>(
        () => _i12.MovieServiceImpl(gh<_i5.NetworkService>()));
    gh.factory<_i13.ReviewListViewModel>(
        () => _i13.ReviewListViewModel(gh<_i6.ReviewService>()));
    gh.factory<_i14.MovieDetailViewModel>(() => _i14.MovieDetailViewModel(
          gh<_i12.MovieService>(),
          gh<_i7.TrailerService>(),
        ));
    gh.factory<_i15.MovieListViewModel>(
        () => _i15.MovieListViewModel(gh<_i12.MovieService>()));
    return this;
  }
}

class _$ThirdPartyModule extends _i16.ThirdPartyModule {}
