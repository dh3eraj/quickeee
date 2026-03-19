import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickeee/configs/dependency_injection/dependency_injection.dart';
import 'package:quickeee/features/flash_drop/presentation/bloc/luxury_flash_drop_cubit.dart';

class LuxuryFlashDropWrapper extends StatelessWidget {
  const LuxuryFlashDropWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LuxuryFlashDropCubit>(),
      child: LuxuryFlashDrop(),
    );
  }
}

class LuxuryFlashDrop extends StatefulWidget {
  const LuxuryFlashDrop({super.key});

  @override
  State<LuxuryFlashDrop> createState() => _LuxuryFlashDropState();
}

class _LuxuryFlashDropState extends State<LuxuryFlashDrop> {
  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false, child: Scaffold());
  }
}
