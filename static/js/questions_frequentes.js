
document.querySelectorAll('.faq-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const content = btn.nextElementSibling;
        const icon = btn.querySelector('span');
        content.classList.toggle('hidden');
        icon.textContent = content.classList.contains('hidden') ? '+' : '−';
    });
});