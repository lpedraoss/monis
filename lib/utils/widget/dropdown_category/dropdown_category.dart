import 'package:flutter/material.dart';
import 'package:monis/utils/golbal_variable.dart';

/// Create a Dropdown with list of categories
class DropDownCategory extends StatefulWidget {
  const DropDownCategory(BuildContext context, {super.key});

  @override
  State<StatefulWidget> createState() {
    return DropDownCategoryState();
  }
}

/// state of dropdown category
class DropDownCategoryState extends State<DropDownCategory> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.arrow_drop_down_circle),
      dropdownColor: Theme.of(context).colorScheme.background.withOpacity(0.7),
      iconDisabledColor: Colors.grey,
      iconEnabledColor:
          Theme.of(context).colorScheme.background.withOpacity(0.7),
      value: selectedItem,
      items: itemsCategory.map((opcion) {
        return DropdownMenuItem(
          value: opcion,
          child: Text(opcion),
        );
      }).toList(),
      onChanged: (valorSeleccionado) {
        setState(() {
          selectedItem = valorSeleccionado;
        });
      },
    );
  }
}
