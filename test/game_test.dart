import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kestirme_ustasi/oyun_kestirme_ustasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kestirmeConfig.title.length, 33);
    expect(kestirmeConfig.tagline.length, 33);
    for (final s in kestirmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kestirmeConfig.gameId, kestirmeId);
    expect(kestirmeRules.gameId, kestirmeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kestirmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kestirmeId, optionalMechanics: kestirmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kestirmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
