import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisness_logic/counter/counter_cubit.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child:
          BlocConsumer<CounterCubit, CounterState>(listener: (context, state) {
        // if (state is CounterInitial) print('inisial');
        // if (state is CounterPlus) print('plus');
        // if (state is CounterMinus) print('minus');
      }, builder: (context, state) {
        return Center(
          child: Row(children: [
            TextButton(
              onPressed: () {
                CounterCubit.get(context).minus();
              },
              child: const Text('-'),
            ),
            Text('${CounterCubit.get(context).counter}'),
            TextButton(
              onPressed: () {
                CounterCubit.get(context).plus();
              },
              child: const Text('+'),
            ),
          ]),
        );
      }),
    );
  }
}
