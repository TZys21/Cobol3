       Identification Division.
       Program-id.          Lab3d.
       
      *      Name: Tyler Zysberg. Description: LAB3d.Counts the number
      *>     of species in each field from an input file.
      
       environment division.
       input-output section.
       file-control.
            select infile assign to "lab3-in.dat"
                organization is line sequential.

       Data division.
       File Section.
       Fd infile.
       01  AnimalClass.
         05  AnimalName       Pic X(12).
         05  Gender           Pic X(1).
         05  Species          Pic X(15).
             88 Amphibian  value "Frog" "Newt" "Salamander" 
             "Toad".
                            
             88 Bird  value "Albatross" "Eagle" 
             "Falcon" "Hawk" "Pelican" "Vulture".

             88 Mammal  value "Ape" "Cheetah" "Chimp"
              "Coyote" "Lion" "Mongoose" "Otter" "Tiger" "Wolf".

             88 Reptile  value "Alligator" "Boa"
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
        01  user-input        pic S999 value -1.
        01  Indx              Pic 999.
       
       
       
       Procedure Division.
       000-main.
       
           Perform 100-initialize
           Perform 200-Input
           Perform Varying indx from 1 by 1 until indx >
               user-input
           read infile
           perform 300-Perform
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
           
       200-Input.
           perform until user-input > 0
           display "Enter line number: " with no advancing
           accept user-input
              if user-input <= 0
                display "Must be positive number"
              end-if
           end-perform.
  
       300-Perform.
            evaluate true
             when Amphibian
             add 1 to counter-Amphibian
             when Bird
             add 1 to counter-Bird
             when Mammal
             add 1 to counter-Mammal
             when Reptile
             add 1 to counter-Reptile
             when other
             add 1 to counter-other
           end-evaluate.
       
              
       999-finalize.  
           close infile.
       
       