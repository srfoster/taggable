#lang racket

(provide mod-name pak-folder main.rkt)

(require racket/runtime-path)

(define
  mod-name
  "Taggable")

(define-runtime-path
  pak-folder
  "BuildUnreal/WindowsNoEditor/Taggable/Content/Paks/")

(define-runtime-path
  main.rkt
  "main.rkt")


