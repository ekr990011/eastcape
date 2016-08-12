module ForumsHelper
    def forum_hompage
        @forum_homepage = Forum.first
    end
    
    def forum_hompage1
        @forum_hompage1 = Forum.second
    end
    
    def forum_hompage2
        @forum_hompage2 = Forum.third
    end
end
