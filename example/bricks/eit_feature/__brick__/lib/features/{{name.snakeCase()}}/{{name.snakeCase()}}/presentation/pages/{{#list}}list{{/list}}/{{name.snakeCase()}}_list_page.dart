import '';
import '';
import '';

import '';
import '';
import '';

class {{name.pascalCase()}}ListPage extends StatelessWidget {
  const {{name.pascalCase()}}ListPage({super.key});
  static const String routeName = '{{name.pascalCase()}}ListPage';
  static const String routePath = '{{name.snakeCase()}}_list_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<{{name.pascalCase()}}ListBloc>(),
      child: EitBackdropScaffold(
        appBar: AppBar(),
        backContent: Container(),
        content: const {{name.pascalCase()}}ListContentView(),
      ),
    );
  }
}
