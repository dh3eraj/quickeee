import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'luxury_flash_drop_state.dart';
part 'luxury_flash_drop_cubit.freezed.dart';
class LuxuryFlashDropCubit extends Cubit<LuxuryFlashDropState> {
  LuxuryFlashDropCubit():super(LuxuryFlashDropState.initial());
}