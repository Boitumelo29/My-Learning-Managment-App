import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitial()) {
    on<NetworkEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
