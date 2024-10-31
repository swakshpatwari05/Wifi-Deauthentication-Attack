# Wifi Deauthentication Attack README

## Project Overview
This project focuses on understanding and executing WiFi deauthentication attacks and WPA2 password hacks. The objective is to disrupt the connection between a target device and a router without physical access to either device, forcing the target device to disconnect from the network temporarily. The project also explores methods to increase the number of potential victims for such attacks and discusses a stealthier approach to hack WPA2 passwords using PMKID attacks.

## Group Members
1. Aansh Chandrakant Dubey (B22AI058)
2. Swaksh Patwari (B22AI065)

## Session
Spring 2024

## Instructor
Professor Sumit Kalra

---

## Task 1: Deauthentication attack and WPA2 password hack

### Problem Statement
Disrupt the connection between a target device and a router without physical access to either device.

### Requirements
- 2 clients: one to launch an attack and one to be the victim.
- Attacker must have a wireless adapter.

### Procedure
1. Identify the Wireless Card and put it into Monitor Mode.
2. Identify the target router and device.
3. Deauthenticate clients to force them to reconnect and trigger the capture of the handshake.
4. Capture the handshake.
5. View captured handshake using Wireshark.

### Observations
1. Not all users were found by aircrack-ng.
2. Once disconnected, the user does not show up on aircrack-ng.
3. The identity of the attacker can be detected by the victim using Wireshark or any other packet capturing tool.

---

## Task 2: Increase the number of potential victims for the attack

### Problem Statement
To find all the users connected to a particular router of IITJ_WLAN network.

### Procedure
1. Get closer to the router.
2. Change the band using –band.

### Observations
- The number of routers in range increased, but the number of potential victims remained the same.

---

## Task 3: A stealthier way to hack WPA2 passwords – PMKID Attack

### Explanation
- Explaining the PMKID attack through terminology.
- Discussing why routers give away the PMKID to unauthorized strangers.

### Execution
Requirements and steps for executing the PMKID attack.
Mitigation strategies to counter the risks associated with this attack.

---

## Task 4: Deep dive into the library aircrack-ng

### Overview
A detailed examination of the aircrack-ng suite of tools and their functions.
Explanation of the output of airodump-ng and understanding what each column means.
Analysis of various functions used from the aircrack-ng library.

---

This README provides an overview of the project, detailing the tasks undertaken, their objectives, procedures, observations, and conclusions. It serves as a comprehensive guide for understanding the WiFi deauthentication attack and related concepts explored during the project.
