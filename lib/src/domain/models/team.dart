/// Time de um clube/organização.
///
/// Representa a entidade competitiva de um clube. Um time pode ser inscrito
/// em múltiplas competições (via [CompetitionTeam]).
///
/// Shape de `GET /api/v1/teams/{id}` e
/// `GET /api/v1/organizations/{orgId}/teams`.
class Team {
  final String id;
  final String organizationId;
  final String name;
  final String? shortName;
  final String? sportName;
  final String? logoUrl;
  final String? status;
  final int? athleteCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Team({
    required this.id,
    required this.organizationId,
    required this.name,
    this.shortName,
    this.sportName,
    this.logoUrl,
    this.status,
    this.athleteCount,
    this.createdAt,
    this.updatedAt,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'] as String,
        organizationId: json['organizationId'] as String,
        name: json['name'] as String,
        shortName: json['shortName'] as String?,
        sportName: json['sportName'] as String?,
        logoUrl: json['logoUrl'] as String?,
        status: json['status'] as String?,
        athleteCount: json['athleteCount'] as int?,
        createdAt: json['createdAt'] is String
            ? DateTime.tryParse(json['createdAt'] as String)
            : null,
        updatedAt: json['updatedAt'] is String
            ? DateTime.tryParse(json['updatedAt'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'organizationId': organizationId,
        'name': name,
        if (shortName != null) 'shortName': shortName,
        if (sportName != null) 'sportName': sportName,
        if (logoUrl != null) 'logoUrl': logoUrl,
      };
}
