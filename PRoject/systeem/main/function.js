function verwerkVoornaam(nummer, artikelnummer) {


    var lijst = new Array();
    //var binnen = document.getElementById("kassa_keypad");

    var buiten = document.getElementById("kassa_input");
    if (nummer == "verwijder") {
        result = buiten.value.slice(0, -1);
        buiten.value = "";

    } else if (nummer == 'enter') {
        //buiten.value = "";
        result = "";
    }
    else if (nummer == 'enter') {

        //buiten.value = "";
        result = "";
    } else {

        result = nummer;
    }

    //alert(nummer);
    buiten.value += result;
    binnen.focus();

    //location.reload();

}

