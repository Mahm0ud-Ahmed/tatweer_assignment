import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_assessment/src/data/models/chat_model.dart';
import 'package:oranos_assessment/src/domain/use_cases/get_chat_message_use_case.dart';
import 'package:oranos_assessment/src/domain/use_cases/get_recommended_use_case.dart';
import '../../../core/error/error_model.dart';
import '../../../core/utils/data_state.dart';
import '../../../data/models/user_model.dart';

part 'api_data_event.dart';
part 'api_data_state.dart';

class ApiDataBloc extends Bloc<ApiDataEvent, ApiDataState> {

  final GetRecommendedUseCase getUsers;
  final GetChatMessageUseCase getChat;

  ApiDataBloc(this.getUsers, this.getChat) : super(const ApiDataIdle()) {
    on<ApiDataRecommended>((event, emit) => _getRecommended(event, emit));
    on<ApiDataChat>((event, emit) => _getChat(event, emit));
  }
  
  _getRecommended(ApiDataRecommended event, Emitter<ApiDataState> emit) async {
    emit(const ApiDataLoading());
    DataState state = await getUsers.getRecommendedExperts();
    if(state is DataSuccess){
      Map<String, List<UserModel>> userFilter = _userFilter(state.data);
      emit(ApiDataLoaded<Map<String, List<UserModel>>>(userFilter));
    }else{
      emit(ApiDataError(error: state.error));
    }
  }
  
  Map<String, List<UserModel>> _userFilter(List<UserModel> data) {
    Map<String, List<UserModel>> users = {};
    users['recommended'] = data;
    List<UserModel> onlineUser = data.where((element) => element.isOnline == true).toList();
    users['online'] = onlineUser;
    return users;
  }
  
  _getChat(ApiDataChat event, Emitter<ApiDataState> emit) async{
    List<ChatModel>? newData = state.data ?? [];
    if(event.chat != null){
      newData?.add(event.chat!);
    }

    emit(const ApiDataLoading());
    DataState dataState = await getChat.getChatMessageUseCase(event.index ?? 0);
    
    if(dataState is DataSuccess){
      newData!.add(dataState.data);
      emit(ApiDataLoaded<List<ChatModel>>(newData));
    }else{
      emit(ApiDataError(error: state.error));
    }
  }

}
