import 'package:eit_uikit/eit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/injection.dart';
import '../../../application/iscubit_cubit/islist_{{name.snakeCase()}}_list/{{name.snakeCase()}}_list_cubit.dart';
import '../../widgets/{{name.snakeCase()}}_list_content_view.dart';

class {{name.pascalCase()}}ListPage extends StatelessWidget {
  const {{name.pascalCase()}}ListPage({super.key});
  static const String routeName = '{{name.pascalCase()}}ListPage';
  static const String routePath = '{{name.snakeCase()}}_list_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<{{name.pascalCase()}}ListCubit>(),
      child: EitBackdropScaffold(
        appBar: AppBar(),
        backContent: Container(),
        content: const {{name.pascalCase()}}ListContentView(),
      ),
    );
  }
}
