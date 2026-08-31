/// Inscrição de um time em uma competição (join table).
///
/// Substitui o antigo modelo onde `Team` já era pivô entre
/// Organization e Competition.
///
/// Shape de `GET /api/v1/competitions/{compId}/teams`.
class CompetitionTeam {
  final String id;
  final String competitionId;
  final String teamId;
  final String? divisionId;
  final DateTime? createdAt;

  const CompetitionTeam({
    required this.id,
    required this.competitionId,
    required this.teamId,
    this.divisionId,
    this.createdAt,
  });

  factory CompetitionTeam.fromJson(Map<String, dynamic> json) =>
      CompetitionTeam(
        id: json['id'] as String,
        competitionId: json['competitionId'] as String,
        teamId: json['teamId'] as String,
        divisionId: json['divisionId'] as String?,
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
