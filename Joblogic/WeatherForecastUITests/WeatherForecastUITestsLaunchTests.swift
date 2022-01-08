//
//  WeatherForecastUITestsLaunchTests.swift
//  WeatherForecastUITests
//
//  Created by Hoang Le on 21/12/2021.
//  Copyright © 2021 Raghav Vashisht. All rights reserved.
//

import XCTest

class WeatherForecastUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
