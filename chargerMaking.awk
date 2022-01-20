# script pour générer le fichier de charger.xml
# Author: Ngagne Diop
# Date: January 2022
# Last edited: January 2022

BEGIN {
  FS=";";

# entête obligatoire pour MATSim
  {print "<!DOCTYPE chargers SYSTEM \"http://www.matsim.org/files/dtd/chargers_v1.dtd\">"}
  {print ""}
  {print "	<chargers>"}
 }

{
## position id_link
  id_charger=$6;
  id_link=$3;
  puissance=$4;
  nombreprise=$5;
  if (NR>=2) {
        print "		<charger id=\""id_charger"\" link=\""id_link"\" plug_power=\""puissance"\" plug_count=\""nombreprise"\"/>";
        }
}
END{
  print "         </chargers>";
}
