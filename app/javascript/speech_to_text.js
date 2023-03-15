const audioInput = document.getElementById('audioInput');
const convertButton = document.getElementById('convertButton');
const resultDiv = document.getElementById('result');

convertButton.addEventListener('click', () => {
  const audioFile = audioInput.files[0];

  if (!audioFile) {
    alert('音声ファイルを選択してください。');
    return;
  }

  const formData = new FormData();
  formData.append('audioFile', audioFile);

  fetch('/speech_to_text/convert', {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .then(data => {
    resultDiv.innerHTML = data.result;
  })
  .catch(error => {
    console.error(error);
    resultDiv.innerHTML = 'エラーが発生しました。';
  });
});