import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool) onChanged;
  const MeetingOptions({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        color: secondaryBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Switch.adaptive(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
