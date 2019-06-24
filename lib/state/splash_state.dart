import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  SplashState._();

  factory SplashState([updates(SplashStateBuilder b)]) => _$SplashState();
//  factory SplashState([updates(SplashStateBuilder b)]) => new _$SplashState((b) => b..isLoading = false);
}
