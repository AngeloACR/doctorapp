#!/usr/bin/python2.7

import sys


def sendResult(dOut):
	print(dOut)
	sys.stdout.flush()

def main():
	try:
	
	    montoActual = sys.argv[1]
	    montoMovimiento = sys.argv[2]
		newBalance = montoActual - montoMovimiento

        data = {
            disponibilidadAntes: montoActual,
            disponibilidadDespues: newBalance,
        }

		sendResult(data)

	except Exception as ex:

		sendResult("Error")

main()