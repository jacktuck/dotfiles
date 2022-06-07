#!/usr/bin/env sh

sketchybar --add   item          mailIndicator right                   \
           --set   mailIndicator update_freq=30                        \
                                 script="$PLUGIN_DIR/mailIndicator.sh" \
                                 icon.font="$FONT:Bold:16.0"           \
                                 icon=􀍜                                \
                                 label.padding_right=8                 \
                                 background.padding_right=0            \
                                 label=!                               \
                                                                       \
           --add   alias         MeetingBar right                      \
           --set   MeetingBar    background.padding_right=-8           \
                                 background.padding_left=-6            \
                                 update_freq=10                        \
                                                                       \
           --add    item         dateTime right                        \
           --set    dateTime     update_freq=60                        \
                                 position=right                        \
                                 drawing=on                            \
                                 background.padding_right=0            \
                                 script="$PLUGIN_DIR/datetime.sh"      \
                                 icon.font="$FONT:Bold:16.0"           \
                                 icon=􀐬                                \
                                 label.padding_right=10                \
                                 label.padding_left=5                  \
                                 background.padding_right=0            \
                                                                       \
           --add   bracket       calendar                              \
                                 mailIndicator                         \
                                 MeetingBar                            \
                                 dateTime                              \
           --set   calendar      background.drawing=on
