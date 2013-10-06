## Copyright (C) 2012 Pantxo Diribarne
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{im} = } checkerboard ()
## @deftypefnx {Function File} {@var{im} = } checkerboard (@var{n})
## @deftypefnx {Function File} {@var{im} = } checkerboard (@var{n}, @var{q}, @var{p})
## Returns an image of a checkerbard, featuring n pixels (default 10)
## quadrant meshes
## replicated p (default 4) times horizontally and q (default q = p)
## times  vertically. 
## @end deftypefn

## Author: Pantxo Diribarne <pantxo@dibona>
## Created: 2012-09-10

function [ im ] = checkerboard (n = 10, p = 4, q = -1)
  if (! all (isnumeric ([n p q])))
    print_usage ();
  elseif (! all ([n p] > 0))
    print_usage ();
  endif
  
  if (q < 0)
    q = p;
  endif
  [xx yy] = meshgrid (linspace (-1, 1, 2*n));
  sample = (xx.*yy) < 0;
  im = double (repmat (sample, p, q));
  im(:, (end/2+1):end) *= .51;
endfunction
