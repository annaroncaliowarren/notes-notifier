import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'note_model.dart';

class NotesNotifier extends StateNotifier<List<NoteModel>> {
  NotesNotifier() : super([]);

  void addNote(NoteModel note) {
    if (note.title.isNotEmpty) {
      state = [note, ...state];
    }
  }

  void selectNote(NoteModel note) {
    NoteModel model = NoteModel(
      title: note.title,
      description: note.description,
      isPressed: !note.isPressed!,
    );

    addNote(model);
    removeNote(note);
  }

  void removeNote(NoteModel note) {
    state = state.where((noteOfList) => noteOfList != note).toList();
  }
}
