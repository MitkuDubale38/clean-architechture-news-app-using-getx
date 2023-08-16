// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/usecases/usecase.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';

class RemoveFromFavoritesUsecase
    implements UseCase<DataState<String>, RemoveFromFavoritesParams> {
  final ArticleRepository _articleRepository;

  RemoveFromFavoritesUsecase(this._articleRepository);

  @override
  Future<DataState<String>> call({RemoveFromFavoritesParams? param}) async {
    dynamic articleList = await _articleRepository.getFavorites();
    if (articleList is DataSuccess) {
      articleList.data.removeWhere(
          (element) => element.title == param?.articleToBeRemoved.title);
      return _articleRepository.saveFavorites(articleList.data);
    } else {
      return const DataFailed("Failed to Remove article from favorites");
    }
  }
}

class RemoveFromFavoritesParams {
  ArticleEntity articleToBeRemoved;
  RemoveFromFavoritesParams({
    required this.articleToBeRemoved,
  });
}
