#include <iostream>
#include <bitset>

using namespace std;

int main() {
    int numbers [9] = { -16, 42, 17, 4, 85, -219, 171, 182, -15};
    for (short number : numbers)
    {
        cout << number << " ";
        if(number>=0)
        {
            //положительная логика
            short tmpPos = number;
            tmpPos |= 17; //операция or
            tmpPos ^= 17; //операция xor
            cout << tmpPos << endl;
        }
        else
        {
            //отрицательная логика
            short tmpNeg = number >> 2; // арифметическое смещение вправо на 2 бита
            cout << tmpNeg << endl;
        }
    }
}