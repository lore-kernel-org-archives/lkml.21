Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887431;
	b=NSTHJSjE2LhhxUaZAVXjIYfto56JMunEWUe8nYobQOA0LBLWTM4K0n8AZsGYRBe+t985
	 VLZv8HCNUoKl09nKjqdqhhA2pzmaMOjK8licqZHS3Q90bc+MqKiJ1xdsmg65HPBHG2u1P
	 OwDI6dEbV5Anf9rn686BKUarUopGmKTzHlncX7oz58fliBJXT2ZCDsk3r773jE8cGZLz0
	 Bh0YxWSnjZNwNSOXRagT4IYHPky9tqLJWNVNidHqppogIdd6V3X007weU5ZPxgdZZwJIg
	 2bVhDBcmeszMx/vyMjSsQHhze1H1a816TTZPhO29ENKLqL58SqVq8HLQwbVlK+7d4IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887431;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5vVMaL2WoNUWtP5izbfKZDJjPH4S44S0rvIBTf5AQwA=;
	b=pDE54BeoYtYBS77w56zSmuFHHuh5sZNsj3pfOl1Zn8g32FCDcUtnTPJRv21LDNeWtEj4
	 AORm/jtAdkyDLywC/b0iaBd6ecHVm7YC8h+BQoi0Y49UaKpC92bJOj7BhiQYiroNTthNz
	 bIL78AyCxoHKyz6uIF5IhvY5RmlxVzCnIMNQnNlZ/DojeRuAzhPHfQWy/XUDhZY0VpXVf
	 z7wHDAJFXVW1BsLysM6Gjv5AAYAcvSnO9Yfbj9oT1ww34WdyK+vhk7JpHfl6/xsREZI1q
	 tmHi+rRNqpDIl0Bs/jCrPtrrjdDR7b0sG/alg7nL99anoEd5OhyqO1tMkCZ3wR9sLyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUt5Amur;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9F606A335;
	Sat, 28 Nov 2026 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUt5Amur
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887431;
	b=TfrY79DaPtrhPcyfarRJ8YTWSJ872trpiMyZXDi5raMISb295l+ul2UlJG4Bt4RRwo15
	 xkpRWzQoYeudTgGM9puUj1dd3s++06+/bdWOzrQhskurJRNqXu+xEXHk/MVbxW01MudOX
	 B9O5EXFRP9GP0kVo3Yw+B4San6sUt3bQ94BkqOZcXnX3Z0V+G6Gs8QTVGt4+VrlmMzrLF
	 j5DOssAvc9AZ48/Gegj5bqLqD9OBVB9QuZIeTJm4LeVVOD3MhElJxFv+fl1aZSGp8snIU
	 2623dO32Ip+VBnhBXxKml6SB1J3qKViaIT4iE66RZxjahbgmBtrdQsQ2j3ddBPfKWPg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887431;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5vVMaL2WoNUWtP5izbfKZDJjPH4S44S0rvIBTf5AQwA=;
	b=Q6IiNud1R3nD4g4ugG0ycB1ytkbpH8l1rW66uJHcyQBejYIQUiIDZSZQYl2LKrnTWcd0
	 /mzuPW4ZYGoPnP12L/rkNAq5BlFFnCUn/jXebYigERILeJbr9Vco8rfe+p4f4wiLjnyz7
	 B48be0xagr86t7Ut8SLAcZYWzS/DTdVthwtKWZZoY8pKDnpci/lQb9iwraxDvWm5UxW/G
	 gThK1c8aa3ZGnKdEf6Ue6QJPPn+rX63ik3Y+/9UNcMznl5iLtstAEd5d46Sj8fynY7vs3
	 BgDW6CaWAAqBz/6FhcylvM+6huHs8l8Uw26Goqi5iWOzaZeuHdnXFiUB/ttJEZVndeg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49DC71F00898;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887431;
	bh=5vVMaL2WoNUWtP5izbfKZDJjPH4S44S0rvIBTf5AQwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dUt5AmurOAIGHrZw+tViI1pJSkkMvpW3xS7GSz8lle1GAv4W3Ii8lz1F3ul6mMfNV
	 U/ZrW9F+SsC7B76RC6hwj8skIBPCPZc9SF/u7zEq5yuqFpeydIirfWBaM1Pjs45O17
	 jIc3YygsxuWwgpl6bSC7rzmH/sRA3Rey3Y+ab4xAqf4bFBXa/3uiPPb88tdHBVYVSU
	 cCm5yqVo34l6ql3obPlKdU+7jhO9FYU02bOyEiARzuoAZoThmlXyb4wgOMbUVMutCq
	 w9ge2P6TEaHaqnwJFEVmidv+k/bQLpjxdW6HYQZWRt1qOr/Wg+ccPSRWtubgsOpDv8
	 TL+0yTcYyrD3A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D26434E1AB;
	Sat, 28 Nov 2026 17:37:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:37:01 +0000
