import 'package:flutter/material.dart';

class DropDownEasyService extends StatelessWidget {
  final ValueNotifier<String> selectedItem;
  const DropDownEasyService({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      focusColor: Colors.white,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(32),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        hintText: "Selecione seu tipo",
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        labelText: "Tipo de Usuário",
        prefixIcon: Icon(Icons.person),
      ),
      hint: const Text('Tipo de Usuário'),
      value: selectedItem.value,
      items: [
        DropdownMenuItem(
            value: "Prestador",
            child: Text("Prestador de Serviço",
                style: Theme.of(context).textTheme.titleSmall)),
        DropdownMenuItem(
            value: "Cliente",
            child:
                Text("Cliente", style: Theme.of(context).textTheme.titleSmall)),
      ],
      onChanged: (value) {
        selectedItem.value = value!;
      },
    );
  }
}
