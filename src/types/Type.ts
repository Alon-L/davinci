export abstract class Type<T> {
  protected constructor(public readonly value: T) {
    this.value = value;
  }

  abstract verify(): boolean;
}

export abstract class FixedType<T> extends Type<T> {
  protected constructor(value: T, private readonly size: number) {
    super(value);

    this.size = size;
  }

  public verify(): boolean {
    if (Array.isArray(this.value) && this.value.length != this.size) {
      throw new TypeError(
        `Number of pixels provided (${this.value.length}) mismatched expected ${this.size}`,
      );
    }

    return false;
  }
}

export abstract class DynamicType<T> extends Type<T> {
  protected constructor(value: T) {
    super(value);
  }
}
