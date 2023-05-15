var update_basket = document.getElementsByClassName("update-basket")

for (var index = 0; index < update_basket.length; index++){
    update_basket[index].addEventListener("click", function(){
        var item_id = this.dataset.item
        var item_action = this.dataset.action
        console.log("Item ID:", item_id, "Item Action:", item_action)
        console.log("User:", user)

        if (user != "AnonymousUser") {
            UserItemRendition(item_id, item_action)

        } else {
            alert("Please register or access herein the emporium!")
        } 
    })
}

function CookieItemSummation(item_id, item_action) {
    console.log("The user did not registered herein.")

    if (item_action == "append") {
        if (basket[item_id] == undefined) {
            basket[item_id] = {"purchase_amount" :1}

        } else {
            basket[item_id] ["purchase_amount"] += 1

        }
    }
    if (item_action == "banish") {
        basket[item_id] ["purchase_amount"] -= 1

        if (basket[item_id] ["purchase_amount"] <= 0){
            console.log("The item will be banished away herein.")
            delete basket[item_id]

        }
    }
    console.log("Basket:", basket)
    document.cookie = "basket =" + JSON.stringify(basket) + ";domain = ;path = /"
    location.reload()
}

function UserItemRendition(item_id, item_action) {
    console.log("The user registered herein. So, the emporium network will dispatch information now!")

    var url = "/rendition/"
    fetch(url, {
        method: "POST",
        headers:{
            "Content-Type" :"application/json",
            "X-CSRFToken" :csrftoken,
        },
        body: JSON.stringify({"item_id" :item_id, "item_action" :item_action})

    })
    .then((response) => {
        return response.json() 

    })
    .then((information) => {
        console.log("Information:", information)
        location.reload()

    })
}