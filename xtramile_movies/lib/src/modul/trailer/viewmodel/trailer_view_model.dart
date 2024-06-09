import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/view_model.dart';
import 'package:xtramile_movies/src/modul/trailer/model/trailer.dart';

@injectable
class TrailerViewModel extends ViewModel<TrailerList> {
  TrailerViewModel() : super(const TrailerList(id: 0, results: []));

  Future<void> init(int movieId) async {}
}
