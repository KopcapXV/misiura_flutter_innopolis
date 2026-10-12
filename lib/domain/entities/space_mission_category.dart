enum MissionCategory {
  telescope('Телескоп'),
  rover('Марсоход'),
  station('Орбитальная станция'),
  probe('Межпланетный зонд'),
  crewed('Пилотируемая');

  final String label;
  const MissionCategory(this.label);
}