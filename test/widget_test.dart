// Testes de unidade do modelo Team (ADR-006).
//
// Valida o parse do novo shape: `Team` agora é entidade própria do clube,
// com `organizationId` obrigatório e sem `competitionId`.

import 'package:flag_public_app/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Team.fromJson', () {
    test('parse do shape completo do ADR-006', () {
      final team = Team.fromJson(const {
        'id': 'team-1',
        'organizationId': 'org-1',
        'name': 'Tigers',
        'shortName': 'TIG',
        'sportName': 'Flag Football',
        'logoUrl': 'https://example.com/logo.png',
        'status': 'ACTIVE',
        'athleteCount': 25,
      });

      expect(team.id, 'team-1');
      expect(team.organizationId, 'org-1');
      expect(team.name, 'Tigers');
      expect(team.shortName, 'TIG');
      expect(team.sportName, 'Flag Football');
      expect(team.logoUrl, 'https://example.com/logo.png');
      expect(team.status, 'ACTIVE');
      expect(team.athleteCount, 25);
    });

    test('parse tolera campos opcionais ausentes', () {
      final team = Team.fromJson(const {
        'id': 'team-2',
        'organizationId': 'org-2',
        'name': 'Eagles',
      });

      expect(team.id, 'team-2');
      expect(team.organizationId, 'org-2');
      expect(team.shortName, isNull);
      expect(team.logoUrl, isNull);
      expect(team.status, isNull);
    });
  });

  group('Team.toJson', () {
    test('serializa apenas campos obrigatórios e não-nulos', () {
      final team = Team(
        id: 'team-1',
        organizationId: 'org-1',
        name: 'Tigers',
      );

      expect(team.toJson(), {
        'organizationId': 'org-1',
        'name': 'Tigers',
      });
    });

    test('não inclui competitionId (removido no ADR-006)', () {
      final team = Team(
        id: 'team-1',
        organizationId: 'org-1',
        name: 'Tigers',
        shortName: 'TIG',
      );

      expect(team.toJson().containsKey('competitionId'), isFalse);
    });
  });
}