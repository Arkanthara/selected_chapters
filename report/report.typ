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

#align(
  left,
  $
    H(p(x,y) || p(x) p(y)) & = sum_x sum_y p(x, y) log(p(x, y) / (p(x)p(y))) \
                           & = sum_x sum_y p(x, y) [log(p(x, y)) - log(p(x)p(y))] \
                           & = sum_x sum_y p(x, y) log(p(x, y)) - sum_x sum_y p(x, y)log(p(x)p(y)) \
                           & = - H(p(x, y)) - sum_x sum_y p(x, y)[log(p(x)) + log(p(y))] \
                           & = - H(p(x, y)) - sum_x sum_y p(x, y)log(p(x)) - sum_x sum_y p(x, y)log(p(y)) \
                           & = - H(p(x, y)) - sum_x p(x)log(p(x)) - sum_y p(y)log(p(y)) \
                           & = - H(p(x, y)) + H(p(x)) + H(p(y)) \
  $,
)

Deduce that $H(X, Y) <= H(X) + H(Y)$, with equality if and only if $X$ and $Y$ are independent random variables.

We have shown that $H(p(x,y) || p(x) p(y)) = H(p(x)) + H(p(y)) - H(p(x,y))$.

As the entropy of discrete variables is always greater or equal to zero, we have:

#align(
  left,
  $
                H(p(x,y) || p(x) p(y)) & >= 0 \
    <==> H(p(x)) + H(p(y)) - H(p(x,y)) & >= 0 \
                <==> H(p(x)) + H(p(y)) & >= H(p(x,y)) \
  $,
)

If $p(x)$ and $p(y)$ are independent, $p(x, y) = p(x)p(y)$.

So
#align(
  left,
  $
    H(p(x, y)) & = H(p(x)p(y)) \
               & = -sum_x sum_y p(x)p(y) log(p(x)p(y)) \
               & = -sum_x sum_y p(x)p(y) [log(p(x)) + log(p(y))] \
               & = -sum_x sum_y p(x)p(y) log(p(x)) -sum_x sum_y p(x)p(y)log(p(y)) \
               & = -sum_x p(x) log(p(x)) -sum_y p(y)log(p(y)) \
               & = H(p(x)) + H(p(y))
  $,
)

So $H(p(x)) + H(p(y)) >= H(p(x,y))$ and if $p(x)$ and $p(y)$ are independent,

$ H(p(x)) + H(p(y)) = H(p(x,y)) $

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

#align(
  left,
  $
    rho & = sum_i p_i |psi_i chevron.r chevron psi_i| \
        & = p_0 |0 chevron.r chevron 0| + p_1 |1 chevron.r chevron 1| \
        & = p_0 vec(1, 0) mat(1, 0) + p_1 vec(0, 1) mat(0, 1) \
        & = mat(p_0, 0; 0, 0) + mat(0, 0; 0, p_1) \
        & = mat(p_0, 0; 0, p_1)
  $,
)

Suppose that the result of the measurement is unknown to us.

So the state of the system afterwards is $rho' = M_1 rho M_1^dagger + M_2 rho M_2^dagger$.

So we have:

#align(
  left,
  $
    rho' & = M_1 rho M_1^dagger + M_2 rho M_2^dagger \
         & = mat(1, 0; 0, 0) mat(p_0, 0; 0, p_1) mat(1, 0; 0, 0) + mat(0, 1; 0, 0)mat(p_0, 0; 0, p_1) mat(0, 0; 1, 0) \
         & = mat(p_0, 0; 0, 0) mat(1, 0; 0, 0) + mat(0, p_1; 0, 0) mat(0, 0; 1, 0) \
         & = mat(p_0, 0; 0, 0) + mat(p_1, 0; 0, 0) \
         & = mat(p_0 + p_1, 0; 0, 0) \
         & = mat(1, 0; 0, 0) \
         & = |0 chevron.r chevron 0|
  $,
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
    lstick([$|psi chevron.r$ or $|phi chevron.r$]),
    $U$,
    ctrl(1),
    $U^dagger$,
    rstick([$|psi chevron.r$ or $|phi chevron.r$]),
    [\ ],
    lstick($|0 chevron.r$),
    1,
    targ(),
    $U^dagger$,
    rstick([$|psi chevron.r$ or $|phi chevron.r$]),
  ),
)<circuit>

