function a = getDesiredLetters()

    prompt = {'Enter desired letters separated by spaces'};
    dlgtitle = 'Letters for arm';
    dims = [1 55];
    definput = {''};
    
    answer = inputdlg(prompt,dlgtitle,dims,definput)
    
    while answer(~='')
        for i=1:5 
            matchLetter(answer.definput{i})
        end
    end 
    
%     
%     for i=1:5
%         matchLetter(answer{i})
%     end

end 
