<div align="center">
	<h1>Arcadia</h1>
	<p>Arcadia is a website that presents several scenarios for installing Arch Linux on LUKS with LVM and EXT4.
	</p>
	<p>
		<a href="https://chaosdynamix.github.io/Arcadia/">
			<img src="https://img.shields.io/badge/-Show the guide-blue?style=for-the-badge" alt="Guide page link" />
		</a>
	</p>
</div>

<div align="center">
	<h2>This project is in early stage</h2>
	<p>Please do not  follow the guide for the moment until this section disappear. The guide will not work or will be incomplete. Use it at your own risk.
	</p>
</div>

---

### Run the project

1. Install the dependencies : `docker` and `make`.
1. Clone the repository in the folder of your choice with : `git clone https://github.com/ChaosDynamix/Arcadia.git`.
1. Move to the project directory : `cd Arcadia`.
1. Create the docker image : `make image`.
1. Run the temporary docker container : `make container`.
1. Open your browser at the address : `http://0.0.0.0:4000/Arcadia`.

#### Alternative

You can also run the project **without** docker :

1. Install the dependencies : `ruby`, `rubygems`, `gcc` and `make`.
1. Install bundler : `gem install bundler`.
1. Clone the repository in the folder of your choice with : `git clone https://github.com/ChaosDynamix/Arcadia.git`.
1. Move to the project directory : `cd Arcadia`.
1. Install the gems : `bundle install`
1. Launch jekyll : `bundle exec jekyll serve`.
1. Open your browser at the address : `http://0.0.0.0:4000/Arcadia`.

