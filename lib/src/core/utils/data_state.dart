import 'package:equatable/equatable.dart';
import '../error/error_model.dart';

abstract class DataState<T> extends Equatable{
  final T? data;
  final String? message;
  final ErrorModel? error;

  const DataState({this.data, this.message, this.error});

  @override
  List<Object?> get props => [data, message, error];

}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data, [String? message]) : super(data: data, message: message);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ErrorModel? error) : super(error: error);
}
