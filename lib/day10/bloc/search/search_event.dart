//事件基
abstract class SearchEvent {
  const SearchEvent();
}

class EventTextChanged extends SearchEvent {
  final String arg;
  const EventTextChanged(this.arg);
}

