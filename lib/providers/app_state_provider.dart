import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../models/app_state.dart';

class AppStateProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AppState()),
  ];
}
