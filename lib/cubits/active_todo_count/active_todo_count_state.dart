part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeCount;
  const ActiveTodoCountState({required this.activeCount});

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeCount: 0);
  }

  @override
  List<Object> get props => [activeCount];

  ActiveTodoCountState copyWith({
    int? activeCount,
  }) {
    return ActiveTodoCountState(
      activeCount: activeCount ?? this.activeCount,
    );
  }
}
