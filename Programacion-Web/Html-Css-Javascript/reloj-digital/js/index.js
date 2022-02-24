function getHora(){
    // Funcion que retorna la hora y la ajusta
    // Para mostrarlo en un buen formato
    tiempo=new Date();
    hora=tiempo.getHours(); 
    minutos=tiempo.getMinutes();
    segundos=tiempo.getSeconds();
    // reloj=""
    if(hora<10)hora='0'+hora;
    if (minutos<10) minutos='0'+minutos;
    if (segundos<10) segundos='0'+segundos;
    return hora+":"+minutos+":"+segundos;
}

function actualizar_hora(){
    horaAct=getHora(); 
    reloj=document.getElementById("clock"); 
    reloj.innerHTML=horaAct; 
}
setInterval(actualizar_hora,1000);
