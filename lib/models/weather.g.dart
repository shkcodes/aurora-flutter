// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherResponse> _$weatherResponseSerializer = new _$WeatherResponseSerializer();
Serializer<Weather> _$weatherSerializer = new _$WeatherSerializer();

class _$WeatherResponseSerializer implements StructuredSerializer<WeatherResponse> {
  @override
  final Iterable<Type> types = const [WeatherResponse, _$WeatherResponse];
  @override
  final String wireName = 'WeatherResponse';

  @override
  Iterable serialize(Serializers serializers, WeatherResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'consolidated_weather',
      serializers.serialize(object.consolidated_weather,
          specifiedType: const FullType(BuiltList, const [const FullType(Weather)])),
    ];

    return result;
  }

  @override
  WeatherResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'consolidated_weather':
          result.consolidated_weather.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(Weather)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherSerializer implements StructuredSerializer<Weather> {
  @override
  final Iterable<Type> types = const [Weather, _$Weather];
  @override
  final String wireName = 'Weather';

  @override
  Iterable serialize(Serializers serializers, Weather object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'weather_state_name',
      serializers.serialize(object.weather_state_name, specifiedType: const FullType(String)),
      'weather_state_abbr',
      serializers.serialize(object.weather_state_abbr, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Weather deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'weather_state_name':
          result.weather_state_name =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'weather_state_abbr':
          result.weather_state_abbr =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherResponse extends WeatherResponse {
  @override
  final BuiltList<Weather> consolidated_weather;

  factory _$WeatherResponse([void Function(WeatherResponseBuilder) updates]) =>
      (new WeatherResponseBuilder()..update(updates)).build();

  _$WeatherResponse._({this.consolidated_weather}) : super._() {
    if (consolidated_weather == null) {
      throw new BuiltValueNullFieldError('WeatherResponse', 'consolidated_weather');
    }
  }

  @override
  WeatherResponse rebuild(void Function(WeatherResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherResponseBuilder toBuilder() => new WeatherResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherResponse && consolidated_weather == other.consolidated_weather;
  }

  @override
  int get hashCode {
    return $jf($jc(0, consolidated_weather.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WeatherResponse')
          ..add('consolidated_weather', consolidated_weather))
        .toString();
  }
}

class WeatherResponseBuilder implements Builder<WeatherResponse, WeatherResponseBuilder> {
  _$WeatherResponse _$v;

  ListBuilder<Weather> _consolidated_weather;

  ListBuilder<Weather> get consolidated_weather =>
      _$this._consolidated_weather ??= new ListBuilder<Weather>();

  set consolidated_weather(ListBuilder<Weather> consolidated_weather) =>
      _$this._consolidated_weather = consolidated_weather;

  WeatherResponseBuilder();

  WeatherResponseBuilder get _$this {
    if (_$v != null) {
      _consolidated_weather = _$v.consolidated_weather?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WeatherResponse;
  }

  @override
  void update(void Function(WeatherResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WeatherResponse build() {
    _$WeatherResponse _$result;
    try {
      _$result = _$v ?? new _$WeatherResponse._(consolidated_weather: consolidated_weather.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'consolidated_weather';
        consolidated_weather.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('WeatherResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Weather extends Weather {
  @override
  final int id;
  @override
  final String weather_state_name;
  @override
  final String weather_state_abbr;

  factory _$Weather([void Function(WeatherBuilder) updates]) =>
      (new WeatherBuilder()..update(updates)).build();

  _$Weather._({this.id, this.weather_state_name, this.weather_state_abbr}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Weather', 'id');
    }
    if (weather_state_name == null) {
      throw new BuiltValueNullFieldError('Weather', 'weather_state_name');
    }
    if (weather_state_abbr == null) {
      throw new BuiltValueNullFieldError('Weather', 'weather_state_abbr');
    }
  }

  @override
  Weather rebuild(void Function(WeatherBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  WeatherBuilder toBuilder() => new WeatherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather &&
        id == other.id &&
        weather_state_name == other.weather_state_name &&
        weather_state_abbr == other.weather_state_abbr;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), weather_state_name.hashCode), weather_state_abbr.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Weather')
          ..add('id', id)
          ..add('weather_state_name', weather_state_name)
          ..add('weather_state_abbr', weather_state_abbr))
        .toString();
  }
}

class WeatherBuilder implements Builder<Weather, WeatherBuilder> {
  _$Weather _$v;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _weather_state_name;

  String get weather_state_name => _$this._weather_state_name;

  set weather_state_name(String weather_state_name) =>
      _$this._weather_state_name = weather_state_name;

  String _weather_state_abbr;

  String get weather_state_abbr => _$this._weather_state_abbr;

  set weather_state_abbr(String weather_state_abbr) =>
      _$this._weather_state_abbr = weather_state_abbr;

  WeatherBuilder();

  WeatherBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _weather_state_name = _$v.weather_state_name;
      _weather_state_abbr = _$v.weather_state_abbr;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Weather other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Weather;
  }

  @override
  void update(void Function(WeatherBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Weather build() {
    final _$result = _$v ??
        new _$Weather._(
            id: id, weather_state_name: weather_state_name, weather_state_abbr: weather_state_abbr);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
