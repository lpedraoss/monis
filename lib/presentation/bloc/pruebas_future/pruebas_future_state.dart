// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pruebas_future_cubit.dart';

class PruebasFutureState extends Equatable {
  const PruebasFutureState({this.data,});
  final String? data;

  @override
  List<Object> get props => [data??''];

  PruebasFutureState copyWith({
    String? data,
    bool delete=false,
  }) {
    return PruebasFutureState(
      data: delete?null:data ?? this.data,
    );
  }
}


