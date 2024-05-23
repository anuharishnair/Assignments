using System;
namespace projectCalculator
{
	public abstract class CalculatorBase
	{
        public virtual int add(int a, int b)
        {
            int sum = a + b;
            Console.WriteLine("parent");
            return sum;
        }
        public virtual int sub(int a, int b)
        {
            int dif = a - b;
            Console.WriteLine("parent");
            return dif;
        }
        public virtual int mul(int a, int b)
        {
            int prdct = a * b;
            Console.WriteLine("parent");
            return prdct;
        }
     
	}
}