= Exercise 5

#set math.equation(numbering: "(1)")

Suppose Alice sends Bob an equal mixture of the four pure states
$
  |X_1 chevron.r & = |0 chevron.r \
  |X_2 chevron.r & = sqrt(1/3) [ |0 chevron.r + sqrt(2)|1 chevron.r] \
  |X_3 chevron.r & = sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(2 pi i \/ 3)|1 chevron.r] \
  |X_4 chevron.r & = sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(4 pi i \/ 3)|1 chevron.r]
$ <init>

Show that the maximum mutual information between Bob's measurement and Alice's transmission
is less than one bit.
A POVM which achieves $approx 0.415$ bits is known.
Can you construct this or better yet, one which achieves the Holevo bound?

// The mutual information is defined as follow:

// $ H(X: Y) = - sum_(x, y) p(x, y) log(p(x, y)/(p(x)p(y))) $

*Von Neumann entropy for quantum states*

The entropy of a quantum state with density $rho$ is given by:

$ S(rho) = - tr(rho log rho) $


*Some basic properties of von Neumann entropy*

+ The entropy is non-negative. The entropy is zero if and only if the state is pure.

+ In a $d$-dimensional Hilbert space the entropy is at most $log d$. The entropy is equal to $log d$ if and only if the system is in the completely mixed state $I / d$.

// (3) Suppose a composite system $A B$ is in a pure state. Then $S(A) = S(B)$.

// (4) Suppose $p_i$ are probabilities, and the states $rho_i$ have support on orthogonal subspaces. Then
// $
//   S( sum_i p_i rho_i ) = H(p_i) + sum_i p_i S(rho_i).
// $

// (5) Joint entropy theorem: Suppose $p_i$ are probabilities, $|i⟩$ are orthogonal states for a system $A$, and $rho_i$ is any set of density operators for another system $B$. Then
// $
//   S( sum_i p_i |i chevron.r chevron i| times.o rho_i ) = H(p_i) + sum_i p_i S(rho_i).
// $

*Holevo bound theorem*:
Suppose Alice prepares a state $rho_x$ where $x = 0, dots, n$ with probabilities $p_0, dots, p_n$.
Bob performs a measurement described by POVM elements ${E_y} = {E_0, dots, E_m}$ on that state, with measurement outcome $Y$.

The Holevo bound states that for any such measurement Bob may do:
$
  H(X: Y) <= S(rho) - sum_x p_x S(rho_x)
$
where
$rho = sum_x p_x rho_x$.

As all the four pure states are only a composition of qubits $|0 chevron.r$  and $|1 chevron.r$, it means that they live in the ${|0 chevron.r, |1 chevron.r}$ basis which is an Hilbert basis.

In accordance with point 2. of von Neumann's properties of entropy, since the states lie in a two-dimensional Hilbert space, the entropy is at most $log 2 = 1$ bit, with equality holding only if the system is in the fully mixed state $I/2$.

// So to have the mutual information equal to 1 bit, Alice and Bob must have their system in the state $I/2$.
// In fact, mutual information tells us to what extent knowing the state of Bob's system allows us to determine the state of Alice's system, and vice versa.

// And as shown on @venn, having mutual information equal to 1 in this case corresponds to the fact that knowledge of the state of Bob's system (or Alice's) fully allows us to determine the state of Alice's system (or Bob's), and that the entropy of Bob's system (or Alice's) is equal to 1.

// #figure(image("img/venn.svg"), caption: "Venn diagram of entropy of two random variables X and Y") <venn>

We want to find the bound of the mutual information according to the Holevo bound theorem.

_Computation of $sum_i p_i S(rho_i)$_

Alice send with probability $1/4$ one of the four pure states with density $rho_i$..
As she sends some pure state, according to property 1. of entropy of Von Neumann, the entropy is 0.

So we have:

#align(
  left,
  $
    sum_i p_i S(rho_i) & = sum_i p_i dot 0 = 0
  $,
)

_Precomputations_

Alice send one of the four pure states $|X_i chevron.r$ with probability $p_i = 1/4$.
So Bob can compute the density $rho_i$ of each pure state $|X_i chevron.r$.
As the states are pure, the density $rho_i$ is given by $rho_i = |X_i chevron.r chevron X_i|$.
Indeed, when we are in a pure state, we cannot be in a mixture of states.

