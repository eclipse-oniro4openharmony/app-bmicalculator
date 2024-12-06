export enum BmiThreshold {
  SevereThinness = 0,
  ModerateThinness = 16,
  MildThinness = 17,
  Normal = 18.5,
  Overweight = 25,
  Obese_I = 30,
  Obese_II = 35,
  Obese_III = 40
};

export function getBmiThreshold(bmi: number): BmiThreshold {
  let result = BmiThreshold.SevereThinness;
  for (let [key, value] of Object.entries(BmiThreshold)) {
    if (!isNaN(Number(key))) continue;
    if (typeof value === 'number' && bmi < value) break;
    result = BmiThreshold[value];
  }
  return result;
}