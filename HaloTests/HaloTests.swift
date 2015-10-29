//
//  HaloTests.swift
//  HaloTests
//
//  Created by 王策 on 15/10/6.
//  Copyright © 2015年 WangCe. All rights reserved.
//

import XCTest
import Halo

class HaloTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testPrint() {
		
        let a             = "哈哈"
        let b             = "测试通过了"

        let normalResult  = "\(a) \(b)"
        let successResult = "✅ \(normalResult)"
        let warningResult = "⚠️ \(normalResult)"
        let errorResult   = "❌ \(normalResult)"
		

		XCTAssertEqual([a,b].halo_appendFirst(nil).halo_stringValue, normalResult)
		cc(a,b)
		
		XCTAssertEqual([a,b].halo_appendFirst("✅").halo_stringValue, successResult)
		ccRight(a,b)
		
		XCTAssertEqual([a,b].halo_appendFirst("⚠️").halo_stringValue, warningResult)
		ccWarning(a,b)
		
		XCTAssertEqual([a,b].halo_appendFirst("❌").halo_stringValue, errorResult)
		ccError(a,b)
		
	}    
}