$
  rho_1 &= |X_1 chevron.r chevron X_1| \
  &= |0 chevron.r chevron 0| \
  &= mat(1, 0; 0, 0) \
  rho_2 &= |X_2 chevron.r chevron X_2| \
  &= sqrt(1/3) [ |0 chevron.r + sqrt(2)|1 chevron.r] sqrt(1/3) [ chevron 0| + sqrt(2) chevron 1| ] \
  &= 1/3 [ vec(1, 0) + sqrt(2)vec(0, 1)] [ mat(1, 0) + sqrt(2) mat(0, 1) ] \
  &= 1/3 vec(1, sqrt(2)) mat(1, sqrt(2)) \
  &= 1/3 mat(1, sqrt(2); sqrt(2), 2) \
  rho_3 &= |X_3 chevron.r chevron X_3| \
  &= sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(2 pi i \/ 3)|1 chevron.r] sqrt(1/3) [ chevron 0| + sqrt(2) e^(-2 pi i \/ 3) chevron 1| ] \
  &= 1/3 [ vec(1, 0) + sqrt(2) e^(2 pi i \/ 3)vec(0, 1)] [ mat(1, 0) + sqrt(2) e^(-2 pi i \/ 3) mat(0, 1) ] \
  &= 1/3 vec(1, sqrt(2) e^(2 pi i \/ 3)) mat(1, sqrt(2) e^(-2 pi i \/ 3)) \
  &= 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2e^(0)) \
  &= 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) \
  rho_4 &= |X_4 chevron.r chevron X_4| \
  &= sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(4 pi i \/ 3)|1 chevron.r] sqrt(1/3) [ chevron 0| + sqrt(2) e^(-4 pi i \/ 3) chevron 1| ] \
  &= 1/3 [ vec(1, 0) + sqrt(2) e^(4 pi i \/ 3)vec(0, 1)] [ mat(1, 0) + sqrt(2) e^(-4 pi i \/ 3) mat(0, 1) ] \
  &= 1/3 vec(1, sqrt(2) e^(4 pi i \/ 3)) mat(1, sqrt(2) e^(-4 pi i \/ 3)) \
  &= 1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2) \
$

_Computation of $S(rho)$_

If Alice sends Bob an equal mixture of the four pure states, it means that Bob will get one of the $|X_i chevron.r$ with probability $p_i = 1/4$.

So Bob can compute the density $rho$ of the system.


$
  rho &= sum_i p_i rho_i \
  &= 1/4 rho_1 + 1/4 rho_2 + 1/4 rho_3 + 1/4 rho_4 \
  &= 1/4 mat(1, 0; 0, 0) + 1/12 mat(1, sqrt(2); sqrt(2), 2) + 1/12 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) + 1/12 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2) \
  &= 1/12( mat(3, 0; 0, 0) + mat(1, sqrt(2); sqrt(2), 2) + mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) + mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 1/12 mat(6, sqrt(2)(1 + e^(-2 pi i \/ 3) + e^(-4 pi i \/ 3)); sqrt(2) (1 + e^(2 pi i \/ 3) + e^(4 pi i \/ 3)), 6) \
  &= 1/12 mat(6, sqrt(2)(e^(-6 pi i \/ 3) + e^(-2 pi i \/ 3) + e^(-4 pi i \/ 3)); sqrt(2) (e^(6 pi i \/ 3) + e^(2 pi i \/ 3) + e^(4 pi i \/ 3)), 6) \
  &= 1/12 mat(6, sqrt(2)(e^(-2 pi i \/ 3)^3 + e^(-2 pi i \/ 3) + e^(-4 pi i \/ 3)^2); sqrt(2) (e^(6 pi i \/ 3)^3 + e^(2 pi i \/ 3) + e^(4 pi i \/ 3)^2), 6) \
  &= 1/12 mat(6, 0; 0, 6)^#report-footnote([As $e^(2 pi i \/ 3)$ and $e^(-2 pi i \/ 3)$ are primitive root. Indeed, $e^(2 pi i \/ 3)^3 = e^(-2 pi i \/ 3)^3 = 1$ so $e^(2 pi i \/ 3) + e^(2 pi i \/ 3)^2 + e^(2 pi i \/ 3)^3 =e^(-2 pi i \/ 3) + e^(-2 pi i \/ 3)^2 + e^(-2 pi i \/ 3)^3 = 0$ ]) \
  &= I/2
