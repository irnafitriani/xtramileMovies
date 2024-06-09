import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:xtramile_movies/src/base_class/view_model_factory.dart';
import 'package:xtramile_movies/src/di/service_locator.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final globalNotifier = ValueNotifier<Object>(Object());
    return ValueListenableProvider.value(
      value: globalNotifier,
      child: GlobalLoaderOverlay(
        child: MultiProvider(
          providers: [
            Provider(
              create: (_) => serviceLocator.get<ViewModelFactory>(),
              dispose: (_, value) => value.dispose(),
            ),
          ],
          child: child, // Use child here to ensure the correct hierarchy
        ),
      ),
    );
  }
}
