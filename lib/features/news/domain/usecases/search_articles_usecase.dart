// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newsappusingcleanarchitechture/core/usecases/usecase.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';

class SearchArticleUseCase
    implements UseCase<List<ArticleEntity>, SearchArticleParams> {
  @override
  Future<List<ArticleEntity>> call({SearchArticleParams? param}) async {
    final results = param!.articles
        .where((article) =>
            article.title!.toLowerCase().contains(param.query.toLowerCase()) ||
            article.description!
                .toLowerCase()
                .contains(param.query.toLowerCase()))
        .toList();
    return results;
  }
}

class SearchArticleParams {
  List<ArticleEntity> articles;
  String query;
  SearchArticleParams({
    required this.articles,
    required this.query,
  });
}
