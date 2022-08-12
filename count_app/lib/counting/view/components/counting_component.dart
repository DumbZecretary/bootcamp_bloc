import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/counting/logic/events/events.dart';
import 'package:count_app/counting/view/widgets/counting_button_widget.dart';
import 'package:count_app/counting/view/widgets/counting_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountingComponent extends StatelessWidget {
  const CountingComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: ContentCounterWidget(),
          ),
        ),
        Positioned(
          bottom: 32,
          right: 32,
          child: Column(
            children: [
              ButtonWidget(
                key: const Key("increase button"),
                icon: Icons.add,
                onPress: () {
                  context
                      .read<CountingBloc>()
                      .add(CountingIncreaseEvent((b) => b..value = 1));
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonWidget(
                key: const Key("decrease button"),
                icon: Icons.remove,
                onPress: () {
                  context
                      .read<CountingBloc>()
                      .add(CountingDecreaseEvent((b) => b..value = 1));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
