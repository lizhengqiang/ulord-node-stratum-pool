var redis = require('redis');
var createClient = redis.createClient;

redis.createClient = function () {
    var client = createClient.apply(this, arguments);
    var multi = client.multi;
    var batch = client.batch;
    client.multi = function () {
        console.log(arguments[0], arguments.length)
        return (process.env.REDIS_BATCH == 'multi' ? multi : batch).apply(this, arguments)
    }
    return client;
}

module.exports = redis;