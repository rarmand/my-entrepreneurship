enum FormType {formSimple, formPeriodical, formInvestment}

class Investment {
  const Investment({
    required this.id,
    required this.name,
    required this.type,
  });

  final String id;
  final String name;
  final FormType type;
}

const investments = {
  // gotówka
  'ca': Investment(
    id: 'ca',
    name: 'cash',
    type: FormType.formSimple,
  ),
  // waluta obca
  'fc': Investment( 
    id: 'fc',
    name: 'foreign currency',
    type: FormType.formSimple,
  ),
  // złoto fizyczne
  'gp': Investment(
    id: 'gp', 
    name: 'physical gold', 
    type: FormType.formSimple,
  ),
  // udziały w złocie (złoto niefizyczne)
  'gs': Investment( 
    id: 'gs',
    name: 'gold shares',
    type: FormType.formSimple,
  ),
  // konto bankowe ROR 
  'ba': Investment(
    id: 'ba',
    name: 'bank account',
    type: FormType.formSimple,
  ),
  // konto oszczędnościowe
  'sa': Investment(
    id: 'sa',
    name: 'savings account',
    type: FormType.formPeriodical,
  ),
  // lokata oszczędnościowa
  'sd': Investment(
    id: 'sd',
    name: 'savings deposit',
    type: FormType.formPeriodical,
  ),
  // obligacja
  'bc': Investment(
    id: 'bc',
    name: 'bond certificates',
    type: FormType.formInvestment,
  ),
  // akcje giełdowe
  'ss': Investment(
    id: 'ss',
    name: 'stock shares',
    type: FormType.formInvestment,
  ),
  // fundusze ETF
  'et': Investment(
    id: 'et',
    name: 'ETFs',
    type: FormType.formInvestment,
  ),
  // kryptowaluta
  'cr': Investment(
    id: 'cr',
    name: 'cryptocurrencies',
    type: FormType.formInvestment,
  ),
  // nieruchomości
  'hp': Investment(
    id: 'hp',
    name: 'house properties',
    type: FormType.formInvestment,
  ),
  // fizyczne dobra jako inwestycje
  'pg': Investment(
    id: 'pg',
    name: 'physical goods',
    type: FormType.formSimple,
  ),
  // inne fundusze
  'of': Investment(
    id: 'of',
    name: 'other funds',
    type: FormType.formSimple,
  )
};
