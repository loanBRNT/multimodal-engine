/*
 * Enumération de a Machine à Etats (Finite State Machine)
 *
 */
 
public enum FSM {
  INITIAL, /* Etat Initial */ 
  RECOGNITION, /* mode de reconnaissance */ 
  LEARNING, /* mode apprentissage */
  EXPORT, /* export des templates */
  IMPORT, /* import des templates */ 
  TEMPLATES, /* affichage des templates */ 
  HELP
}
