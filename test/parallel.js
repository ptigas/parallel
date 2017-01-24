contract('Parallel', function(accounts) {
  it("claim some land", function() {
    var parallel = Parallel.deployed();

    var threw = false;
    return parallel.claimLand("abcde1").then(function() {
		return parallel.claimLand("abcde2");
	}).then(function(txid) {
      var tx = web3.eth.getTransaction(txid);
      var txr = web3.eth.getTransactionReceipt(txid);
      if (txr.gasUsed === tx.gas) throw new Error("all gas used");
    }).catch(function(e) {		
		threw = true;
	}).then(function() {
		assert.equal(threw, false, "Should not have thrown an exception");
	})
  });  

  it("claim some land conflict", function() {
    var parallel = Parallel.deployed();

    var threw = false;
    return parallel.claimLand("abcdet").then(function() {
		return parallel.claimLand("abcdet");
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