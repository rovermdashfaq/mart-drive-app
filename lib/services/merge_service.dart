class MergeResult {
  final String text;
  final bool hasConflict;
  final String? conflictText;
  MergeResult({required this.text, this.hasConflict = false, this.conflictText});
}

class SpanMatch {
  final int prefix;
  final int suffix;
  SpanMatch({required this.prefix, required this.suffix});
}

class MergeService {
  static SpanMatch span(String a, String b) {
    int p = 0;
    final int minLen = a.length < b.length ? a.length : b.length;
    while (p < minLen && a.codeUnitAt(p) == b.codeUnitAt(p)) p++;
    int s = 0;
    while (s < (minLen - p) && a.codeUnitAt(a.length - 1 - s) == b.codeUnitAt(b.length - 1 - s)) s++;
    return SpanMatch(prefix: p, suffix: s);
  }

  static MergeResult m3(String base, String mine, String server) {
    if (mine == server) return MergeResult(text: mine);
    if (mine == base) return MergeResult(text: server);
    if (server == base) return MergeResult(text: mine);

    final mSpan = span(base, mine);
    final int mMidLen = mine.length - mSpan.prefix - mSpan.suffix;
    final sSpan = span(base, server);
    final int sMidLen = server.length - sSpan.prefix - sSpan.suffix;

    final int mStart = mSpan.prefix;
    final int mEndInBase = base.length - mSpan.suffix;
    final int sStart = sSpan.prefix;
    final int sEndInBase = base.length - sSpan.suffix;

    if (mEndInBase <= sStart) {
      final mineChunk = mine.substring(mStart, mStart + mMidLen);
      final serverChunk = server.substring(sStart, sStart + sMidLen);
      return MergeResult(text: '${base.substring(0, mStart)}$mineChunk${base.substring(mEndInBase, sStart)}$serverChunk${base.substring(sEndInBase)}');
    }

    if (sEndInBase <= mStart) {
      final serverChunk = server.substring(sStart, sStart + sMidLen);
      final mineChunk = mine.substring(mStart, mStart + mMidLen);
      return MergeResult(text: '${base.substring(0, sStart)}$serverChunk${base.substring(sEndInBase, mStart)}$mineChunk${base.substring(mEndInBase)}');
    }

    return MergeResult(text: server, hasConflict: true, conflictText: mine);
  }
}