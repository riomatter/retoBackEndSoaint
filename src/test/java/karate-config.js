function fn() {
  var config = {
    apiUrl: 'https://serverest.dev/',
    email: 'suso@qa.com.br',
    password: 'teste'
  };
  karate.log('Loaded karate-config.js successfully');
  return config;
}
