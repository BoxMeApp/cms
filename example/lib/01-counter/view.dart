import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cms.dart';

class CounterPage extends StatelessWidget {
  @Preview(name: 'Counter')
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (context) => M(), child: CounterView());
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<M, int>(
          builder: (context, s) =>
              Text('$s', style: Theme.of(context).textTheme.displayMedium),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        crossAxisAlignment: .end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<M>().add(const .increment()),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<M>().add(const .decrement()),
          ),
        ],
      ),
    );
  }
}
