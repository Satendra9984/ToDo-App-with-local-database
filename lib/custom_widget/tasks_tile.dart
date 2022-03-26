import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_app/modals/data_provider.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  // final int index;
  final Function toggleIsCheckedState;
  final Function longPressCallBack;

  const TasksTile({
    Key? key,
    // required this.index,
    required this.isChecked,
    required this.title,
    required this.toggleIsCheckedState,
    required this.longPressCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      onLongPress: () async => await longPressCallBack(),
      leading: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (bool? value) async => await toggleIsCheckedState(),
      ),
    );
  }
}
