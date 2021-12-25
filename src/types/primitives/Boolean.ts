import { FixedType } from '../Type';
import { Pixel, PixelUtils } from '../../pixel';
import { tokens } from '../../tokens';

export class BooleanType extends FixedType<Pixel> {
  public static size: number = 1;

  constructor(value: Pixel) {
    super(value, BooleanType.size);
  }

  public verify(): boolean {
    if (!PixelUtils.contains(this.value, tokens.types.boolean.values)) {
      throw new TypeError('Pixel value does not represent a boolean');
    }

    return super.verify();
  }
}
