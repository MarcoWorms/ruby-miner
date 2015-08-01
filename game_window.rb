class Game_window < Gosu::Window
    def initialize
        super(800,800)
        @pickaxe = Pickaxe.new
        @field = Field.new(10,10)
        @font = Gosu::Font.new(30)
        @mouse = Gosu::Image.new("Mouse_crosshair-w21-h21.png")
        @can_click = true
    end

    def update
        @pickaxe.goto_mouse(self.mouse_x, self.mouse_y)
        @pickaxe.check_mouse_button
        @field.highlight_hover(self.mouse_x, self.mouse_y)
    end

    def draw
        @mouse.draw_rot(self.mouse_x, self.mouse_y, 3, 0)
        @pickaxe.draw
        @field.draw
        @font.draw(Gosu::fps,0,0,1)
    end

    def button_down(id)
        if id == Gosu::MsLeft
            if @can_click
                @field.handle_click(self.mouse_x, self.mouse_y, @pickaxe)
                @can_click = false
            end
        end
    end

    def button_up(id)
        if id == Gosu::MsLeft
            @can_click = true
        end
    end

end