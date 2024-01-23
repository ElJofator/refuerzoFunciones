Funcion resultado <- sumar(numero1, numero2)
	resultado = numero1 + numero2
FinFuncion

Funcion resultado <- restar(numero1, numero2)
	resultado = sumar(numero1, -numero2)
FinFuncion

Funcion resultado <- multiplicar(numero1, numero2)
	resultado = numero1 * numero2
FinFuncion

Funcion resultado <- dividir(numero1, numero2)
	resultado = multiplicar(numero1, 1/numero2)
FinFuncion

Funcion validacion <- validar(num1)
	cantidad = Longitud(num1)
	punto = Falso
	validacion = Verdadero
	Para i <- 1 Hasta cantidad Con Paso 1 Hacer
		num = Falso
		Para j <- 0 Hasta 9 Con Paso 1 Hacer
			Si Subcadena(num1, i, i) == ConvertirATexto(j) Entonces
				num = Verdadero
				j = 10
			FinSi
		Fin Para
		Si Subcadena(num1, i, i) == "." Y i > 1 Entonces
			Si !punto Entonces
				punto = Verdadero
				num = Verdadero
			SiNo
				validacion = Falso
				i = cantidad + 1
			FinSi
		FinSi
		Si !num Entonces
			validacion = Falso
			i = cantidad + 1
		FinSi
	FinPara
FinFuncion

Algoritmo calculadora
	val = Falso
	Repetir
		Escribir "Ingrese el primer número:"
		Leer texto_numero1
		val = validar(texto_numero1)
	Hasta Que val
	Repetir
		Escribir "Ingrese el segundo número:"
		Leer texto_numero2
		val = validar(texto_numero2)
	Hasta Que val
	numero1 = ConvertirANumero(texto_numero1)
	numero2 = ConvertirANumero(texto_numero2)
	operacion = ""
	Repetir
		Escribir "Seleccione la operación (+,-,*,/):"
		Leer operacion
		Segun operacion Hacer
			"+":
				resultado = sumar(numero1, numero2)
				Escribir resultado
			"-":
				resultado = restar(numero1, numero2)
				Escribir resultado
			"*":
				resultado = multiplicar(numero1, numero2)
				Escribir resultado
			"/":
				Si numero2 <> 0 Entonces
					resultado = dividir(numero1, numero2)
					Escribir resultado
				SiNo
					Escribir "No se puede dividir entre 0"
				FinSi
			De Otro Modo:
				Escribir "Operación no válida"
		Fin Segun
	Hasta Que operacion == "+" O operacion == "-" O operacion == "*" O operacion == "/"
FinAlgoritmo
