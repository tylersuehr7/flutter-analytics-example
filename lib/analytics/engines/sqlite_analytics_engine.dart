import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../analytics.dart';

class SqliteAnalyticsEngine implements IAnalyticsEngine {
  Database? _database;
  bool _isProcessing = false;
  final List<AnalyticsEvent> _eventsQueue = [];

  @override
  Future<void> initialize() async {
    final String databasesDir = await getDatabasesPath();
    final String databasePath = join(databasesDir, "analytics.db");
    _database = await openDatabase(
      databasePath,
      onCreate: _onCreateDatabase,
      onUpgrade: _onUpgradeDatabase,
      version: 1,
    );
  }

  @override
  void submit(AnalyticsEvent event) {
    _eventsQueue.add(event);

    if (_isProcessing) {
      return;
    }

    _isProcessing = true;

    try {
      _processAllQueuedEvents();
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _processAllQueuedEvents() async {
    final Batch batch = _database!.batch();

    while (_eventsQueue.isNotEmpty) {
      final AnalyticsEvent event = _eventsQueue.removeLast();
      batch.insert(_AllAnalyticsTable.tableName, {
        _AllAnalyticsTable.columnCreated: DateTime.now().toIso8601String(),
        _AllAnalyticsTable.columnEventName: event.eventName,
        _AllAnalyticsTable.columnEventPayload: jsonEncode(event.properties),
      });
    }

    await batch.apply(continueOnError: true);
  }

  static Future<void> _onCreateDatabase(final Database db, final int version) async {
    await db.execute(_AllAnalyticsTable.tableCreateSql);
  }

  static Future<void> _onUpgradeDatabase(final Database db, final int oldVersion, final int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS ${_AllAnalyticsTable.tableName}");
    await _onCreateDatabase(db, newVersion);
  }
}

final class _AllAnalyticsTable {
  final DateTime created;
  final String eventName;
  final Map<String, dynamic> eventPayload;

  const _AllAnalyticsTable({
    required this.created,
    required this.eventName,
    required this.eventPayload,
  });

  static const String tableName = "all_analytics";
  static const String columnCreated = "created";
  static const String columnEventName = "event_name";
  static const String columnEventPayload = "event_payload";

  static const String tableCreateSql = """
  CREATE TABLE "$tableName"(
    "$columnCreated" TEXT UNIQUE NOT NULL,
    "$columnEventName" TEXT NOT NULL,
    "$columnEventPayload" TEXT NOT NULL,
    PRIMARY KEY ("$columnCreated")
  );
  """;

  @override
  String toString() => tableName;
}
