import '';

class {{name.pascalCase()}}ListContentView extends StatelessWidget {
  const {{name.pascalCase()}}ListContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: const Text('Tpl Feature Name List Content View'),
          subtitle: Text('subtitle $index'),
          trailing: Text('$index'),
        );
      },
      itemCount: 200,
    );
  }
}
