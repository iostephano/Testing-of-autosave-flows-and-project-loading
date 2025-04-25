// ProjectPersistence.swift
// Testing of autosave flows and project loading
//
// Created by Stephano Portella on 25/04/25.

import Foundation

struct ProjectPersistence {

    static func save(_ project: ProjectModel, timestamp: Date) {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        print("Autosaved '\(project.name)' at \(formatter.string(from: timestamp))")

        let url = getURL()
        do {
            let data = try JSONEncoder().encode(project)
            try data.write(to: url)
        } catch {
            print("Save error:", error)
        }
    }

    static func load() -> ProjectModel? {
        let url = getURL()
        guard let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(ProjectModel.self, from: data)
    }

    private static func getURL() -> URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent("autosave.json")
    }
}
