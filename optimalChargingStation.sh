##!/bin/bash
# 1/ files creation : zones, bornes, trips, distances, add(nbsites and nbbornes), maxbornes
# 2/ concatenation of files to create file.dat for ampl
mkdir output # create folder for outputs
# create add.dat file in input folder to choose numbers of charging stations and zones

echo check file add where nbsites and nbbornes are defined

echo I-Begin files creation-50%

echo zones creation ...
awk -f codes/zones.awk input/zones.csv > output/zones.dat
echo bornes creation ...
awk -f codes/bornes.awk input/bornes.csv > output/bornes.dat
echo trips creation-please confirm pct trips ...
awk -f codes/trips.awk input/ndep.csv > output/trips.dat 
echo distances interzones creation ...
awk -f codes/dist.awk input/distance.csv > output/distances.dat
echo bornesmax per sites creation ...
awk -f codes/bornesmax.awk input/bornemax.csv > output/bornesmax.dat 
echo End files creation

echo II-Begin concatenation-50%
cp -r output cache # to save original data before merging
cp input/add.dat output/ 
cat output/bornesmax.dat >> output/add.dat 
cat output/add.dat >> output/distances.dat
cat output/distances.dat >> output/trips.dat 
cat output/trips.dat >> output/bornes.dat 
cat output/bornes.dat >> output/zones.dat
echo End concatenation
cp output/zones.dat output/optibornes.dat

