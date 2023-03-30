import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pruebas_future_state.dart';

class PruebasFutureCubit extends Cubit<PruebasFutureState> {
  PruebasFutureCubit() : super(const PruebasFutureState());

  Future<void> hola() async {
    await Future.delayed(
      const Duration(seconds: 10),
    );
    emit(
      state.copyWith(data: 'holamundo'),
    );
    await Future.delayed(
      const Duration(seconds: 10),
    );
    emit(
      state.copyWith(delete: true),
    );
  }
}

