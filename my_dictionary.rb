require 'pg'
class EngDictionary
    
    def initialize
       @words = []
       @dictionary = {}
    end

    def menu
        while true
        print"
        *---Your ENGLISH DICTIONARY---*
        1: list
        2: quiz
      
        9: exit
        "
        choice = gets.chomp
        
        case 
            when '1' == choice
                list
            when '2' == choice
                quiz
            when '9' == choice
                puts "exit"
                break
            end
        end
    end

    def readFile
      File.open("Eng_words.txt"){|f|
            f.each_line{|line|
                word = "" 
                if line.size() < 1

                else
                    contents = line.chomp().split(':').map()
                    contents.each_with_index{|content, i|     
                        if i==0
                            word = content
                            @dictionary[word] = ""
                            #puts word
                        else
                            @dictionary[word] = content.split('　')
                        end
                    }
                end  
            }
        }
        @dictionary.sort()  
    end

    def list
        @dictionary.each{|key,value|
            print "----
            WORD    : #{key}
            MEANING : #{value}
            "
        }
    end

    def quiz
        puts "(enter to see the meaning)"
        flag = 0
        while(flag == 0) do
            id = rand( @dictionary.length )
            i = 0
            @dictionary.each{|key,value|
                if i == id
                    print "-----------------\n"  
                    print "WORD:        #{key}\n"
                    ans = gets.chomp()
                    if ans == "quit" || ans == "exit" || ans == "9"
                        flag = 1
                    end
                    print "MEANING:     #{value}\n"
                end
                i += 1
            }
        end
    end

end



eng_dic = EngDictionary.new
eng_dic.readFile

choice = eng_dic.menu