class Hash
  # Access a hash as a JavaScript hash: foo.bar.baz
  # Gavin Kistner -- http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/92897
   def method_missing(meth,*args)
     if /=$/=~(meth=meth.id2name) then
       self[meth[0...-1]] = (args.length<2 ? args[0] : args)
     else
       self[meth]
     end
   end
end