function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiURL: 'https://conduit.productionready.io/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'karate@ytdf.com'
    config.userPassword = 'karate123'
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }

  var accessToken = karate.callSingle('classpath:conduitApp/helpers/createToken.feature',config).authToken
  
  karate.configure('headers',{Authorization: 'Token '+ accessToken})

  return config;
}