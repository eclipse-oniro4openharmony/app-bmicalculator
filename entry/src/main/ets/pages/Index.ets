import { BmiThreshold, getBmiThreshold } from '../model/BmiThreshold'
import { bmiLabels } from '../resources/BmiLabels'
import '../StringExt';

@Component
struct Field {
  @Prop caption: Resource;
  @Prop unit: string;
  onChange: (string) => void;

  build() {
    Row() {
      Text(this.caption)
        .fontSize(18)
        .width('35%')
        .textAlign(TextAlign.End)
      Flex({ alignItems: ItemAlign.Center }) {
        TextInput()
          .fontSize(28)
          .margin(10)
          .width(120)
          .inputFilter('[0-9.]')
          .maxLength(5)
          .textAlign(TextAlign.End)
          .onChange(this.onChange)
        Text(this.unit)
      }.width('75%')
    }
  }
}

@Entry
@Component
struct Index {
  @State heightValue: string = '';
  @State weightValue: string = '';
  @State bmiThreshold?: BmiThreshold = undefined;
  @State resultVisible: boolean = false;
  @State errorMessageVisible: boolean = false;
  bmi?: number = undefined

  calculateBmi() {
    if (this.heightValue.isNotEmpty() && this.weightValue.isNotEmpty()) {
      const height = Number(this.heightValue) / 100;
      const weight = Number(this.weightValue);
      if (isNaN(height) || isNaN(weight)) {
        this.resultVisible = false;
        this.errorMessageVisible = true;
      } else {
        this.bmi = weight / Math.pow(height, 2);
        this.bmiThreshold = getBmiThreshold(this.bmi);
        this.resultVisible = true;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.EntryAbility_label'))
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .width('100%')
      .height(64)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .backgroundColor(0x752642)

      Column() {
        Field({
          caption:$r('app.string.height'),
          unit: 'cm',
          onChange: ((value: string) => {
            this.heightValue = value;
            this.resultVisible = false;
            this.errorMessageVisible = false;
          })
        })
        Field({
          caption: $r('app.string.weight'),
          unit: 'kg',
          onChange: ((value: string) => {
            this.weightValue = value;
            this.resultVisible = false;
            this.errorMessageVisible = false;
          })
        })
        Button($r('app.string.calculate')).onClick(() => {
          this.calculateBmi();
        })
          .backgroundColor(0xD75C77)
        if (this.resultVisible) {
          Text($r('app.string.your_bmi_is', this.bmi.toFixed(1)))
            .margin({top: 20})
          Text(bmiLabels[this.bmiThreshold])
            .fontSize(24)
        }
        if (this.errorMessageVisible) {
          Text($r('app.string.enter_proper_values'))
            .margin({top: 20})
            .fontColor(Color.White)
            .backgroundColor(0x461123)
            .fontSize(24)
            .padding(10)
            .border({ radius: 4 })
        }
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(0xFBE8EB)
    }
  }
}