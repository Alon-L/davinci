export type Pixel = [number, number, number];

export class PixelUtils {
  public static any(pixel: Pixel, matches: Pixel[] | Record<string, Pixel>): boolean {
    const values = Array.isArray(matches)
      ? matches
      : Object.values(matches);

    return values.some(match => this.compare(pixel, match));
  }

  public static compare(pixel1: Pixel, pixel2: Pixel): boolean {
    return pixel1.every((c, i) => c == pixel2[i]);
  }
}
