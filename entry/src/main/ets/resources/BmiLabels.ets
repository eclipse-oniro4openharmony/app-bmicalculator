interface BmiLabels {
  SevereThinness: string|Resource
  ModerateThinness: string|Resource
  MildThinness: string|Resource
  Normal: string|Resource
  Overweight: string|Resource
  Obese_I: string|Resource
  Obese_II: string|Resource
  Obese_III: string|Resource
}

export const bmiLabels: BmiLabels = {
  SevereThinness: $r('app.string.bmi_threshold_severe_thinness'),
  ModerateThinness: $r('app.string.bmi_threshold_moderate_thinness'),
  MildThinness: $r('app.string.bmi_threshold_mild_thinness'),
  Normal: $r('app.string.bmi_threshold_normal'),
  Overweight: $r('app.string.bmi_threshold_overweight'),
  Obese_I: $r('app.string.bmi_threshold_obese_i'),
  Obese_II: $r('app.string.bmi_threshold_obese_ii'),
  Obese_III: $r('app.string.bmi_threshold_obese_iii')
};
