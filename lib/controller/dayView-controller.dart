int retornaHoraMenos() {
  int hora = DateTime.now().hour - 1;

  if (hora <= 0) {
    hora = 0;
  } else if (hora >= 23) {
    hora = 23;
  }
  return hora;
}

int retornaHoraMais() {
  int hora = DateTime.now().hour + 6;

  if (hora <= 0) {
    hora = 0;
  } else if (hora >= 23) {
    hora = 23;
  }
  return hora;
}
