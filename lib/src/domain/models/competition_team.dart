/// Inscrição de um time em uma competição (join table).
///
/// Substitui o antigo modelo onde `Team` já era pivô entre
/// Organization e Competition.
///
/// Shape de `GET /api/v1/competitions/{compId}/teams`:
/// `{id, competitionId, teamId, teamName, organizationId, organizationName,
/// divisionId, createdAt}`.
class CompetitionTeam {
  final String id;
  final String competitionId;
  final String teamId;
  final String? divisionId;

  /// Dados derivados do time (para exibição na listagem da competição).
  final String? teamName;
  final String? organizationId;
  final String? organizationName;

  final DateTime? createdAt;

  const CompetitionTeam({
    required this.id,
    required this.competitionId,
    required this.teamId,
    this.divisionId,
    this.teamName,
    this.organizationId,
    this.organizationName,
    this.createdAt,
  });

  factory CompetitionTeam.fromJson(Map<String, dynamic> json) =>
      CompetitionTeam(
        id: json['id'] as String,
        competitionId: json['competitionId'] as String,
        teamId: json['teamId'] as String,
        divisionId: json['divisionId'] as String?,
        teamName: json['teamName'] as String?,
        organizationId: json['organizationId'] as String?,
        organizationName: json['organizationName'] as String?,
        createdAt: json['createdAt'] is String
            ? DateTime.tryParse(json['createdAt'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'competitionId': competitionId,
        'teamId': teamId,
        if (divisionId != null) 'divisionId': divisionId,
      };
}
