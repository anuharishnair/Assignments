using System;
namespace projectCalculator
{
	public class Calculator:CalculatorBase
	{
        public override int add(int a, int b)
        {
            int sum = a + b;
            return sum;
        }
        public override int sub(int a, int b)
        {
            int dif = a - b;
            return dif;
        }
        public override int mul(int a, int b)
        {
            int prdct = a * b;
            return prdct;
        }
    }
}

