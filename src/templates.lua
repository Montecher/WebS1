local templates={}

templates.base="base.html"
templates.article="article.html"

local pages={}

pages["a_propos.html"]={}
pages["a_propos.html"].template='base'
pages["a_propos.html"].values={}
pages["a_propos.html"].values.title="À propos"

pages["article.html"]={}
pages["article.html"].template='article'
pages["article.html"].values={}
pages["article.html"].values.title="Fregona"

pages["article2.html"]={}
pages["article2.html"].template='article'
pages["article2.html"].values={}
pages["article2.html"].values.title="Lama"

pages["index.html"]={}
pages["index.html"].template='base'
pages["index.html"].values={}
pages["index.html"].values.title="Accueil"

pages["ma_commande.html"]={}
pages["ma_commande.html"].template='base'
pages["ma_commande.html"].values={}
pages["ma_commande.html"].values.title="Ma commande"

pages["ma_recherche.html"]={}
pages["ma_recherche.html"].template='base'
pages["ma_recherche.html"].values={}
pages["ma_recherche.html"].values.title="Ma recherche"

pages["nous_contacter.html"]={}
pages["nous_contacter.html"].template='base'
pages["nous_contacter.html"].values={}
pages["nous_contacter.html"].values.title="Nous contacter"

pages["panier.html"]={}
pages["panier.html"].template='base'
pages["panier.html"].values={}
pages["panier.html"].values.title="Mon panier"

-- lipsum test page
pages["lipsum.html"]={}
pages["lipsum.html"].template='base'
pages["lipsum.html"].values={}
pages["lipsum.html"].values.title="Lorem ipsum"

return {templates=templates, pages=pages}
