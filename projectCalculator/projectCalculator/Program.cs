using System;
namespace projectCalculator
{
    class Program
    {
        public static void Main(string[] args)
        {
            int result;
            int num1;
            int num2;
            var opt = "";
            var val1 = "";
            var val2 = "";
            CalculatorBase calc = new Calculator();
            Console.WriteLine("Welcome!!!");
            do
            {
                Console.WriteLine("\nEnter your choice...\n1. Addition\n2. Subtraction\n3. Multiplication\n4. Exit");
                opt = Console.ReadLine();
            
                switch (opt)
                {
                    case "1":

                        Console.WriteLine("Enter the first number: ");
                        val1 = Console.ReadLine();
                        num1 = Convert.ToInt32(val1);
                        Console.WriteLine("Enter the second number: ");
                        val2 = Console.ReadLine();
                        num2 = Convert.ToInt32(val2);
                        result = calc.add(num1, num2);
                        Console.WriteLine("\nsum= " + result);
                        break;

                    case "2":

                        Console.WriteLine("Enter the first number: ");
                        val1 = Console.ReadLine();
                        num1 = Convert.ToInt32(val1);
                        Console.WriteLine("Enter the second number: ");
                        val2 = Console.ReadLine();
                        num2 = Convert.ToInt32(val2);
                        result = calc.sub(num1, num2);
                        Console.WriteLine("\ndifference= " + result);
                        break;

                    case "3":

                        Console.WriteLine("Enter the first number: ");
                        val1 = Console.ReadLine();
                        num1 = Convert.ToInt32(val1);
                        Console.WriteLine("Enter the second number: ");
                        val2 = Console.ReadLine();
                        num2 = Convert.ToInt32(val2);
                        result = calc.mul(num1, num2);
                        Console.WriteLine("\nproduct= " + result);
                        break;

                    case "4":

                        Console.WriteLine("Bye...");
                        break;

                    default:

                        Console.WriteLine("\nInvalid option!!!Please enter a valid option.");
                        break;
                }
            } while (opt != "4");
            
        }
    }

}