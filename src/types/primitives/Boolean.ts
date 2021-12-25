import { Pixel, PixelUtils } from '../../pixel';
import { FixedType } from '../index';
import { tokens } from '../../tokens';

export class BooleanType extends FixedType<Pixel> {
  constructor(value: Pixel) {
    super(value, 1);
  }

  public verify(): void {

  }
}
