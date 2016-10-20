module Elements exposing (..)

import Html exposing (Html)
import Style exposing (..)
import Style.Elements exposing (element, elementAs, build)
import Style.Elements.Basic
import Style.Basic
import Color


--------------------
-- Define Base Style
--------------------


base : Style.Model
base =
    { empty
        | colors =
            { background = Color.rgba 255 255 255 0
            , text = Color.rgb 17 17 17
            , border = Color.rgb 230 230 230
            }
        , text =
            { font = "Georgia"
            , size = 18
            , lineHeight = 1.7
            , characterOffset = Nothing
            , align = alignLeft
            , whitespace = normal
            }
    }


blue =
    Color.rgba 12 148 200 1



--------------------
-- Define Elements
--------------------
-- container


centered : List (Html.Attribute a) -> List (Element a) -> Html a
centered =
    build
        { base
            | padding = topBottom 100
            , layout = Style.Basic.centered
        }


pirateContent : List (Html.Attribute a) -> List (Element a) -> Element a
pirateContent =
    element
        { base
            | width = px 700
            , padding = all 20
            , spacing = all 40
            , layout =
                textLayout
        }


sidebar : List (Html.Attribute a) -> List (Element a) -> Element a
sidebar =
    element
        { base
            | width = px 300
            , padding = all 20
            , spacing = topBottom 40
            , layout =
                textLayout
        }


p : List (Html.Attribute a) -> List (Element a) -> Element a
p =
    elementAs "p"
        { base | spacing = all 20 }


title : List (Html.Attribute a) -> List (Element a) -> Element a
title =
    elementAs "h1"
        { base
            | text =
                { font = "Georgia"
                , size = 24
                , lineHeight = 1.4
                , characterOffset = Nothing
                , align = alignLeft
                , whitespace = normal
                }
        }


box : List (Html.Attribute a) -> List (Element a) -> Element a
box =
    element
        { base
            | width = px 180
            , height = px 180
            , padding = all 20
            , colors =
                { background = blue
                , text = Color.white
                , border = Color.rgb 230 230 230
                }
        }



-------------------
-- Table Creation
-------------------


{-| -}
table : List (Html.Attribute msg) -> List (Element msg) -> Element msg
table =
    elementAs "table"
        { empty
            | layout = Style.tableLayout
        }


{-| -}
row : List (Html.Attribute msg) -> List (Element msg) -> Element msg
row =
    elementAs "tr" empty


{-| -}
tableHeader : List (Html.Attribute msg) -> List (Element msg) -> Element msg
tableHeader =
    elementAs "th"
        { empty
            | padding = all 10
            , borderStyle = solid
            , borderWidth = all 1
            , cornerRadius = all 0
        }


{-| -}
cell : List (Html.Attribute msg) -> List (Element msg) -> Element msg
cell =
    elementAs "td"
        { empty
            | padding = all 10
            , borderStyle = solid
            , borderWidth = all 1
            , cornerRadius = all 0
        }


{-| -}
button : List (Html.Attribute msg) -> List (Element msg) -> Element msg
button =
    elementAs "button" empty
