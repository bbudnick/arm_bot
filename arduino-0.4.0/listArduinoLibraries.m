## Copyright (C) 2018 John Donoghue <john.donoghue@ieee.org>
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} listArduinoLibraries ()
## @deftypefnx {} {@var{retval} =} listArduinoLibraries (@var{libtypes})
## Retrieve list of all known arduino library modules that are available.
##
## @subsubheading Inputs
## @var{libtypes} - optional specifier for type of libraries to list.
##
## Options are:
## @table @asis
## @item all
## List core and addons
## @item core
## List core only libraries
## @item addons
## List addons only
## @end table
## When no libtypes is specified, all libraries are shown.
##
## @subsubheading Outputs
## @var{retval} is an cell array of string library names that are
## available for programming to the arduino.
##
## @seealso{arduino, arduinosetup}
## @end deftypefn

function retval = listArduinoLibraries (libtypes)
  retval = {};

  if nargin == 0
    libtypes = "all";
  elseif ! ischar(libtypes)
    error ("Expected libtypes to be a string")
  endif

  if ! (strcmpi(libtypes, "all") || strcmpi(libtypes, "addons") || strcmpi(libtypes, "core"))
    error ("Invalid libtypes value '%s'", libtypes)
  endif
  
  # hardcoded libraries
  if strcmpi(libtypes, "all") || strcmpi(libtypes, "core")
    retval{end+1} = 'I2C';
    retval{end+1} = 'Servo';
    retval{end+1} = 'SPI';
    retval{end+1} = 'ShiftRegister';
    retval{end+1} = 'RotaryEncoder';
  endif

  # add ons
  if strcmpi(libtypes, "all") || strcmpi(libtypes, "addons")
    addonfiles = __addons__ ();
    for i = 1:numel (addonfiles)
      retval{end+1} = addonfiles{i}.libraryname;
    endfor
  endif
endfunction

%!test
%! libs = listArduinoLibraries ();
%! assert (!isempty (libs))
%! assert (! isempty (find(strcmp(libs, 'SPI'))));
%! assert (isempty (find(strcmp(libs, 'unknown'))));

%!test
%! deflibs = listArduinoLibraries ();
%! alllibs = listArduinoLibraries ("all");
%! corelibs = listArduinoLibraries ("core");
%! addonlibs = listArduinoLibraries ("addons");
%! assert(numel(alllibs) == (numel(corelibs) + numel(addonlibs)))
%! assert(numel(alllibs) == numel(deflibs))

%!error <Expected libtypes to be a string> listArduinoLibraries(1)

%!error <Invalid libtypes value> listArduinoLibraries("invalid")
