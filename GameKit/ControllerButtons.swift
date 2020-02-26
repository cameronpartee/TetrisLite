import SwiftUI

struct ControllerButtons: View {
    // binding degree to ControllerButtons
    // bindings have no value, think protocol
    @Binding var degree: Double
    var body: some View {
        // hstack no zstack
        HStack {
            // button with action
            Button(action: {
                self.degree += 90
            }) {
                Text("Left")
                    .font(.system(size: 18))
                    .frame(width: 60, height: 44)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }
            Button(action: {
                self.degree -= 90
            }) {
                Text("Right")
                    .font(.system(size: 18))
                    .frame(width: 62, height: 44)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }
        }
        .padding()
        .border(Color.black, width: 6)
    }
}

struct ControllerButtons_Previews: PreviewProvider {
    static var previews: some View {
        // public signature
        // have to use .constant with binding
        ControllerButtons(degree: .constant(90))
    }
}
