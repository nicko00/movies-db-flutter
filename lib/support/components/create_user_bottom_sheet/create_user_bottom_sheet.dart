import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../features/home/home_factory.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../default_elevated_button.dart';
import '../default_text_form_field.dart';

abstract class CreateUserBottomSheetViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  bool get isDisabled;
  String? get errorMessage;

  void didChangeUsername(String text);
  void didTapCreate();

  VoidCallback? onCreateUser;
}

class CreateUserBottomSheet extends StatefulWidget {
  final CreateUserBottomSheetViewModelProtocol viewModel;

  const CreateUserBottomSheet({super.key, required this.viewModel});

  @override
  State<CreateUserBottomSheet> createState() => _CreateUserBottomSheetState();
}

class _CreateUserBottomSheetState extends State<CreateUserBottomSheet> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: BoxDecoration(
              color: AppColors.lighterBlack,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: AnimatedBuilder(
                animation: widget.viewModel,
                builder: (_, __) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          'Criar conta de usuário',
                          textAlign: TextAlign.center,
                          style: AppFonts.montserratBold(16, color: AppColors.white),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                        child: Text(
                          'Seja bem-vindo ao Cinematica. Para usar o app não é necessário fazer Login, apenas informe como gostaria de ser chamado e seus dados serão salvos no dispositivo',
                          textAlign: TextAlign.center,
                          style: AppFonts.montserratMedium(13, color: AppColors.gray),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DefaultTextFormField(
                        hintText: '',
                        errorText: widget.viewModel.errorMessage,
                        onChanged: widget.viewModel.didChangeUsername,
                      ),
                      const SizedBox(height: 16),
                      DefaultElevatedButton(
                        title: 'Confirmar',
                        isDisabled: widget.viewModel.isDisabled,
                        isLoading: widget.viewModel.isLoading,
                        onTap: widget.viewModel.didTapCreate,
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _bind() {
    widget.viewModel.onCreateUser = () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeFactory.route,
        (_) => false,
      );
    };
  }
}
