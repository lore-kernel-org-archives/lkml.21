Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887433;
	b=KUeVRFCwI1iBmiuk4RtnQW3XXdObn/3Xq/MtZH9DILIfTRZiV9oFGuBGGUUjaVGHEvwW
	 5OzpeUhJPSHxnmr5s39x44hLhidhRZldcTdAd35JaO4DQ3v/vgqblHwmBfH70v9jkPddi
	 F2btO0UYyjb0eGgxsZxe18mjvpmTVwt3XuSTiO5Iilwq4ZZ4NcGBfo+Dz08XN0oappDYO
	 hs8xpayVTeD35bqJxjARySJPirSGAnSAEYomLB3G8E4LK5H87hUVJDDn/R4nO2X55+YI7
	 08ySOm3lvO7Emnt8k+O3x0iCqnC/cGikhGkF1+zkXzp30xOp0zPEhlWbAYULa37MvZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887433;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fUPE6w5YiebuqamtEftvySmxsc7jqCcj5zEzC+EdRhE=;
	b=E2In84v835+L2kfT5rAQhdE27Xwz7eBjm/6LJkDdOtL7iYRD/zOeNuqpI4tGZmPNovwy
	 aP8zk9Cip0S6s2fmfPxMS9IQvZJuOI4djEDhCtdh1P+2dCBAmgzlXCDkb9NDlNYdWpGX0
	 e0yA/RXLC4FaXZRMVa53brsf4+mQYVQ0Z+pyHOi2xMg73mlMfPG71J4uAN52wElbYrtxu
	 DG+JH4HgouGmRnI/M/ydo3MdkdLMoEK9JfwAoMyOA7x/qtUmFKTd9dCcgr8hK8M0cTGLu
	 WY+zAs4dwvHokiBZLqe1GgWjGlQs5JzMQCCP4ZZfwBGsPBmgKAj6sCoG6XrEH7ZaOzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxFFKp6F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210E606A33B;
	Sat, 28 Nov 2026 17:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxFFKp6F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887432;
	b=j054Z3ILtBh6fsvIJdvJPPaWiqxQkDk4DSw11Ss7hd61Qrx4TWiS8xpJzUfLgI234kDi
	 l8iE3CakyCEvhiUA0UUJZ0pVZ74Nx03GqOuGbep4LrgZh1SKYhLBDa0qZSikGbqrShEHk
	 QBtVDyU27IiwJTWz3pUWvI24N5TyU9BrPWY0pI/3Fx6esVC4AuRR5QwfplnltJdQHRyWA
	 7QHaA7fUC5QCadbTGToRkdV+TmiIhoULyFhwrZVHUyslm/p1T/AAa0MImkNIzT2aNhhp7
	 ojm6UP9a71jK9KiYu8h8uQ+5LJn2Noh6/zMCAX0rbwWa9P4u0s2NuI8F0YE3oDUd3sA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887432;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fUPE6w5YiebuqamtEftvySmxsc7jqCcj5zEzC+EdRhE=;
	b=zLLJfozSSgbRtDmYyPawOQVxSVCp8DCOY6te0xZbNOriCG+tNcYz3FCIakZf8mEsZCbP
	 9WmK/QrCULgUTofUShQ6aYVf6OBR60mOYkoYbMfKjK+Bs5VHCDMnWsemVUmHChbsdOV3h
	 QIfCwEzFTpu9bNYOEYlsp5kyG/Ye0mSieHPBkzDlcCjESyqY4crCTIXN7q9QCk3gdIHO4
	 9mIs8Xf1XIdGYwOColE815eFvBshw+jvVdjt7cuxb2rhTJ31NBJLv48O3rpwiduB8aNoV
	 M4VhxIU9kGlaHfzymnzY/ojs7G41cQjvN7xs4dX/cYmFxcekxyTVcNt8EGuRJNnUyZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70ABC1F00899;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887432;
	bh=fUPE6w5YiebuqamtEftvySmxsc7jqCcj5zEzC+EdRhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HxFFKp6F0FAqVH5y9rB2YjWbh7eRBU1ESha03D5kTPBfKqJ55J93NeNxOvfumYG36
	 6nSgbwHlaHFMPs8rC4rE7JOGqwTPruaKY3uE8B5UXD7JG0MD8oGAuP1M29zAYRptJu
	 wjTmaiRLcjw5pf1XBSI5xADKeaBo7kFii10nIbYB/ngXXCyymH/qDfB9lp44PbJZfd
	 Mf/A16xWk+kMVttfLL9GJXfuCd/1Y+MYAR1Ub+xWO+l2eYESeLS2dOax/NswCJ+8yL
	 NDt0dd5fhgafwZcZpglCp5ahf2W2IqA8P2Sgq3uS5kprLv80912GXIxOhE1pWzfMBD
	 /fi9WXeZg2cLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 004074E1B2;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:37:02 +0000
Subject: [PATCH net-next v5 3/6] net: stmmac: Balance runtime PM when the
 probe fails
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
Message-Id: <20261128-sun8i-emac-mux-uaf-v5-3-0869f2ccdb8b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887420; l=1668;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=rH+Zx3E8Ab2jJngSw5MrXl2wadN+CIxd4Z/MEuIR690=;
 b=ZZuVlul74eZkfRspC30kctOJoK9HdJwPwlJ/KX46SvgNxnRgyEMr4Cncv2SZewpcMNwNFzrPy
 F5dOSRPvzhXB46a1Rn8reIJJDoDxpC50zsJ4rhZI+OH3y6nP4dvPCNe
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

__stmmac_dvr_probe() takes a usage count and, unless the bus already
did, enables runtime PM before it registers the MDIO bus, but its error
path undoes neither. After a failed or deferred probe the device never
runtime-suspends.

Drop the usage count, and disable runtime PM if the probe enabled it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca4c7fb11b73..1280496741e7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8091,6 +8091,7 @@ static int __stmmac_dvr_probe(struct device *device,
 			      struct stmmac_resources *res)
 {
 	struct net_device *ndev = NULL;
+	bool rpm_enabled = false;
 	struct stmmac_priv *priv;
 	int i, ret = 0;
 	u8 rxq;
@@ -8343,8 +8344,10 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	pm_runtime_get_noresume(device);
 	pm_runtime_set_active(device);
-	if (!pm_runtime_enabled(device))
+	if (!pm_runtime_enabled(device)) {
 		pm_runtime_enable(device);
+		rpm_enabled = true;
+	}
 
 	ret = stmmac_mdio_register(ndev);
 	if (ret < 0) {
@@ -8398,6 +8401,9 @@ static int __stmmac_dvr_probe(struct device *device,
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
+	if (rpm_enabled)
+		pm_runtime_disable(device);
+	pm_runtime_put_noidle(device);
 	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);

-- 
2.55.0


