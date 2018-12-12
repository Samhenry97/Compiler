/*
 * File: AsciiArt.java
 * Author: Sam Henry 
 * Date: April 4, 2018
 * Class: CpS 450, Compiler
 * Desc: Ascii Art Generator
 */

package cps450.util;

import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;

import cps450.CodeGen;

public class AsciiArt {
	
	/**
	 * Emits an ASCII Art string 
	 * Taken and adapted from https://www.mkyong.com/java/ascii-art-java-example/
	 * @param text
	 * @param gen
	 */
	public static void printString(String text, CodeGen gen) {
		// Make sure it's a valid font (no crash)
		String fontName = "Ubuntu";
		
		// Now draw the art
		Font font = new Font(fontName, Font.BOLD, 16);
		Graphics g = new BufferedImage(1000, 1000, BufferedImage.TYPE_INT_RGB).getGraphics();
		FontMetrics fm = g.getFontMetrics(font);
		int width = fm.stringWidth(text);
        int height = fm.getAscent();

        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        g = image.getGraphics();
        g.setFont(font);

        Graphics2D graphics = (Graphics2D) g;
        graphics.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING,
                RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        graphics.drawString(text, 0, height - 4);	

        for(int y = 0; y < height; y++) {
            StringBuilder sb = new StringBuilder();
            for(int x = 0; x < width; x++) {
                sb.append(image.getRGB(x, y) == 0xFF000000 ? " " : "*");
            }
            
            String output = sb.toString();
            if(output.trim().length() == 0) { continue; }

            gen.emitComment(output, false);
        }
	}

}