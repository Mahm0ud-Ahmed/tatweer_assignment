part of 'api_data_bloc.dart';

abstract class ApiDataEvent extends Equatable {

  int? index;
  ApiDataEvent({this.index});

  @override
  List<Object?> get props => [index];
}

class ApiDataRecommended extends ApiDataEvent {
  ApiDataRecommended();
}

class ApiDataChat extends ApiDataEvent {
  ChatModel? chat;

  ApiDataChat(int index, {this.chat}):super(index: index);
}


