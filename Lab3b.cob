       Identification Division.
       Program-id.          Lab3b.
       
      *      Name: Tyler Zysberg. Description: LAB3b.Counts the number
      *>     of species in each field from an input file.
      
       environment division.
       input-output section.
       file-control.
            select infile assign to "lab3-in.dat"
                organization is line sequential.

       Data division.
       File Section.
       Fd infile.
       01    AnimalClass.
         05    AnimalName       Pic X(12).
         05    Gender           Pic X(1).
         05    Species          Pic X(15).
          
	   Working-storage section.
        01  counter-Amphibian pic 999.
        01  counter-Bird      pic 999.
        01  counter-Mammal    pic 999.
        01  counter-Reptile   pic 999.
        01  counter-other     pic 999.
        01  Amphibian-format  pic ZZZ.
        01  Bird-format       pic ZZZ.
        01  Mammal-format     pic ZZZ.
        01  Reptile-format    pic ZZZ.
        01  other-format      pic ZZZ.
        01  eof               pic X value "N".
           88 eof-false       value "Y".
       
       
       
       Procedure Division.
       000-main.
       
           Perform 100-initialize
           
            perform until eof-false
              read infile
                 at end
                    set eof-false to true
                 not at end
                    perform 300-Count
              end-read
           end-perform
           
           move counter-Amphibian to Amphibian-format
           move counter-Bird to Bird-format
           move counter-Mammal to Mammal-format
           move counter-Reptile to Reptile-format
           move counter-other to other-format
                                            
                 display "Amphibian: " Amphibian-format
                 display "Bird: " Bird-format
                 display "Mammal: " Mammal-format
                 display "Reptile: " Reptile-format
                 display "Other: " other-format
           
           perform 999-finalize
           
           stop run.
           
       100-initialize.
           open input  infile.
           
       300-Count.
           evaluate species
		   when "Frog"
           when "Newt"
           when "Salamander"
           when "Toad"
           add 1 to counter-Amphibian
           when "Albatross"
           when "Eagle"
           when "Falcon"
           when "Hawk"
           when "Pelican"
           when "Vulture"
           add 1 to counter-Bird
           when "Ape"
           when "Cheetah"
           when "Chimp"
           when "Coyote"
           when "Lion"
           when "Mongoose"
           when "Otter"
           when "Tiger"
		   when "Wolf"
           add 1 to counter-Mammal
           when "Alligator"
           when "Boa"
           when "Cobra"
           when "Komodo"
           when "Turtle"
           when "Viper"
           add 1 to counter-Reptile
           when other
           add 1 to counter-other
           end-evaluate.
		   
           
           
           
       999-finalize.  
           close infile.
       
       