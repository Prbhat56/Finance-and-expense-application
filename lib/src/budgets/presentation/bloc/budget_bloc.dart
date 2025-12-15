import 'package:bloc/bloc.dart';
import 'package:finanace_and_expense_app/src/budgets/presentation/bloc/budget_event.dart';
import 'package:finanace_and_expense_app/src/budgets/presentation/bloc/budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc() : super(const BudgetState()) {
    on<LoadBudgets>(_onLoadBudgets);
    on<AddBudget>(_onAddBudget);
    on<UpdateBudget>(_onUpdateBudget);
    on<DeleteBudget>(_onDeleteBudget);
  }

  Future<void> _onLoadBudgets(
    LoadBudgets event,
    Emitter<BudgetState> emit,
  ) async {
    emit(state.copyWith(status: BudgetStatus.loading));
    
    // Mock data for demonstration
    await Future.delayed(const Duration(seconds: 1));
    
    final budgets = [
      {
        'category': 'Food',
        'limit': 10000.0,
        'spent': 8500.0,
      },
      {
        'category': 'Transport',
        'limit': 5000.0,
        'spent': 3200.0,
      },
      {
        'category': 'Shopping',
        'limit': 8000.0,
        'spent': 9500.0,
      },
      {
        'category': 'Entertainment',
        'limit': 3000.0,
        'spent': 2500.0,
      },
    ];
    
    emit(state.copyWith(
      status: BudgetStatus.success,
      budgets: budgets,
    ));
  }

  Future<void> _onAddBudget(
    AddBudget event,
    Emitter<BudgetState> emit,
  ) async {
    // Implementation would add budget to storage
  }

  Future<void> _onUpdateBudget(
    UpdateBudget event,
    Emitter<BudgetState> emit,
  ) async {
    // Implementation would update budget in storage
  }

  Future<void> _onDeleteBudget(
    DeleteBudget event,
    Emitter<BudgetState> emit,
  ) async {
    // Implementation would delete budget from storage
  }
}