# Values used on all servers. These may be overwritten.

maintenance:
  enabled: False
  # Set safe default.
  patching: automatic

system_contacts:
  # For system notifications.
  root: sysadmin@dogsbody.com
  # For cron jobs.
  cron_admin: sysadmin@open-contracting.org,sysadmin@dogsbody.com

ssh:
  # Public keys of users with root access to all servers.
  admin:
    # Open Contracting Partnership
    # James
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2AYzfKIjwrhN7Jg3RrQKK/YJSVo1OSXadbhgE8mKMLi5nuDN6v9g8+QodcCEdA/AjGIr25CtBWcLwvT33h0SfMZ9a8Csq2pv6IAQkigxMrr8aBE9TL8pqQuwcc7CS9PQNYFuqpKoC4PSvNGqn9NRPtZmPkmcIa+CL/G6Y48HY36jWsauI8T8l4gMeOkH9bfB1yNRmEwQAuA+PmGXgGSlx7Gj+TofOHNbWj1l7lThFyG73qQfqyMPmfHPIjyu1EfA4lBezjcgJXlE2VodrLTFfimORJLHk684xnmf7935KwmjBqIucD16PE/KSOyj+vQxXZCTLsQjDuXr3GexOJBXx
    # Yohanna
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG8dhMVvgH/tt9+VoyokyUg/iKVcZKMku8pYN6o8RoT8XKoyP/iyrUIl5HxolqIt+PJTpomYkA40eJ/0mN4/kRhr+tctZ+tUdo8/G8H42FG3McklL6XlwOdXRGIYC+NynF8YGws57J8YkM2oL9linkUZYpGpVkNew2aEg916HWWfGZktwuQa7knIwIhFr9FlvxxaZhdcQ7VJjnJOP0fLLr5WCVaiWDGjQ5cHJURcTBL+j+eTRpKFvk9BMKCAQyLkSEluT0QeESDMtR7sRHA54to1LDXRX0ky9cAQ6mxXWgpSpmHCuPVYpzOfoSd7b8aczDLUGBxq9EWOTS3UMUWJBX
    # Dogsbody Technology
    # Dan Benton (https://github.com/dogsbody.keys)
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxMTmzcgW9CNTbeCphmwW8O2DlYQrd3MiSoTj3Hx8zb8n8RZtb6cRr2QOEUyRr7Ac4u4UN+Q7uhpDdKxc+cOLxCGDx5TaKpkFh+SJOKKG/fE7ieeif42l9XVyrRbLBALKqZhPyTAe6p20oii2ESpD9ddpA/d9J6WtTlQdc8eJ9IJvSY3xbZfTrg7qbQk5wEyhWhZDlXStdnnmfYxNplAwDKwAKJjbtXvDG3EEsW3oZPxUjHucSB3KG2vIsxJ7C7RUKl4SGLu02lNQ/sdseLtb8bKKENkELgli99yWsl0y4fAh2mcdrQrhiU6GTUnCMTN/Bt1LzxhuccsIIcrofZZSW8QoHBVfp4BXsof6ZuEHlLjDj/ueI1bJ8fPsSEak7CuKAAlGFnlV4xbW024wWL1vc0A05MP7mH/MbDLYtuKQ9/kbbLWZuVI0HHu1PMyGC2eG6BJrUv6TYPz67Oy4RqvGAVCrSCW4/lM/w1scbzf29bWYLV3mbWVaGtApQhwSYmPMEmbrlnWfgSmXlUGyd0i0hJ3tNR/Xawt4qaFYNcZHnifGIe5u8XYcQbtceQvMiBWG+6MXXAXePqH6orTK+vJLxmz5X2Nr7rVlkBTiEVW6Q+L5eAZMZpHPrGtt6iYo4Z1b2JLrYZxi0mpex9KTBvClA38so+xuFPDZUIDFxnNK1cQ==
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyamQMCOlo1Yy5KRRgOCMer7BryeQl8gSLIgzeiE6eSK5OO6z+kbiWpEsxRpEkHCMg2cvNSBJ1FIJntY66Mi93/0Z9MoKaAgOZgSUbAhQ4Hr0wW4HY4tth/8Yk5XuLVRFapw7jFyh50cGXl8PP5ncpZO1qEjKsSA6fREh2m/AbU/Sye2CVIffYnkIsbRMU91SdKkE7FoTDtJqsO565flzAlcx68kOk4QueRf9kBr0rXLIoTjcWPcSJ+d5A+FqIXInm0F9uMBt4kTBMBEXsjso/OcC2ZRGXbVDq/Kxz98CgX1CgwLne5lEiAlJjruLW2FVF/PpMoGY12Y/z3Aqmt4qsTDkIu2DRmcCGODgdD8xk/1Ts8yqRWtmyocPj6Gg9l/JQLvo+XP6PvtaGmw+nFKtgm22uKV6wNBRVA+rwBO3rsChNraEC6M1D7MG5fI6lQ/Phq56yE4/IOnzNTyLH2Nk3bX4IqOwN+Gt6LliihKih7/kS3+3ZdWnjxuYmwLhEon0bzMap+DbP0FE8MVYzSxeR0g5mPlsVu4boSM9PicgLLRU5P98QB8lh0ZEcmv5YKjkAgakPkfYF9KHoVBWtigz2/wL0OfYdHDCSywFRsAzY7p0gfBZh6M+aUULlh8eN09SWmNOmZ1ZPOJLV0ObePx+mlBMHCRa/UnVfh62B2hC2Pw==
    # Jim
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaNcXIRfgKip7dQlyxGv2AU9h9gCpdj3kF+avhBkDvUtuaxcudjSI2UtAKp9Rwclm1lAkHdj1QP0mRLKMSLAlgfiYz9KmEnd5xf0c5In87D7872hCrrZ4KQnhm8s0KEKc2xBcNggjMCq1gVmyJUCy9VoU77Ob9J9cV44ZAbW3CFVN3wkEOMdF0hsx+01MckBOJN2XzTZ10lVTOjDQAMQPmcwd4g/Wk5Atd7VWR0i/+zzgfFkHLy9Z1N+nemJnFyd7zCihbmHt+K65yr9K35QXkJ1eaA5kY/C3aZwInKmr++JLHUjCn3vEvq6L1pQEkKSLxdQZYfpdhC1fzQopUZVIvrIsovcvIlf2R6nNYvDUf/iPpvRXHwEIgp4gPYrgzZ5665f637bxZy6o4YlfmiskYJX8o5qn/TAnCqOF9Y39XkZ+rIUIssUZH3UAReyjqcWwu7zDVsAcenFTZXXqDY6Ds3wZx4tHB4DpRoy5j45pqtg7Y7qi850xxcsRYr/hf5bV71FK9t/AiHk1G7VmFZ+SI0JQwjZKg/NtztYkeogCDrcStSIVpIVK8WrVm8vyXALNr6EZDlntGCFOuk7sPQM8420ABctMzX0g2HcToQtWpEu7JShhGe1qK9gGXAm+647aA6ctTPKQoqS488d/zpMrRefrK87pZBuRFMlIo6bn4xQ==
    # Rob
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7eOa3ZIcXmRJyPhQ8MNh1WQTvfyPnvH6XD80OemoGwnQvCIKSZ/mFqhATU6urhhuC238vLvy9jia6zSyxRC5ryvM+kUm8WC9J1KRYXTPXx1pR4tPQvXBqSJeX08yXVvp30zHo7t/8vIcrSn0c9MGH5TKdN2cL4xojYL+CHZ9TxgHsl43AaEuP9ckBLxYRyfLtA+h8fv/GP6DLT5roSrbev7zvhmu3a8fOlnz6KZ2ywOYd1ySKhLux3/rGtoJ2duiT8Ar6z/IwyszhllEikWcSTOLseffmYWbCoOqRNnWPADzS5a1nQAHpKvOui6eHyjIPEIoUEbaoCTdi8zD/5X3m56o6dLyxOXEzj8tYjM+Y2H8+dNIueauuNthOUF9Jbmw/EbSQ51h83s5lA3N6hR6ndMYhSD0eeA3z2ybUKuIuXRBK4VkIcWcrH/rPzNVLa7VV6eNyXuLscgAYHHOlTVByrrIdcnvvKhn88TkLabxSI020qWB7AoDDOgRdiWSCw7eLjmTqDTEriJOR6/rfH5aAoyUdZVTnQ3DUDTyVxWmDt2P1vI9mS7OzU2gu+/ScTqTHDVYXXfhuVvjY+QVEfK9wclFbE2/JUqYXWBao/PE+qn974U+xuwWjGR36MNj8USq4wItHsoktaVwDqSCw1llg7CwaPO8XlhHrRohsE4ZuUQ==
    # Ashley
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqdeY88blBbGV2uhSXsws7xLA1xlu5nNRHETKtdUeKDzt5OoaWiYNW81y14jCMSzxnK++SlzbOlBrW01CvtbxstLNevCYRakk6pfrV3FOVvQmvx32eEnboG3uPpO77cyWACD5We3Qzu056m29h2sDHNA0lGyFHaFZTHZh/07eWXxGTJYJPiybkv1R+/P8Cknah9VYFs/TagWstfisBCxKhrvaf5X5uvBVD6zSK7PJu3/ZRvEm/9y3HSGVl4TFKdCk9hH8w3oMtN1yKYErCF6lWiC/SD4b+bJmyuwFjOEAPsvZbGzS5SwHTiaZD8o5dz+i1stWkaRshJyLq/MVrLacBdTgK+u/Uu8nC5cVlpT0HC0bSVZcZWbiCbpaBDsCaDipKR8J/ji25QMMcGDclXOsloja1iC4h5XagoexoQmvPt3jf1brsxfwpSCetD6DUUsKWwrMwEsYwfou0GG/vVsR5+70feTmsO3Il/tcOvmJCFf8NHs/NI3r5fYkX8bZ/4P84crAOrrXp3RsD7rFkG5GV/AYRFq6/2rYcOwMK9fdybevIX/0gTz7Yh6aBAIaOeJJUi6ftUiAbwi07yRxOSkK8o3KiRctwA1LYb+kmDz5mYjheMxVNn/nHA67DqC3ShVL2iBy1j2bOYVUVI9G0PeNNNLv1v65gSw0ifdeKSkERrw==
    # Josh
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCUuQWZWXWk+a2qjE67IuUGWgG1fb6/Nw/4div9e5AIxmpj43HxoM2k1lS+qM3IF0s+A5TGzb7GWbZoOS568og8zMNLdN5X+NcU99tzXLAuQTMY8bdHBmFWFmPt+FvMSxZIuAVtHZ3fXhZNWJBivgPktiE9J2YFcdwwFBysgPRqSAPfGMl/6mpyRe9PNP56Ab1y/Vp2SXDCcfUmU6fu1qULb9s1EkOy3an/FjbNrbmFklxWBJGEeNZuoDcf23Tj8EafT/pO9B+ayJtmmQ+ld7joID6/7/2GeLyH9wBtuBnDlom1FsZxqU8G6RhlqiqtIOK+t4Zxc70P32iQQ/5R9owXFxGJcPqqiQSLfuBRBKw9AhCuLPtpaiiS4T4tbPmMRrxMfQDawb0dej83CwsLZnB8XHNGn5XvvnFcc9nF2yrOQOaD4m8U79TifaB2+bUWsjuxbXSMCy2lg3EWlMrA157eG+IrXjE0NhxPhn4Hxet1IArN4ntk7PndqWg7xfzaFDgZJVQ9tjlQSXDY7v98D3nyJf+8Xr+pUp578ugEo3P5gCjsa2IuivovUEWoU4dVX5NjzyRB8dpgWmLOXUMREaRTgFv7WC+lLf6rZvtVdmuLX9Tzfjb2FfPfUTLB9gnGSA4SOt368RFQM00GnSOIq0aLZsIBQXjcw3KdFK5YxtVKSQ==
