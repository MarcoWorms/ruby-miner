class Square

    attr_accessor :mouse_is_hovering

    def initialize(x, y, width, height, image, hover_image, cracks_animation)
        @x = x
        @y = y
        @image = image
        @hover_image = hover_image
        @width = width
        @height = height
        @true_x = x * width
        @true_y = y * height
        @mouse_is_hovering = false
        @max_health = 10
        @health = @max_health
        @font = Gosu::Font.new(20)
        @crack = cracks_animation
    end

    def draw
        if @mouse_is_hovering
            @hover_image.draw(@true_x, @true_y, 1)
        else
            @image.draw(@true_x, @true_y, 1)
        end

        @font.draw(@health, @true_x, @true_y, 3)

        if @health > @max_health * 0.8
            return
        else
            frame = @health / @max_health
            @crack[0].draw(@true_x, @true_y, 5)
        end
    end

    def hit(pickaxe)
        @health -= pickaxe.damage
        if @health <= @max_health
            #die
        end
    end

end