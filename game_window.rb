class Game_window < Gosu::Window
    def initialize
        super(800,800)
        @pickaxe = Pickaxe.new
        @field = Field.new(10,10)
        @font = Gosu::Font.new(30)
        @mouse = Gosu::Image.new("Mouse_crosshair-w21-h21.png")

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
end