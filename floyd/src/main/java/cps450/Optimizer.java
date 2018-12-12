/*
 * File: Optimizer.java
 * Author: Sam Henry 
 * Date: March 28, 2018
 * Class: CpS 450, Compiler
 * Desc: A class to optimize instructions
 */

package cps450;

import static cps450.util.BitVersion.*;

import java.util.ArrayList;

import cps450.codegen.BinaryInstruction;
import cps450.codegen.TargetInstruction;
import cps450.codegen.UnaryInstruction;

public class Optimizer {
	private ArrayList<TargetInstruction> data;
	
	/**
	 * Instantiates the optimizer with the instructions
	 * @param data The instructions
	 */
	public Optimizer(ArrayList<TargetInstruction> data) {
		this.data = data;
	}
	
	/**
	 * Performs the optimizations on the target instructions
	 */
	public void optimize() {
		int size = data.size();
		
		for(int i = 0; i < data.size() - 1; i++) {
			TargetInstruction i1 = data.get(i);
			TargetInstruction i2 = data.get(i + 1);
			if(i1 instanceof UnaryInstruction && i2 instanceof UnaryInstruction) {
				UnaryInstruction u1 = (UnaryInstruction) i1;
				UnaryInstruction u2 = (UnaryInstruction) i2;
				
				if(u1.name.equals(PUSH) && u2.name.equals(POP) && !(u1.left.contains("(") && u2.left.contains("("))) {
					if(u1.left.equals(u2.left)) {
						data.remove(i);
						data.remove(i--);
					} else {
						BinaryInstruction opt = new BinaryInstruction(MOV, u1.left, u2.left);
						data.set(i, opt);
						data.remove(i + 1);
					}
				} else if(u1.name.equals(POP) && u2.name.equals(PUSH) && u1.left.equals(u2.left)) {
					data.remove(i);
					data.remove(i--);
				}
			} else if(i1 instanceof BinaryInstruction) {
				BinaryInstruction b1 = (BinaryInstruction) i1;
				if((b1.name.equals(SUB) || b1.name.equals(ADD)) && b1.left.equals("$0")) {
					data.remove(i--);
				}
			}
		}
		
		System.out.println("Optimized " + (size - data.size()) + " instructions");
	}
}
