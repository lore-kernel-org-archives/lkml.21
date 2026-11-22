Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358989;
	b=Y/rsAC3m8aU/B50ClLtjSvn6+siBqhWuI/i8vg7Ic6Jw4mGRV0HsKyDMsVYltwZaDinF
	 z4RdTa0sxMnK+4QDQlhRRQg1gaYxV67yj8DDucWSIXhigf7Vl80dWpEIebZKYArmL5Vvt
	 pZMFH3uAy4zoJ6xKJpMhTj/69DR8+uMYLUeqSBjethvlhbgTB/8C+ebjZqNzFSdJgQlZs
	 1zzh+NPgzAxSuUCyyFqhanHgvchLjaNy+iuXBZk7PHiQ3NPkjrzlSsnM/QD/0LGe5zqno
	 zkmDp/JaQS4hjSoi13Pa0CW9nl9ZSbtSdZCjjafGP4IBy8JjyOwqcH+LPJhi5mUDS+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358989;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=90uW9vPXKmWFpzCjI8Up2KnoezPG5Nbi1kLisqyflSw=;
	b=1EfYVrWE/n2/sV7SRXSJq71pH7IE2keR1XuV5sJ6D2PSmtLX4Hu/YT023uAzAO9dVbAV
	 XhMduQ+qjuY1igbyD52+vxKLTwecq5l1uyik0UMMLlLXbAv7GPe1AKS8cR2Lpl6O4+tQY
	 HMb5uHjivPyncZ3RC4PIKcpJ39JK4TqC1g4IXM3oOh4xxu4fj5K6xpZZ2JL5gWzKRfI7z
	 hVr3tqGQNTyS3EAACXgJ+sQWIfpbIOBpYjXHgMXQqWsed3dPb2tKtsUFCMEsKt9/nH2fT
	 K6Vc6PKzV6gPpPv8DWZD4+2uG3lj5WBIc+zldH8Y+cKFsv0FXrZejdSvbSxkjdGOc3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b3pc9oae;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D15C606A68E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D15C606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b3pc9oae
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C537D1A1709;
	Sun, 22 Nov 2026 14:49:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93B7D60512;
	Sun, 22 Nov 2026 14:49:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAD8111E62396;
	Sun, 22 Nov 2026 15:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358985; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=90uW9vPXKmWFpzCjI8Up2KnoezPG5Nbi1kLisqyflSw=;
	b=b3pc9oaep+z/bJD4QxXY7ItQ9Mhm9vK4KSpxC1+FEcS76h22AnJdRuLoNc2vDv2VilJxFk
	XB10alWQcDGW5eq/DgZ3BjLf0EqkZ5GLTejX3nEtxaOezKR01W/uW5k+u9wXaFSs+dboIo
	pEo2LIdE1Zi4EZyGfElNeXUfsrrzZ9XSZRJqphfKOmNb5pUtqetPEu52IQfNs77C+A89Ew
	FFCVUTg+XhoumzBDVsrCjP19/Rcn4T0G+TIX63yPiJ927z1sqUD8F+t+g/tcWrsQE387al
	WBqva0f/+8krqadVlEp4T/1ZzzzHyE7mvP2VEoERJYKrrdLy4wWRKJTHbzp/1w==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
Date: Sun, 22 Nov 2026 15:49:24 +0100
Message-ID: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The TX flow control mechanism needs multiple things setup to actually
work:

 - The TX_FLOW_CTL_EN bit needs to be set in the TC_FLOW_CTL register,
   this is already done

 - The RX fifo thresholds needs to be set, to indicate when the MAC needs
   to start sending pause frames based on the RX fifo occupancy, and
   when it should stop.

Let's configure the threshold the following way:

 - Send pause frames when there's less than 2K left in the RX fifo
 - Stop sending them when there's more than 4K left in the RX fifo.

This was tested in Allwinner H2+ using the ethtool -t "flow control"
selftest. On that SoC, the RX fifo is 16K.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index c63f4d87de50..75c743dfe348 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -202,6 +203,11 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 #define EMAC_RX_TH_64		(0x1 << 4)
 #define EMAC_RX_TH_96		(0x2 << 4)
 #define EMAC_RX_TH_128		(0x3 << 4)
+#define EMAC_RX_FLOW_CTL_TH_ACT	GENMASK(21, 20)
+#define EMAC_RX_FLOW_CTL_TH_DEACT	GENMASK(23, 22)
+#define EMAC_RX_FLOW_CTL_TH_2K	0x1
+#define EMAC_RX_FLOW_CTL_TH_4K	0x3
+#define EMAC_RX_FIFO_FLOW_CTL	BIT(24)
 #define EMAC_RX_DMA_EN  BIT(30)
 #define EMAC_RX_DMA_START       BIT(31)
 
@@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 		v &= ~EMAC_RX_FLOW_CTL_EN;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
+	v = readl(ioaddr + EMAC_RX_CTL1);
+	v &= ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
+	       EMAC_RX_FLOW_CTL_TH_DEACT);
+	if (fc & FLOW_TX)
+		v |= EMAC_RX_FIFO_FLOW_CTL |
+		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
+				EMAC_RX_FLOW_CTL_TH_2K) |
+		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
+				EMAC_RX_FLOW_CTL_TH_4K);
+	writel(v, ioaddr + EMAC_RX_CTL1);
+
 	v = readl(ioaddr + EMAC_TX_FLOW_CTL);
 	if (fc & FLOW_TX)
 		v |= EMAC_TX_FLOW_CTL_EN;
-- 
2.56.1

