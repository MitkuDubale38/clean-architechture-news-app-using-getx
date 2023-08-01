import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/usecases/usecase.dart';
import 'package:newsappusingcleanarchitechture/data/repository/article_repository_impl.dart';
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
}
