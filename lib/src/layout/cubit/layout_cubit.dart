import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monawpaty/src/modules/home/home_screen.dart';
import 'package:monawpaty/src/modules/shifts_booking/shifts_booking_layout.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int selectedScreenIndex = 0;
  final screens = [
    const HomeScreen(),
    const ShiftsBookingLayout(),
    const HomeScreen(),
    const HomeScreen()
  ];

  void changeScreen(int index) {
    selectedScreenIndex = index;
    emit(LayoutChangeNotifier());
  }
}
