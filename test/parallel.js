contract('Parallel', function(accounts) {
  it("to bytes 7", function() {
    var parallel = Parallel.deployed();
    return parallel.toBytes7.call("abcdefg").then(function(a) {
      return parallel.toBytes7.call("abcdefgh").then(function(b) {
        assert.equal(a, b);
      });
    });
  });

  it("claim some land", function() {
    var parallel = Parallel.deployed();

    var threw = false;
    return parallel.claimLand("abcdef1").then(function() {
		return parallel.claimLand("abcdef2");
	}).then(function(txid) {
      var tx = web3.eth.getTransaction(txid);
      var txr = web3.eth.getTransactionReceipt(txid);
      if (txr.gasUsed === tx.gas) throw new Error("all gas used");
    }).catch(function(e) {		
		threw = true;
    console.log(e);
	}).then(function() {
		assert.equal(threw, false, "Should not have thrown an exception");
	})
  });  

  it("claim some land conflict", function() {
    var parallel = Parallel.deployed();

    var threw = false;
    return parallel.claimLand("abcdeft").then(function() {
		return parallel.claimLand("abcdeft");
	}).then(function(txid) {
      var tx = web3.eth.getTransaction(txid);
      var txr = web3.eth.getTransactionReceipt(txid);
      if (txr.gasUsed === tx.gas) throw new Error("all gas used");
    }).catch(function(e) {		
		threw = true;
	}).then(function() {
		assert.equal(threw, true, "Should have thrown an exception");
	})
  });  
});