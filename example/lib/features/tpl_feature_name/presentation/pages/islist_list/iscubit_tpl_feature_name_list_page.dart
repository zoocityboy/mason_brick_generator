import 'package:eit_uikit/eit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/injection.dart';
import '../../../application/iscubit_cubit/islist_tpl_feature_name_list/tpl_feature_name_list_cubit.dart';
import '../../widgets/tpl_feature_name_list_content_view.dart';

class TplFeatureNameListPage extends StatelessWidget {
  const TplFeatureNameListPage({super.key});
  static const String routeName = 'TplFeatureNameListPage';
  static const String routePath = 'tpl_feature_name_list_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TplFeatureNameListCubit>(),
      child: EitBackdropScaffold(
        appBar: AppBar(),
        backContent: Container(),
        content: const TplFeatureNameListContentView(),
      ),
    );
  }
}
