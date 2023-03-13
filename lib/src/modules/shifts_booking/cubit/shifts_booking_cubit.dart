import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shifts_booking_state.dart';

class ShiftsBookingCubit extends Cubit<ShiftsBookingState> {
  ShiftsBookingCubit() : super(ShiftsBookingInitial());

  static ShiftsBookingCubit get(context) => BlocProvider.of(context);

  late TabController controller;
  void initController() {
    //  controller = TabController(length: 2, vsync: );
  }
}
