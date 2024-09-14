import 'package:equatable/equatable.dart';
import 'package:mylearning/network/failures/error_handler.dart';

class Failure extends Equatable {
  final int code;
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;

  const Failure(this.code, this.message, {this.error, this.stackTrace});

  @override
  List<Object?> get props => [code, message, error, stackTrace];
}

extension FailureX on Failure {
  bool get isNoConnectionFailure {
    return code == ResponseCode.NO_INTERNET_CONNECTION;
  }
}

class DefaultFailure extends Failure {
  const DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
