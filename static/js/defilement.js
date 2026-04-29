document.addEventListener('DOMContentLoaded', () => {
    const links = document.querySelectorAll('a[href^="#"]');

    links.forEach(link => {
        link.onclick = function (e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            const targetSection = document.querySelector(targetId);

            if (targetSection) {
                // On récupère la position de la section par rapport au haut de la page
                const elementPosition = targetSection.getBoundingClientRect().top;
                // On définit la marge (hauteur de ton header + un peu d'espace)
                const offset = 50; 
                // On calcule la position finale
                const offsetPosition = elementPosition + window.pageYOffset - offset;
                // On utilise window.scrollTo au lieu de scrollIntoView pour plus de précision
                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth"
                });
            }
        };
    });
});
