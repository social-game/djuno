module github.com/desmos-labs/djuno

go 1.13

require (
	cloud.google.com/go v0.55.0 // indirect
	cloud.google.com/go/firestore v1.1.1 // indirect
	firebase.google.com/go v3.12.0+incompatible
	github.com/cosmos/cosmos-sdk v0.39.1
	github.com/desmos-labs/desmos v0.12.0
	github.com/desmos-labs/juno v0.0.0-20200706074258-15a37786a810
	github.com/jmoiron/sqlx v1.2.0
	github.com/proullon/ramsql v0.0.0-20181213202341-817cee58a244
	github.com/rs/zerolog v1.18.0
	github.com/spf13/cobra v1.0.0
	github.com/spf13/viper v1.6.3
	github.com/stretchr/testify v1.6.1
	github.com/tendermint/tendermint v0.33.7
	github.com/ziutek/mymysql v1.5.4 // indirect
	golang.org/x/tools v0.0.0-20200321224714-0d839f3cf2ed // indirect
	google.golang.org/api v0.20.0
	google.golang.org/genproto v0.0.0-20200319113533-08878b785e9c // indirect
)
replace github.com/desmos-labs/desmos => github.com/social-game/desmos v0.12.2-0.0.1
