// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherResponse> _$weatherResponseSerializer =
new _$WeatherResponseSerializer();
Serializer<Weather> _$weatherSerializer = new _$WeatherSerializer();

class _$WeatherResponseSerializer
    implements StructuredSerializer<WeatherResponse> {
  @override
  final Iterable<Type> types = const [WeatherResponse, _$WeatherResponse];
  @override
  final String wireName = 'WeatherResponse';

  @override
  Iterable serialize(Serializers serializers, WeatherResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'consolidated_weather',
      serializers.serialize(object.consolidatedWeather,
          specifiedType:
          const FullType(BuiltList, const [const FullType(Weather)])),
      'title',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
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
          result.consolidatedWeather.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Weather)])) as BuiltList);
          break;
        case 'title':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
      serializers.serialize(object.weatherStateName,
          specifiedType: const FullType(String)),
      'weather_state_abbr',
      serializers.serialize(object.weatherStateAbbr,
          specifiedType: const FullType(String)),
      'the_temp',
      serializers.serialize(object.temperature,
          specifiedType: const FullType(double)),
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
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'weather_state_name':
          result.weatherStateName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'weather_state_abbr':
          result.weatherStateAbbr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'the_temp':
          result.temperature = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherResponse extends WeatherResponse {
  @override
  final BuiltList<Weather> consolidatedWeather;
  @override
  final String location;

  factory _$WeatherResponse([void Function(WeatherResponseBuilder) updates]) =>
      (new WeatherResponseBuilder()..update(updates)).build();

  _$WeatherResponse._({this.consolidatedWeather, this.location}) : super._() {
    if (consolidatedWeather == null) {
      throw new BuiltValueNullFieldError(
          'WeatherResponse', 'consolidatedWeather');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('WeatherResponse', 'location');
    }
  }

  @override
  WeatherResponse rebuild(void Function(WeatherResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherResponseBuilder toBuilder() =>
      new WeatherResponseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherResponse &&
        consolidatedWeather == other.consolidatedWeather &&
        location == other.location;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, consolidatedWeather.hashCode), location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WeatherResponse')
      ..add('consolidatedWeather', consolidatedWeather)..add('location', location))
        .toString();
  }
}

class WeatherResponseBuilder
    implements Builder<WeatherResponse, WeatherResponseBuilder> {
  _$WeatherResponse _$v;

  ListBuilder<Weather> _consolidatedWeather;
  ListBuilder<Weather> get consolidatedWeather =>
      _$this._consolidatedWeather ??= new ListBuilder<Weather>();
  set consolidatedWeather(ListBuilder<Weather> consolidatedWeather) =>
      _$this._consolidatedWeather = consolidatedWeather;

  String _location;

  String get location => _$this._location;

  set location(String location) => _$this._location = location;

  WeatherResponseBuilder();

  WeatherResponseBuilder get _$this {
    if (_$v != null) {
      _consolidatedWeather = _$v.consolidatedWeather?.toBuilder();
      _location = _$v.location;
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
      _$result = _$v ??
          new _$WeatherResponse._(
              consolidatedWeather: consolidatedWeather.build(),
              location: location);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'consolidatedWeather';
        consolidatedWeather.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WeatherResponse', _$failedField, e.toString());
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
  final String weatherStateName;
  @override
  final String weatherStateAbbr;
  @override
  final double temperature;

  factory _$Weather([void Function(WeatherBuilder) updates]) =>
      (new WeatherBuilder()..update(updates)).build();

  _$Weather._({this.id, this.weatherStateName, this.weatherStateAbbr, this.temperature})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Weather', 'id');
    }
    if (weatherStateName == null) {
      throw new BuiltValueNullFieldError('Weather', 'weatherStateName');
    }
    if (weatherStateAbbr == null) {
      throw new BuiltValueNullFieldError('Weather', 'weatherStateAbbr');
    }
    if (temperature == null) {
      throw new BuiltValueNullFieldError('Weather', 'temperature');
    }
  }

  @override
  Weather rebuild(void Function(WeatherBuilder) updates) =>
      (toBuilder()
        ..update(updates)).build();

  @override
  WeatherBuilder toBuilder() => new WeatherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather &&
        id == other.id &&
        weatherStateName == other.weatherStateName &&
        weatherStateAbbr == other.weatherStateAbbr &&
        temperature == other.temperature;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), weatherStateName.hashCode),
            weatherStateAbbr.hashCode),
        temperature.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Weather')
      ..add('id', id)..add('weatherStateName', weatherStateName)..add(
          'weatherStateAbbr', weatherStateAbbr)..add('temperature', temperature))
        .toString();
  }
}

class WeatherBuilder implements Builder<Weather, WeatherBuilder> {
  _$Weather _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _weatherStateName;
  String get weatherStateName => _$this._weatherStateName;
  set weatherStateName(String weatherStateName) =>
      _$this._weatherStateName = weatherStateName;

  String _weatherStateAbbr;
  String get weatherStateAbbr => _$this._weatherStateAbbr;
  set weatherStateAbbr(String weatherStateAbbr) =>
      _$this._weatherStateAbbr = weatherStateAbbr;

  double _temperature;

  double get temperature => _$this._temperature;

  set temperature(double temperature) => _$this._temperature = temperature;

  WeatherBuilder();

  WeatherBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _weatherStateName = _$v.weatherStateName;
      _weatherStateAbbr = _$v.weatherStateAbbr;
      _temperature = _$v.temperature;
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
            id: id,
            weatherStateName: weatherStateName,
            weatherStateAbbr: weatherStateAbbr,
            temperature: temperature);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
