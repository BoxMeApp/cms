import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cms.dart';

class TimerPage extends StatelessWidget {
  @Preview(name: 'Timer')
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => M(const Ticker()),
      child: TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: .center,
            children: <Widget>[
              Padding(
                padding: .symmetric(vertical: 100),
                child: Center(child: TimerText()),
              ),
              Actions(),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((M bloc) => bloc.state.duration);
    final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(
      2,
      '0',
    );
    final secondsStr = (duration % 60).toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(
        context,
      ).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w500),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<M, S>(
      buildWhen: (prev, cur) => prev.runtimeType != cur.runtimeType,
      builder: (context, s) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: switch (s) {
            Zero() => [
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context.read<M>().add(const .start()),
              ),
            ],
            Running() => [
              FloatingActionButton(
                child: const Icon(Icons.pause),
                onPressed: () => context.read<M>().add(const .pause()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<M>().add(const .reset()),
              ),
            ],
            Paused() => [
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context.read<M>().add(const .resume()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<M>().add(const .reset()),
              ),
            ],
            Completed() => [
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<M>().add(const .reset()),
              ),
            ],
          },
        );
      },
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.blue.shade500],
          ),
        ),
      ),
    );
  }
}
