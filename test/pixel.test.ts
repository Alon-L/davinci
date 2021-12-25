import { Pixel, PixelUtils } from '../src/pixel';

describe('matching pixel to multiple options', () => {
  const p: Pixel = [255, 255, 255];

  test('array', () => {
    const options: Pixel[] = [[0, 255, 255], [15, 20, 35], [255, 255, 255], [3, 2, 1]];

    expect(PixelUtils.contains(p, options)).toBe(true);
  });

  test('object', () => {
    const options: Record<string, Pixel> = {
      opt1: [0, 255, 255],
      opt2: [15, 20, 35],
      opt3: [3, 2, 1],
      opt4: [255, 255, 255],
    };

    expect(PixelUtils.contains(p, options)).toBe(true);
  });
})
