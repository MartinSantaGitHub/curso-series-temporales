library(forecast)

# Dataset de linces 
# Número de linces atrapados por año en el período 1821-1934 en Canadá
length(lynx)

plot(lynx)

# Parece estacionario pero probablemente haya autocorrelación 
# Si se capturan muchos linces un año, se espera que al año siguiente hayan menos porque hay 
# menos para reproducirse.
# Vemos un pulso cíclico que son los puntos máximos, no hay estacionalidad pero hay un patrón

# Es estacionaria
adf.test(lynx)

tsdisplay(lynx) # autoregresion?

#Por lo menos un AR(2)

auto.arima(lynx) # version basica

auto.arima(lynx, trace = T)

# Mejor modelo
myarima=auto.arima(lynx, trace = T, 
           stepwise = F, 
           approximation = F)
### ARIMA Forecast

# Forecast de 10 años
arimafore <- forecast(myarima, h = 10)

plot(arimafore)

# Valores estimados del futuro
arimafore$mean

# Ultimas observaciones y forecast
plot(arimafore, xlim = c(1930, 1944))

### Tarea 5

summary(myarima)

myarima2 = auto.arima(lynx, trace = T, 
                      stepwise = F, 
                      approximation = F,
                      max.p = 8,
                      max.order = 8)

summary(myarima2)

# myarima es el modelo obtenido de la clase anterior AR(4)
# myarima2 es el modelo AR(8)

myarima$loglik
myarima2$loglik

myarima$aic
myarima2$aic

# Aumentemos max.p y max.order hasta un valor exagerado de 18.

myarima3 = auto.arima(lynx, trace = T, 
                      stepwise = F, 
                      approximation = F,
                      max.p = 18,
                      max.order = 18)

summary(myarima3)
