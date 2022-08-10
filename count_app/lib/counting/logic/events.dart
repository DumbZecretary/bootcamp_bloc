// this is an example for singleton pattern

// abstract class CountingEvent {}
//
// class CountingIncreaseEvent extends CountingEvent {
//   static CountingIncreaseEvent? _instance;
//   CountingIncreaseEvent._internal(this.value) {
//     _instance = this;
//   }
//   factory CountingIncreaseEvent(int value) {
//     return _instance ?? CountingIncreaseEvent._internal(value);
//   }
//   final int value;
// }
//
// class CountingDecreaseEvent extends CountingEvent {
//   static CountingDecreaseEvent? _instance;
//   CountingDecreaseEvent._internal(this.value) {
//     _instance = this;
//   }
//   factory CountingDecreaseEvent(int value) {
//     return _instance ?? CountingDecreaseEvent._internal(value);
//   }
//   final int value;
// }
