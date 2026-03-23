// Main report file
#import "template.typ": make-report, report-footnote
#import "metadata.typ": my-report
#import "@preview/theofig:0.1.0": definition
#import "@preview/physica:0.9.8"
#import "@preview/quill:0.7.2": *


// Main content
#show: make-report.with(my-report)


= Exercise 1

Prove that the binary entropy $H_"bin" (p)$ attains its maximum value of one at $p = 1\/2$.

Suppose we have a binary variable $X$ that follows a Bernoulli distribution $cal(B)$ of parameter $p$.

#align(
  center,
  $PP(X = 0) &= p \
  PP(X = 1) &= 1 - p$,
)

The entropy is defined as:

#align(
  center,
  $H(X) &= - sum_(x in {0, 1}) PP(X = x) log_2(PP(X = x)) \
  &= -PP(X = 0)log_2(PP(X = 0)) - PP(X = 1) log_2(PP(X = 1)) \
  &= - p log_2(p) - (1 - p) log_2(1 - p)\
  &= f(p)$,
)

We want to find the parameter $p$ that maximize the entropy.

To do that, we can compute the derivate of the $f$ function according to the parameter $p$ to find optima of the function.
We have:

#align(
  center,
  $
    (partial f)/(partial p) & = partial / (partial p) (- p log_2(p) - (1 - p) log_2(1 - p)) \
                            & = partial / (partial p) (- p ln(p)/ln(2) - (1 - p) ln(1 - p)/ln(2)) \
                            & = - ln(p)/ln(2) + p / (p ln(2)) + ln(1 - p)/ln(2) - (1 - p)/((1 - p)ln(2)) \
                            & = - (ln(p) + 1 + ln(1 - p) - 1)/ln(2) \
                            & = - (ln(p) + ln(1 - p))/ln(2) \
                            & = ln((1 - p)/p) dot 1/ln(2) \
  $,
)

The optimum is obtained for $(partial f)/(partial p) = 0$, so:

#align(
  center,
  $
    & text("     ") (partial f)/(partial p) = 0 \
    & <==> ln((1 - p)/p) dot 1/ln(2) = 0 \
    & <==> ln((1 - p)/p) = 0 \
    & <==> (1 - p)/p = e^0 \
    & <==> 1 - p = p \
    & <==> p = 1/2 \
  $,
)

So the entropy of a binary variable attains its maximum value at $p = 1/2$.
The maximum value of entropy obtained for $p = 1/2$ is:

#align(
  center,
  $
    f(1/2) & = -1/2 log_2(1/2) - (1 - 1/2)log_2(1 - 1/2) \
           & = 1/2 + 1/2 \
           & = 1 \
  $,
)

= Exercise 2: Sub-additivity of the Shannon entropy

Show that
$
  H(p(x,y) || p(x) p(y)) = H(p(x)) + H(p(y)) - H(p(x,y)).
$

By definition of the Kullback-Leibler divergence, $H(P || Q) = sum_(x in cal(X)) P(x) log(P(x)/Q(x))$.

The entropy is defined as $H(p(x)) = - sum_x p(x) log(p(x))$.
We know that $log$ is stricly increasing, with undefined value for $0$ and $log(1) = 0$.
So as probabilities are defined in $[0, 1]$, the $log$ is always less or equal to zero.
So the entropy is always greater or equal to zero.

So we have:

#align(left,
$
  H(p(x,y) || p(x) p(y)) &= sum_x sum_y p(x, y) log(p(x, y) / (p(x)p(y))) \
  &= sum_x sum_y p(x, y) [log(p(x, y)) - log(p(x)p(y))] \
  &= sum_x sum_y p(x, y) log(p(x, y)) - sum_x sum_y p(x, y)log(p(x)p(y)) \
  &= - H(p(x, y)) - sum_x sum_y p(x, y)[log(p(x)) + log(p(y))] \
  &= - H(p(x, y)) - sum_x sum_y p(x, y)log(p(x)) - sum_x sum_y p(x, y)log(p(y)) \
  &= - H(p(x, y)) - sum_x p(x)log(p(x)) - sum_y p(y)log(p(y)) \
  &= - H(p(x, y)) + H(p(x)) + H(p(y)) \

$)

Deduce that $H(X, Y) <= H(X) + H(Y)$, with equality if and only if $X$ and $Y$ are independent random variables.

