//
//  TextFieldView.swift
//  landmarks
//
//  Created by Ashutosh Narang on 04/02/23.
//

import SwiftUI

struct TextFieldView: View {
    @State private var messageData = MessageState()
    @State private var inputText = ""
    @State private var responseText = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Enter text", text: $inputText)
                    .padding()
                    .border(.blue)
                Button(action: {
                    responseText = "Waiting for response ..."
                    self.messageData.callGPT(prompt: inputText) { (result) -> () in
                            switch result {
                            case .success(let data):
                                print(data)
                                responseText = data
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }) {
                    Text("Submit")
                            .padding()
                  }
            }
            .padding()
            Text(responseText)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
