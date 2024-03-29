## Copyright (C) 2018 John Donoghue
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Loadable Function} {} flushoutput (@var{serial})
##
## Flush the output buffer.
##
## @var{serial} - instance of @var{octave_serial} class.
##
## @seealso{srl_flush, flushinput}
## @end deftypefn
function flushoutput (serial, q)
  __srl_properties__ (serial, 'flush', 0);
end
