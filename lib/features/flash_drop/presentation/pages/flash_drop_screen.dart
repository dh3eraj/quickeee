import 'dart:async' show StreamController;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickeee/configs/dependency_injection/dependency_injection.dart';
import 'package:quickeee/features/flash_drop/data/models/watch_data_response_model.dart'
    show WatchUpdate;
import 'package:quickeee/features/flash_drop/presentation/bloc/flash_drop_cubit.dart';
import 'package:quickeee/features/flash_drop/presentation/widgets/live_chart_widget.dart';

class FlashDropScreenWrapper extends StatelessWidget {
  const FlashDropScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FlashDropCubit>(),
      child: FlashDropScreen(),
    );
  }
}

class FlashDropScreen extends StatefulWidget {
  const FlashDropScreen({super.key});

  @override
  State<FlashDropScreen> createState() => _FlashDropScreenState();
}

class _FlashDropScreenState extends State<FlashDropScreen> {
  late final FlashDropCubit _cubit;
  late final StreamController<WatchUpdate> _streamController;
  late bool _isStreaming;
  @override
  void initState() {
    _cubit = context.read<FlashDropCubit>();
    _streamController = StreamController<WatchUpdate>();
    _isStreaming = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.loadWatchData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    _isStreaming = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: BlocConsumer<FlashDropCubit, FlashDropState>(
          buildWhen: (previous, current) {
            return current.maybeWhen(
              loadingWatchData: () => true,
              loadedWatchData: (_) => true,
              loadWatchDataError: (_) => true,
              orElse: () => false,
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loadingWatchData: () {
                return Center(child: CircularProgressIndicator.adaptive());
              },
              loadedWatchData: (watchData) {
                return LiveChart(
                  name: watchData.watchName,
                  stream: _streamController.stream,
                  currency: watchData.currency,
                );
              },
              loadWatchDataError: (error) {
                return Center(child: Text(error));
              },
              orElse: () {
                return SizedBox.shrink();
              },
            );
          },
          listenWhen: (previous, current) {
            return current.maybeWhen(
              loadedWatchData: (watchData) => true,
              orElse: () => false,
            );
          },
          listener: (context, state) {
            state.maybeWhen(
              loadedWatchData: (watchData) async {
                _isStreaming = true;
                while (_isStreaming) {
                  for (WatchUpdate update in watchData.updates ?? []) {
                    if (!_isStreaming) break;
                    await Future.delayed(const Duration(milliseconds: 800));
                    _streamController.sink.add(update);
                  }
                }
              },

              orElse: () {},
            );
          },
        ),
      ),
    );
  }
}
