Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887441;
	b=HU71EhCKs6XNRAO9TmMgho4MXlrmOr8FLoq9mT+NXyMjbaAs/qwyClxp7yhYvNai1FDF
	 5m70wKYnpOZITIynLjAEzuJjiTq5gphxxISOgFwUW/+3i3InCHuiZMemqAv0mFIUKelxp
	 sqA49OI1MEUStgPCll8FhbBwdNNoJ0YYPPym26E2ufXrYjWZoMEchXHki/1ac+Rso66gC
	 O1zIIH9TTAKsXtxzcL65CJ7L7elu7m6R5/ScN13oFgh16lKf8VuIfJJlzC0vUPq4fEDXr
	 6hdg2GMEVnrGqdMjYVATd1rdskX7E6aZRjZScpXWjHIoqw9N9zf72xLNSoe1TFiNrjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887441;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/0gHURhkLbMVwQ94P8BZt2UDw9G7o7asCUiVtZ2+fYo=;
	b=rWJhGkoHmW/dkt86sGHDwIsxsgXs6U3jIwrsq3c/GD/IwFCvUJ0L9CXkaxLVdtSKN157
	 IxztmkehgbYM7WncrhsXm4VdjQemRXkwkw4D5L/4RHFt/MHeMMA6VUv6vKnyVSagQ0xB4
	 ETbYZeJqjrN0fusPftbwJK/L5+a+g3cEI+jOrh8JU+SYeplalFBwZp8yCMnu/Ri8y0SzD
	 c4srqh4+2OBrppSY6IlyT8u6oDGBzaH9GNUhSP8RCzUIJ9OyV0gzrRaRvQOgq+f+sMICT
	 jUNWoa2xQgmfSFWvfZEY1q2wEsBIL08As4EV+FPUlp57a2ZnfTflLuplearkKs6R8Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGv5e9Li;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC1606A33C;
	Sat, 28 Nov 2026 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGv5e9Li
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887440;
	b=KtYzx2/w1Vp+31cOaA+bCIG26RGLMhqi7NFvcWTY9paRpUg5Q8DmCGTaSNIjcezP8DPy
	 fowY5t2KOtal8MkZd6Jpi8VlV3dYzV2tQuOHCakot/nYCF9/ly7vDU3rrRQyNK5N7sxnX
	 vq6tIsBSEqKRsJ5taLd46DtNqEHfzoJycdvR0tb2y8jx90ZTpWAig3wvHRLXQI/oiVFyY
	 0ymlOg+SlKbaNXpPuR4jl3XSF2XzxXmEC1op4pBQELZmg8lEufjNllfdRpl9DZ0cBSeEB
	 sSh2DIqwomqIdCgRVBvN4lDBP0a5NGw4U8D+jACIDXJkfOFIi+kABAwoQPw1Mt4zA1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887440;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/0gHURhkLbMVwQ94P8BZt2UDw9G7o7asCUiVtZ2+fYo=;
	b=A1u2v7v+QX7/XFmCTF7S8b7fwJBYPhdIUpYsX9IrjaZcKdZo3LSsj143tN+oiaGppXqP
	 4aXTpjMSBlfBh9Z8Gv3cFkg10dSeL5jY/vW7A0NJ6JjoMSENNsZTHH7SHfffLADIknPDe
	 3y9cRM6kfYN2GLHNOBWJTLVLjt/tM/vT0LSx3wCkCrOwGxocbaIjPUP/0QWCVe8B65UzZ
	 GQfMG6c0FHtTmNpea0VaUpfMZHkWO37tDC+rzd514FOZ3r6no0Pu1Jx5EmPVE28Mc1wVZ
	 mJx51p9MWDS2zFv54a/koE3VSPtowZ99cyG+sg9+eGuZonRE50yFY95KNNwukW3Z1LQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73FB91F00927;
	Sat, 28 Nov 2026 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887440;
	bh=/0gHURhkLbMVwQ94P8BZt2UDw9G7o7asCUiVtZ2+fYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hGv5e9LiRuRGH3/DTL+lCCZcZqEK5OR+qYAl2o3/yOoXGTtM2hhECCzUUMBxAsY+8
	 VlhFGKIXONcnjLPwS5qy7tGQnDNcZiFxlxl7fETa2vizuGqi35q4c6sqGuIzsXcotY
	 vP4MogUGMDKKHqGzy9gIMEBTKhRm9QSE3bRC5wdar6JwxmCrCTM72J38ewElPZD2wO
	 FO6jfd132nCaA7F8AtgYuvE00JCCJkQD4tSBfDN6cRVm441Qt7mWCJGp8BPBiQ7LNu
	 AN9Ykk1VzUZ8nPy3K0PIMzChkyLuExevLzVQdbq/fRm/dAMnxDfmjt7Za2f5fE3ADg
	 5cHWmMKij0sBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 617BA4E1BE;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:37:05 +0000