$ <eq-1>

So the entropy of Bob's system is maximal: $S(rho) = S(I/2) = log 2 = 1$.

So according to the Holevo bound theorem, we have:

#align(
  left,
  $
         H(X: Y) & <= S(rho) - sum_x p_x S(rho_x) \
    <==> H(X: Y) & <= S(I\/2) - 0 \
    <==> H(X: Y) & <= 1
  $,
)

Now we want to prove that the mutual information is stricly less than 1.

Mutual information is maximized only if Bob can determine Alice's qubit state without any error.
Thus, if there is any overlap between the qubits $|X_i chevron.r$, Bob might make a mistake, and the mutual information would not be maximized.
Indeed, mutual information tells us to what extent knowing the state of Bob's system allows us to determine the state of Alice's system, and vice versa.

As the entropy of Bob's system is of 1, we want that the system of Bob allows to fully determinate the Alice's system to have a mutual information of 1.

So we want to verify whether the four qubits state do not overlap.
However, we have basicaly only two dimensions, so we can only have two orthogonal states that are clearly distinguishable.
So the four states must overlap, so Bob might make a mistake.
So the mutual information is strictly less than 1.

The POVM (Posivite Operator-Valued Measure) is used for the analysis of the measurement.
Indeed, suppose that a measurement is achieved with a measurement operator $M_m$ on a quantum system in the state $|psi chevron.r$, then the probability of outcome $m$ is given by

$ p(m) = chevron psi|E_m|psi chevron.r $ with $E_m = M_m^dagger M_m$.

Due to the property of completeness equation of the measurement operator, we have:

$ sum_m M_m^dagger M_m = sum_m E_m = I $

On top of that, as $p(m)$ is a probability, $p(m) >= 0$ $forall m$.
So $chevron psi|E_m|psi chevron.r &>= 0$ $forall E_m$, which means that $E_m$ is a positif operator.

The complete set of operators ${E_m}$ is known as POVM.

So we want to construct a set of operators ${E_m}$ such that:
- Each operator $E_m$ is positive
- $sum_m E_m = I$

We want to check now if we can find a set of operators ${E_m}$ that maximize the mutual information, so that allows Bob to determine Alice's state with the least error.

Actually, we have $sum_i p_i rho_i = I/2$ with $rho_i = |X_i chevron.r chevron X_i|$.
We can constate that the operator $rho_i$ is a projector.
Indeed, if we take some random state $|psi chevron.r$, we have:
$ rho_i |psi chevron.r = (|X_i chevron.r chevron X_i|)|psi chevron.r = |X_i chevron.r (chevron X_i|psi chevron.r) $
As $chevron X_i|psi chevron.r$ is the scalar product between the states, it is a scalar that determines the amplitude of the projection.
So $rho_i$ allows to project any state on the state $|X_i chevron.r$ with a amplitude determined by the scalar product.

So we want to construct a set of operators ${E_m}$ that maximize the detection of the states $|X_i chevron.r$.
If we make $I - rho_i$, we obtain the operator that allows to project any state on the subspace orthogonal to $|X_i chevron.r$.
Indeed, for instance, if we take some random state $|psi chevron.r$, we have:
$ (I - rho_i) |psi chevron.r = (I - |X_i chevron.r chevron X_i|)|psi chevron.r = |psi chevron.r - underbrace(|X_i chevron.r (chevron X_i|psi chevron.r), "Projection on" |X_i chevron.r) $
So this means that we take the state $|psi chevron.r$ and we remove all the component of $|psi chevron.r$ that is in the direction of $|X_i chevron.r$, so we are left with the component of $|psi chevron.r$ that is in the subspace orthogonal to $|X_i chevron.r$.

So we can construct the POVM from the operators $rho_i$ and $I - rho_i$.
As $rho_i$ are density operators, they are positive. Indeed, for any state $|psi chevron.r$, we have $chevron psi|rho_i|psi chevron.r$ which is the probability of finding the system in the state $|psi chevron.r$. As it is a probability, it is always positive. So $rho_i$ is a positive operator.

