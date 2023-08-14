import 'package:eit_uikit/eit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/injection.dart';
import '../../../application/iscubit_cubit/isdetail_{{name.snakeCase()}}_detail/{{name.snakeCase()}}_detail_cubit.dart';
import '../../widgets/{{name.snakeCase()}}_detail_content_view.dart';

class {{name.pascalCase()}}DetailPage extends StatelessWidget {
  const {{name.pascalCase()}}DetailPage({super.key});
  static const String routeName = '{{name.pascalCase()}}DetailPage';
  static const String routePath = '{{name.snakeCase()}}_detail_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<{{name.pascalCase()}}DetailCubit>(),
      child: EitBackdropScaffold(
        appBar: AppBar(),
        backContent: Container(),
        content: const {{name.pascalCase()}}DetailContentView(),
      ),
    );
  }
}
