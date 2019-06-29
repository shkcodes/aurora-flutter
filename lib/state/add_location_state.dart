import 'package:built_value/built_value.dart';

part 'add_location_state.g.dart';

abstract class AddLocationState implements Built<AddLocationState, AddLocationStateBuilder> {
  AddLocationState._();

  bool get isLoading;

  int get locationId;

  factory AddLocationState([updates(AddLocationStateBuilder b)]) => _$AddLocationState((b) => b
    ..isLoading = false
    ..locationId = 0);
}
