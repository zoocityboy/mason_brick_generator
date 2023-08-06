import 'package:eit_uikit/eit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/injection.dart';
import '../../../application/iscubit_cubit/isdetail_tpl_feature_name_detail/tpl_feature_name_detail_cubit.dart';
import '../../widgets/tpl_feature_name_detail_content_view.dart';

class TplFeatureNameDetailPage extends StatelessWidget {
  const TplFeatureNameDetailPage({super.key});
  static const String routeName = 'TplFeatureNameDetailPage';
  static const String routePath = 'tpl_feature_name_detail_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TplFeatureNameDetailCubit>(),
      child: EitBackdropScaffold(
        appBar: AppBar(),
        backContent: Container(),
        content: const TplFeatureNameDetailContentView(),
      ),
    );
  }
}
