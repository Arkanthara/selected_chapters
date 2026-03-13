// Main report file
#import "template.typ": make-report, report-footnote
#import "metadata.typ": my-report
#import "@preview/theofig:0.1.0": definition
#import "@preview/physica:0.9.8"


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
Deduce that $H(X, Y) <= H(X) + H(Y)$, with equality if and only if $X$ and $Y$ are independent random variables.

= Exercise 3: Generalised measurements can decrease entropy

Suppose a qubit is in the state $rho$ measured using the measurement operators
$M_1 = |0 chevron.r chevron.l 0|$ and $M_2 = |0 chevron.r chevron.l 1|$.
If the result of the measurement is unknown to us then the state of the system afterwards is
$M_1 rho M_1^dagger + M_2 rho M_2^dagger$.
Show that this procedure can _decrease_ the entropy of the qubit.

= Exercise 12.1

Suppose $|psi chevron.r$ and $|phi chevron.r$ are two orthogonal quantum states of a single qubit.
Design a quantum circuit with two input qubits (the "data" and the "target" qubits),
with the data qubit in either the state $|psi chevron.r$ or $|phi chevron.r$,
and the target qubit prepared in the standard state $|0 chevron.r$,
which produces as output $|psi chevron.r |psi chevron.r$ or $|phi chevron.r |phi chevron.r$,
depending on whether $|psi chevron.r$ or $|phi chevron.r$ was input to the data qubit.

= Exercise 12.4

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

#v(2em)

#text(weight: "bold")[
  To archive all results (solutions, report together with your code, etc.) and submit them using Quantum computing course moodle.
]
