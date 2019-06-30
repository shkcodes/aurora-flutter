// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_location_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddLocationState extends AddLocationState {
  @override
  final bool isLoading;

  factory _$AddLocationState(
          [void Function(AddLocationStateBuilder) updates]) =>
      (new AddLocationStateBuilder()..update(updates)).build();

  _$AddLocationState._({this.isLoading}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AddLocationState', 'isLoading');
    }
  }

  @override
  AddLocationState rebuild(void Function(AddLocationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddLocationStateBuilder toBuilder() =>
      new AddLocationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddLocationState && isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddLocationState')
          ..add('isLoading', isLoading))
        .toString();
  }
}

class AddLocationStateBuilder
    implements Builder<AddLocationState, AddLocationStateBuilder> {
  _$AddLocationState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  AddLocationStateBuilder();

  AddLocationStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddLocationState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddLocationState;
  }

  @override
  void update(void Function(AddLocationStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddLocationState build() {
    final _$result = _$v ?? new _$AddLocationState._(isLoading: isLoading);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
