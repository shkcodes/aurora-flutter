import 'package:built_value/built_value.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  List<String> get locations;

  int get currentPage;

  HomeState._();

  factory HomeState([updates(HomeStateBuilder b)]) => new _$HomeState((b) => b
    ..currentPage = 0
    ..locations = []
  );
}
