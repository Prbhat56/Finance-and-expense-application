import 'package:equatable/equatable.dart';

enum BudgetStatus { initial, loading, success, error }

class BudgetState extends Equatable {
  final BudgetStatus status;
  final List<Map<String, dynamic>> budgets;
  final String? errorMessage;
  
  const BudgetState({
    this.status = BudgetStatus.initial,
    this.budgets = const [],
    this.errorMessage,
  });
  
  BudgetState copyWith({
    BudgetStatus? status,
    List<Map<String, dynamic>>? budgets,
    String? errorMessage,
  }) {
    return BudgetState(
      status: status ?? this.status,
      budgets: budgets ?? this.budgets,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  
  @override
  List<Object?> get props => [status, budgets, errorMessage];
}