//
//  MainContentView.swift
//  DefaultImage
//
//  Created by Иван Тарасенко on 02.12.2022.
//

import UIKit

protocol MainContentViewProtocol: AnyObject {}

final class MainContentView: UIView, MainContentViewProtocol {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let segmentedController = UISegmentedControl().apply {
        $0.backgroundColor = .blue
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        configereView()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   private func configereView() {
        backgroundColor = .white
       addSubview(segmentedController)
    }

    private func makeConstraints() {
        segmentedController.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentedController.widthAnchor.constraint(equalToConstant: 200),
            segmentedController.heightAnchor.constraint(equalToConstant: 60),
            segmentedController.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            segmentedController.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
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

