class NoteModel {
  String title;
  String description;
  bool? isPressed;

  NoteModel({
    required this.title,
    required this.description,
    this.isPressed = false,
  });

}
