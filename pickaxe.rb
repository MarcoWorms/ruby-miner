class Pickaxe
    def initialize
        @image = Gosu::Image.new("Pickaxe-w88-h116.png")
        @x = 0
        @y = 0
        @z = 2

        @initial_angle = 20
        @clicked_angle = -40
        @angle = @initial_angle

        @initial_anchor_x = 0.5
        @initial_anchor_y = 0.9
        @anchor_x = @initial_anchor_x
        @anchor_y = @initial_anchor_y
    end

    def draw
        @image.draw_rot(@x + 77, @y + 28, @z, @angle, center_x = @anchor_x, center_y = @anchor_y)
    end

    def goto_mouse(mouse_x, mouse_y)
        @x = mouse_x
        @y = mouse_y
    end

    def check_mouse_button
        if Gosu::button_down?(Gosu::MsLeft)
            @angle = @clicked_angle
        else
            @angle = @initial_angle
        end
    end
end