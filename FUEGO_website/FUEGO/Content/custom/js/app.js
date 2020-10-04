const uploadBTN = document.querySelector('#Upload') ; 
const ShowBTN = document.querySelector('#ShowBTN') ; 
const inputUpload = document.querySelector('#inputUpload') ; 



//to generate random numbers between a range 

function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
  }

  
//uploadBTN.addEventListener("click", function(){ alert("Hello World!"); });
ShowBTN.addEventListener("click", function(){
    
    //map.center = [24.3773, 44.4539] ;
    
    alert("Generate New Location!"); 
      //my access token
      mapboxgl.accessToken = 'pk.eyJ1IjoiemF5MG9kIiwiYSI6ImNrZmxkb2UxbjAwbjEycWxobmRland0M24ifQ.u386aSYmGwClias706QDIg';
      //map object to use the map
      var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        zoom: 9,
        center: [getRandomArbitrary(20.333 , 56.433), getRandomArbitrary(10.333 , 46.433)]
      });


      // Add zoom and rotation controls to the map.
        map.addControl(new mapboxgl.NavigationControl());




});




  //to hide the ugle upload input
  uploadBTN.addEventListener("click", function (e) {
  
    if (inputUpload) {
       // console.log(inputUpload)
      inputUpload.click();
    }
  });


inputUpload.addEventListener("change", function(){ 

    //this load the array of files we have and then display them in the console log
    const fileList = this.files; 
    //console.log(fileList)
    alert(`You're ${fileList.length} files are successfully uploaded`);

});



