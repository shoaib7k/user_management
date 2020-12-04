<!-- release v5.1.4, copyright 2014 - 2020 Kartik Visweswaran -->
<!--suppress JSUnresolvedLibraryURL -->
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Krajee JQuery Plugins - &copy; Kartik</title>
    <!-- include common vendor stylesheets & fontawesome -->
    <link rel="stylesheet" type="text/css" href="./node_modules/bootstrap/dist/css/bootstrap.css">
    

    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/fontawesome.css">
    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/regular.css">
    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/brands.css">
    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/solid.css">
   
       <link rel="stylesheet" type="text/css" href="./node_modules/bootstrap-select/dist/css/bootstrap-select.css">

    <link rel="stylesheet" type="text/css" href="./node_modules/bootstrap-duallistbox/dist/bootstrap-duallistbox.css">


    <link rel="stylesheet" type="text/css" href="./node_modules/select2/dist/css/select2.css">
    <link rel="stylesheet" type="text/css" href="./node_modules/chosen-js/chosen.css">
    <!-- include fonts -->
    <link rel="stylesheet" type="text/css" href="./dist/css/ace-font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">

    <link href="./css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
    <link href="./themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    -
    <script src="./js/plugins/piexif.js" type="text/javascript"></script>
    <script src="./js/plugins/sortable.js" type="text/javascript"></script>
    <script src="./js/fileinput.js" type="text/javascript"></script>
    <script src="./js/locales/fr.js" type="text/javascript"></script>
    <script src="./js/locales/es.js" type="text/javascript"></script>
    <script src="./themes/fas/theme.js" type="text/javascript"></script>
    <script src="./themes/explorer-fas/theme.js" type="text/javascript"></script>

    <link rel="icon" type="image/png" href="./images/rf-title2.jpg" />
<script src="./node_modules/jquery/dist/jquery.js"></script>

    <script src="./node_modules/bootstrap/dist/js/bootstrap.js"></script>

   <script src="./node_modules/bootstrap-select/dist/js/bootstrap-select.js"></script>
    <script src="./node_modules/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.js"></script>


    <script src="./node_modules/select2/dist/js/select2.js"></script>
    <script src="./node_modules/chosen-js/chosen.jquery.js"></script>

    <!-- include ace.js -->
    <script src="./dist/js/ace.js"></script>

   <style type="text/css">
       .scrollme {
    overflow-x: auto;
}
.file {
  visibility: hidden;
  position: absolute;
}
.file2 {
  visibility: hidden;
  position: absolute;
}
   </style>
  </head>
  <body>
<div class="container my-4">
    <h1>Bootstrap File Input Examples
        <small><a href="https://github.com/kartik-v/bootstrap-fileinput-samples"><i
                class="glyphicon glyphicon-download"></i> Download Sample Files</a></small>
    </h1>
    <hr>
    <form enctype="multipart/form-data">
        <div class="file-loading">
            <input id="kv-explorer" type="file" multiple>
        </div>
        <br>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-outline-secondary">Reset</button>
    </form>
    
</div>
</body>
<script>
    $('#file-fr').fileinput({
        theme: 'fas',
        language: 'fr',
        uploadUrl: '#',
        allowedFileExtensions: ['jpg', 'png', 'gif']
    });
    $('#file-es').fileinput({
        theme: 'fas',
        language: 'es',
        uploadUrl: '#',
        allowedFileExtensions: ['jpg', 'png', 'gif']
    });
    $("#file-0").fileinput({
        theme: 'fas',
        uploadUrl: '#'
    }).on('filepreupload', function(event, data, previewId, index) {
        alert('The description entered is:\n\n' + ($('#description').val() || ' NULL'));
    });
    $("#file-1").fileinput({
        theme: 'fas',
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 10,
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    /*
     $(".file").on('fileselect', function(event, n, l) {
     alert('File Selected. Name: ' + l + ', Num: ' + n);
     });
     */
    $("#file-3").fileinput({
        theme: 'fas',
        showUpload: false,
        showCaption: false,
        browseClass: "btn btn-primary btn-lg",
        fileType: "any",
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        overwriteInitial: false,
        initialPreviewAsData: true,
        initialPreview: [
            "http://lorempixel.com/1920/1080/transport/1",
            "http://lorempixel.com/1920/1080/transport/2",
            "http://lorempixel.com/1920/1080/transport/3"
        ],
        initialPreviewConfig: [
            {caption: "transport-1.jpg", size: 329892, width: "120px", url: "{$url}", key: 1},
            {caption: "transport-2.jpg", size: 872378, width: "120px", url: "{$url}", key: 2},
            {caption: "transport-3.jpg", size: 632762, width: "120px", url: "{$url}", key: 3}
        ]
    });
    $("#file-4").fileinput({
        theme: 'fas',
        uploadExtraData: {kvId: '10'}
    });
    $(".btn-warning").on('click', function () {
        var $el = $("#file-4");
        if ($el.attr('disabled')) {
            $el.fileinput('enable');
        } else {
            $el.fileinput('disable');
        }
    });
    $(".btn-info").on('click', function () {
        $("#file-4").fileinput('refresh', {previewClass: 'bg-info'});
    });
    /*
     $('#file-4').on('fileselectnone', function() {
     alert('Huh! You selected no files.');
     });
     $('#file-4').on('filebrowse', function() {
     alert('File browse clicked for #file-4');
     });
     */
    $(document).ready(function () {
        $("#test-upload").fileinput({
            'theme': 'fas',
            'showPreview': false,
            'allowedFileExtensions': ['jpg', 'png', 'gif'],
            'elErrorContainer': '#errorBlock'
        });
        $("#kv-explorer").fileinput({
            'theme': 'explorer-fas',
            'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
        });
        /*
         $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
         alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
         });
         */
    });
</script>
</html>