As $I - rho_i$ is the difference between the identity and a positive operator that gives a probability, so that is always less than or equal to 1, it is also a positive operator.

Now, we need to verify that $sum_i (I - rho_i) = I$.
We have:

$
  sum_i (I - rho_i) &= sum_i I - sum_i rho_i \
  &= 4I - (mat(1, 0; 0, 0) + 1/3 mat(1, sqrt(2); sqrt(2), 2) \ &+ 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) + 1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 4I - (1/3mat(4, sqrt(2); sqrt(2), 2) + 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) + 1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 4I - 1/3mat(6, 0; 0, 6) \
  &= 4I - 2I \
  &= 2I \
$

So if we take $E_i = (I - rho_i) / 2$, we have $sum_i E_i = I$.

As used in page 534 of Quantum Computation and Quantum Information: 10th Anniversary Edition @Nielsen_Chuang_2010,
the joint distribution $p(x, y)$ satisfies $p(x, y) = p(x)p(y|x) = p(x)tr(rho_x E_y)$.

$p(x = X_i)$ is the probability that Alice sends the state $|X_i chevron.r$, so $p(x) = 1/4$ for all $|X_i chevron.r$.

We have $p(y|x) = tr(rho_x E_y)$, which is the probability that Bob gets the outcome $y$ given that Alice sends the state $|X_i chevron.r$.

As ${E_y}$ is a POVM, so a set of measurement operators, we can write $p(y|x) = tr(rho_x E_y) = chevron X_i|E_y|X_i chevron.r$, which is the probability of getting the outcome $y$ when we measure the state $|X_i chevron.r$ with the measurement operator $E_y$.

We first need to check if the pure states $|X_i chevron.r$ are normalized, so that $chevron X_i|X_i chevron.r = 1$.
We have:
$
  chevron X_1|X_1 chevron.r &= chevron 0|0 chevron.r = 1 \
  chevron X_2|X_2 chevron.r &= 1/3 [ chevron 0| + sqrt(2) chevron 1| ] [ |0 chevron.r + sqrt(2)|1 chevron.r] \
  &= 1/3 [ chevron 0|0 chevron.r + sqrt(2) chevron 0|1 chevron.r + sqrt(2) chevron 1|0 chevron.r + 2 chevron 1|1 chevron.r ] \
  &= 1/3 [ 1 + 0 + 0 + 2 ] \
  &= 1 \

  chevron X_3|X_3 chevron.r &= 1/3 [ chevron 0| + sqrt(2) e^(-2 pi i \/ 3) chevron 1| ] [ |0 chevron.r + sqrt(2) e^(2 pi i \/ 3)|1 chevron.r] \
  &= 1/3 [ chevron 0|0 chevron.r + sqrt(2) e^(2 pi i \/ 3) chevron 0|1 chevron.r + sqrt(2) e^(-2 pi i \/ 3) chevron 1|0 chevron.r + 2e^(0) chevron 1|1 chevron.r ] \
  &= 1/3 [ 1 + 0 + 0 + 2 ] \
  &= 1 \
$
$
  chevron X_4|X_4 chevron.r &= 1/3 [ chevron 0| + sqrt(2) e^(-4 pi i \/ 3) chevron 1| ] [ |0 chevron.r + sqrt(2) e^(4 pi i \/ 3)|1 chevron.r] \
  &= 1/3 [ chevron 0|0 chevron.r + sqrt(2) e^(4 pi i \/ 3) chevron 0|1 chevron.r + sqrt(2) e^(-4 pi i \/ 3) chevron 1|0 chevron.r + 2e^(0) chevron 1|1 chevron.r ] \
  &= 1/3 [ 1 + 0 + 0 + 2 ] \
  &= 1 \
$

So the pure states $|X_i chevron.r$ are normalized, so $chevron X_i|X_i chevron.r = 1$.

We have $E_i = (I - rho_i) / 2$.
We now want to compute $p(y = X_i | x = X_j)$ for all $i$ and $j$.

When $i = j$, we have:

