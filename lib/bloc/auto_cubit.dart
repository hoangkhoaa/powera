import 'package:flutter_bloc/flutter_bloc.dart';

class AutoCubit extends Cubit<int> {
  AutoCubit(int val) : super(0);
  void setAutoOff() => emit(state + 1);
}
