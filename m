Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887439;
	b=FReyIjILAYwySlN4DErRB5UPJW3SwRixOY9fdSLxGG24M/1Y8Zpz4Bgc7CsZweB44p0w
	 hdGGWihatVOmGkJqz1ikolcdLc22RKtLysdP2wY0/9yyRy9ki3SgRzGCJPC59Paw4aFXR
	 MRPvZeI/Nfz59DA//XhR686p/qhutiVUzbW1UnlyDbhCDGff1nMPb1xWKbNbONh4gavvY
	 YoDhrwdnslzctj8nacupnSmLzmCIFktLI5C88JZN0J5wEMFfX+iZUUujrrt2wlYIwpXUJ
	 v7EnOe9DJRRX9VV4KKgqg3QKsXiAB+LDJHdX2koatrC+4Xbn5rYtO0VRR3bykHurcWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887439;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F4ek9UYmclTLPaKcYtcgGP/XCx+3COyCTCJutZB8xVI=;
	b=jpB4k16eYCL2wpBzZlumr4r23rB7vgVBsjVUG6zbNmPV6tlYU/NN+qqije37KY8QL5lR
	 Z2uQyS3/QBaJqNDNx3JoTufc/dgZDVba9Ghk2QP4NR7InlNRjMFPwSwHesexEffc2rXAp
	 kg9FqyOXObrss7+/JiR8cnY3zC4Zfyxz2vm+SDGGfrw5Ib2OZsGQKPq+ZZkyG28HtApIZ
	 +AXJBagJrTQwgY1Re3a7X6kg0rHM5bKfsvgUqmXUne6OiAqyg8HfyLaEIjhmpMdAejGMW
	 qbSGzPLLCdpoplq1cCbEyJvGYtguFsrVhwFAr7D9OY/mRT+JsCni0YTS9UFCx4o4P/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ5eXvIz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA49606A323;
	Sat, 28 Nov 2026 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ5eXvIz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887438;
	b=fExwnJVo7QJL4ghWfEm4eMhdrbOU5jlNnLebXzurNF7eAZsRyOwgWvrYBy6QBBPrJTg2
	 P8KKcIBkH9oOC+jCzPGqQohtcWPllP0g6XH37DJz9Ep+a7BrSZDBej4ZsQELT9AFd5Y3f
	 3NY4lqn8o+9hZga1/sh/wjZW7us/wyEPVfVQMb0AtLm5Ws7vh+iV6HtcPRRoIws1G+nAh
	 4raciTbsxUFkxM5zY2YXrhbJUneJ0qd2Krznyv9lD9fc/ozQIS1rAoW3h+YrUtiZ+QgCg
	 G8c3wQmPHTDfKnGoEJ55IF84Q62cwPNM6UGE3NHrTHa176etMmlpwmUZNN6dz+LN/2w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887438;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F4ek9UYmclTLPaKcYtcgGP/XCx+3COyCTCJutZB8xVI=;
	b=VPBKbxCd5YvZYGGlTZ/lR++rlcSJF3G4kwrHDwH2ARPfaCFpbkAwXcNgAAdPUOVpRGkp
	 rgEnvT+m6s9tFLBPbESnCfyKEgIPGRblSdh1ag+W0nkowq/xOBz3BqMBKzdoyJ+WBajeF
	 FC/1HVn+WWyzPZDwgRauVhNih75/PNB8eCdEp7VjA82Ksflk257WdqkYAflP0YxHQH0Lz
	 HLc6uThFe2zI/gOx8Mf9POzHKmZ28ICtjoeyMu5PO/PJYE8rkHFD0WuWTwLws7H3I35+b
	 NZP3z6nZW4uZzOmgIlXw/1cuZcSvjIvMCvt7Fgv4AaNn6VLpOSu3EDmwYf0FFVNub+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7057C1F00926;
	Sat, 28 Nov 2026 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887438;
	bh=F4ek9UYmclTLPaKcYtcgGP/XCx+3COyCTCJutZB8xVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fQ5eXvIzHLlsbXbUFGD0Rq1YA7H33w5rSyvIQ4m4Oe53AcN7hov4cicIHDFweFwJ1
	 LS7waTDIjQz8Sw7QjWEGgsaAWCkxDC+cAr3MqEMyAhTogK6YokObvpjoJQEQRry5sq
	 P7YEZ5BiSCrEdSh75GL/Z+SMkBgNokJjceG3xiaJsPHitiIKdIjh1qMc2hPjg9HrlU
	 p55/k7WFNJpgpBCJ0Tjo30SWVav1HyQmRcxoO++wyIvgNFWGY7YAbZXX54RejyvXYb
	 bXh4MiKaEE5XJ0p4OWiSayAEQypxFnSVOzsL9Wa8p8jB+Pc1Ll4H3z5yYbpGSdtBnS
	 H74gmPPIURMsA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 418854E1BA;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:37:04 +0000
Subject: [PATCH net-next v5 5/6] net: stmmac: Add MDIO init and exit
 platform hooks
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
Message-Id: <20261128-sun8i-emac-mux-uaf-v5-5-0869f2ccdb8b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887420; l=2267;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=sU4OlMg5eue6XUYJySuNOsinRijL+atE1x8U133YDQM=;
 b=tti/PpR+O7WEXV9w5+WzUOeBJXHtLQUROe4pAggucvugryhlXV52A5oVyLJAZhotgZMZ8iOyT
 4HghA+OARWqBaVZf7bvCW49gVTanwZpUdZ+4YThKkCGV4SaMQ+ErW6n
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A glue driver that adds devices on top of the stmmac MDIO bus, such as
an MDIO mux, can only do so after stmmac_dvr_probe() has registered the
netdev.

Add mdio_init(), called once the bus is registered, and mdio_exit(),
called before it is unregistered.

Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 11 +++++++++++
 include/linux/stmmac.h                            |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7396b68899c6..fb1f7b1a5323 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -682,8 +682,16 @@ int stmmac_mdio_register(struct net_device *ndev)
 bus_register_done:
 	priv->mii = new_bus;
 
+	if (priv->plat->mdio_init) {
+		err = priv->plat->mdio_init(priv);
+		if (err)
+			goto mdio_init_fail;
+	}
+
 	return 0;
 
+mdio_init_fail:
+	priv->mii = NULL;
 no_phy_found:
 	mdiobus_unregister(new_bus);
 bus_register_fail:
@@ -703,6 +711,9 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (!priv->mii)
 		return 0;
 
+	if (priv->plat->mdio_exit)
+		priv->plat->mdio_exit(priv);
+
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
 	mdiobus_free(priv->mii);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..a67f1f71eb28 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -296,6 +296,9 @@ struct plat_stmmacenet_data {
 	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
 			   void *ctx);
 	void (*dump_debug_regs)(void *priv);
+	/* Run while the MDIO bus is registered and the MAC is out of reset */
+	int (*mdio_init)(struct stmmac_priv *priv);
+	void (*mdio_exit)(struct stmmac_priv *priv);
 	int (*pcs_init)(struct stmmac_priv *priv);
 	void (*pcs_exit)(struct stmmac_priv *priv);
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,

-- 
2.55.0


