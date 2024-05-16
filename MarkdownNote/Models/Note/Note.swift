//
//  Note.swift
//  MarkdownNote
//
//  Created by Home on 15/5/2024.
//

import SwiftUI
//Note model and sample notes

struct Note: Identifiable {
    var id = UUID().uuidString
    var note: String
    var date: Date
    var cardColor: Color
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


var notes: [Note] = [
    Note(note: "What, if some day or night a demon were to steal after you into your loneliest loneliness and say to you: 'This life as you now live it and have lived it, you will have to live once more and innumerable times more; and there will be nothing new in it, but every pain and every joy and every thought and sigh and everything unutterably small or great in your life will have to return to you, all in the same succession and sequence—even this spider and this moonlight between the trees, and even this moment and I myself. The eternal hourglass of existence is turned upside down again and again, and you with it, speck of dust!' Would you not throw yourself down and gnash your teeth and curse the demon who spoke thus? Or have you once experienced a tremendous moment when you would have answered him: 'You are a god and never have I heard anything more divine.' If this thought gained possession of you, it would change you as you are, or perhaps crush you. The question in each and every thing, 'Do you desire this once more and innumerable times more?' would lie upon your actions as the greatest weight! Or how well disposed would you have to become to yourself and to life to crave nothing more fervently than this ultimate eternal confirmation and seal?",
         date: getSampleDate(offset: 1),
         cardColor: Color(.blue)),
    Note(note: "I am alone, utterly alone. I am neither happy nor unhappy; I lie suspended like a hair or a grain of dust. I see no end to my unhappiness. I am weak. God gave me a heart that trembles and shivers at everything. In my cowardice, I do not dare to be happy.",
         date: getSampleDate(offset: -10),
         cardColor: Color(.green)),
    Note(note: "How can we expect righteousness to prevail when there is hardly anyone willing to give himself up individually to a righteous cause? Such a fine, sunny day, and I have to go, but what does my death matter, if through us, thousands of people are awakened and stirred to action?",
         date: getSampleDate(offset: 10),
         cardColor: Color(.orange)),
    Note(note: "Freedom, dignity, and respect for all people.",
         date: getSampleDate(offset: -15),
         cardColor: Color(.purple)),
    Note(note: "I am Cyrus, king of the world, great king, mighty king, king of Babylon, king of the land of Sumer and Akkad, king of the four quarters, son of Cambyses, great king, king of Anshan, grandson of Cyrus, great king, king of Anshan, descendant of Teispes, great king, king of Anshan, of a family which always exercised kingship; whose rule Bel and Nabu love, whom they want as king to please their hearts.",
         date: getSampleDate(offset: -3),
         cardColor: Color(.skin))

]
