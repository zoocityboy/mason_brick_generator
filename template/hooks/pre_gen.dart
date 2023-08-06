import 'package:mason/mason.dart';

void run(HookContext context) {
  // Read vars.
  final name = context.vars['name'];
  final description = context.vars['description'];

  // Use the `Logger` instance.
  context.logger.info('Hello $name!');
  context.logger.info('Hello $description!');

  // Update vars.
  context.vars['current_year'] = DateTime.now().year;
}
