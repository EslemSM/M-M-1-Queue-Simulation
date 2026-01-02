############################################################
# M/M/1 Queue Simulation (Monte Carlo) — waiting time in queue
# θ = E[Wq] where Wq = waiting time before service starts
############################################################

set.seed(123)

# ---- Parameters (edit if you want) ----
lambda <- 0.8   # arrival rate λ
mu     <- 1.0   # service rate μ
N      <- 100000  # number of customers to simulate

stopifnot(lambda > 0, mu > 0)
if (lambda >= mu) stop("Need λ < μ for a stable M/M/1 queue (rho < 1).")

# ---- Generate interarrival and service times ----
A <- rexp(N, rate = lambda)  # interarrival times
S <- rexp(N, rate = mu)      # service times

# ---- Simulate the queue ----
t_arr <- numeric(N)   # arrival times
b_srv <- numeric(N)   # service start times
d_dep <- numeric(N)   # departure times
Wq    <- numeric(N)   # waiting times in queue

t_arr[1] <- A[1]
b_srv[1] <- t_arr[1]
d_dep[1] <- b_srv[1] + S[1]
Wq[1]    <- 0

for (i in 2:N) {
  t_arr[i] <- t_arr[i-1] + A[i]
  b_srv[i] <- max(t_arr[i], d_dep[i-1])
  d_dep[i] <- b_srv[i] + S[i]
  Wq[i]    <- b_srv[i] - t_arr[i]
}

# ---- Monte Carlo estimate + MCSE ----
theta_hat <- mean(Wq)
mcse      <- sd(Wq) / sqrt(N)

cat("M/M/1 queue simulation\n")
cat("lambda =", lambda, " mu =", mu, " N =", N, "\n")
cat("Estimate theta = E[Wq] =", theta_hat, "\n")
cat("MCSE =", mcse, "\n")

# ---- Optional: theoretical value for M/M/1 waiting time in queue ----
# E[Wq] = lambda / (mu * (mu - lambda))
theta_theory <- lambda / (mu * (mu - lambda))
cat("Theory E[Wq] =", theta_theory, "\n")
cat("Abs error =", abs(theta_hat - theta_theory), "\n")

# ---- Minimal convergence diagnostic: running mean plot ----
running_mean <- cumsum(Wq) / seq_along(Wq)

plot(running_mean, type = "l",
     xlab = "n (customers simulated)",
     ylab = "Running mean of Wq",
     main = "Convergence of Monte Carlo estimate for E[Wq]")

abline(h = theta_hat, lty = 2)     # simulated estimate
abline(h = theta_theory, lty = 3)  # theory (optional)
legend("topright",
       legend = c("Running mean", "Sim estimate", "Theory (optional)"),
       lty = c(1, 2, 3),
       bty = "n")

