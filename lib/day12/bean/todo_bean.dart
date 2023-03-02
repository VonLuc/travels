class TodoBean {
  final int todoId;
  final String todoTitle;
  final String todoContent;
  final int todoCreateTime;
  final int todoStartTime;
  final int todoEndTime;
  final String todoColor;
  final int todoDone;
  final int todoIcon;

  TodoBean({
    required this.todoId, required this.todoTitle, required this.todoContent,
    required this.todoCreateTime, required this.todoEndTime, required this.todoStartTime,
    this.todoColor = "0xFFFF0000",
    this.todoDone = 0,
    this.todoIcon = 0
});
}