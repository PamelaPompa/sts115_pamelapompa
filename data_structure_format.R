# TYPE/class() = what kind of thing is this? (chr, int, factor)
#STRUCTURE = How is it organized?
#FORMAT = How is it represented/stored

#As soon as you apply structure, you apply some bias to the data; you are telling people
#how to view the data --> there's no data structure in the world free of bias i.e you tell
#people what was important to consider and what to ignore, in order to answer a question

#Data structure that is a tree is hierarchical by nature

#Tabular data is the most ubiquitous form of data storage and the one most familiar to most users.
#Tabular data consists of organizing data in a table of rows and columns. 
#Traditionally, each column in the table represents a field or variable and each row represents 
#an observation or entity. 

#XML --> extensible markup language, also hierarchical

sentences: [

<TAG> ITEM </TAG> #the slash indicates the end of this tag
<sentence> I am Carl. </sentence> #if the hierarchical structure is Grammatical
<sentence><subject> I</subject> am Carl. </sentence>
<sentence ID = 1>
  <clause ID = 1> #A clause is a group of words that includes a subject and a verb.
      <subject ID = 23> I </subject> 
      <verb ID = 12> am </verb>
  </clause>
  <clause ID = 2>
    <object ID = 34><PN> Carl </PN></object> # close the tags in proper order
    
  </clause>
</sentence>
      
  #The IDs represent the row numbers
  
  
#XML vs JSON
  #JSON is more readable meanwhile XML is crowded due to tags
  #JSON is sparse while XML has a lot of characters that has nothing to do with the data itself
  #XML takes up more space
  
#Graph Data occupies a space, it can be represented/formatted in a variety of ways
    #i.e tables, hierarchy
    #graph data --> pairs of data; nodes/vertices and edges
  
        Edges
LH Kellog| R Arrowsmith | Date  | FAFQ (?) | TYPE
________________________________________________________
Y Dilek  |  CA Stewart  | ~~~~  |   27     | Colleague
________________________________________________________
         |              | ~~~~  |          | Friend
________________________________________________________
         |              | ~~~~  |          | Co-publisher

#You can put weights/labels on the edges
