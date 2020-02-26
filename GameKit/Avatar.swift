import SwiftUI

struct Avatar: View {
    // binding degree to Avatar
    // bindings have no value, think protocol
    @Binding var degree: Double
    
    // exposed vars
    var x1 : Double
    var x2 : Double
    var x3 : Double
    var y1 : Double
    var y2 : Double
    var y3 : Double
    var shapeColor : Color
    
    var body: some View {
        // zstack
        ZStack {
            // draw a shape
            Path { path in
                path.move(to: CGPoint(x: x1, y: y1))
                path.addLine(to: CGPoint(x: x2, y: y2))
                path.addLine(to: CGPoint(x: x3, y: y3))
            }
            .fill(shapeColor)
            .onTapGesture {
                self.degree += 90
            }
        }
        .frame(width: 100, height: 80)
        .animation(.easeInOut(duration: 0.2))
        .rotationEffect(Angle(degrees: degree))
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            // public signature
            Avatar(degree: .constant(0), x1: 90, x2: 90, x3: 0, y1: 0, y2: 80, y3: 80, shapeColor: Color.blue)
        }
    }
}
