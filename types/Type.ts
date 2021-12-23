import { Pixel } from '../pixel';

export namespace Types {
  export abstract class Type {
    public readonly values: Pixel[];

    protected constructor(values: Pixel[]) {
      this.values = values;
    }
  }

  export class FixedType extends Type {
    constructor(values: Pixel[], public length: number) {
      super(values);

      this.length = length;
    }
  }

  export class DynamicType extends Type {
    constructor(values: Pixel[]) {
      super(values);
    }
  }
}
