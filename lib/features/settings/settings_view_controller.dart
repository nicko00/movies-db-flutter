import 'package:flutter/material.dart';

import 'settings_view.dart';

abstract class SettingsProtocol extends SettingsViewModelProtocol {
  void getSettingsValues();
}

class SettingsViewController extends StatefulWidget {
  final SettingsProtocol viewModel;

  const SettingsViewController({super.key, required this.viewModel});

  @override
  State<SettingsViewController> createState() => _SettingsViewControllerState();
}

class _SettingsViewControllerState extends State<SettingsViewController> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getSettingsValues();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsView(viewModel: widget.viewModel);
  }
}
