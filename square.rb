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

        frame = calculate_cracking_frame(@health, @max_health)

        if frame == 'none'
            return
        else
            @crack[frame].draw(@true_x, @true_y, 5)
        end
    end

    def hit(pickaxe)
        @health -= pickaxe.damage
        if @health <= @max_health
            #die
        end
    end

    def calculate_cracking_frame(health, max_health)
        health_percentage = health.to_f/max_health
        if health_percentage == 1
            return 'none'
        elsif health_percentage >= 0.8
            return 0
        elsif health_percentage >= 0.6
            return 1
        elsif health_percentage >= 0.4
            return 2
        elsif health_percentage >= 0.2
            return 3
        elsif health_percentage >= 0
            return 4
        end
        return 'none'
    end

end