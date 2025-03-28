import 'package:bloc/bloc.dart';
import 'package:taskbloc/BLoC/events/event.dart';
import 'package:taskbloc/BLoC/states/state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });

    on<UpdateUsernameEvent>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<UpdatePasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<TogglePasswordVisibilityEvent>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
  }
}