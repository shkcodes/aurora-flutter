import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {
  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'woeid')
  int get locationId;

  factory Location([void Function(LocationBuilder) updates]) = _$Location;

  static Serializer<Location> get serializer => _$locationSerializer;

  Location._();
}
