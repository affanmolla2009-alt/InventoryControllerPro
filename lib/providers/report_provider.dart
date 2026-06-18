import 'package:flutter/foundation.dart';

import '../models/inventory.dart';
import '../repositories/report_repository.dart';

enum ReportType {
  daily,
  weekly,
  monthly,
  yearly,
  custom,
}

class ReportProvider extends ChangeNotifier {
  ReportProvider({
    required ReportRepository repository,
  }) : _repository = repository;

  final ReportRepository _repository;

  bool _isLoading = false;

  List<Inventory> _reportItems = [];

  DateTime? _startDate;

  DateTime? _endDate;

  ReportType _reportType =
      ReportType.daily;

  bool get isLoading =>
      _isLoading;

  List<Inventory> get reportItems =>
      _reportItems;

  DateTime? get startDate =>
      _startDate;

  DateTime? get endDate =>
      _endDate;

  ReportType get reportType =>
      _reportType;

  Future<void> generateDailyReport(
    DateTime date,
  ) async {
    _isLoading = true;

    notifyListeners();

    _reportType = ReportType.daily;

    _startDate = date;

    _endDate = date;

    _reportItems =
        await _repository
            .getReportByDate(
      date,
    );

    _isLoading = false;

    notifyListeners();
  }

  Future<void> generateWeeklyReport(
    DateTime start,
    DateTime end,
  ) async {
    _isLoading = true;

    notifyListeners();

    _reportType = ReportType.weekly;

    _startDate = start;

    _endDate = end;

    _reportItems =
        await _repository
            .getReportBetweenDates(
      start,
      end,
    );

    _isLoading = false;

    notifyListeners();
  }

  Future<void> generateMonthlyReport(
    int month,
    int year,
  ) async {
    _isLoading = true;

    notifyListeners();

    _reportType =
        ReportType.monthly;

    _reportItems =
        await _repository
            .getMonthlyReport(
      month,
      year,
    );

    _isLoading = false;

    notifyListeners();
  }

  Future<void> generateYearlyReport(
    int year,
  ) async {
    _isLoading = true;

    notifyListeners();

    _reportType =
        ReportType.yearly;

    _reportItems =
        await _repository
            .getYearlyReport(
      year,
    );

    _isLoading = false;

    notifyListeners();
  }

  Future<void> generateCustomReport({
    required DateTime start,
    required DateTime end,
  }) async {
    _isLoading = true;

    notifyListeners();

    _reportType =
        ReportType.custom;

    _startDate = start;

    _endDate = end;

    _reportItems =
        await _repository
            .getReportBetweenDates(
      start,
      end,
    );

    _isLoading = false;

    notifyListeners();
  }

  int get totalProducts =>
      _reportItems.length;

  int get totalQuantity {
    int total = 0;

    for (final item
        in _reportItems) {
      total += item.quantity;
    }

    return total;
  }

  void clearReport() {
    _reportItems = [];

    _startDate = null;

    _endDate = null;

    _reportType =
        ReportType.daily;

    notifyListeners();
  }

  Future<void> refresh() async {
    if (_startDate == null) {
      return;
    }

    switch (_reportType) {
      case ReportType.daily:
        await generateDailyReport(
          _startDate!,
        );
        break;

      case ReportType.weekly:
      case ReportType.custom:
        await generateCustomReport(
          start: _startDate!,
          end: _endDate!,
        );
        break;

      case ReportType.monthly:
        await generateMonthlyReport(
          _startDate!.month,
          _startDate!.year,
        );
        break;

      case ReportType.yearly:
        await generateYearlyReport(
          _startDate!.year,
        );
        break;
    }
  }
}