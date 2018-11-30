print()

local templates={
	["article.html"]={
		template="article.html",
		values={
			title="Fregona",
			price=25,
			discount="-20%",
			illustration={
				url="assets/Classic-Mop.png",
				alt="Un magnifique balai à franges"
			},
			specs=[[Magnifique balais à frange en plastique rouge qui vous permet de faire le ménage avec une facilité déconcertante. Vous ne voudrez plus jamais utiliser autre chose. Fini le balai et la serpillère, maintenant ayez le réflexe balai brosse ! De plus s'il devient usée, des rechanges existent pour une maison toujours plus propre !]],
			comments={
				{
					username="Jean-Philippe",
					rating=5,
					comment=[[Bon produit et livraison rapide]]
				},
				{
					username="Jean-Kévin",
					rating=1,
					comment=[[Livréson trop longue et produi pas aussi beau que sur la photo, il a cassé aprè que je l'ai secoué car il mettai du temps a démaré]]
				},
			}
		}
	},
	["article2.html"]={
		template="article.html",
		values={
			title="Lamas",
			price=6942,
			illustration={
				{
					url="assets/Lama_(1).png",
					alt="Lama des montagnes",
					title="Magnifique Lama des montagnes",
					id="i1",
					next="i2"
				},
				{
					url="assets/Best_boi.jpg",
					alt="Best boi Lama",
					title="Best boi Lama",
					id="i2",
					prev="i1",
					next="i3"
				},
				{
					url="assets/Serge_Lama.jpg",
					alt="Serge Lama",
					title="Serge Lama",
					id="i3",
					prev="i2"
				},
			},
			specs=[[Magnifique assortiment de Lama.
Vous pouvez voir dans la galerie nos modèles d'exposition. En partenaria avec <a href="http://www.lamashopper.cl" target="_blank">Lama Shopper</a> nous pouvons vous proposer de choisir dès petit votre futur lama et de le voir grandir jusqu'à ce qu'il ai l'âge de voyager jusqu'à vous. Vous pouvez voir nos autres lamas disponibles sur envoi de la demande à notre addresse mail ou postale. Livraison par Fedex ou TNT possible sous 15 jours après réception de la commande si votre Lama à l'âge légal le permettant.]]
		}
	}
}

for line in io.popen('ls -1 src/pages'):lines() do
	if not templates[line] then
		local fd=io.open('src/pages/'..line)
		local html=fd:read '*a'
		fd:close()
		local title=html:match("<h1>([^<]+)</h1>")
		print("Found page "..line.." with"..(title and (" title: "..title) or "out title"))
		templates[line]={
			template="base.html",
			values={
				title=title,
				html=html
			}
		}
	end
end

return templates
