function scaledImage = customResize(image, scale)
    [height, width, ~] = size(image);
    newHeight=round(height * scale);
    newWidth=round(width * scale);
    scaledImage = uint8(zeros(newHeight,newWidth,3));
    for i=1:newHeight
        for j=1:newWidth
            x=round(i/scale);
            y=round(j/scale);
            if x<= 0
                x = 1;
            elseif x>height
                x = height;
            end
            if y<=0
                y=1;
            elseif y>width
                y=width;
            end
            scaledImage(i,j,:) = image(x,y,:);
        end
    end
end
