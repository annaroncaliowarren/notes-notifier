import 'package:app_notes_notifier/notes/note_model.dart';
import 'package:app_notes_notifier/notes/notes_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteModel>>(
  (ref) => NotesNotifier(),
);

class NotesPage extends StatefulHookConsumerWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends ConsumerState<NotesPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple.shade200,
                  ),
                ),
                labelText: 'Título',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple.shade200,
                  ),
                ),
                hintText: 'Escreva seu insight',
                labelText: 'Descrição',
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: ListTile(
                      selected: notes[index].isPressed!,
                      selectedTileColor: Colors.purple.shade100,
                      selectedColor: Colors.black,
                      tileColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      title: Text(
                        notes[index].title,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      subtitle: Text(
                        notes[index].description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                          width: 2,
                          color: Colors.purple.shade300,
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () {
                          notes[index].isPressed;
                        },
                        icon: Icon(
                          notes[index].isPressed!
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          color: Colors.purple.shade300,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          ref
                              .read(notesProvider.notifier)
                              .removeNote(notes[index]);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(notesProvider.notifier).addNote(
                NoteModel(
                  title: titleController.text,
                  description: descriptionController.text,
                ),
              );
          titleController.clear();
          descriptionController.clear();
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
