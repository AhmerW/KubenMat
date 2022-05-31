class PriceService {
  int getDeliveryCost(int productCost) {
    if (productCost <= 50) {
      return 10;
    } else if (productCost <= 100) {
      return 20;
    } else if (productCost <= 150) {
      return 30;
    } else if (productCost <= 200) {
      return 35;
    } else if (productCost <= 250) {
      return 50;
    } else if (productCost <= 300) {
      return 60;
    } else if (productCost <= 350) {
      return 70;
    } else if (productCost <= 400) {
      return 80;
    } else if (productCost <= 450) {
      return 90;
    } else if (productCost <= 500) {
      return 100;
    }
    return 0;
  }
}
