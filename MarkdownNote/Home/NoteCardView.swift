//
//  NoteCardView.swift
//  MarkdownNote
//
//  Created by Home on 17/5/2024.
//

import SwiftUI

struct NoteCardView: View {
    
    var note: Note
    
    var body: some View {
        VStack {
            
            previewText
            
            HStack {
                noteModifyDate
                
                Spacer(minLength: 0)
                
                editButton
            }
            .padding(.top, 55)
        }
        .padding()
        .background(note.cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    NoteCardView(note: notes[0])
}

extension NoteCardView {
    private var previewText: some View {
        Text(note.note)
            .font(Device.hasMacOS ? .title3 : .body)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var editButton: some View {
        Button(action: {}) {
            Image(systemName: "pencil")
                .font(.system(size: 15, weight: .bold))
                .padding(8)
                .foregroundStyle(.white)
                .background(Color(.black))
                .clipShape(Circle())
        }
    }
    private var noteModifyDate: some View {
        Text(note.date, style: .date)
            .foregroundStyle(.black)
            .opacity(0.8)
    }
}
