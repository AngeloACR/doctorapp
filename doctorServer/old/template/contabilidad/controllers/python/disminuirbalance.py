#!/usr/bin/python2.7

import sys


def sendResult(dOut):
	print(dOut)
	sys.stdout.flush()

def main():
	try:
	
	    balance = sys.argv[1]
	    montoMovimiento = sys.argv[2]
		newBalance = balance - montoMovimiento

        data = {
            balanceAntes: balance,
            balanceDespues: newBalance,
        }

		sendResult(data)

	except Exception as ex:

		sendResult("Error")

main()