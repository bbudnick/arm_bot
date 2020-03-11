function[] = sCloseAll()
out = instrfind;
if ~isempty(out)
    fclose(out);
end
end
