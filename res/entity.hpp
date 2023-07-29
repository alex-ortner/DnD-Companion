

namespace dnd{
  
  enum class dndClass : int
  {
    classBarbarian,
    classBard,
    classCleric,
    classDruid,
    classFighter,
    classMonk,
    classPaladin,
    classRanger,
    classRogue,
    classSorcerer,
    classWarlock,
    classWizard
  };

  enum class dndRace : int
  {
    raceDragonborn,
    raceDwarf,
    raceElf,
    raceGnome,
    raceHalf_elf,
    raceHalfling,
    raceHalf_orc,
    raceHuman,
    raceTiefling
  };

  class entity
  {
    int m_strength = 0;
    int m_dexterity = 0;
    int m_constitution = 0;
    int m_intelligence = 0;
    int m_wisdom = 0;
    int m_charisma = 0;
    int m_level = 0;
    
  };
}