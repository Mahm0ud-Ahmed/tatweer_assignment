
import 'package:oranos_assessment/src/core/utils/data_state.dart';


abstract class IAppRepository{

  Future<DataState> getRecommendedExperts();
  Future<DataState> getChatMessage(int index);
}
