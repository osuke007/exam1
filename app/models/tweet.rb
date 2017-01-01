class Tweet < ActiveRecord::Base

    # 「1文字以上255文字以下」
    validates :content, length: { in: 1..255 } 

end