$
  chevron X_i|E_i|X_i chevron.r &= chevron X_i| (I - rho_i)/2 |X_i chevron.r \
  &= (chevron X_i|I|X_i chevron.r - chevron X_i|rho_i|X_i chevron.r) / 2 \
  &= (chevron X_i|X_i chevron.r - chevron X_i|X_i chevron.r chevron X_i|X_i chevron.r) / 2 \
  &= (1 - 1) / 2 \
  &= 0 \
$

When $i != j$, we have:

$
  p(y = X_i | x = X_j) &= tr(rho_j E_i) \
  &= tr(rho_j (I - rho_i) / 2) \
  &= (tr(rho_j) - tr(rho_j rho_i)) / 2
$

We have:

$
text("   ")#table(
  columns: 4,
  align: center,
  rows: 2,
  inset: 10pt,
  $tr(rho_1)$, $tr(rho_2)$, $tr(rho_3)$, $tr(rho_4)$,
  $tr(mat(1, 0; 0, 0))$, $1/3tr( mat(1, sqrt(2); sqrt(2), 2))$, $1/3tr( mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2))$, $1/3tr(mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2))$,

) \
= #table(
  columns: 4,
  align: center,
  rows: 2,
  inset: 10pt,
  $tr(rho_1)$, $tr(rho_2)$, $tr(rho_3)$, $tr(rho_4)$,
  $1$, $1$, $1$, $1$,

) \
$

and:

$
  text("   ")#table(
  columns: 2,
  align: center,
  rows: 6,
  inset: 10pt,
  $tr(rho_1 rho_2)$, $1/3tr(mat(1, 0; 0, 0) mat(1, sqrt(2); sqrt(2), 2)) \ = 1/3(1 + 0) = 1/3$,
  $tr(rho_1 rho_3)$, $1/3tr(mat(1, 0; 0, 0) mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2)) \ = 1/3(1 + 0) = 1/3$,
  $tr(rho_1 rho_4)$, $1/3tr(mat(1, 0; 0, 0) mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \ = 1/3(1 + 0) = 1/3$,
  $tr(rho_2 rho_3)$, $1/9tr(mat(1, sqrt(2); sqrt(2), 2) mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2)) \ = 1/9(1 + 2e^(2 pi i \/ 3) + 2e^(-2 pi i \/ 3) + 4) = 1/3$,
  $tr(rho_2 rho_4)$, $1/9tr(mat(1, sqrt(2); sqrt(2), 2) mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \ = 1/9(1 + 2e^(4 pi i \/ 3) + 2e^(-4 pi i \/ 3) + 4) = 1/3$,
  $tr(rho_3 rho_4)$, $1/9tr(mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2))
  \ = 1/9((1 + 2e^(2 pi i \/ 3) + 2e^(-2 pi i \/ 3) + 4)) = 1/3$,
) \
$

So when $i != j$, we have $ p(y = X_i | x = X_j) = (tr(rho_j) - tr(rho_j rho_i)) / 2 = (1 - 1/3) / 2 = 1/3$.

So we have the following table of the joint and marginal probabilities:

#table(
  columns: 6,
  rows: 6,
  align: center,
  inset: 10pt,
  $x \\ y$, $X_1$, $X_2$, $X_3$, $X_4$, $p(x)$,
  $X_1$, $0$, $1/12$, $1/12$, $1/12$, $1/4$,
  $X_2$, $1/12$, $0$, $1/12$, $1/12$, $1/4$,
  $X_3$, $1/12$, $1/12$, $0$, $1/12$, $1/4$,
  $X_4$, $1/12$, $1/12$, $1/12$, $0$, $1/4$,
  $p(y)$, $1/4$, $1/4$, $1/4$, $1/4$, $1$,
) \

So we have:

- $H(X) = - sum_x p(x) log_2(p(x)) = - 4 dot 1/4 log_2(1/4) = 2$
- $H(Y) = - sum_y p(y) log_2(p(y)) = - 4 dot 1/4 log_2(1/4) = 2$
- $H(X, Y) = - sum_(x, y) p(x, y) log_2(p(x, y)) = - 12 dot 1/12 log_2(1/12) = 3.585$

So the mutual information is given by:

$ H(X: Y) = H(X) + H(Y) - H(X, Y) = 2 + 2 - 3.585 = 0.415 $.

So we can see that the mutual information don't reach 1 bit and that the POVM we constructed allows to reach the known bound of $approx 0.415$ bits.