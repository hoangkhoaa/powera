import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavEvent {
  const NavEvent();
}

class NavigateTo extends NavEvent {
  final NavItem destination;
  const NavigateTo(this.destination);
}

class NavState {
  final NavItem selectedItem;
  const NavState(this.selectedItem);
}

class NavBloc extends Bloc<NavEvent, NavState> {
  @override
  NavBloc(NavState initialState) : super(initialState);
  @override
  Stream<NavState> mapEventToState(NavEvent event) async* {
    if (event is NavigateTo) {
      // only route to a new location if the new location is different
      if (event.destination != state.selectedItem) {
        yield NavState(event.destination);
      }
    }
  }
}

enum NavItem { light_page, heat_page, humid_page, setting_page }