Subject: [PATCH net-next v5 2/6] net: stmmac: dwmac-sun8i: Get the EPHY
 clock and reset before the MAC probe
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
Message-Id: <20261128-sun8i-emac-mux-uaf-v5-2-0869f2ccdb8b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887420; l=3900;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=SUsFtWJfutSd0Ot3xLTIEXYdZNvfXec2HzH4/NUqExU=;
 b=1K36yQLgnoCBX9HZRJ6cDYGhP637fEJkOoUiicw2psv3NY/i+79+PKH1r6rB4gs78/kjllE+s
 DlulXzBhnxtBZy1fhv2/eedKlXDxWOggZXRbPg29FpFIfTeXeIIdBtD
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Switching the MDIO mux to the internal PHY uses the EPHY clock and
reset, and a later patch registers the mux from within
stmmac_pltfr_probe(). Look both up before it.

Also defer on the clock, as on the reset, instead of skipping the node.
This only matters if the EPHY clock has another provider than the EMAC
reset; in-tree DTs take both from the CCU.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 34 ++++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 26744693e93f..0ae0888467bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -795,16 +795,15 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 }
 
 /* Search in mdio-mux node for internal PHY node and get its clk/reset */
-static int get_ephy_nodes(struct stmmac_priv *priv)
+static int get_ephy_nodes(struct device *dev, struct sunxi_priv_data *gmac)
 {
-	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 	struct device_node *mdio_internal;
 	struct device_node *mdio_mux;
 	int ret;
 
-	mdio_mux = of_get_child_by_name(priv->device->of_node, "mdio-mux");
+	mdio_mux = of_get_child_by_name(dev->of_node, "mdio-mux");
 	if (!mdio_mux) {
-		dev_err(priv->device, "Cannot get mdio-mux node\n");
+		dev_err(dev, "Cannot get mdio-mux node\n");
 		return -ENODEV;
 	}
 
@@ -812,7 +811,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 						"allwinner,sun8i-h3-mdio-internal");
 	of_node_put(mdio_mux);
 	if (!mdio_internal) {
-		dev_err(priv->device, "Cannot get internal_mdio node\n");
+		dev_err(dev, "Cannot get internal_mdio node\n");
 		return -ENODEV;
 	}
 
@@ -821,8 +820,13 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 		struct clk *ephy_clk;
 
 		ephy_clk = of_clk_get(iphynode, 0);
-		if (IS_ERR(ephy_clk))
+		if (IS_ERR(ephy_clk)) {
+			if (PTR_ERR(ephy_clk) == -EPROBE_DEFER) {
+				of_node_put(mdio_internal);
+				return -EPROBE_DEFER;
+			}
 			continue;
+		}
 		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
 		if (IS_ERR(gmac->rst_ephy)) {
 			ret = PTR_ERR(gmac->rst_ephy);
@@ -834,7 +838,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 			continue;
 		}
 		gmac->ephy_clk = ephy_clk;
-		dev_info(priv->device, "Found internal PHY node\n");
+		dev_info(dev, "Found internal PHY node\n");
 		of_node_put(mdio_internal);
 		return 0;
 	}
@@ -1229,9 +1233,15 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
 
+	if (gmac->variant->soc_has_internal_phy) {
+		ret = get_ephy_nodes(dev, gmac);
+		if (ret)
+			return ret;
+	}
+
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
 	if (ret)
-		return ret;
+		goto dwmac_ephy;
 
 	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 	if (ret)
@@ -1250,9 +1260,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	 * so after stmmac_dvr_probe()
 	 */
 	if (gmac->variant->soc_has_internal_phy) {
-		ret = get_ephy_nodes(priv);
-		if (ret)
-			goto dwmac_remove;
 		ret = sun8i_dwmac_register_mdio_mux(priv);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register mux\n");
@@ -1267,10 +1274,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 dwmac_remove:
 	pm_runtime_put_noidle(&pdev->dev);
 	stmmac_pltfr_remove(pdev);
-	reset_control_put(gmac->rst_ephy);
-	clk_put(gmac->ephy_clk);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
+dwmac_ephy:
+	reset_control_put(gmac->rst_ephy);
+	clk_put(gmac->ephy_clk);
 
 	return ret;
 }

-- 
2.55.0


