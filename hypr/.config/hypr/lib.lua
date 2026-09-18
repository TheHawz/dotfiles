-- Sustituto mínimo de los helpers de Omarchy (default/hypr/helpers.lua).
-- `hl` es global y lo provee Hyprland; `o` era de Omarchy y lo reimplementamos
-- aquí para que la sintaxis de los atajos rescatados siga funcionando igual.

o = o or {}

local function shell_quote(value)
  return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

-- Lanza bajo uwsm para que la app quede en su propio scope de systemd.
function o.launch(command)
  return "uwsm-app -- " .. command
end

local function command_from(value)
  if type(value) ~= "table" then
    return value
  end
  if value.launch then
    return o.launch(value.launch)
  end
  error("o.bind: forma de comando no soportada (solo cadena o { launch = ... })")
end

-- o.bind(teclas, descripción, comando [, opciones])
-- El comando puede ser una cadena, { launch = "..." } o un dispatcher hl.dsp.*
function o.bind(keys, description, dispatcher, options)
  local opts = options or {}
  if description then
    opts.description = description
  end

  dispatcher = command_from(dispatcher)
  if type(dispatcher) == "string" then
    dispatcher = hl.dsp.exec_cmd(dispatcher)
  end

  hl.bind(keys, dispatcher, opts)
end

-- o.window("clase", { reglas }) o o.window({ title = "..." }, { reglas })
function o.window(match, rules)
  rules.match = rules.match or {}
  if type(match) == "string" then
    rules.match.class = match
  else
    for key, value in pairs(match) do
      rules.match[key] = value
    end
  end
  hl.window_rule(rules)
end

function o.exec_on_start(command)
  hl.on("hyprland.start", function()
    hl.exec_cmd(command)
  end)
end

function o.launch_on_start(command)
  o.exec_on_start(o.launch(command))
end

return o
