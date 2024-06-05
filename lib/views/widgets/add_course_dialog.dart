import 'package:flutter/material.dart';

class AddCourseDialog extends StatefulWidget {
  const AddCourseDialog({super.key});

  @override
  State<AddCourseDialog> createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  String imageUrl = "";
  String title = "";
  String description = "";
  double price = 0;
  final formKey = GlobalKey<FormState>();

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(context, {
        "imageUrl": imageUrl,
        "price": price,
        "title": title,
        "description": description
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("New course"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Course title",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltimos kurs nomini kiriting";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  title = newValue!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Course description",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "PLease enter course description";
                  } else if (value.length < 10) {
                    return "Course description can't be less than 10 words";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  description = newValue!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Course price",
                ),
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return "please enter course price appropriately";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  price = double.parse(newValue!);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Course image url",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "PLease give image url for course";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  imageUrl = newValue!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Bekor qilish",
              style: TextStyle(color: Colors.amber),
            ),
          ),
          FilledButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.amber)),
            onPressed: submit,
            child: const Text("Saqlash"),
          ),
        ]);
  }
}
