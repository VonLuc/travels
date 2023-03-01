import 'package:travels/day10/bloc/search/search_event.dart';
import 'package:travels/day10/bloc/search/search_state.dart';
import 'package:travels/day10/bloc/search/Api.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchStateNoSearch(); //初始状态

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is EventTextChanged) {
      if (event.arg.isEmpty) {
        yield SearchStateNoSearch();
      }else {
        yield SearchStateLoading();
        try{
          final results = await GithubApi.search(event.arg);
          if (results.items.isEmpty) yield SearchStateEmpty();
          yield SearchStateSuccess(results);
        }catch (error) {
          yield SearchStateError();
        }
      }
    }
  }
}
