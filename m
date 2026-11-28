Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887428;
	b=uAEJD4LMAvuwudhiwuffH1nEq+S/8UzvCXuX6ML6DiS2IA1uZ4g6AnRX1BYKCMNJ2sFY
	 5kywuYSvzwvQENgTqsltBhwj76ID5awJqzV4+6vrgpBsOFJVUFuk4P9/KdzYaABiqOmdk
	 /dxBfvoo2E4OcL+WC/qwiTCei+5ndM2V+Gb55O5L3zkEVXdA4j1V+dgNN9jqY7n5E+Q1c
	 PUCytUyYFfX5FfmJ5OlUmSaILL0zkI3SoaZBVbXeynIN3XN6BPEQeTS+k2q07GUPrXTSE
	 6mbx4VL8aXy9sixk6lNFboJ95UNp6IesFXhNpaW70XKLY9mgKH3he/am1fnBR7SgFuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887428;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MjCIaG7j2T2uJmv8PRWYs9Z74U4ALdpHl27AkehCMaM=;
	b=OIwqTIje+yDfKcY/wpWAqeiU1vK6gUf4rnkFCW2osQDPLz55JUYvQCAa0cVcUlBqR4b5
	 YncVg9mR7L0sSw/ZwmQYK2qNeLfO0T/3I3ddt0pVmXnaTYs9L/1BEG9lRo+WHgArwqU4k
	 9ktNcEvWNSHvNCKg7SiL6vRRIep0JrRwb4gAf5B6xB+scg2N2ImzQQr2jhQpvNL7iRlE/
	 sik5dx7qlKri0F/fgaNjhsYdfEUOBPhquDtQxj0I+eybr3Uwglqc1VkOiNftc3nD2yDd5
	 edwh1Wr4hhYL5jGrzexdCKFUWR0/gYaJkXTRnhbF3eOFMG75nSj7DA+jLqEqHcb2MNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4+N7rGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92523606A335;
	Sat, 28 Nov 2026 17:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4+N7rGn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887428;
	b=IRhwTi9D12Ndw4VEKV90cRsq4yqm4NiQgNatRJjag5cU0efHcwOiki1im9DlhkrM3yrE
	 WrkebddM4fisidmN9Xxq++2GbB6Or4iUwvkPnAvBAd9ONFLAwpVFcwKJy/PVMQQNqmACy
	 rixX2Yz9wWDUWxqL6RfA+B4O7rySQWfaVpbZX8E2VM0sZKOBeVgEZ6quRcXhiYDoQun7A
	 72M386SUZ3kD/dc3SBLOVT3G/5+lZakBHc0BMXGVK4AfK7dphUj6du520IRE1cadW99f/
	 XLA1/g/iMpn104fsWuW312vAtEtqHSowuDh//t121LcA3cJzj8GNpyyUWiARouKTj8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887428;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MjCIaG7j2T2uJmv8PRWYs9Z74U4ALdpHl27AkehCMaM=;
	b=DLJh6BgOraVDa34Vn1HLyfuyNZzeNMwawYqp9+YlzcMadEudaDrWkxV8F1mouVYGLigX
	 5TKRiPDyxOYZxnStU5+g0a7MdikfH2Jf88iV3A1Rp+cQDUAPrO5UogVCpHI6eImbLT1xH
	 44ZO3AzsrUiwmn+vDz4mwLO1ta1z0Wdz0I0oS1K+LTfwVe3vXfUVjBHnN7XVmmUdHelXf
	 hi6wq/hOiUWPKr5KRZQymrJHQPXEgDEoE5hC7FtSeiGNR9WLzvEYO0O8FzmrM6YIAIA3M
	 0xADEnAyLA3GgYxotTfE+hQHEvSBD4h+IkhfDdtakyK3W0zQVqh+B7bIEjMxOp+XoRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 902151F0089B;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887428;
	bh=MjCIaG7j2T2uJmv8PRWYs9Z74U4ALdpHl27AkehCMaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U4+N7rGnvk6EGdagsNz+/sxgrkVfbB4jJraVBeU7B+oRMhR6LfxypFcML7fQN0QSS
	 POL4wGxhf1MFGHqZ1xVEWtnB3HKp2y4jLBlumt5+LWipbgpLFvdBXxel7gW9l9UWP+
	 6KDLk+yki9znq1qqjhj277eiwhTH7yF+LpLcPLLF1qZDF/62e8SA38rhQFl5cUqHFb
	 LGpcYPfK4xLTRzOBvrLNJRptxapcOxnaXogKYls/JI9jjqsnZjfuf4nR8oK+rwPrJu
	 wdrnpU8R8hqYwpJOJH+KTnPGQJJXJERroqI8pX79wiLf8OS15TYIKYfMBa6DrNEjdM
	 n8Etj9ZOp/7AQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 214664E1B6;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:37:03 +0000
Subject: [PATCH net-next v5 4/6] net: stmmac: Assert the resets after
 unregistering the MDIO bus
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
Message-Id: <20261128-sun8i-emac-mux-uaf-v5-4-0869f2ccdb8b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887420; l=1603;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=DTcXXb/dRBfp8NpiHWgnCWsLsU86F3mVbGpIU8u2ol0=;
 b=AEKUf92gWY3A4K8xq2XRY0xCM684mn6oYBwycKoJe9TEu88aRMssuK+zyJEcOw9seIPp7a0b0
 YtUDvbnF3kODba9T8TItV75dk0Thym41WLGPrxcv90+nRkDX/E4QbkU
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

stmmac_dvr_remove() asserts the MAC resets before it unregisters the
MDIO bus, so the PHYs on the bus are removed with the MDIO master in
reset. The probe error path does not assert them at all.

Assert them after the PCS and the MDIO bus are gone in both.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1280496741e7..da03a8223bba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8406,6 +8406,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	pm_runtime_put_noidle(device);
 	stmmac_napi_del(ndev);
 error_hw_init:
+	if (priv->plat->stmmac_rst)
+		reset_control_assert(priv->plat->stmmac_rst);
+	reset_control_assert(priv->plat->stmmac_ahb_rst);
 	destroy_workqueue(priv->wq);
 error_wq_init:
 	bitmap_free(priv->af_xdp_zc_qps);
@@ -8465,13 +8468,13 @@ void stmmac_dvr_remove(struct device *dev)
 	stmmac_unregister_devlink(priv);
 
 	phylink_destroy(priv->phylink);
+	stmmac_pcs_clean(ndev);
+	stmmac_mdio_unregister(ndev);
+
 	if (priv->plat->stmmac_rst)
 		reset_control_assert(priv->plat->stmmac_rst);
 	reset_control_assert(priv->plat->stmmac_ahb_rst);
 
-	stmmac_pcs_clean(ndev);
-	stmmac_mdio_unregister(ndev);
-
 	destroy_workqueue(priv->wq);
 	mutex_destroy(&priv->lock);
 	mutex_destroy(&priv->est_lock);

-- 
2.55.0


