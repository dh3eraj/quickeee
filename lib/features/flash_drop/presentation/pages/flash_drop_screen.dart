import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickeee/configs/dependency_injection/dependency_injection.dart';
import 'package:quickeee/features/flash_drop/presentation/bloc/flash_drop_cubit.dart';

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

  @override
  void initState() {
    _cubit = context.read<FlashDropCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.loadWatchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: BlocConsumer<FlashDropCubit, FlashDropState>(
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
                    return SingleChildScrollView(
                      physics: ClampingScrollPhysics(),

                      child: Text(watchData.toJson().toString()),
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
              listener: (context, state) {},
            ),
          ),
        ),
      ),
    );
  }
}
