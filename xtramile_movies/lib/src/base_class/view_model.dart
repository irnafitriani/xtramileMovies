import 'package:flutter/foundation.dart';
import 'package:xtramile_movies/src/base_class/state_data_model.dart';

abstract class ViewModel<T extends StateData> implements ValueListenable<T> {
  ViewModel(T initial) : _stateDataNotifier = ValueNotifier(initial);

  final ValueNotifier<T> _stateDataNotifier;

  @protected
  set stateData(T value) => _stateDataNotifier.value = value;

  bool isDisposed = false;

  @override
  T get value => _stateDataNotifier.value;

  @override
  void addListener(VoidCallback listener) {
    _stateDataNotifier.addListener(listener);
    isDisposed = true;
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateDataNotifier.removeListener(listener);
  }

  @mustCallSuper
  void dispose() {
    if (!isDisposed) {
      _stateDataNotifier.dispose();
      isDisposed = false;
    }
  }
}
