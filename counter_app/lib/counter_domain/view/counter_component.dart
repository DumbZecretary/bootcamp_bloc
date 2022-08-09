import 'package:counter_app/counter_domain/logic/counter_logic.dart';
import 'package:counter_app/counter_domain/view/widget/counter_button_widget.dart';
import 'package:counter_app/counter_domain/view/widget/counter_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterComponent extends StatelessWidget {
  const CounterComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: CounterViewWidget(),
          ),
        ),
        Positioned(
          bottom: 32,
          right: 32,
          child: Column(
            children: [
              CounterButtonWidget(
                iconData: Icons.add,
                function: () {
                  context.read<CounterBloc>().add(CounterIncreasePress());
                },
              ),
              const SizedBox(
                height: 32,
              ),
              CounterButtonWidget(
                iconData: Icons.remove,
                function: () {
                  context.read<CounterBloc>().add(CounterDecreasePress());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
