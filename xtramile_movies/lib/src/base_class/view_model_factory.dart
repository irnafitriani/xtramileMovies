import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/view_model.dart';
import 'package:xtramile_movies/src/di/service_locator.dart';

abstract class ViewModelFactory {
  T create<T extends ViewModel>();

  void dispose<T extends ViewModel>();
}

@Singleton(as: ViewModelFactory)
class ViewModelFactoryImpl implements ViewModelFactory {
  @override
  T create<T extends ViewModel>() => serviceLocator.get<T>();

  @override
  void dispose<T extends ViewModel>() => serviceLocator.get<T>().dispose();
}
