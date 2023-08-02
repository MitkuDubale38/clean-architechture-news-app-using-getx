import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/resources/local_data_state.dart';
import 'package:newsappusingcleanarchitechture/core/usecases/usecase.dart';
import 'package:newsappusingcleanarchitechture/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void param}) {
    return _articleRepository.getNewsArticles();
  }

  List<ArticleEntity> searchArticle(
      String query, List<ArticleEntity> articles) {
    final results = articles
        .where((article) =>
            article.title!.toLowerCase().contains(query.toLowerCase()) ||
            article.description!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return results;
  }

  Future<LocalDataState<bool>> saveToFavorites(ArticleEntity article) {
    return _articleRepository.addToFavorite(article);
  }

  Future<LocalDataState<List<ArticleEntity>>> getFavArticles() {
    return _articleRepository.getFavoriteArticles();
  }

  Future<LocalDataState<bool>> removeFromFavorites(ArticleEntity article) {
    return _articleRepository.removeFromFavorite(article);
  }
}
