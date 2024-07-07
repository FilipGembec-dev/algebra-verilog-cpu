# RISC-V Design and FPGA Implementation
Welcome to the GitHub repository for the Algebra RISC-V cpu. This repository contains all the necessary files, documentation, and instructions to understand, build, and deploy a RISC-V processor on an Basys3 development board.

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
4. [Getting Started](#getting-started)
5. [Design Overview](#design-overview)
6. [Simulation and Verification](#simulation-and-verification)
7. [TODO](#TODO)

## Introduction
This project aims to design rv32i ISA processor and deploy it on Basys3 development board. 

## Prerquisites
Before you begin, ensure you have the following software installed:
- Vivado design suite

## Getting started
Read userguide. For quick test, program device with helloRISCV.bit bitstream.

## Design Overview
Design contains multicycle rv32i ISA core, single beat AXI interconnect for pheriprele, and block RAM. 
Core consists of 3 modules: top_module, decode(CU), ALU (arithemtcl logical unit). It can be split in two categorys control(decode) and datapath(top and alu). Control representing control signals that are produced in FSM, and datapath computation that happens according to these control signals. This processor is designed for purpouse of simple demonstration, so some rv32i features are not implanted - FENCE, CSR, store byte and halfword might not work as inteded. Top_module also contains single beat AXI master interface, which is used for integration with Basys3 development board.

## Simulation and Verification
Core at least in this version has been tested with all instructions except pseudo instructions. Tests and example programs can be looked up in project history.

## TODO
Further testing using RISCV gnu tools, add missing instructions, branch optimization.


