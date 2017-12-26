       Identification Division.
       Program-id.          Lab3c.
       
      *      Name: Tyler Zysberg. Description: LAB3c.Counts the number
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
        01  Amphibian-format  pic ZZ9.
        01  Bird-format       pic ZZ9.
        01  Mammal-format     pic ZZ9.
        01  Reptile-format    pic ZZ9.
        01  other-format      pic ZZ9.
        01  user-input        pic S999 value -1.
       
       
       
       Procedure Division.
       000-main.
       
           Perform 100-initialize
           Perform 200-Input
           Perform user-input times
           read infile
           perform 300-count
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
           
       300-Count.
          if species = "Frog" or "Newt" or "Salamander" or "Toad"
             add 1 to counter-Amphibian
          else if species = "Albatross" or "Eagle" or "Falcon" or
          "Hawk" or "Pelican" or "Vulture"
             add 1 to counter-Bird
          else if species = "Ape" or "Cheetah" or "Chimp" or "Coyote"
           or "Lion" or "Mongoose" or "Otter" or "Tiger" or "Wolf"
             add 1 to counter-Mammal
          else if species = "Alligator" or "Boa" or "Cobra" or 
          "Komodo" or "Turtle" or "Viper"
             add 1 to counter-Reptile
          else 
             add 1 to counter-other
		  end-if.
           
        999-finalize.  
           close infile.
       
       