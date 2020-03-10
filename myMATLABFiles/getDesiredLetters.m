function a = getDesiredLetters()

    prompt = {'Enter desired letters separated by spaces'};
    dlgtitle = 'Letters for arm';
    dims = [1 55];
    definput = {''};
    answer = inputdlg(prompt,dlgtitle,dims,definput)
    
    
 
    for i=1:size(answer) 
        current_letter=answer(i); 
        matchLetter(current_letter)
    end
    
    a = answer; 

end 
