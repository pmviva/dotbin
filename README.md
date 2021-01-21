# Dotbin

1. About
2. Installing
3. Authors
4. Contributing

## About

This repository contains my binary files and bash scripts shared across all computers I work.

## Installing

```bash
git clone https://github.com/pmviva/dotbin.git ~/.dotbin
mkdir -p bin
cd .dotbin
for i in *.sh
do
  ln -f -s ~/.dotbin/$i ~/bin/$i
done
cd ..
```

## Authors

* Pablo Martin Viva [pmviva@gmail.com](mailto:pmviva@gmail.com)

## Contributing

1. Fork it ( https://github.com/pmviva/dotbin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
