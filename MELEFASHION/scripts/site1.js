//let card = document.getElementById('card');
//let xmark = document.getElementById('Xmark');

//xmark.addEventListener('click', () => {
//    if (card.style.display === 'none') {
//        card.style.display = 'flex'; 
//    } else {
//        card.style.display = 'none'; 
//    }
//});
function toggleProfileCard() {
    const profileCard = document.getElementById("profile-card");
    if (profileCard.style.display === "none" || profileCard.style.display === "") {
        profileCard.style.display = "block";
    } else {
        profileCard.style.display = "none";
    }
}

// Optional: Hide the card when clicking outside
document.addEventListener("click", function (event) {
    const profileCard = document.getElementById("profile-card");
    const userProfile = document.getElementById("user-profile");
    if (profileCard && !profileCard.contains(event.target) && !userProfile.contains(event.target)) {
        profileCard.style.display = "none";
    }
});