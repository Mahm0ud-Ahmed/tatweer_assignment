import 'package:get_it/get_it.dart';
import 'package:oranos_assessment/src/domain/use_cases/get_chat_message_use_case.dart';
import 'package:oranos_assessment/src/domain/use_cases/get_recommended_use_case.dart';

import '../../data/repositories/app_repository_imp.dart';
import '../../domain/repositories/i_app_repository.dart';
import '../../presentation/controller/data_bloc/api_data_bloc.dart';
import 'themes/theme_manager.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  
  injector.registerFactory<IAppRepository>(() => AppRepositoryImp());
  injector.registerFactory<GetRecommendedUseCase>(() => GetRecommendedUseCase(injector()));
  injector.registerFactory<GetChatMessageUseCase>(() => GetChatMessageUseCase(injector()));
  injector.registerFactory<ApiDataBloc>(() => ApiDataBloc(injector(), injector()));

  ThemeManager().load();
}
