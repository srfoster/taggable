#lang at-exp codespells

(require taggable/mod-info)

(provide tag
         with-tag
         move-with-tag
         delete-with-tag
         find-with-tag)

(define (tag t v)
  (thunk
   @unreal-js{
     (function(){
     var x = @(if (procedure? v)
                  (v)
                  v)
             
     if(!global.taggedThings){
       global.taggedThings = {};}

     global.taggedThings['@t'] = x;
     return x;
     })()
 }))

;Should delete if already some
(define (with-tag tag code)
  (thunk
   @unreal-js{
     (function(){
     var x = @(if (procedure? code)
                  (code)
                  code)

     if(!global.taggedThings){
       global.taggedThings = {};}

     var destroy = function(a){
         a.GetAttachedActors().OutActors.map(destroy)

         a.DestroyActor()                         
     }

     if(global.taggedThings['@tag'])
       destroy(global.taggedThings['@tag']);
     
     global.taggedThings['@tag'] = x;
     return x;
     })()
 }))

(define (delete-with-tag tag)
  (thunk
   @unreal-js{
     (function(){
       var x = global.taggedThings["@tag"];
       console.log(x);

       var destroy = function(a){
         a.GetAttachedActors().OutActors.map(destroy)

         a.DestroyActor()                         
       }
       
       destroy(x);
       
       return x;
     })()
 }))

(define (move-with-tag tag)
  (thunk
   @unreal-js{
     (function(){
       var x = global.taggedThings["@tag"];

       x.SetActorLocation({X: @(current-x), Y: @(current-z), Z: @(current-y)})
                                    
       return x;
     })()
 }))

(define (find-with-tag tag)
  (thunk
   @unreal-js{
     (function(){
       var x = global.taggedThings["@tag"];
                                    
       return x;
     })()
 }))

#;(module+ main
  (codespells-workspace ;TODO: Change this to your local workspace if different
   (build-path (current-directory) ".." "CodeSpellsWorkspace"))
  
  (once-upon-a-time
   #:world (demo-world)
   #:aether (demo-aether
             #:lang (my-mod-lang #:with-paren-runes? #t))))

