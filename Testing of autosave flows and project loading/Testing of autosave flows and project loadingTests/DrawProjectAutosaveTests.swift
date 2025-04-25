// DrawProjectAutosaveTests.swift
// Testing of autosave flows and project loading
//
// Created by Stephano Portella on 25/04/25.

import XCTest
@testable import Testing_of_autosave_flows_and_project_loading

final class DrawProjectAutosaveTests: XCTestCase {

    func testSaveAndLoadProject() {
        let project = ProjectModel(name: "Test Project")
        let now = Date()

        // Save the project
        ProjectPersistence.save(project, timestamp: now)

        // Load it back
        guard let loaded = ProjectPersistence.load() else {
            XCTFail("No project loaded")
            return
        }

        XCTAssertEqual(loaded.name, "Test Project", "Loaded project name should match the saved one")
    }
}
