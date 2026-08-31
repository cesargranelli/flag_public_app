enum OrganizationType {
  federation,
  league,
  association,
  university,
  club,
  other;

  static OrganizationType fromJson(String value) => switch (value) {
        'FEDERATION' => OrganizationType.federation,
        'LEAGUE' => OrganizationType.league,
        'ASSOCIATION' => OrganizationType.association,
        'UNIVERSITY' => OrganizationType.university,
        'CLUB' => OrganizationType.club,
        'OTHER' => OrganizationType.other,
        _ => throw FormatException('Tipo de organizacao desconhecido: $value'),
      };

  String toJson() => switch (this) {
        OrganizationType.federation => 'FEDERATION',
        OrganizationType.league => 'LEAGUE',
        OrganizationType.association => 'ASSOCIATION',
        OrganizationType.university => 'UNIVERSITY',
        OrganizationType.club => 'CLUB',
        OrganizationType.other => 'OTHER',
      };

  String get label => switch (this) {
        OrganizationType.federation => 'Federacao',
        OrganizationType.league => 'Liga',
        OrganizationType.association => 'Associacao',
        OrganizationType.university => 'Universitario',
        OrganizationType.club => 'Clube',
        OrganizationType.other => 'Outro',
      };
}
