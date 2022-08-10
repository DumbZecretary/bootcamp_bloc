// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counting_increase_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CountingIncreaseEvent extends CountingIncreaseEvent {
  @override
  final int value;

  factory _$CountingIncreaseEvent(
          [void Function(CountingIncreaseEventBuilder)? updates]) =>
      (new CountingIncreaseEventBuilder()..update(updates))._build();

  _$CountingIncreaseEvent._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'CountingIncreaseEvent', 'value');
  }

  @override
  CountingIncreaseEvent rebuild(
          void Function(CountingIncreaseEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountingIncreaseEventBuilder toBuilder() =>
      new CountingIncreaseEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountingIncreaseEvent && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CountingIncreaseEvent')
          ..add('value', value))
        .toString();
  }
}

class CountingIncreaseEventBuilder
    implements Builder<CountingIncreaseEvent, CountingIncreaseEventBuilder> {
  _$CountingIncreaseEvent? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  CountingIncreaseEventBuilder();

  CountingIncreaseEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountingIncreaseEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountingIncreaseEvent;
  }

  @override
  void update(void Function(CountingIncreaseEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountingIncreaseEvent build() => _build();

  _$CountingIncreaseEvent _build() {
    final _$result = _$v ??
        new _$CountingIncreaseEvent._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'CountingIncreaseEvent', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
