library(forecast)

head(AirPassengers)
class(AirPassengers)

autoplot(AirPassengers)

frequency(AirPassengers) # Frecuencia mensual. Hay 12 observaciones por año.

autoplot(decompose(tsclean(AirPassengers), 
                   type = "multiplicative"))

AirPassDec = decompose(tsclean(AirPassengers), 
                         type = "multiplicative")

autoplot(AirPassDec$trend)
