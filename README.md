# Nim-Backdoor
This is a simple reverse shell write in Nim lang

Replace "attacker_ip" and attacker_port with the attacker's IP and port, respectively.
Compile the Nim code using the Nim compiler:

bash

nim c -d:release --opt:speed --cpu:amd64 reverse_shell.nim

On the attacker's machine, listen for the connection using a tool like nc (Netcat):

bash

    nc -lvnp <port>

Notes:

    This script connects back to the attacker's machine using a TCP socket, then waits for commands to execute.
    It captures the output of the command using Windows cmd and sends the result back to the attacker.
    Only run this on systems where you have legal permission to do so, such as penetration testing environments
