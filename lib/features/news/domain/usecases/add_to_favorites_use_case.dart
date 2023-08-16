// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/usecases/usecase.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';

class SaveToFavoritesUsecase
    implements UseCase<DataState<String>, SaveToFavoritesParams> {
  final ArticleRepository _articleRepository;

  SaveToFavoritesUsecase(this._articleRepository);

  @override
  Future<DataState<String>> call({SaveToFavoritesParams? param}) async {
    return _articleRepository.saveArticleToFavorites(param!.article);
  }
}

class SaveToFavoritesParams {
  ArticleEntity article;
  SaveToFavoritesParams({
    required this.article,
  });
}
