import 'package:flutter_test/flutter_test.dart';
import 'package:mart_drive/services/merge_service.dart';

void main() {
  test('m3 3-way merge correctly preserves disjoint edits', () {
    const base = 'Header\n\nSection 1';
    const mine = 'Header (Modified)\n\nSection 1';
    const server = 'Header\n\nSection 1 (Server)';
    final result = MergeService.m3(base, mine, server);
    expect(result.hasConflict, isFalse);
  });
}
