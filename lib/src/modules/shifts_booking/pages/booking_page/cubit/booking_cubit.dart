import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  static BookingCubit get(context) => BlocProvider.of(context);

  String? choiceType;
  String? selectedWeek;
  String? selectedTimeShift;
  String? selectedDay;

  List<String> tableShifts = List<String>.generate(28, (i) {
    return "ss";
  });
}
