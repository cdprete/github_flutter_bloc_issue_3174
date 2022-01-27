import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc_issue_3174/add_item/bloc/add_item_bloc.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddItemBloc(),
      child: BlocConsumer<AddItemBloc, AddItemState>(
        listenWhen: (_, state) => state is NewItemAdded,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "New item '${(state as NewItemAdded).addedItem}' added",
              ),
            ),
          );
          Navigator.pop(context);
          // Trigger here the refresh of the list in the ItemListWidget
        },
        builder: (context, state) => AlertDialog(
          title: const Text('Add item'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () =>
                  context.read<AddItemBloc>().addNewItem(Item(controller.text)),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
