import { Pixel } from './pixel';

/**
 * Represents the type object in the final {@link tokens} object.
 */
type TypeToken<V extends string> = {
  values: Record<V, Pixel>;
  id: Pixel
}

/**
 * The structure of the {@link tokens} object.
 */
export type Tokens = {
  types: {
    boolean: TypeToken<'BOOL_TRUE' | 'BOOL_FALSE'>
  }
}

/**
 * Represents the pixel colors associated to every token in the language.
 */
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
