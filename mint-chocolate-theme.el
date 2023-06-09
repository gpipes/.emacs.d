;;; mint-chocolate-theme.el
;; Copyright (C) 2023 gpipes

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;  simple mint green and black theme with very little highlighting.
;;  I do not use font lock mode and don't plan to support anything more
;;  than keeping the look of this theme very simple

;;; Code:

(deftheme mint-chocolate "Mint + Black plain theme")

(let ((mint      "#E1FAE1")
	  (chocolate "#000000"))
  (custom-theme-set-faces
   'mint-chocolate
   `(default ((t . (:foreground ,chocolate
								:background ,mint))))))
							  
							  
