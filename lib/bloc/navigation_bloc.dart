import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class NavEvent {
  const NavEvent();
}

class NavigateTo extends NavEvent {
  final NavItem destination;
  const NavigateTo(this.destination);
}

class NavState extends Equatable {
  final NavItem selectedItem;
  const NavState(this.selectedItem);
  @override
  List<Object> get props => [selectedItem];
}

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc(NavState initialState) : super(initialState);
  @override
  Stream<NavState> mapEventToState(NavEvent event) async* {
    if (event is NavigateTo) {
      yield NavState(event.destination);
    }
  }
}

enum NavItem {
  light_page,
  heat_page,
  humid_page,
  setting_page,
  light_page1,
  heat_page1,
  humid_page1,
}
