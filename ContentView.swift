import SwiftUI

struct ContentView: View {
    @State private var display: String = "0"

    let buttonSpacing: CGFloat = 12
    let buttonSize: CGFloat = 64

    var body: some View {
        VStack(spacing: 16) {
            // Display area
            HStack {
                Spacer()
                Text(display)
                    .font(.system(size: 48, weight: .light))
                    .foregroundColor(.white)
                    .padding(.trailing, 16)
            }
            .frame(height: 80)
            .padding(.top, 16)

            // Button grid
            VStack(spacing: buttonSpacing) {
                CalculatorRow(buttons: [
                    .init(label: "AC", color: .gray),
                    .init(label: "+/-", color: .gray),
                    .init(label: "%", color: .gray),
                    .init(label: "÷", color: .orange, foreground: .white)
                ], buttonSize: buttonSize, spacing: buttonSpacing)

                CalculatorRow(buttons: [
                    .init(label: "7"),
                    .init(label: "8"),
                    .init(label: "9"),
                    .init(label: "×", color: .orange, foreground: .white)
                ], buttonSize: buttonSize, spacing: buttonSpacing)

                CalculatorRow(buttons: [
                    .init(label: "4"),
                    .init(label: "5"),
                    .init(label: "6"),
                    .init(label: "-", color: .orange, foreground: .white)
                ], buttonSize: buttonSize, spacing: buttonSpacing)

                CalculatorRow(buttons: [
                    .init(label: "1"),
                    .init(label: "2"),
                    .init(label: "3"),
                    .init(label: "+", color: .orange, foreground: .white)
                ], buttonSize: buttonSize, spacing: buttonSpacing)

                CalculatorRow(buttons: [
                    .init(systemImage: "calculator", color: .gray),
                    .init(label: "0"),
                    .init(label: "."),
                    .init(label: "=", color: .orange, foreground: .white)
                ], buttonSize: buttonSize, spacing: buttonSpacing)
            }
            .padding(.bottom, 16)

            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.black)
        .frame(minWidth: 320, minHeight: 480)
    }
}

struct CalculatorRow: View {
    let buttons: [CalculatorButtonConfig]
    let buttonSize: CGFloat
    let spacing: CGFloat

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(buttons) { config in
                CalculatorButton(config: config, size: buttonSize)
            }
        }
    }
}

struct CalculatorButtonConfig: Identifiable {
    let id = UUID()
    var label: String? = nil
    var systemImage: String? = nil
    var color: Color = Color(.darkGray)
    var foreground: Color = .white
}

struct CalculatorButton: View {
    let config: CalculatorButtonConfig
    let size: CGFloat

    var body: some View {
        Button(action: {
            // Action goes here
        }) {
            if let label = config.label {
                Text(label)
                    .font(.system(size: 28))
                    .frame(width: size, height: size)
                    .background(config.color)
                    .foregroundColor(config.foreground)
                    .clipShape(Circle())
            } else if let systemImage = config.systemImage {
                Image(systemName: systemImage)
                    .font(.system(size: 28))
                    .frame(width: size, height: size)
                    .background(config.color)
                    .foregroundColor(config.foreground)
                    .clipShape(Circle())
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
