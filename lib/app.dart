import 'package:finanace_and_expense_app/core/constants/app_constant.dart';
import 'package:finanace_and_expense_app/core/theme/app_theme.dart';
import 'package:finanace_and_expense_app/core/theme/cubit/theme_cubit.dart';
import 'package:finanace_and_expense_app/init.dart';
import 'package:finanace_and_expense_app/src/budgets/presentation/bloc/budget_bloc.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:finanace_and_expense_app/src/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:finanace_and_expense_app/src/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => sl<ThemeCubit>(),
        ),
        BlocProvider<TransactionBloc>(
          create: (_) => sl<TransactionBloc>(),
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => sl<DashboardBloc>(),
        ),
        BlocProvider<BudgetBloc>(
          create: (_) => sl<BudgetBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Smart Finance Tracker',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.themeMode,
            debugShowCheckedModeBanner: false,
            home: const DashboardScreen(),
            routes: AppConstants.routes,
          );
        },
      ),
    );
  }
}