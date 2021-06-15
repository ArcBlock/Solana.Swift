import XCTest
@testable import Solana

class TokenProgramTests: XCTestCase {
    let publicKey = try! Solana.PublicKey(string: "11111111111111111111111111111111")
    
    func testInitializeAccountInstruction() throws {
        let instruction = Solana.TokenProgram.initializeAccountInstruction(account: publicKey, mint: publicKey, owner: publicKey)
        XCTAssertEqual("2", Base58.encode(instruction.data))
    }
    
    func testTransferInstruction() throws {
        let instruction = Solana.TokenProgram.transferInstruction(tokenProgramId: publicKey, source: publicKey, destination: publicKey, owner: publicKey, amount: 100)
        XCTAssertEqual("3WBgs5fm8oDy", Base58.encode(instruction.data))
    }
    
    func testApproveInstruction() throws {
        let instruction = Solana.TokenProgram.approveInstruction(tokenProgramId: publicKey, account: publicKey, delegate: publicKey, owner: publicKey, amount: 1000)
        XCTAssertEqual("4d5tSvUuzUVM", Base58.encode(instruction.data))
    }
    
    func testMintToInstruction() throws {
        let instruction = Solana.TokenProgram.mintToInstruction(tokenProgramId: publicKey, mint: publicKey, destination: publicKey, authority: publicKey, amount: 1000000000)
        XCTAssertEqual("6AsKhot84V8s", Base58.encode(instruction.data))
    }
    
    func testCloseAccountInstruction() throws {
        let instruction = Solana.TokenProgram.closeAccountInstruction(tokenProgramId: publicKey, account: publicKey, destination: publicKey, owner: publicKey)
        XCTAssertEqual("A", Base58.encode(instruction.data))
    }
}
