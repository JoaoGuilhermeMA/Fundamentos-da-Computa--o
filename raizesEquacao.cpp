#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

int main()
{
    const int a = 1;
    const float b1 = -100.0001, c1 = 0.01;
    const double b2 = -100.0001, c2 = 0.01;
    float delta1 = pow(b1, 2) - 4 * a * c1;
    double delta2 = pow(b2, 2) - 4 * a * c2;
    float x1P = -b1 + sqrt(delta1) / 2 * a;
    double x2P = -b2 + sqrt(delta2) / 2 * a;
    float x1N = -b1 - sqrt(delta1) / 2 * a;
    double x2N = -b2 - sqrt(delta2) / 2 * a;

    cout << setprecision(8) << "(float) O delta é " << delta1 << endl;
    cout << setprecision(8) << "(double) O delta é " << delta2 << endl;
    cout << setprecision(8) << "(float, positivo) o valor de x e " << x1P << endl;
    cout << setprecision(8) << "(double, positivo) o valor de x e " << x2P << endl;
    cout << setprecision(8) << "(float, Negativo) o valor de x e " << x1N << endl;
    cout << setprecision(8) << "(double, Negativo) o valor de x e " << x2N << endl;
}