We have shown that $H(p(x,y) || p(x) p(y)) = H(p(x)) + H(p(y)) - H(p(x,y))$.

As the entropy of discrete variables is always greater or equal to zero, we have:

#align(left, 
$
  H(p(x,y) || p(x) p(y)) &>= 0 \
  <==> H(p(x)) + H(p(y)) - H(p(x,y)) &>= 0 \
  <==> H(p(x)) + H(p(y)) &>= H(p(x,y)) \
$)

If $p(x)$ and $p(y)$ are independent, $p(x, y) = p(x)p(y)$.

So
#align(left,
$
  H(p(x, y)) &= H(p(x)p(y)) \
  &= -sum_x sum_y p(x)p(y) log(p(x)p(y)) \
  &= -sum_x sum_y p(x)p(y) [log(p(x)) + log(p(y))] \
  &= -sum_x sum_y p(x)p(y) log(p(x)) -sum_x sum_y p(x)p(y)log(p(y)) \
  &= -sum_x p(x) log(p(x)) -sum_y p(y)log(p(y)) \
  &= H(p(x)) + H(p(y))
$)

So $H(p(x)) + H(p(y)) >= H(p(x,y))$ and if $p(x)$ and $p(y)$ are independent,

$ H(p(x)) + H(p(y)) >= H(p(x,y)) = H(p(x)) + H(p(y)) $

= Exercise 3: Generalised measurements can decrease entropy

Suppose a qubit is in the state $rho$ measured using the measurement operators
$M_1 = |0 chevron.r chevron.l 0|$ and $M_2 = |0 chevron.r chevron.l 1|$.
If the result of the measurement is unknown to us then the state of the system afterwards is
$M_1 rho M_1^dagger + M_2 rho M_2^dagger$.
Show that this procedure can _decrease_ the entropy of the qubit.

We have the two following measurement operators:

- $M_1 = |0 chevron.r chevron.l 0| = vec(1, 0) mat(1, 0) = mat(1, 0; 0, 0)$
- $M_2 = |0 chevron.r chevron.l 1| = vec(1, 0) mat(0, 1) = mat(0, 1; 0, 0)$

The density $rho$ is defined as follow:

$ rho = sum_i p_i |psi_i chevron.r chevron psi_i| $

with $p_i$ the probability to be in the state $|psi_i chevron.r$.
As $p_i$ is a probability, $sum_i p_i = 0$.

In our case, as we work with only  one qubit, this qubit can be in state $|0 chevron.r$ or $|1 chevron.r$.

So we have:

#align(left, 
  $
  rho &= sum_i p_i |psi_i chevron.r chevron psi_i| \
  &= p_0 |0 chevron.r chevron 0| + p_1 |1 chevron.r chevron 1| \
  &= p_0 vec(1, 0) mat(1, 0) + p_1 vec(0, 1) mat(0, 1) \
  &= mat(p_0, 0; 0, 0) + mat(0, 0; 0, p_1) \
  &= mat(p_0, 0; 0, p_1)
  $
)

Suppose that the result of the measurement is unknown to us.

So the state of the system afterwards is $rho' = M_1 rho M_1^dagger + M_2 rho M_2^dagger$.

So we have:

#align(left, 
$
  rho' &= M_1 rho M_1^dagger + M_2 rho M_2^dagger \
  &= mat(1, 0; 0, 0) mat(p_0, 0; 0, p_1) mat(1, 0; 0, 0) + mat(0, 1; 0, 0)mat(p_0, 0; 0, p_1) mat(0, 0; 1, 0) \
  &= mat(p_0, 0; 0, 0) mat(1, 0; 0, 0) + mat(0, p_1; 0, 0) mat(0, 0; 1, 0) \
  &= mat(p_0, 0; 0, 0) + mat(p_1, 0; 0, 0) \
  &= mat(p_0 + p_1, 0; 0, 0) \
  &= mat(1, 0; 0, 0) \
  &= |0 chevron.r chevron 0|
$
)

