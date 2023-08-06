import 'package:flutter/material.dart';

class TplFeatureNameListContentView extends StatelessWidget {
  const TplFeatureNameListContentView({super.key});

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
