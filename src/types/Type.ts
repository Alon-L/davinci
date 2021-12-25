export abstract class Type<T> {
  public readonly value: T;
  public length?: number;

  protected constructor(values: T) {
    this.value = values;

    this.verify();
  }

  abstract verify(): boolean;
}

export abstract class FixedType<T> extends Type<T> {
  protected constructor(value: T, public length: number) {
    super(value);

    this.length = length;
  }
}

export abstract class DynamicType<T> extends Type<T> {
  protected constructor(value: T) {
    super(value);
  }
}
