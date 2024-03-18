import { SimpleToggleButton } from "../ToggleButton"
import icons from "lib/icons"
import options from "options"

const { nightColor } = options.theme

export const NightColorToggle = () => SimpleToggleButton({
    icon: icons.system.temp,
    label: 'Night Color',
    toggle: () => {
      if (nightColor.value === 'day') {
        Utils.exec('hyprshade on blue-light-filter'),
        nightColor.value = 'night'
      } else {
        Utils.exec('hyprshade on vibrance'),
        nightColor.value = 'day'
      }
    },
    connection: [nightColor, () => nightColor.value === "night"],
})
