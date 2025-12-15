import 'package:finanace_and_expense_app/core/theme/cubit/theme_cubit.dart';
import 'package:finanace_and_expense_app/src/budgets/presentation/screens/budget_screen.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/widgets/balance_card.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/widgets/expense_chart.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/widgets/quick_start.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/widgets/recent_transaction.dart';
import 'package:finanace_and_expense_app/src/transaction/presentation/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add-transaction');
            },
          ),
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state.status == DashboardStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          if (state.status == DashboardStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          return RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardBloc>().add(LoadDashboardData());
            },
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                BalanceCard(
                  balance: state.balance,
                  income: state.totalIncome,
                  expense: state.totalExpense,
                ),
                const SizedBox(height: 20),
                QuickStats(
                  totalTransactions: state.transactions.length,
                  avgTransaction: state.transactions.isNotEmpty
                      ? (state.totalIncome + state.totalExpense) / state.transactions.length
                      : 0,
                ),
                const SizedBox(height: 20),
                ExpenseChart(expensesByCategory: state.expensesByCategory),
                const SizedBox(height: 20),
                RecentTransactions(
                  transactions: state.recentTransactions,
                  onTransactionTap: (transaction) {
                    Navigator.pushNamed(
                      context,
                      '/edit-transaction',
                      arguments: transaction,
                    );
                  },
                  onViewAll: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TransactionsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Budgets',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TransactionsScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BudgetsScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}