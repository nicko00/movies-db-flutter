import 'package:flutter/material.dart';

import '../../../support/components/default_screen.dart';
import '../../../support/components/default_text_form_field.dart';
import '../../../support/components/placeholders/loading_view.dart';
import 'item/search_movies_item_view.dart';

abstract class SearchMoviesViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  String? get errorMesssage;
  List<SearchMoviesItemViewModelProtocol> get itemViewModels;

  void onChangeText(String text);
}

class SearchMoviesView extends StatelessWidget {
  final SearchMoviesViewModelProtocol viewModel;

  const SearchMoviesView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            DefaultTextFormField(
              hintText: 'Pesquisar',
              onChanged: viewModel.onChangeText,
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: viewModel,
              builder: (_, __) {
                if (viewModel.isLoading) return const LoadingView();

                return Flexible(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: viewModel.itemViewModels.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (_, index) {
                      final itemViewModel = viewModel.itemViewModels[index];

                      return SearchMoviesItemView(itemViewModel: itemViewModel);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
