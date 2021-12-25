import { FixedType } from '..';
import { Pixel, PixelUtils } from '../../pixel';
import { tokens } from '../../tokens';

export class BooleanType extends FixedType<Pixel> {
  constructor(value: Pixel) {
    super(value, 1);
  }

  public verify(): boolean {
    if (!PixelUtils.contains(this.value, tokens.types.boolean.values)) {
      throw new TypeError('Pixel value does not represent a boolean');
    }

    return true;
  }
}
