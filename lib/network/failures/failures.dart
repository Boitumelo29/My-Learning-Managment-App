import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {

  const factory Failure.serverFailure() = ServerFailure;

  const factory Failure.socketFailure() = SocketFailure;

  const factory Failure.httpFailure() = HttpFailure;

  const factory Failure.dioFailure(DioException error) = DioFailure;

  const factory Failure.formatFailure() = FormatFailure;

  const factory Failure.authFailure({
    String? message,
    required String code,
  }) = AuthFailure;

  const factory Failure.generalFailure({
    required String message,  String? code,
  }) = GeneralFailure;
}

