local M = {}

local engine
local function updateGFX(dt)
  if not engine then
    engine = powertrain.getDevice("mainEngine")
    if not engine then return end
  end

  local broken = false
  for _, wheel in ipairs(wheels.wheelInfo or {}) do
    if wheel.isBroken or wheel.isDeflated then
      broken = true
      break
    end
  end

  if broken then
    electrics.values.throttle = 0
    engine:checkengine(true)
    guihooks.message("AIAM ACTIVÉ : Moteur coupé, anomalie détectée", 5, "aiam_alert")
  end
end

M.updateGFX = updateGFX
return M
