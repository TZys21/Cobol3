       Identification Division.
       Program-id.          Lab3a.
       
      *      Name: Tyler Zysberg. Description: LAB3a.Counts the number
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
             88 Amphibian    value "Frog" "Newt" "Salamander" 
             "Toad".
                            
             88 Bird  value "Albatross" "Eagle" 
             "Falcon" "Hawk" "Pelican" "Vulture".

             88 Mammal    value "Ape" "Cheetah" "Chimp"
              "Coyote" "Lion" "Mongoose" "Otter" "Tiger" "Wolf".

             88 Reptile    value "Alligator" "Boa"
             "Cobra" "Komodo" "Turtle" "Viper".
          
		  
       Working-storage section.
        01  counter-Amphibian pic 999.
        01  counter-Bird      pic 999.
        01  counter-Mammal    pic 999.
        01  counter-Reptile   pic 999.
        01  counter-other     pic 999.
        01  Amphibian-format  pic ZZ9.
        01  Bird-format       pic ZZ9.
        01  Mammal-format     pic ZZ9.
        01  Reptile-format    pic ZZ9.
        01  other-format      pic ZZ9.
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
           if Amphibian
               add 1 to counter-Amphibian
           else if Bird
               add 1 to counter-Bird
           else if Mammal
               add 1 to counter-Mammal
           else if Reptile
               add 1 to counter-Reptile
           else
               add 1 to counter-other
           end-if.
           
           
           
       999-finalize.  
           close infile.
       
       