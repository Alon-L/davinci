import { Pixel } from './pixel';

type TypeToken<V extends string> = {
  values: Record<V, Pixel>;
  id: Pixel
}

export type Tokens = {
  types: {
    boolean: TypeToken<'BOOL_TRUE' | 'BOOL_FALSE'>
  }
}

export const tokens: Tokens = {
  types: {
    boolean: {
      values: {
        BOOL_TRUE: [0, 255, 50],
        BOOL_FALSE: [255, 0, 50],
      },
      id: [0, 0, 255],
    },
  },
};
