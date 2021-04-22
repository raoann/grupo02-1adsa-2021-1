function lm35(min, max) {
    min = typeof min == 'undefined' ? 19 : min;
    max = typeof max == 'undefined' ? 27 : max;
    
    let random = Math.random() * (max - min) + min;

    return random
}

function trc5000() {
    min = 0;
    max = 1;
    
    let random = Math.random() * (max - min) + min;
    
    if (random >= 0.7) {
        return 1
    } else if (random <= 0.7) {
        return 0
    }
}

function ldr(){
    min = 0;
    max = 1023

    let random = Math.floor(Math.random()*(max-min+1)+min);

    return random
}

function dht11(options){

    minHumidity = options.minHum;
    maxHumidity = options.maxHum;

    minTemperature = options.minTemp;
    maxTemperature = options.maxTemp;

    if (minHumidity < 20 || maxHumidity > 100) {
        //removendo qualquer restrição
    }

    if (minTemperature < 0 || maxTemperature > 50) {
        //removendo qualquer restrição
    }

    minTemperature = typeof minTemperature == 'undefined' ? 18 : minTemperature;
    maxTemperature = typeof maxTemperature == 'undefined' ? 21 : maxTemperature;

    minHumidity = typeof minHumidity == 'undefined' ? 20 : minHumidity;
    maxHumidity = typeof maxHumidity == 'undefined' ? 80 : maxHumidity;


    let randomHumidity = (Math.random()*(maxHumidity-minHumidity+1)+minHumidity);
    
    let randomTemperature = Math.random() * (maxTemperature - minTemperature) + minTemperature;
    
    return [randomHumidity, randomTemperature]
}


module.exports = {lm35, trc5000, ldr, dht11};
