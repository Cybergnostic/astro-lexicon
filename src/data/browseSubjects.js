export const browseSubjects = [
  {
    slug: 'dignities-debilities',
    name: 'Dignities & Debilities',
    detail: 'Domicile, exaltation, terms, faces, fall, detriment and related conditions',
    keywords: ['dignit', 'domicile', 'exalt', 'triplicit', 'term', 'bound', 'face', 'decan', 'detriment', 'fall', 'reception']
  },
  {
    slug: 'planetary-motion',
    name: 'Planetary Motion',
    detail: 'Application, separation, retrogradation, orientality and solar phase',
    keywords: ['motion', 'application', 'separation', 'retrograd', 'station', 'direct', 'swift', 'slow', 'oriental', 'occidental', 'combust', 'beams', 'cazimi', 'synodic', 'phase']
  },
  {
    slug: 'perfection-impediments',
    name: 'Perfection & Impediments',
    detail: 'Translation, collection, prohibition, refrenation and frustration',
    keywords: ['perfection', 'translation of light', 'collection of light', 'prohibition', 'refrenation', 'frustration', 'abscission', 'evasion', 'return of virtue', 'resistance', 'contrariety', 'interruption', 'mediation']
  },
  {
    slug: 'signs-divisions',
    name: 'Signs & Divisions',
    detail: 'Signs, triplicities, decans, lunar mansions and zodiacal subdivisions',
    keywords: ['zodiac', 'sign', 'triplicit', 'decan', 'face', 'lunar mansion', 'division', 'dodecatemor', 'twelfth-part', 'bound', 'term']
  },
  {
    slug: 'sect-condition',
    name: 'Sect & Planetary Condition',
    detail: 'Diurnal and nocturnal doctrine, hayz and related conditions',
    keywords: ['sect', 'diurnal', 'nocturnal', 'hayz', 'halb', 'condition', 'benefic', 'malefic', 'temperament', 'quality']
  },
  {
    slug: 'horary-questions',
    name: 'Horary & Questions',
    detail: 'Interrogational doctrine, significators and judgment of questions',
    keywords: ['horary', 'question', 'interrog', 'significator', 'querent', 'quesited', 'perfection', 'translation', 'collection', 'prohibition', 'frustration', 'refrenation']
  },
  {
    slug: 'natal-astrology',
    name: 'Natal Astrology',
    detail: 'Nativities, profession, longevity and rectification terminology',
    keywords: ['natal', 'nativity', 'nativities', 'profession', 'longevity', 'rectification', 'hyleg', 'alcocoden', 'temperament', 'quality of mind', 'children', 'marriage']
  },
  {
    slug: 'predictive-techniques',
    name: 'Predictive Techniques',
    detail: 'Revolutions, time-lord methods and annual techniques',
    keywords: ['predict', 'profection', 'firdar', 'alfridar', 'revolution', 'return', 'direction', 'distribution', 'time lord', 'time-lord', 'lord of year', 'ages of life']
  },
  {
    slug: 'mundane-electional',
    name: 'Mundane & Electional',
    detail: 'World-year doctrine, elections, weather and collective indications',
    keywords: ['mundane', 'world', 'election', 'electional', 'weather', 'ingress', 'conjunction', 'collective', 'revolution of the year']
  }
];

const normalize = (value = '') => String(value).toLowerCase();

export function searchableSubjectText(term) {
  return [
    term.slug,
    term.label,
    term.category,
    term.short_definition,
    ...(term.aliases ?? []).map((item) => item.label),
    ...(term.concept_families ?? []).flatMap((family) => [
      family.slug,
      family.label,
      family.description,
      ...(family.members ?? []).map((member) => `${member.role_label ?? ''} ${member.note ?? ''}`)
    ])
  ].filter(Boolean).join(' ').toLowerCase();
}

export function subjectSlugsForTerm(term) {
  const haystack = searchableSubjectText(term);
  return browseSubjects
    .filter((subject) => subject.keywords.some((keyword) => haystack.includes(normalize(keyword))))
    .map((subject) => subject.slug);
}

export function subjectBySlug(slug) {
  return browseSubjects.find((subject) => subject.slug === slug) ?? null;
}
