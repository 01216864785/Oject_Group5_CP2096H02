$(document).ready(() => {
    $('#hamburger-menu').click(() => {
        $('#hamburger-menu').toggleClass('active')
        $('#nav-menu').toggleClass('active')
    })


    /// play music
    $('.btn-play').on('click',function(e){
        e.preventDefault();
        var src = $(this).attr('data-src');
        $("#music_src").attr('src',src);
        $(".audioplayer").remove();
        var audio= document.createElement('AUDIO');
        audio.setAttribute('controls', true);
        var source = document.createElement('source');
        source.src = src;
        audio.appendChild(source)
        $('.player-control_center').append(audio);
        $( function() { $( 'audio' ).audioPlayer(); } );
    });

    // like song
    $('.like-song').on('click',function(e){
        e.preventDefault();
        if($(this).find("i").hasClass("bx-heart")){
            $(this).find("i").removeClass("bx-heart").addClass("bxs-heart red");
        }
        else{
            $(this).find("i").removeClass("bxs-heart red").addClass("bx-heart");
        }
    });

    // setting owl carousel

    let navText = ["<i class='bx bx-chevron-left'></i>", "<i class='bx bx-chevron-right'></i>"]

    $('#hero-carousel').owlCarousel({
        items: 1,
        dots: false,
        loop: true,
        nav:true,
        navText: navText,
        autoplay: true,
        autoplayHoverPause: true
    })

    $('.movies-slide').owlCarousel({
        items: 2,
        dots: false,
        nav:true,
        navText: navText,
        margin: 15,
        responsive: {
            500: {
                items: 2
            },
            1280: {
                items: 5
            },
            1600: {
                items: 6
            }
        }
    })
})