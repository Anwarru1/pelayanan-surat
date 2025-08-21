@if(isset($fileUrl))
    <h4>Pratinjau Dokumen</h4>
    <iframe 
        src="https://docs.google.com/viewer?url={{ urlencode($fileUrl) }}&embedded=true" 
        style="width:100%; height:600px;" 
        frameborder="0">
    </iframe>
@endif
