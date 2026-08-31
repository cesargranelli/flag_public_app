import 'package:flag_public_app/domain.dart';

import '../api_client.dart';

/// Serviço REST de elencos (roster) de times.
///
/// Seguindo o ADR-006, o elenco é por time + competição (tabela `roster`).
/// As rotas usam `rosterId` em vez de `teamId` direto para entradas.
class RosterApi {
  final ApiClient _client;

  RosterApi(this._client);

  /// Lista o elenco de um time em uma competição específica.
  ///
  /// `GET /api/v1/teams/{teamId}/roster?competitionId={compId}`.
  Future<List<RosterEntry>> listByTeamAndCompetition(
    String teamId,
    String competitionId,
  ) =>
      _client.getList(
        '/api/v1/teams/$teamId/roster?competitionId=$competitionId',
        RosterEntry.fromJson,
      );

  /// Lista os elencos de um time (todas as competições).
  ///
  /// `GET /api/v1/teams/{teamId}/rosters`.
  Future<List<Roster>> listRostersByTeam(String teamId) => _client.getList(
        '/api/v1/teams/$teamId/rosters',
        Roster.fromJson,
      );

  /// Adiciona um atleta a um elenco.
  ///
  /// `POST /api/v1/teams/{teamId}/roster` com `competitionId` no body.
  Future<void> add({
    required String teamId,
    required String competitionId,
    required String athleteId,
    String? nickname,
    int? number,
  }) =>
      _client.post(
        '/api/v1/teams/$teamId/roster',
        {
          'competitionId': competitionId,
          'athleteId': athleteId,
          'nickname': ?nickname,
          'number': ?number,
        },
        (json) => json,
      );

  /// Remove um atleta de um elenco.
  ///
  /// `DELETE /api/v1/teams/{teamId}/roster/{athleteId}`.
  Future<void> remove({
    required String teamId,
    required String athleteId,
  }) =>
      _client.delete('/api/v1/teams/$teamId/roster/$athleteId');

  /// Importa uma carga em lote de atletas no elenco (idempotente).
  Future<RosterBatchResult> createBatch(
    String teamId,
    List<Map<String, dynamic>> athletes,
  ) =>
      _client.post(
        '/api/v1/teams/$teamId/roster/batch',
        {'athletes': athletes},
        RosterBatchResult.fromJson,
      );
}
