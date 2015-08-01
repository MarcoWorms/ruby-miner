class Field
    def initialize(width, height)
        @width = width
        @height = height
        @matrix = []
        @size_x = 0..@width
        @size_y = 0..@height
        @square_image = Gosu::Image.new("Square-w64-h64.png")
        @square_hover_image = Gosu::Image.new("Square_hover-w64-h64.png")
        @square_cracks_animation = Gosu::Image::load_tiles("cracking-5frames-w64-h64.png", 64, 64)

        for x in @size_x
            @matrix[x] = []
            for y in @size_y
                @matrix[x][y] = Square.new(x,y,64,64,@square_image,@square_hover_image,@square_cracks_animation)
            end
        end
    end

    def draw
        for x in @size_x
            for y in @size_y
                @matrix[x][y].draw
            end
        end
    end

    def highlight_hover(mouse_x, mouse_y)
        grid_x = mouse_x.to_i / 64
        grid_y = mouse_y.to_i / 64
        for x in @size_x
            for y in @size_y
                if x == grid_x && y == grid_y
                    @matrix[x][y].mouse_is_hovering = true
                else
                    @matrix[x][y].mouse_is_hovering = false
                end
            end
        end
    end

    def handle_click(mouse_x, mouse_y, pickaxe)
        grid_x = mouse_x.to_i / 64
        grid_y = mouse_y.to_i / 64
        for x in @size_x
            for y in @size_y
                if x == grid_x && y == grid_y
                    @matrix[x][y].hit(pickaxe)
                end
            end
        end
    end

end