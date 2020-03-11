function a = getDesiredLetters()

    prompt = {'Enter desired letters separated by spaces'};
    dlgtitle = 'Letters for arm';
    dims = [1 55];
    definput = {''};
    
    answer = inputdlg(prompt,dlgtitle,dims,definput)
    
    for i=1:5 
        first_letter = answer{''}
        matchLetter(first_letter)
    end
    
%     
%     for i=1:5
%         matchLetter(answer{i})
%     end

end 
