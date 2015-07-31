class Field
    def initialize(width, height)
        @width = width
        @height = height
        @matrix = []
        @size_x = 0..@width
        @size_y = 0..@height

        for x in @size_x
            @matrix[x] = []
            for y in @size_y
                @matrix[x][y] = Square.new(x,y,64,64)
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

end

class Square

    attr_accessor :mouse_is_hovering

    def initialize(x, y, width, height)
        @x = x
        @y = y
        @image = Gosu::Image.new("Square-w64-h64.png")
        @hover_image = Gosu::Image.new("Square_hover-w64-h64.png")
        @width = width
        @height = height
        @true_x = x * width
        @true_y = y * height
        @mouse_is_hovering = false
    end

    def draw
        if @mouse_is_hovering
            @hover_image.draw(@true_x, @true_y, 1)
        else
            @image.draw(@true_x, @true_y, 1)
        end
    end

end