contract('Parallel', function(accounts) {

    describe("Bytes7 to Bytes8", function() {        
        it("tests Byte7 convertion of 8 chars string", function() {            
            var parallel = Parallel.deployed();
            return parallel.toBytes7.call("abcdefg").then(function(a) {
                return parallel.toBytes7.call("abcdefgh").then(function(b) {
                    console.log(a);
                    console.log(b);
                    assert(a === b);
                });
            });
        });

        it("tests validation of non 0-9a-z chars", function() {
            var parallel = Parallel.deployed();
            var threw = false;
            return parallel.validate.call("abcde=1").catch(function(e) {        
                threw = true;
            }).then(function() {
                assert.equal(threw, true, "Should have thrown an exception");
            })
        });
    });    

    it("check hashes", function() {
        var parallel = Parallel.deployed();
        return parallel.claimLand("asdfghj").then(function() {
            return parallel.claimLand("qwertyu").then(function() {
                return parallel.getHashes.call().then(function(hashes) {
                    return parallel.toBytes7.call("asdfghj").then(function(a) {
                        return parallel.toBytes7.call("qwertyu").then(function(b) {
                            assert.equal(a, hashes[0]);
                            assert.equal(b, hashes[1]);
                        });
                    });
                });
            });
        });
    });

    it("claim some land", function() {
        var parallel = Parallel.deployed();

        var threw = false;
        return parallel.claimLand("abcdef1").then(function(a) {
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
