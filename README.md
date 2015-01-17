# gitrob-box

This installs [gitrob](http://michenriksen.com/blog/gitrob-putting-the-open-source-in-osint/) in a Vagrant box.

```bash
vagrant up
vagrant ssh
gitrob --help
```

## Enter your GitHub tokens

After provisioning you have to enter your GitHub tokens in the file `~/.gitrobrc`.

## Check a GitHub org

Now check a GitHub org with this command

```bash
gitrob -o yourorg -b 0.0.0.0
```

Afterwards open a web browser on your host and watch the output

```bash
open http://127.0.0.1:9393
```

## Add own search patterns

At the time of writing gitrob has the search patterns in the file `/var/lib/gems/1.9.1/gems/gitrob-0.0.4/patterns.json`.

If you put a modified `patterns.json` beside the `Vagrantfile` then this will be copied inside the VM to be used.
