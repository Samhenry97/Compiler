/*
 * File: FileData.java
 * Author: Sam Henry 
 * Date: February 2, 2018
 * Class: CpS 450, Compiler
 * Desc: A class to hold data for files
 * 		 used for debug printing
 */

package cps450.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class FileData {	
	public String name;			// File's name
	public int lines;			// Lines in file
	public int lineEnding;		// End of line in logical file
	
	public FileData(String name, int lines, int lineEnding) {
		this.name = name;
		this.lines = lines;
		this.lineEnding = lineEnding;
	}
	
	//********************************************************************************
	// Static Methods
	//********************************************************************************
	
	// The string lines in the file. This makes it easier to
	// print debug output in the assembler
	private static ArrayList<String> lineContent = new ArrayList<>();
	
	// The data for the files that have been processed
	private static ArrayList<FileData> data = new ArrayList<>();
	
	/**
	 * Combines the files into one logical file, keeping
	 * track of all the line endings for error messages
	 * @return The single logical file
	 */
    public static String preprocessFiles() {
    	StringBuilder ret = new StringBuilder();
    	
    	int linesSoFar = 0;
    	for(String file : Options.fileNames) {
    		try(Scanner scanner = new Scanner(new File(file)).useDelimiter("\\Z")) {
    			String content = scanner.next() + "\n";
    			int lastPos = 0, pos = content.indexOf("\n");
    			while(pos != -1) {
    				lineContent.add(content.substring(lastPos, pos));
    				lastPos = pos + 1;
    				pos = content.indexOf("\n", lastPos);
    			}
    			int lines = (int) content.chars().filter(c -> c == '\n').count();
    			linesSoFar += lines;
    			data.add(new FileData(file, lines, linesSoFar));
    			ret.append(content);
    		} catch(FileNotFoundException e) {
    			System.err.println("Could not open file: " + e.getMessage());
    			System.exit(1);
    		}
    	}
    	
    	return ret.toString();
    }
    
    /**
     * Gets the file data from the line of input
     * from the single logical file
     * @param line The line to check
     * @return The FileData of the file
     */
    public static FileData getFileNameFromLine(int line) {
    	for(FileData d : data) {
    		if(line <= d.lineEnding) { return d; }
    	}
    	return new FileData("unknown", 0, 0);
    }
    
    /**
     * Gets the string content of the given line
     * @param line The line to get
     * @return The line
     */
    public static String getLine(int line) {
    	if(--line < 0 || line >= lineContent.size()) { return ""; }
    	return lineContent.get(line);
    }
    
    /**
     * Gets the original file name and line
     * from single logical file
     * @param line The line to check
     * @return The FileData, where <lineEnding> is original line
     */
    public static FileData getOriginalLine(int line) {
    	int linesBefore = 0;
    	for(FileData d : data) {
    		if(line <= d.lineEnding) {
    			return new FileData(d.name, d.lines, line - linesBefore);
    		}
    		linesBefore += d.lineEnding;
    	}
    	return new FileData("unknown", 0, 0);
    }
}
