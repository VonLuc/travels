//基态
import '../bean/search_result.dart';

abstract class SearchState {
  const SearchState();
}

//无搜索结果
class SearchStateNoSearch extends SearchState {}
//结果为空
class SearchStateEmpty extends SearchState {}
//加载中
class SearchStateLoading extends SearchState {}
//异常
class SearchStateError extends SearchState {}
//有结果
class SearchStateSuccess extends SearchState {
  //搜索结果
  final SearchResult result;
  const SearchStateSuccess(this.result);
}