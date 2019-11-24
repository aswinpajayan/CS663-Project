function [img_detail]= add_detail(img_noflash, img_flash, ss, is, ws)
    r_bilateral = basicBilateralFiltering(img_flash(:,:,1), ss, is, ws);
    g_bilateral = basicBilateralFiltering(img_flash(:,:,2), ss, is, ws);
    b_bilateral = basicBilateralFiltering(img_flash(:,:,3), ss, is, ws);
    
    f_base = cat(3, r_bilateral, g_bilateral, b_bilateral);
    f = img_flash;
    
    f_detail = (f + 0.02)./(f_base + 0.02);
    
    img_detail = img_noflash .* f_detail;
    
end