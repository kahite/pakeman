module SvgHelper exposing (capturedIcon)

import Html exposing (Html)
import Html.Attributes exposing (style)
import Svg exposing (svg, path)
import Svg.Attributes exposing (viewBox, fill, d)


capturedIcon: String -> Html msg
capturedIcon color = 
    svg [viewBox "0 0 450 500", style "width" "1.25em", style "height" "1.25em"] [
        path [
            fill color,
            d "M416 32H32A32 32 0 0 0 0 64v384a32 32 0 0 0 32 32h384a32 32 0 0 0 32-32V64a32 32 0 0 0-32-32zm-16 400H48V80h352zm-176-32A144 144 0 1 0 80 256a144 144 0 0 0 144 144zm0-168a24 24 0 1 1-24 24 24 24 0 0 1 24-24z"
        ] []
    ]