So as $rho = p_0 |0 chevron.r chevron 0| + p_1 |1 chevron.r chevron 1|$ and $rho' = |0 chevron.r chevron 0|$, it means that the quantity of information has decreased.
Indeed, $rho'$ can only be in one state $|0 chevron.r$ in a deterministic way, meaning that the entropy of $rho'$ is zero whereas the entropy of $rho$ is greater or equal to zero. Indeed, we have:
- $H(rho) = - sum_i p_i log_2(p_i) = - p_0 log_2(p_0) - p_1 log_2(p_1) >= 0$ since $log_2$ of variable less than 1 is negative and as $p_i$ is a probability, $p_i$ is always positive.
- $H(rho') = - sum_i p_i log_2(p_i) = -1 log_2(1) = 0$ since $log_2(1) = 0$.

So this procedure can decrease the entropy of the qubit.

= Exercise 4

Suppose $|psi chevron.r$ and $|phi chevron.r$ are two orthogonal quantum states of a single qubit.
Design a quantum circuit with two input qubits (the "data" and the "target" qubits),
with the data qubit in either the state $|psi chevron.r$ or $|phi chevron.r$,
and the target qubit prepared in the standard state $|0 chevron.r$,
which produces as output $|psi chevron.r |psi chevron.r$ or $|phi chevron.r |phi chevron.r$,
depending on whether $|psi chevron.r$ or $|phi chevron.r$ was input to the data qubit.

We build a quantum circuit such as:
- We have a data state that can take values $|phi chevron.r$ or $|psi chevron.r$.
- We prepare a target state that takes the value $|0 chevron.r$.

So initialy, we have either the state $|phi 0 chevron.r$ or the state $|psi 0 chevron.r$.

As $|psi chevron.r$ and $|phi chevron.r$ are two orthogonal quantum states of a single qubit, they form an orthogonal basis {$|psi chevron.r$, $|phi chevron.r$}.

So it means that we can find an operator $U$ that remaps the states to the basis {$|0 chevron.r$, $|1 chevron.r$}.
As $U$ is an operator, $U$ must respect the constraint $U^dagger U = I$.

So we will have for instance: $U times.o |psi chevron.r = |0 chevron.r$ and $U times.o |phi chevron.r = |1 chevron.r$.

After applying the operator $U$, the circuit will be in state either $|0 0 chevron.r$ or $|1 0 chevron.r$.
Now, if we apply the operator CNOT, the state $|0 0 chevron.r$ remains the same whereas the state $|1 0 chevron.r$ will become $|1 1 chevron.r$ due to the construction of the operator.
Indeed, the CNOT operator invert the state of the target qubit (the second) if the control qubit (the first) is equal to $1$, else leave the target qubit unchanged.

So now, the circuit will be in state either $|0 0 chevron.r$ or $|1 1 chevron.r$.

Finally, we apply the inverse operator $U^dagger$ to the two qubits to come back to the basis {$|psi chevron.r |phi chevron.r$}.

The circuit can be drawn like in @circuit.

#figure(
  caption: "Quantum circuit to clone states of two orthogonal qubits",
  quantum-circuit(
    lstick([$|psi chevron.r$ or $|phi chevron.r$]), $U$, ctrl(1), $U^dagger$, rstick([$|psi chevron.r$ or $|phi chevron.r$]), [\ ],
    lstick($|0 chevron.r$), 1, targ(), $U^dagger$, rstick([$|psi chevron.r$ or $|phi chevron.r$])
  )
)<circuit>

= Exercise 5

Suppose Alice sends Bob an equal mixture of the four pure states
$
  |X_1 chevron.r & = |0 chevron.r \
  |X_2 chevron.r & = sqrt(1/3) lr([|0 chevron.r + sqrt(2)|1 chevron.r]) \
  |X_3 chevron.r & = sqrt(1/3) lr([|0 chevron.r + sqrt(2) e^(2 pi i \/ 3)|1 chevron.r]) \
  |X_4 chevron.r & = sqrt(1/3) lr([|0 chevron.r + sqrt(2) e^(4 pi i \/ 3)|1 chevron.r])
$

Show that the maximum mutual information between Bob's measurement and Alice's transmission
is less than one bit.
A POVM which achieves $approx 0.415$ bits is known.
Can you construct this or better yet, one which achieves the Holevo bound?

The mutual information is defined as follow:

$ I(X; Y) = - sum_(x, y) p(x, y) log(p(x, y)/(p(x)p(y))) $

#v(2em)

#text(weight: "bold")[
  To archive all results (solutions, report together with your code, etc.) and submit them using Quantum computing course moodle.
]
