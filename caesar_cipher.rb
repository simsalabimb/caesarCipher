require "sinatra"
require "sinatra/reloader" if development?

def caesar_cipher(str, num)

    return "" if !str
    num = num.to_i
    alphabet = ('a'..'z').to_a
    arr = str.split('')
    ans = []
    i = 0
  
    arr.each do |letter|
  
     case_changed = false
      if letter.upcase == letter  
          letter = letter.downcase
          case_changed = true
      end
      
      if alphabet.include? letter 
        temp = alphabet[(alphabet.index(letter) + num) % alphabet.size] #use modulo to wrap array. If there is remainder, then array will wrap the beginning
        if case_changed
          temp = temp.upcase
        end
        ans[i]=temp
      else 
        ans[i] = letter
      end
      i += 1 
    end 
    str = ans.join('')
    str
  end

get '/' do
    word = params["word"]
    shift = params["shift"]

    result = caesar_cipher(word, shift)
    erb :index,
    :locals => {:word => word, :shift => shift, :result => result}
    
end