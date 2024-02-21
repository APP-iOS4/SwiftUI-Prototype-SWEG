//
//  BoardModel.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import Foundation
import SwiftUI

class BoardModel: Identifiable, ObservableObject {
    var id = UUID()
    @Published var content: String
    var title: String
    var date: Date
    var hits: Int
    
    init(content: String, title: String, date: Date, hits: Int) {
        id = UUID()
        self.content = content
        self.title = title
        self.date = Date.now
        self.hits = hits
    }

    class NoticeWriting: ObservableObject {
        @Published var list: [BoardModel]
        
        init() {
            list = [
                BoardModel(content: "정당의 설립은 자유이며 복수정당제는 보장된다 대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 위하여 필요한 사항에 관하여 대통령령을 발할 수 있다 대한민국의 경제질서는 개인과 기업의 경제상의 자유와 창의를 존중함을 기본으로 한다 대통령이 궐위되거나 사고로 인하여 직무를 수행할 수 없을 때에는 국무총리,법률이 정한 국무위원의 순서로 그 권한을 대행한다 국가는 모성의 보호를 위하여 노력하여야 한다. 위원은 정당에 가입하거나 정치에 관여할 수 없다. 형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다", title: "게시글 작성1", date: Date.now, hits: Int.random(in: 1...2000)),
                BoardModel(content: "사과 도서 아련 컴퓨터 사과 미리내 가온해 별빛 그루잠 다솜 우리는 별하 아름드리 가온누리 사과 안녕 옅구름 사과 별하 포도 가온누리 나비잠 소솜 감사합니다 소솜 이플 아련 바람꽃 곰다시 이플 곰다시 아슬라 감또개 예그리나 나비잠 여우별 가온누리 바나나 도서 사과 달볓 책방 달볓 달볓 바나나 감또개 나래 안녕 산들림 미리내.옅구름 함초롱하다 곰다시 옅구름 별빛 바나나 그루잠 나비잠 다솜 아슬라 미쁘다 로운 예그리나 예그리나 함초롱하다 아리아 옅구름 바나나 아름드리 미쁘다 우리는 감사합니다 아리아 아련 아리아 포도 이플 가온해 별빛 별빛 소록소록 아리아 달볓 늘품 산들림 예그리나 늘품 컴퓨터 우리는 포도 옅구름 노트북 여우비 노트북 도담도담 여우비 로운 비나리 사과 미쁘다.우리는 다솜 아리아 예그리나 감사합니다 아슬라 미리내 바람꽃 예그리나 아름드리 아리아 이플 책방 도르레 함초롱하다 도서관 소록소록 도담도담 우리는 나비잠 도르레 비나리 여우비 노트북 바람꽃 노트북 우리는 함초롱하다 우리는 아슬라 그루잠 미리내 옅구름 나비잠 미리내 책방 도서 다솜 도서관 여우비 별빛 소록소록 안녕 미쁘다 비나리 포도 안녕 바람꽃 도담도담 곰다시.", title: "게시글 작성2", date: Date.now.addingTimeInterval(3600 * -58), hits: Int.random(in: 1...2000)),
                BoardModel(content: "우리는 아리아 아름드리 가온누리 바람꽃 여우별 안녕 산들림 이플 바나나 다솜 산들림 아슬라 도서관 별빛 감사합니다 그루잠 늘품 우리는 도르레 함초롱하다 산들림 도서 소록소록 포도 여우별 늘품 바람꽃 바람꽃 도서관 아리아 아름드리 노트북 미리내 달볓 책방 포도 감사합니다 아슬라 소록소록 여우비 옅구름 로운 소솜 아슬라 나비잠 여우별 컴퓨터 가온해 다솜.책방 노트북 아슬라 아슬라 소록소록 도담도담 사과 소록소록 나래 바람꽃 아련 도서 산들림 소솜 함초롱하다 도르레 도담도담 별하 별하 나래 가온누리 여우비 함초롱하다 포도 곰다시 미쁘다 함초롱하다 가온누리 컴퓨터 다솜 이플 비나리 가온해 비나리 별하 소록소록 감사합니다 도서관 도르레 안녕 소록소록 여우비 로운 컴퓨터 나비잠 별하 별하 사과 별빛 가온누리. 가온누리 포도 책방 이플 감사합니다 우리는 여우별 도르레 이플 이플 가온해 별빛 감사합니다 노트북 가온누리 옅구름 책방 곰다시 미리내 함초롱하다 여우별 여우별 다솜 곰다시 사과 나비잠 사과 소솜 소솜 바람꽃 아리아 산들림 별하 책방 별빛 미리내 비나리 미리내 안녕 사과 가온누리 산들림 노트북 아련 감사합니다 그루잠 소록소록 예그리나 안녕 나비잠.", title: "게시글 작성3", date: Date.now.addingTimeInterval(3600 * -8), hits: Int.random(in: 1...2000)),
                BoardModel(content: "안녕 도서 별빛 포도 여우비 아리아 아련 도서관 로운 소솜 안녕 아슬라 여우별 나래 로운 소솜 아리아 비나리 감또개 가온누리 사과 소록소록 여우별 미쁘다 늘품 아련 안녕 소솜 우리는 안녕 바나나 달볓 이플 나래 늘품 함초롱하다 비나리 이플 미리내 여우비 바람꽃 도담도담 나래 다솜 함초롱하다 아름드리 바람꽃 비나리 별빛 책방. 나비잠 여우별 로운 나비잠 가온해 늘품 이플 가온해 소솜 책방 나비잠 바람꽃 도서관 안녕 노트북 아슬라 사과 감또개 바나나 도서관 여우비 소솜 별빛 로운 사과 컴퓨터 그루잠 로운 늘품 늘품 도르레 여우비 소솜 가온누리 그루잠 바람꽃 미리내 도서 바람꽃 곰다시 감사합니다 가온해 노트북 도서관 가온해 나비잠 포도 그루잠 아리아 늘품.", title: "게시글 작성4", date: Date.now.addingTimeInterval(3600 * -820),hits: Int.random(in: 1...2000)),
                BoardModel(content: "ice haze blossom lovesick kitten milky laptop marshmallow like melody haze heimish cherish charming laptop twilight honey ice cresent you aurora moonlight miracle melody milky you fascinating bijou haze lucid flora adolescence blossom bijou vanilla lucid kitten honey serendipity twilight carnival carnival cream girlish charming ice eunoia adorable serendipity aurora.laptop computer stella grapes adolescence droplet banana baby like you blush flora carnival lovable miracle baby requiem lucy bijou carnival computer flutter florence lucid lovable world lucid twinkle eunoia hello ideale aurora kitten requiem eunoia melody you twilight miracle hel adorable destiny ice lovable flora banana droplet iris florence fascinating iris cresent flora sunrise iris laptop requiem iris twilight seraphic destiny lovesick lucy like iris pure fabulous flutter way cream lucy stella pure droplet destiny florence carnival flora melody kitten apple lovesick adorable hello girlish florence baby blush way cresent.", title: "게시글 작성5", date: Date.now.addingTimeInterval(3600 * -18), hits: Int.random(in: 1...2000)),
                BoardModel(content: "はなび わくわく あきら の国 はれ ひびき すみれ はつこい みず あさみ はれ ゆり すずらん あめ ふゆ なつみ しずか はなび もも すてき つき はる すずらん なつ あかし すてき ほし いけ ゆり ひまわり そら あかし にじ さくら はれ つき あられ ふゆ ほし あい ゆり そら ふゆ わくわく もも わくわく みず あきら はれ まなざし. なつみ そら ひまわり ささやき みどり はる ひびき みず なつみ ふゆ あさみ はつこい きらきら はな ぎんが さくら ねこ なつみ あい かすみ あきら きらきら かすみ つきこ ひびき ひかり ふゆ つらら ぎんが つき はなび ねこ つらら はつこい はな そら つき みどり そら ぎんが どきどき みどり えがお はる かすみ ゆめ おもいで ひまわり そら わくわく.わくわく すずらん わくわく すてき つきこ ゆめ あさみ どきどき あさみ おもいで なつ かすみ すずらん あかし あい はなび ひかり えがお ゆらめく ぎんが あさみ そら そら えがお はな ゆらめく しずか ふゆ わくわく まなざし まなざし すてき あられ どきどき ゆらめく つらら はな ほし みず あめ かすみ ゆり ゆめ はなび にじ そら まなざし すずらん すてき しずか.", title: "게시글 작성6", date: Date.now.addingTimeInterval(3600 * -41), hits: Int.random(in: 1...2000)),
                BoardModel(content: "运 上海 舒适的 狂热 美食 舒适的 入迷 口香糖 催眠曲 流水 命运 微笑 永恒 香喷喷的 永恒 奇异的 目不转睛 美妙 袋鼠 我爱你 介绍 可爱 我爱你 雪花 上海 袋鼠 口香糖 韩国 精美 口香糖 美餐 精美 美妙 催眠曲 闪闪发光 美人 蓝色 美人.上海 介绍 可爱 菜 和平 五彩斑斓 目不转睛 生命力 口香糖 上海 美餐 你好 韩国 和平 介绍 舒适的 阳光 美词佳句 可爱 意外新发现 命运 微笑 入迷 菜 晚会 目不转睛 微笑 美词佳句 旅行 美妙 月光 母亲 美妙 入迷 五彩斑斓 菜 蝴蝶 五彩斑斓 彩虹 口香糖 美梦 舒适的 目不转睛 爱人 我爱你 入迷 美食 优美 的 银河.母亲 银河 缘分 奇异的 美食 旅行 你好 安宁 情感 香蕉 口香糖 催眠曲 雨伞 安宁 五彩斑斓 入迷 银河 五彩斑斓 希望 雪花 香喷喷的 甜蜜 狂热 安宁 美餐 月光 你好 诚心诚意 知道 蓝色 蝴蝶 美词佳句 生命力 五彩斑斓 精美 上海 永恒 彩虹 旅游 介绍 精美 一心一意 蜜蜂 宴会 和平 鸽子 香喷喷的 缘分 闪闪发光 诚心诚意.", title: "게시글 작성7",date: Date.now.addingTimeInterval(3600 * -20), hits: 109),
                BoardModel(content: "computer eunoia blossom world lucy miracle milky cream iris masquerade cream hello grapes masquerade charming heimish serendipity eunoia seraphic lovesick vanilla pure moonlight world pure girlish seraphic lucid blossom flutter kitten banana masquerade blossom adolescence miracle way laptop iris laptop masquerade haze requiem cherish cream destiny lovesick kitten carnival like. hello eunoia adorable adorable vanilla world droplet destiny blush laptop miracle adolescence kitten computer masquerade computer like charming blossom sunrise masquerade laptop vanilla florence miracle marshmallow shine droplet kitten flora adolescence eunoia lovable hello florence twinkle banana illusion carnival shine blush shine girlish droplet twinkle stella lucy way florence like. kitten carnival world charming banana melody fabulous hello shine ideale grapes pure sunrise fascinating requiem destiny adorable lucid baby destiny cherish ideale blossom ice blush twilight honey ice adorable fabulous way twinkle cresent shine fascinating ideale melody miracle florence vanilla flutter marshmallow pure ideale illusion twinkle melody illusion world cream.", title: "게시글 작성8", date: Date.now.addingTimeInterval(3600 * -200), hits: Int.random(in: 1...2000)),
                BoardModel(content: "にじ あめ ゆらめく もも なつ はつこい つき はな すもも まぼろし ひびき みず すもも つらら そら ぎんがけい ひかり つき どきどき はれ ゆめ あさみ ゆめ おもいで はる みどり はなび ぎんがけい ふゆ なつみ もも かすみ さくら あめ つき もも ゆき すてき しずか つき つらら そら ほし ゆり はな まなざし あい ゆり ゆらめく すてき. しずか なつみ あかし すてき どきどき なつみ どきどき ふゆ そら ささやき なつみ いけ ゆらめく あめ あめ あきら あめ まぼろし すてき の国 にじ あさみ すずらん つきこ あめ ひびき もも きらきら まなざし すもも まぼろし まなざし あめ ふゆ ふゆ ぎんが もも はる あめ なつみ ひかり つき わくわく あい ひかり ささやき あめ はれ ひまわり はな. ひかり おもいで ゆめ みどり はつこい ひびき まぼろし はれ すもも ふゆ ゆり ぎんがけい わくわく しずか ふゆ つきこ まなざし えがお みず はれ すてき つらら おもいで どきどき はな ぎんが あさみ あき さくら あめ ぎんがけい ゆり みず なつみ はなび ひろみ あい つき おもいで ひろみ ゆめ あられ なつ みず の国 えがお しずか あきら ねこ あかし.", title: "게시글 작성9", date: Date.now.addingTimeInterval(3600 * -56), hits: Int.random(in: 1...2000)),
                BoardModel(content: "宴会 微笑 目不转睛 雪花 知道 的 椰子树 目不转睛 月光 一心一意 一心一意 闪闪发光 香蕉 知道 宴会 如果 知道 非常 的 晚会 彩虹 北京 向日葵 我爱你 韩国 希望 一心一意 安宁 美梦 菜 复兴 花丛 韩国 欢闹的 旅游 椰子树 蝴蝶 缘分 如果 如果 一心一意 极好的 母亲 口香糖 狂热 蜂蜜 美妙 美餐 蜜蜂 香蕉. 缘分 复兴 鸽子 优美 复兴 晚会 宴会 菜 狂热 菜 介绍 希望 向日葵 咯咯笑 缘分 蝴蝶 自由 北京 知道 闪耀 雪花 闪耀 复兴 诚心诚意 安宁 我爱你 永恒 雨伞 情感 舒适的 银河 北京 银河 口香糖 缘分 缘分 蜂蜜 如果 永恒 晚会 美食 希望 缘分 安宁 北京 你好 蜂蜜 向日葵 可爱 北京. 北京 入迷 鸽子 美食 缘分 彩虹 美梦 如果 闪耀 目不转睛 我爱你 激情 永恒 我爱你 宴会 安宁 微笑 雪花 上海 闪烁 精细的 流水 优美 优美 母亲 蜜蜂 椰子树 你好 蜂蜜 缘分 银河 蓝色 绚丽的 口香糖 希望 闪耀 永恒 银河 鸽子 精细的 极好的 美女 安宁 美梦 闪闪发光 上海 上海 复兴 欢闹的 情感.", title: "게시글 작성10", date: Date.now.addingTimeInterval(3600 * -33), hits: Int.random(in: 1...2000))
            ]
        }
        func insert(){
            list.insert(BoardModel(content: "", title: "", date: Date.now, hits: Int.random(in: 1...2000)) ,at: 0)
        }
        func update(boardModel: BoardModel?, content:String, title: String, date: Date) {
            guard let boardModel = boardModel else {
                return
            }
            boardModel.content = content
        }
        func delete(boardModel: BoardModel) {
            list.removeAll { $0.id == boardModel.id }
        }
        func delete(set: IndexSet) {
            for index in set {
                list.remove(at: index)
            }
        }
    }
}
