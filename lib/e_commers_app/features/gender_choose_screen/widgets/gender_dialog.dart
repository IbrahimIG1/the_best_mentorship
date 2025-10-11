import 'package:flutter/material.dart';

void showGenderDialog(BuildContext context, String gender) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text("Selected: $gender"),
      content: Text("You’ve chosen $gender category.\nContinue shopping in this style?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // TODO: Navigate to next screen (e.g. Home)
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8A63F7),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text("Continue"),
        ),
      ],
    ),
  );
}
