import { BooleanType } from '../../../src/types';
import { tokens } from '../../../src/tokens';

test('create boolean type', () => {
  const boolean = new BooleanType(tokens.types.boolean.values.BOOL_TRUE);

  const badBoolean = new BooleanType([0, 0, 0]);
  expect(badBoolean.verify).toThrow();
});
