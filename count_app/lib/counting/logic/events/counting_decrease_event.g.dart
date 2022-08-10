// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counting_decrease_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CountingDecreaseEvent extends CountingDecreaseEvent {
  @override
  final int value;

  factory _$CountingDecreaseEvent(
          [void Function(CountingDecreaseEventBuilder)? updates]) =>
      (new CountingDecreaseEventBuilder()..update(updates))._build();

  _$CountingDecreaseEvent._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'CountingDecreaseEvent', 'value');
  }

  @override
  CountingDecreaseEvent rebuild(
          void Function(CountingDecreaseEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountingDecreaseEventBuilder toBuilder() =>
      new CountingDecreaseEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountingDecreaseEvent && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CountingDecreaseEvent')
          ..add('value', value))
        .toString();
  }
}

class CountingDecreaseEventBuilder
    implements Builder<CountingDecreaseEvent, CountingDecreaseEventBuilder> {
  _$CountingDecreaseEvent? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  CountingDecreaseEventBuilder();

  CountingDecreaseEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountingDecreaseEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountingDecreaseEvent;
  }

  @override
  void update(void Function(CountingDecreaseEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountingDecreaseEvent build() => _build();

  _$CountingDecreaseEvent _build() {
    final _$result = _$v ??
        new _$CountingDecreaseEvent._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'CountingDecreaseEvent', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
