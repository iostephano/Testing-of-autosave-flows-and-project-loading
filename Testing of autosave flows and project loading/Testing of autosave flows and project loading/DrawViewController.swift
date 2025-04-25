// DrawViewController.swift
// Testing of autosave flows and project loading
//
// Created by Stephano Portella on 25/04/25.

import UIKit

final class DrawViewController: UIViewController {

    private var saveCount = 0
    private let project = ProjectModel(name: "My Project")
    private let statusLabel = UILabel()
    private var autosaveTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBlue

        // Configure label
        statusLabel.textColor = .white
        statusLabel.font = .boldSystemFont(ofSize: 24)
        statusLabel.textAlignment = .center
        statusLabel.text = "Autosave Flow Ready!"
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusLabel)

        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        // Start autosave simulation
        autosaveTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.simulateAutosave()
        }
    }

    private func simulateAutosave() {
        saveCount += 1
        let timestamp = Date()
        ProjectPersistence.save(project, timestamp: timestamp)

        // Update label text
        statusLabel.text = "Saved '\(project.name)' · \(saveCount) times"

        // Add green pulse animation
        let pulseView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        pulseView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2 - 80)
        pulseView.layer.cornerRadius = 15
        pulseView.backgroundColor = UIColor.systemGreen
        pulseView.alpha = 0.0
        view.addSubview(pulseView)

        UIView.animate(withDuration: 0.5, animations: {
            pulseView.alpha = 0.8
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                pulseView.alpha = 0.0
            }, completion: { _ in
                pulseView.removeFromSuperview()
            })
        }
    }

    deinit {
        autosaveTimer?.invalidate()
    }
}
