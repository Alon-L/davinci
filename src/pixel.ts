/**
 * Represents a single pixel on the input canvas. A pixel is made of 3 channels: red, green and blue - each represented by an 8-bit unsigned integer.
 */
export type Pixel = [number, number, number];

/**
 * Utility functions for the {@link Pixel} tuple.
 */
export class PixelUtils {
  /**
   * Returns whether a pixel is included in a list of pixels.
   */
  public static contains(pixel: Pixel, matches: Pixel[] | Record<string, Pixel>): boolean {
    const values = Array.isArray(matches)
      ? matches
      : Object.values(matches);

    return values.some(match => this.equals(pixel, match));
  }

  /**
   * Returns whether two pixels have the same values for all channels.
   */
  public static equals(pixel1: Pixel, pixel2: Pixel): boolean {
    return pixel1.every((c, i) => c == pixel2[i]);
  }
}
