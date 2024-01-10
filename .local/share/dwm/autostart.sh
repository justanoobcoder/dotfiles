#!/bin/bash

eww daemon && 
    eww open bar && 
    dwm-msg subscribe tag_change_event layout_change_event > /tmp/dwm.log
