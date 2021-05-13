class Property{
  final String propertyName;
  final String propertyAddress;
  final double mortgagePayment;
  final double schoolTax;
  final double municipalTax;
  final double insurance;
  final int numberOfUnits;

  Property(this.propertyName, this.propertyAddress, this.mortgagePayment, this.schoolTax, this.municipalTax, this.insurance, this.numberOfUnits);


  
  Map<String, dynamic> toJson() => {
    'propertyName' : propertyName,
    'propertyAddress' : propertyAddress,
    'mortgagePayment' : mortgagePayment,
    'schoolTax' : schoolTax,
    'municipalTax' : municipalTax,
    'insurance' : insurance,
    'numberOfUnits' : numberOfUnits
  };

}