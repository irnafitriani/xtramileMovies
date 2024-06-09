import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:xtramile_movies/src/base_class/state_data_model.dart';
import 'package:xtramile_movies/src/base_class/view_model.dart';
import 'package:xtramile_movies/src/base_class/view_model_factory.dart';

abstract class ViewModelScreenStfl extends StatefulWidget {
  const ViewModelScreenStfl({super.key});

  @override
  ViewModelScreenStflState createState();
}

abstract class ViewModelScreenStflState<T extends ViewModelScreenStfl, T2 extends ViewModel<T3>,
    T3 extends StateData> extends State<T> {
  ViewModelScreenStflState();

  late final T2 viewModel;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    viewModel = context.read<ViewModelFactory>().create<T2>();
  }

  @override
  @mustCallSuper
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ValueListenableProvider<T3>.value(value: viewModel),
      ],
      builder: (context, _) => buildScreen(context),
    );
  }
}
