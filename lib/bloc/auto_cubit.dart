import 'package:flutter_bloc/flutter_bloc.dart';

class AutoCubit extends Cubit<bool> {
  AutoCubit(bool isAuto) : super(isAuto);
  void setAutoOff() => emit(false);
  void setAutoOn() => emit(true);
}
