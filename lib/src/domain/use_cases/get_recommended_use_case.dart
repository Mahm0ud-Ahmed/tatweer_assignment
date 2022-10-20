import '../../core/utils/data_state.dart';
import '../../data/models/user_model.dart';
import '../repositories/i_app_repository.dart';

class GetRecommendedUseCase {
  final IAppRepository _appRepository;
  GetRecommendedUseCase(
    this._appRepository,
  );

    Future<DataState<List<UserModel>>> getRecommendedExperts() async {
      DataState data = await _appRepository.getRecommendedExperts();
      if(data is DataSuccess){
        return DataSuccess<List<UserModel>>(data.data);
      }else{
        return DataFailed(data.error);
      }
    }
    
}
