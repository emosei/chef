TARGET = libyajl
DLLIB = $(TARGET).so
all:

install:
	mkdir -p /home/emosei/work/chef/vendor/bundle/ruby/2.4.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/lib
	cp $(DLLIB) /home/emosei/work/chef/vendor/bundle/ruby/2.4.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/lib/$(DLLIB)
	mkdir -p /home/emosei/work/chef/vendor/bundle/ruby/2.4.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/include/yajl
	cp yajl/*.h /home/emosei/work/chef/vendor/bundle/ruby/2.4.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/include/yajl
