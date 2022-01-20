BEGIN {
  FS="\"";
  new=0;
  th=0.0085; # pct of charging evechicles
  str1="<vehicle id=\"";
  str2="\" battery_capacity=\"";
  str3="\" initial_soc=\"";
  str4="\" charger_types=\"default";
  str5="\" vehicle_type=\"defaultVehicleType";
  str6="\"/>";
# entête obligatoire pour MATSim
  {print "<!DOCTYPE vehicles SYSTEM \"http://www.matsim.org/files/dtd/electric_vehicles_v1.dtd\">"}
  {print ""}
  {print "<vehicles>"}

}

/person id/ {
  new =1;
  id=$2;
}

/leg mode/ && /car/ && new==1 { # for cars

#/leg mode/ && new==1 { # for all vehicles

 if(rand()<th) {
    print "	" str1 id str2 "60" str3 "60" str4 str5 str6;
 }

  new = 0;

}



END {
 print "</vehicles>" ;
}
