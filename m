Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887435;
	b=oVcIseZxSZVL3pI7kJCuWdwqFC0cIm/6psu27rpxCLd2uv3qk74BcNUYrq4E6DR4Nc+J
	 KNYfVkC3wNRKgwO7PaHt4HOPFyLdb0NYiEUazSniaMX7UsRDZhQrtZkXvW2qxNiYx5xKy
	 fnyz8plXcY8QujxruWBeph1GwrRZJ1RgVwo9Y00QSan342/sqzgiiTcUtff8ohaho67Gj
	 OOdGsoTx/u2GmQL5q4WnktQWJU6/rA5FGKUt3gSVHy6inSZsvFE7iL7oZ+r+vrCCCAGFj
	 +o3vfzJx1xU7OtxOp7OQcJ/qtEGpnzUbHe+b/LHXgMoLiKpUxTtwiiTqIzwAF12S6EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887435;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=j9MxUvNJubPH4QmJjFxqXwfWJ2eaM+OK9NJ2IRa8qbY=;
	b=WUtGXOnnZYrB7wA2e4NU8HZQ7juoTVXCLHdj2GXeliTOSYSqFJnMRC+l1rzGnYxKgPHv
	 zSDeTTLvg/CAq2Ul4isPCnT3b2u0ENNTcfo6HSQ/R7OOYk1aXE5p0EqQ6FftBJ+Btu9p2
	 BwYSPjfiA3NsqxgLljh5ogJZtnISvVwsK2cDpatAvLlD9nVqqRAtSwXaQE20T7Hfn1hgS
	 BYiunRxTozku5SXprWXXLkikCn4zKAfNHcl3uWk6IbU1x5YemYklNw34d6i3GK98H2Qt2
	 aASRiq8uI8KWyyKclg2pHrB+BGrvEJ6/NTUxUxQMcEeL97MjouwzhP3xabwTmve0V7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOqyYHVX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CD606A6B8;
	Sat, 28 Nov 2026 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOqyYHVX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887434;
	b=FfHgowmU0AgkwmztHaGmf1AEJyNXLYKnEcJNzhSfuylAtPxQcHkcP65Qzp/Q3C8q3ZGC
	 8n4D8mBJEf5hvfZNsW7eElV33WEcnmWg9wajCLlMsXtqcCFUViZxWcgCX4CaZbW+MasXO
	 Ba0bQh24JCg9pOLIxG6ivEqw74waPlASuTto68SeeeqCrAOVQY+UqHNEK8WKhtjm/Mgjk
	 I6jvsAp/G2A659s09/SWn+fIq+zygtrozURHfQNiv6TaPf1RHYBLlz3DOnW+ZPjHIJKAd
	 9t5h8SLSqcBDpx+tgaqzjsz940m5nYGeRHiwAAj3xmhl7seE6msV7/QMln9rgg+zy9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887434;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=j9MxUvNJubPH4QmJjFxqXwfWJ2eaM+OK9NJ2IRa8qbY=;
	b=luJHr7aZuKkRWL8OKKU1PdvPq8LsdpIbwPuOiH52UhFNRdo8+ouyai9Bmg23bMM1l5fY
	 UWGjcArRsid1Yvk4RVURnef7c4VHnRBDrlzFH+nXCtPf5v7sgZAmRZfXfmFPwLiUxdpRO
	 Akoe9dlecNoU79H+ylQOZbvhKtMQvmOHd9MDuT8upP5ux/jkNO/01nqPUSMwfT/5Igqmd
	 f+XyHK2nQ9gBR1//iBNMPf5o9TleTd4nZdVRz1XPwi9gYsqYUjdN70XqCor5ys3KQhy9z
	 NR3cVuKvrdWPeCGC2JT1SPCTAsGqEAJpufJgHS65CERIH375ihJTkcMWOy38MjazNEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27AF61F00893;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887434;
	bh=j9MxUvNJubPH4QmJjFxqXwfWJ2eaM+OK9NJ2IRa8qbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oOqyYHVXxZW0eX6jN+UrRblpWxHeu/yLd6pi7tKcucIdDejiIvLGrWfNAfp/FnrXW
	 BO4fz2+aPeYrA8iK+UKOtW9SY08P2ZSjOi2y9BFou96GmZNQkgw7QNvfzgjBWGFqsV
	 jUZVc+VSMs0hO6mE6ZWxqfgm1jBzGHreK2wvnGXbeX7j72Ph3Z1EkeGKrDzUtvAJjJ
	 cuAtAHhzrhlZDMaiai4nYHBYHG4YWiKgwWtdvwsH9a7GlRXoA0pAOsxzpVwwDPONML
	 PpKf7gm//pvnpOmJTwWsTqjJmXAborBYR+D3rSeeaIQKxpsx7MbisMyu8e3c8y+Lrz
	 kxkOK04JDyQ0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B02684E1A3;
	Sat, 28 Nov 2026 17:37:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:37:00 +0000
Subject: [PATCH net-next v5 1/6] net: stmmac: dwmac-sun8i: Put the EPHY
 clock and reset after the MAC
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-sun8i-emac-mux-uaf-v5-1-0869f2ccdb8b@gmail.com>
References: <20261128-sun8i-emac-mux-uaf-v5-0-0869f2ccdb8b@gmail.com>
In-Reply-To: <20261128-sun8i-emac-mux-uaf-v5-0-0869f2ccdb8b@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887420; l=2186;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=b8p9lz3zAv6zupWMcRQ8N3WEXAxq9R0CfxkU1Sr3FIU=;
 b=baod/pA3put8iaWYuTGkNEVskEqoo1OXc6gpGAldGnvaO1NtT8IGK9FCUWGnaAyEfE5fpXqUH
 S4XtvhUnilzC5h93nD6ZgDQ45uR0eoSnZDPnidLU+d4Ww/GSoPcH7Ed
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

sun8i_dwmac_exit() unpowers the internal PHY through ephy_clk and
rst_ephy, but the probe error path and sun8i_dwmac_remove() put both
before stmmac_pltfr_remove() calls it. If mdio_mux_init() fails after
the scan of the internal bus has powered the PHY, this is a
use-after-free.

Put them after stmmac_pltfr_remove(). The explicit unpower in remove()
is then redundant.

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 613199da57c1..26744693e93f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1256,7 +1256,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		ret = sun8i_dwmac_register_mdio_mux(priv);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register mux\n");
-			goto dwmac_mux;
+			goto dwmac_remove;
 		}
 	}
 
@@ -1264,12 +1264,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 
 	return 0;
 
-dwmac_mux:
-	reset_control_put(gmac->rst_ephy);
-	clk_put(gmac->ephy_clk);
 dwmac_remove:
 	pm_runtime_put_noidle(&pdev->dev);
 	stmmac_pltfr_remove(pdev);
+	reset_control_put(gmac->rst_ephy);
+	clk_put(gmac->ephy_clk);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
 
@@ -1282,14 +1281,12 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 
-	if (gmac->variant->soc_has_internal_phy) {
+	if (gmac->variant->soc_has_internal_phy)
 		mdio_mux_uninit(gmac->mux_handle);
-		sun8i_dwmac_unpower_internal_phy(gmac);
-		reset_control_put(gmac->rst_ephy);
-		clk_put(gmac->ephy_clk);
-	}
 
 	stmmac_pltfr_remove(pdev);
+	reset_control_put(gmac->rst_ephy);
+	clk_put(gmac->ephy_clk);
 	sun8i_dwmac_unset_syscon(gmac);
 }
 

-- 
2.55.0


