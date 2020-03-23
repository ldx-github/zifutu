package zifutu;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class AsciiPic {
	public static String createAsciiPic(final String path) throws IOException {
		final String base = "@#&%?*+>/-.";

		final BufferedImage image = ImageIO.read(new File(path));
		String temp = "";
		for (int y = 0; y < image.getHeight(); y++) {
			for (int x = 0; x < image.getWidth(); x++) {
				final int pixel = image.getRGB(x, y);
				final int r = (pixel & 0xff0000) >> 16, g = (pixel & 0xff00) >> 8, b = pixel & 0xff;
				final float gray = 0.299f * r + 0.578f * g + 0.114f * b;
				final int index = Math.round(gray * (base.length() + 1) / 255);
				temp = temp + (index >= base.length() ? " " : String.valueOf(base.charAt(index)));
			}
			temp = temp + "\n";
		}
		return temp;
	}
}
