import 'package:oranos_assessment/src/data/models/chat_model.dart';

import '../../core/utils/data_state.dart';
import '../repositories/i_app_repository.dart';

class GetChatMessageUseCase {
  final IAppRepository _appRepository;
  GetChatMessageUseCase(
    this._appRepository,
  );

    Future<DataState<ChatModel>> getChatMessageUseCase(int index) async {
      DataState data = await _appRepository.getChatMessage(index);
      if(data is DataSuccess){
        return DataSuccess<ChatModel>(data.data);
      }else{
        return DataFailed(data.error);
      }
    }
    
}
