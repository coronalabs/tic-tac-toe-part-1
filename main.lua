-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local title = display.newText("Tic-Tac-Toe", display.contentCenterX, 25, native.systemFontBold, 20)

local leftVerticalLine = display.newRect( display.contentCenterX - 50, display.contentCenterY, 5, 300 )
local rightVerticalLine = display.newRect( display.contentCenterX + 50, display.contentCenterY, 5, 300 )
local topHorzontalLine = display.newRect( display.contentCenterX, display.contentCenterY - 50, 300, 5 )
local bottomHorizontalLine = display.newRect( display.contentCenterX, display.contentCenterY + 50, 300, 5 )

local spots = {}
local player = "X" -- Player X goes first in Tic Tac Toe

local function handleMove( event )
    if event.phase == "began" then
        if event.target.moveType == nil then
            if player == "X" then
                event.target.moveText.text = player
                event.target.moveType = player
                player = "O"
            else
                event.target.moveText.text = player
                event.target.moveType = player
                player = "X"
            end
        end
    end
    return true
end

for i = 1, 9 do
    spots[i] = display.newRect( 0, 0, 90, 90)
    spots[i]:setFillColor( 0.2, 0.2, 0.2 )
    spots[i].x = ( i - 1 ) % 3 * 100 + 60
    spots[i].y = math.floor( ( i - 1 ) / 3 ) * 100 + 140
    spots[i].moveText = display.newText( i, spots[i].x, spots[i].y, native.systemFontBold, 80)
    spots[i].moveType = nil

    spots[i]:addEventListener( "touch", handleMove )
end
