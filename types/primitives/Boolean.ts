import { Pixel } from '../../pixel';
import { FixedType } from '../';

export class BooleanType extends FixedType<Pixel> {
  constructor(value: Pixel) {
    super(value, 1);
  }

  public verify(): void {

  }
}
