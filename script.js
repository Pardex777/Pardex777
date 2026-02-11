const questionForm = document.getElementById('questionForm');
const questionStatus = document.getElementById('questionStatus');
const faqList = document.getElementById('faqList');

questionForm?.addEventListener('submit', (event) => {
  event.preventDefault();

  const name = document.getElementById('studentName')?.value.trim();
  const question = document.getElementById('studentQuestion')?.value.trim();

  if (!name || !question) {
    questionStatus.textContent = 'Preencha nome e pergunta para enviar.';
    return;
  }

  const details = document.createElement('details');
  const summary = document.createElement('summary');
  const answer = document.createElement('p');

  summary.textContent = `${name} pergunta: ${question}`;
  answer.textContent = 'Recebida! Em breve vamos publicar a resposta oficial neste bloco.';

  details.append(summary, answer);
  faqList.appendChild(details);

  questionStatus.textContent = 'Pergunta enviada com sucesso!';
  questionForm.reset();
});

const feedbackForm = document.getElementById('feedbackForm');
const feedbackStatus = document.getElementById('feedbackStatus');
const feedbackList = document.getElementById('feedbackList');
const feedbackTypeInput = document.getElementById('feedbackType');
const feedbackButtons = document.querySelectorAll('[data-type]');

feedbackButtons.forEach((button) => {
  button.addEventListener('click', () => {
    feedbackButtons.forEach((item) => item.classList.remove('active'));
    button.classList.add('active');
    feedbackTypeInput.value = button.dataset.type;
  });
});

feedbackForm?.addEventListener('submit', (event) => {
  event.preventDefault();

  const name = document.getElementById('feedbackName')?.value.trim();
  const message = document.getElementById('feedbackMessage')?.value.trim();
  const type = feedbackTypeInput.value;

  if (!name || !message || !type) {
    feedbackStatus.textContent = 'Preencha tudo e selecione feedback positivo ou negativo.';
    return;
  }

  const card = document.createElement('article');
  card.className = 'feedback-item';

  const badge = document.createElement('span');
  badge.className = `badge badge--${type}`;
  badge.textContent = type === 'positivo' ? '👍 Feedback positivo' : '👎 Feedback negativo';

  const author = document.createElement('strong');
  author.textContent = name;

  const text = document.createElement('p');
  text.textContent = message;

  card.append(badge, author, text);
  feedbackList.prepend(card);

  feedbackStatus.textContent = 'Feedback publicado com sucesso!';
  feedbackForm.reset();
  feedbackTypeInput.value = '';
  feedbackButtons.forEach((item) => item.classList.remove('active'));
});
