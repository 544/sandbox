package test;

public class FuzzBuzz {
	public static void main(String[] args) {
		String val = null;
		for(int i=1; i<100; i++) {
			if (i%15 == 0) {
				val = "FuzzBuzz";
			} else if (i%3 == 0) {
				val = "Fuzz";
			} else if (i%5 == 0) {
				val = "Buzz";
			} else {
				val = String.valueOf(i);
			}

			System.out.print(val);
			System.out.print(" ");

		}
	}
}
