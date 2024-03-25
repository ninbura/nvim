Ninlog = {
  levels = { debug = 1, info = 2, warn = 3, error = 4 },
  level = "debug",
  messages = {}  -- Add a table to store messages
}

function Ninlog.log(self, level, message, print_message)
  if print_message == nil then
    print_message = false
  end

  if self.levels[level] >= self.levels[self.level] then
    if print_message then
      print(string.format("[%s] %s", level, message))
    end

    table.insert(self.messages, string.format("[%s] %s", level, message))  -- Store the message
  end
end

function Ninlog.getMessages(self)
  return self.messages
end

function Ninlog.printMessages(self)
  for _, message in ipairs(self:getMessages()) do
    print(message)
  end
end
