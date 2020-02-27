import SwiftUI
import AVFoundation

/*
 *GAME LOGIC NOTE*
 if I wanted to match it to a sequence I would have a function
 inside of the the struct and outside the body that would take
 in some kind of structure and match it to another structure
 */

struct ContentView: View {
    // changeable degree state that binds degree to Avatar
    // state have value bc we are changing the value
    @State var shapeOne: Double = 0
    @State var shapeTwo: Double = 0
    @State var shapeThree: Double = 0
    @State var timeRemaining = 10
    @State var timerIsRunning = true
    
    let audioPlayer = AVPlayer()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Play sound helper method.
    func playSound(filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "") else { return }
        
        let playerItem = AVPlayerItem(url: url)
        audioPlayer.replaceCurrentItem(with: playerItem)
        audioPlayer.play()
    }
    
    var body: some View {
        // using geometryReader
        GeometryReader { geometry in
            Text("Score: \(self.timeRemaining)")
                .font(.system(size: 30))
                .foregroundColor(Color.black)
                .padding(.top, 20).padding(.leading, 270)
            
            // when the game is over play the buzzer sounds
            if self.timeRemaining == 0  {
                //playSound(filename: "buzz.wav")
            }
            
            // zstack instead of vstack or hstack
            ZStack {
                // instantiate a gameboard
                // from this level we are passing data back
                GameBoard(shapeOne: self.$shapeOne, shapeTwo: self.$shapeTwo, shapeThree: self.$shapeThree)
            }
        }
        .onReceive(timer) { _ in
            // Block gets called when timer updates.
            if self.timeRemaining > 0 && self.timerIsRunning {
                self.timeRemaining -= 1
                
                print("Time Remaining:", self.timeRemaining)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
