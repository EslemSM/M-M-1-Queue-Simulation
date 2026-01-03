# Monte Carlo Simulation of an M/M/1 Queue

## 📌 Project Overview

This project applies **Monte Carlo simulation** to analyze customer **waiting time in a single-server queue (M/M/1)**. It focuses on estimating the expected waiting time before service and comparing simulation results with theoretical queueing theory values.

The project is developed in the context of **Business Simulation** and illustrates how simulation supports operational and capacity planning decisions.

## 🎯 Objectives

* Model a service system using an **M/M/1 queue**
* Estimate the expected waiting time in the queue:
  [
  \theta = E[W_q]
  ]
* Compare **Monte Carlo estimates** with theoretical results
* Analyze convergence and waiting time distribution

## ⚙️ Model Description

* **Arrivals**: Poisson process (rate λ = 0.8)
* **Service times**: Exponential distribution (rate μ = 1.0)
* **Server**: Single server
* **Queue discipline**: First-Come, First-Served
* **Number of customers simulated**: 100,000

## 📊 Key Results

* Monte Carlo estimates closely match theoretical values
* Convergence observed as the number of simulated customers increases
* Waiting time distribution is right-skewed, with few customers experiencing long delays

## 🛠 Tools & Technologies

* R (random number generation, simulation, visualization)
* Monte Carlo methods
* Queueing theory (M/M/1)

## 💡 Business Insights

* High server utilization leads to rapidly increasing waiting times
* Simulation helps evaluate staffing levels and service capacity
* Useful for decision-making in banks, call centers, hospitals, and service desks

## 🚀 Possible Extensions

* Multiple servers (M/M/c)
* Non-exponential service times
* Finite queue capacity
* Time-dependent arrival rates

## 👥 Team

* Sabrine Abdmouleh
* Eya Attia
* Islem Smiai
* Yassmine Yazidi
* Sahar Bhiri
