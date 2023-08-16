import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/usecases/usecase.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';

class GetFavoritesArticleUseCase
    implements UseCase<DataState<List<ArticleEntity?>>, void> {
  final ArticleRepository _articleRepository;

  GetFavoritesArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity?>>> call({void param}) {
    return _articleRepository.getFavorites();
  }
}
