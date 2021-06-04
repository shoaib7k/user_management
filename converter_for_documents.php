<?php
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);

function convert_document($_path_to_document) {
       
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $_file_mime_type = finfo_file($finfo, $_path_to_document);
    finfo_close($finfo);    
    
    //echo "<br>Mime: ".$_file_mime_type."<br>";

    $_file_ext = pathinfo($_path_to_document, PATHINFO_EXTENSION);
    $_file_dir = pathinfo($_path_to_document, PATHINFO_DIRNAME );
    
    $_file_ext_length = strlen($_file_ext);
    $_file_len = strlen($_path_to_document);
    $_file_without_extension = substr($_path_to_document, 0, $_file_len - $_file_ext_length - 1 );
    $_image_file = $_file_without_extension.".jpg";
    $_temp_pdf_file = $_file_without_extension.".pdf";
    
    if ($_file_ext != "pdf") {
    
        $convert_parameter = 'pdf';

        switch ($_file_ext) {
           case 'doc':
               $convert_parameter = $convert_parameter . ':writer_pdf_Export';
               break;

           case 'docx':
               $convert_parameter = $convert_parameter . ':writer_pdf_Export';
               break;

           case 'xls':
               $convert_parameter = $convert_parameter . ':calc_pdf_Export';
               break;

           case 'xlsx':
               $convert_parameter = $convert_parameter . ':calc_pdf_Export';
               break;

           case 'ppt':
               $convert_parameter = $convert_parameter . ':impress_pdf_Export';
               break;

           case 'pptx':
               $convert_parameter = $convert_parameter . ':impress_pdf_Export';
               break;             
        }



        $command = 'libreoffice --headless --convert-to ' . 
                $convert_parameter . 
                /*' -env:UserInstallation=file:///tmp/LibreOfice_Conversion_${user}'.*/
                ' --outdir "'.$_file_dir.'" ' . 
                ' ' . 
                '"'.$_path_to_document.'"';
        $command=$command.' 2>&1';//2 & 1 for error showing 
        echo $command;
        putenv('PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin');
putenv('HOME=/tmp'); 
       echo shell_exec($command); 
        // if ($shellresult == null) {
        //     echo "Error";
        // } else {
        //     echo "ShellResult: ".$shellresult."";
        // }
        
    
    }
       


    $img = new Imagick();               
    $img->readImage($_file_without_extension.".pdf"."[0]");                
    $img->setimageformat('jpeg');
    $img->setImageUnits(imagick:: RESOLUTION_PIXELSPERINCH);                
    $img->setImageCompression(imagick::COMPRESSION_JPEG); 
    $img->setImageCompressionQuality(90);                
    $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); 
    $img->scaleImage(256, 256,true);
    $img->writeImage($_file_without_extension.".jpg");
    $img->clear();
    $img->destroy();
    
    if ($_file_ext != "pdf") { unlink($_file_without_extension.".pdf"); }
        
        

}

?>

