

import 'package:oranos_assessment/src/core/utils/data_state.dart';
import 'package:oranos_assessment/src/data/models/chat_model.dart';
import 'package:oranos_assessment/src/data/models/user_model.dart';

import '../../core/error/error_model.dart';
import '../../domain/repositories/i_app_repository.dart';
import '../local_data.dart';

class AppRepositoryImp extends IAppRepository {

  @override
  Future<DataState> getRecommendedExperts() async {
    List<UserModel> allUsers = [];
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        for (var user in users) {
          allUsers.add(UserModel.fromJson(user));
        }
        },
      );
      return DataSuccess<List<UserModel>>(allUsers);
    } on  Exception catch (error){
      return DataFailed(
        ErrorModel(
          message: error.toString(),
        ),
      );
    }
    
  }
  
  @override
  Future<DataState> getChatMessage(int index) async{
    late ChatModel chatModel;
    try {
      await Future.delayed(const Duration(seconds: 0), () {
          chatModel = ChatModel.fromJson(chat[index]);
        },
      );
      return DataSuccess<ChatModel>(chatModel);
    } on  Exception catch (error){
      return DataFailed(
        ErrorModel(
          message: error.toString(),
        ),
      );
    }
  }

  

}
