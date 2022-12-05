//
//  MainContentView.swift
//  DefaultImage
//
//  Created by Иван Тарасенко on 02.12.2022.
//

import UIKit

protocol MainContentViewProtocol: AnyObject {}

final class MainContentView: UIView, MainContentViewProtocol {

    var saveSegment: SaveSegmentProtorol = SaveSegment()
    var model: ThemeProtocol = Theme()

    let imageView = UIImageView()

    private let segmentedController = UISegmentedControl(items: ["", "", ""]).apply {
        $0.setTitle(R.Title.system, forSegmentAt: 0)
        $0.setTitle(R.Title.light, forSegmentAt: 1)
        $0.setTitle(R.Title.dark, forSegmentAt: 2)
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 8
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        configereView()
        makeConstraints()
        addTarget()
        setSavedSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func segmentPressed(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            saveSegment.segment = sender.selectedSegmentIndex
            setSystemTheme()
        case 1:
            saveSegment.segment = sender.selectedSegmentIndex
            setLightTheme()
        case 2:
            saveSegment.segment = sender.selectedSegmentIndex
            setDarkTheme()
        default:
            break
        }
    }
}

private extension MainContentView {



    func configereView() {
        backgroundColor = .white
        addSubview(segmentedController)
        addSubview(imageView)
    }

    func addTarget() {
        segmentedController.addTarget(self, action: #selector(segmentPressed(sender: )), for: .valueChanged)
    }

    func setSystemTheme() {
        backgroundColor = model.systemTheme.background
        imageView.image = model.systemTheme.image
        segmentedController.backgroundColor = R.Color.Syslem.controller
        segmentedController.selectedSegmentTintColor = R.Color.Syslem.swicher
        segmentedController.setTitleTextAttributes(model.setAtrebutesTitleColor(color: R.Color.Syslem.textColor!), for: .normal)
    }

    func setLightTheme() {
        backgroundColor = model.lightTheme.background
        imageView.image = model.lightTheme.image
        segmentedController.backgroundColor = R.Color.Light.controller
        segmentedController.selectedSegmentTintColor = R.Color.Light.swicher
        segmentedController.setTitleTextAttributes(model.setAtrebutesTitleColor(color: R.Color.Light.textColor!), for: .normal)
    }

    func setDarkTheme() {
        backgroundColor = model.darkTheme.background
        imageView.image = model.darkTheme.image
        segmentedController.backgroundColor = R.Color.Dark.controller
        segmentedController.selectedSegmentTintColor = R.Color.Dark.swicher
        segmentedController.setTitleTextAttributes(model.setAtrebutesTitleColor(color: R.Color.Dark.textColor!), for: .normal)
    }

    func setSavedSettings() {
        segmentedController.selectedSegmentIndex = saveSegment.segment ?? 0
        switch segmentedController.selectedSegmentIndex {
        case 0:
            setSystemTheme()
        case 1:
            setLightTheme()
        case 2:
            setDarkTheme()
        default:
            break
        }
    }

    func makeConstraints() {
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentedController.widthAnchor.constraint(equalToConstant: 220),
            segmentedController.heightAnchor.constraint(equalToConstant: 35),
            segmentedController.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            segmentedController.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),

            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: segmentedController.topAnchor, constant: 100)
        ])
    }
}


// MARK: - PreviewProvider
#if DEBUG
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct Representable: UIViewRepresentable {
    let view: UIView

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}


@available(iOS 13.0, *)
struct DicesViewRepresentablePreview: PreviewProvider {
    static var previews: some View {
        Representable(view: MainContentView(frame: .zero))

            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .center
            )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
    }
}
#endif
#endif