Subject: [PATCH net-next v5 6/6] net: stmmac: dwmac-sun8i: Register the
 MDIO mux in the MDIO setup
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
Message-Id: <20261128-sun8i-emac-mux-uaf-v5-6-0869f2ccdb8b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887420; l=3534;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=06xMMbK7YMcRgRF52+HyeLRwttdqVvbxWi3c45LCb9c=;
 b=LedbXetbsn+G/QRIf+sec51VZmTvG7/NHISEeTmdSBC2nRVIuYgkHVQG9THIY7usAiKbTRG34
 WkoFaYfUdsAALnVMg1UMF/a0DDanu0wAxXdZ+MxsSsV1IGXuWiN9aYd
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Both PHYs sit behind the mux, but the mux is registered only after
stmmac_pltfr_probe() has registered the netdev, so an early open does
not find the PHY. On remove, the mux goes away before
unregister_netdev(), and unbinding with the link up oopses in
phy_stop().

Register and unregister the mux through the mdio_init() and mdio_exit()
hooks added by "net: stmmac: Add MDIO init and exit platform hooks".

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 41 ++++++-----------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ae0888467bb..09f07546f08c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -18,7 +18,6 @@
 #include <linux/of_platform.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/stmmac.h>
@@ -961,6 +960,13 @@ static int sun8i_dwmac_register_mdio_mux(struct stmmac_priv *priv)
 	return ret;
 }
 
+static void sun8i_dwmac_unregister_mdio_mux(struct stmmac_priv *priv)
+{
+	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
+
+	mdio_mux_uninit(gmac->mux_handle);
+}
+
 static int sun8i_dwmac_set_syscon(struct device *dev,
 				  struct plat_stmmacenet_data *plat)
 {
@@ -1153,8 +1159,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct stmmac_resources stmmac_res;
 	struct sunxi_priv_data *gmac;
 	struct device *dev = &pdev->dev;
-	struct stmmac_priv *priv;
-	struct net_device *ndev;
 	struct regmap *regmap;
 	int ret;
 
@@ -1237,6 +1241,9 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		ret = get_ephy_nodes(dev, gmac);
 		if (ret)
 			return ret;
+
+		plat_dat->mdio_init = sun8i_dwmac_register_mdio_mux;
+		plat_dat->mdio_exit = sun8i_dwmac_unregister_mdio_mux;
 	}
 
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
@@ -1247,33 +1254,8 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		goto dwmac_syscon;
 
-	ndev = dev_get_drvdata(&pdev->dev);
-	priv = netdev_priv(ndev);
-
-	/* the MAC is runtime suspended after stmmac_dvr_probe(), so we
-	 * need to ensure the MAC resume back before other operations such
-	 * as reset.
-	 */
-	pm_runtime_get_sync(&pdev->dev);
-
-	/* The mux must be registered after parent MDIO
-	 * so after stmmac_dvr_probe()
-	 */
-	if (gmac->variant->soc_has_internal_phy) {
-		ret = sun8i_dwmac_register_mdio_mux(priv);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to register mux\n");
-			goto dwmac_remove;
-		}
-	}
-
-	pm_runtime_put(&pdev->dev);
-
 	return 0;
 
-dwmac_remove:
-	pm_runtime_put_noidle(&pdev->dev);
-	stmmac_pltfr_remove(pdev);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
 dwmac_ephy:
@@ -1289,9 +1271,6 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 
-	if (gmac->variant->soc_has_internal_phy)
-		mdio_mux_uninit(gmac->mux_handle);
-
 	stmmac_pltfr_remove(pdev);
 	reset_control_put(gmac->rst_ephy);
 	clk_put(gmac->ephy_clk);

-- 
2.55.0


