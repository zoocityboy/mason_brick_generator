import '';
import '';
import '';

import '';
import '';
import '';

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
