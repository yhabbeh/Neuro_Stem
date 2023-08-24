class TypeOfModel {
  TypeOfModel(
      {required this.onTap,
      required this.title,
      required this.imagePath,
      required this.id});
  final String title;
  final String imagePath;
  final int id;
  final void Function()? onTap;
}
