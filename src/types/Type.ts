import { Pixel } from '../pixel';

export abstract class Type<T = Pixel[]> {
  public readonly value: T;
  public length?: number;

  protected constructor(values: T) {
    this.value = values;
  }

  abstract verify(): void;
}

export abstract class FixedType<T = Pixel[]> extends Type<T> {
  protected constructor(value: T, public length: number) {
    super(value);

    this.length = length;
  }
}

export abstract class DynamicType<T = Pixel[]> extends Type<T> {
  protected constructor(value: T) {
    super(value);
  }
}
