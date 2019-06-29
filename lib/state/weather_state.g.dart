// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WeatherState extends WeatherState {
  @override
  final List<Weather> weather;
  @override
  final String location;
  @override
  final bool isLoading;

  factory _$WeatherState([void Function(WeatherStateBuilder) updates]) =>
      (new WeatherStateBuilder()..update(updates)).build();

  _$WeatherState._({this.weather, this.location, this.isLoading}) : super._() {
    if (weather == null) {
      throw new BuiltValueNullFieldError('WeatherState', 'weather');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('WeatherState', 'isLoading');
    }
  }

  @override
  WeatherState rebuild(void Function(WeatherStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStateBuilder toBuilder() => new WeatherStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherState &&
        weather == other.weather &&
        location == other.location &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, weather.hashCode), location.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WeatherState')
          ..add('weather', weather)..add('location', location)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class WeatherStateBuilder
    implements Builder<WeatherState, WeatherStateBuilder> {
  _$WeatherState _$v;

  List<Weather> _weather;
  List<Weather> get weather => _$this._weather;
  set weather(List<Weather> weather) => _$this._weather = weather;

  String _location;

  String get location => _$this._location;

  set location(String location) => _$this._location = location;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  WeatherStateBuilder();

  WeatherStateBuilder get _$this {
    if (_$v != null) {
      _weather = _$v.weather;
      _location = _$v.location;
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WeatherState;
  }

  @override
  void update(void Function(WeatherStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WeatherState build() {
    final _$result = _$v ??
        new _$WeatherState._(
            weather: weather, location: location, isLoading: isLoading);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
