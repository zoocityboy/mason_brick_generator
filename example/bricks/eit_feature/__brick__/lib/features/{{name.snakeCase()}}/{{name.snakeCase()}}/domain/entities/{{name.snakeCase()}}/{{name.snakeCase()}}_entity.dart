import '';

typedef {{name.pascalCase()}}Entities = List<{{name.pascalCase()}}Entity>;

class {{name.pascalCase()}}Entity extends Equatable {
  const {{name.pascalCase()}}Entity({
    required this.id,
  });
  final int id;
  @override
  List<Object?> get props => [id];

  {{name.pascalCase()}}Entity copyWith({
    int? id,
  }) {
    return {{name.pascalCase()}}Entity(
      id: id ?? this.id,
    );
  }
}
