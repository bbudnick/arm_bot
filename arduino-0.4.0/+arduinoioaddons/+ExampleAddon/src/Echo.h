/*
 * Copyright (C) 2018 John Donoghue <john.donoghue@ieee.org>
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see
 * <https://www.gnu.org/licenses/>.
 */
#include "LibraryBase.h"

const char MSG_NEEDS_VALUE[] PROGMEM = "Needs a value to echo";

class Echo : public LibraryBase
{
public:
  Echo(OctaveArduinoClass& a)
  {
    libName = "ExampleAddon/Echo";
    a.registerLibrary(this);
  }
  void commandHandler(uint8_t cmdID, uint8_t* data, uint8_t datasz)
  {
    switch (cmdID)
      {
      case 0x01:
        {
	  if(datasz == 0)
	    sendErrorMsg_P(MSG_NEEDS_VALUE);
	  else
            sendResponseMsg(cmdID, data, datasz);
          break;
        }
      default:
        {
          // notify of invalid cmd
          sendUnknownCmdIDMsg();
        }
      }
  }
};

