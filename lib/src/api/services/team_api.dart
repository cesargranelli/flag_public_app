import 'package:flag_public_app/domain.dart';

import '../api_client.dart';

/// Serviço REST de times.
///
/// Seguindo o ADR-006, `Team` é entidade própria do clube (não mais pivô).
/// Endpoints de inscrição em competição ficam em [CompetitionTeam].
class TeamApi {
  final ApiClient _client;

  TeamApi(this._client);

  /// Lista os times de uma competição (via `competition_team`).
  Future<List<Team>> listByCompetition(String competitionId) => _client.getList(
        '/api/v1/competitions/$competitionId/teams',
        Team.fromJson,
      );

  /// Lista os times de uma organização (clube).
  Future<List<Team>> listByOrganization(String organizationId) =>
      _client.getList(
        '/api/v1/organizations/$organizationId/teams',
        Team.fromJson,
      );

  Future<Team> getById(String id) =>
      _client.getOne('/api/v1/teams/$id', Team.fromJson);

  /// Cria um time dentro de um clube.
  ///
  /// O backend espera `POST /api/v1/organizations/{orgId}/teams` ou
  /// `POST /api/v1/teams` com `organizationId` obrigatório.
  Future<Team> create({
    required String organizationId,
    required String name,
    String? shortName,
    String? sportName,
    String? logoUrl,
  }) =>
      _client.post(
        '/api/v1/teams',
        {
          'organizationId': organizationId,
          'name': name,
          'shortName': ?shortName,
          'sportName': ?sportName,
          'logoUrl': ?logoUrl,
        },
        Team.fromJson,
      );

  /// Atualiza um time.
  Future<Team> update(
    String id, {
    required String organizationId,
    required String name,
    String? shortName,
    String? sportName,
    String? logoUrl,
  }) =>
      _client.put(
        '/api/v1/teams/$id',
        {
          'organizationId': organizationId,
          'name': name,
          'shortName': ?shortName,
          'sportName': ?sportName,
          'logoUrl': ?logoUrl,
        },
        Team.fromJson,
      );

  /// Remove um time.
  Future<void> delete(String id) => _client.delete('/api/v1/teams/$id');

  /// Inscreve um time em uma competição.
  ///
  /// `POST /api/v1/competitions/{compId}/teams/{teamId}`.
  Future<CompetitionTeam> enrollTeam({
    required String competitionId,
    required String teamId,
    String? divisionId,
  }) =>
      _client.post(
        '/api/v1/competitions/$competitionId/teams/$teamId',
        {'divisionId': ?divisionId},
        CompetitionTeam.fromJson,
      );

  /// Remove a inscrição de um time em uma competição.
  ///
  /// `DELETE /api/v1/competitions/{compId}/teams/{teamId}`.
  Future<void> unenrollTeam({
    required String competitionId,
    required String teamId,
  }) =>
      _client.delete('/api/v1/competitions/$competitionId/teams/$teamId');
}
