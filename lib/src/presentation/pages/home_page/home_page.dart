import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_assessment/src/core/config/injector.dart';
import 'package:oranos_assessment/src/core/utils/size_config.dart';
import 'package:oranos_assessment/src/presentation/pages/home_page/widget/bottom_nav_bar_widget.dart';
import 'package:oranos_assessment/src/presentation/pages/home_page/widget/home_draggable_widget.dart';
import 'package:oranos_assessment/src/presentation/pages/home_page/widget/item_online_widget.dart';
import 'package:oranos_assessment/src/presentation/pages/home_page/widget/item_recommended_widget.dart';
import 'package:oranos_assessment/src/presentation/pages/home_page/widget/section_title_widget.dart';

import '../../../core/config/l10n/generated/l10n.dart';
import '../../../core/utils/constant.dart';
import '../../../data/models/user_model.dart';
import '../../controller/data_bloc/api_data_bloc.dart';
import '../../widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ApiDataBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = injector()..add(ApiDataRecommended());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, Constant.kHeightAppBAr),
        child: AppBarWidget(),
      ),
      body: Stack(
        children: [
          BlocBuilder<ApiDataBloc, ApiDataState>(
            bloc: _usersBloc,
            builder: (context, state) {
              
              if(state is ApiDataLoaded<Map<String, List<UserModel>>>){
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitleWidget(title: S.of(context).home_page_recommended_title, onMore: (){}),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 204,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(state.data!['recommended']!.length, (index) {
                              return ItemRecommendedWidget(
                                user: state.data!['recommended']![index],
                              );
                            }),
                          )
                        ),
                      ),

                      SizedBox(height: SizeConfig.blockSizeVertical * 8),
                      SectionTitleWidget(title: S.of(context).home_page_online_title, onMore: () {}),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 108,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(state.data!['online']!.length, (index) {
                              return ItemOnlineWidget(onlineUser: state.data!['online']![index],);
                            }),
                          )
                        ),
                      ),
                      const SizedBox(height: 24)
                    ],
                  ),
                );
              }

              else if(state is ApiDataError){
                Center(
                  child: Text(state.error!.message),
                );
              }
              
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const HomeDraggableWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}