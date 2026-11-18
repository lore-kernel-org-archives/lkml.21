Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994225;
	b=MORnyUxyZjgVfa4EOtzsjlwglek+e497Zl7p51wHJsao6iGMI/FmvOFhsHZsPUXOXpPq
	 wZDJ4T3LtgEJNQyJ2teygKBOaVO4IZyB2VGZcl0HMjLQzfMvoTC9uUx4mJCgBkxsuLG+T
	 SCeqqMxlZG9hJLkvtgTH3SYy/YNmfdetJTd/E6jPYs8m1Yo7AyrO5yOi9bQF55XmmB20j
	 wPv3SeB4phKKEuWWRe5mZQ/R0PYNfhtFPwkDeboaotGqkaupgwXCEiYWYBZNvmoMSfj8l
	 GgZ+XitpweayrzIsmMhkn764vvmfSVmjcpmG1N8pvtyaQCYyLJG/sJNJBjA8zEG3wTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uD1tBuYOug83rEirqNXlPEIbnE3sowo0Gmaf/KHGZnI=;
	b=sO59vhHSvE0D7pLn/jBYqXrPmVvl6o0vfVz8Bixozs7PptLeMtaq3UGugYEPKm/3kiJc
	 ji3Ak4FafYTzx3gPdIHYedx/FZfZkIcE68ydhAMS/E00Lj25JMnfmkPWTej6ffjUFuakN
	 WU2aXmq89T/aomDF1R1O9osynVE+kQ5eguSc4bzLnngKaBxP3qSaowF65zUJ41cfoT5nL
	 5mc7uTpcsHJITrGSHbLE6ul4h+zgCoRFU9FKMP3cLCkqG9zFUzxjNDPR4aigRo1ZsA2sW
	 ykEB/IKpBCF3YY6Bm3lO3ucjIkvRHlLcgOr59d+9SgyMujyDQzHXTb96J8Zo8MelRXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYGhSDO9;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6FE606A8BB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6FE606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYGhSDO9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491d1f66968so26194f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994224; x=1795599024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uD1tBuYOug83rEirqNXlPEIbnE3sowo0Gmaf/KHGZnI=;
        b=fYGhSDO9+nroHFZCNfRmxsl96MZLuAiQ1ScC+SsvjLLVYxAvcIEwQdHGTl6XY7AF5e
         hwBpE9x/gNgFTYsYQbJtRIiwTxohhxS6WcKdskS6v5SkwFwHHqXoLvKIM9D5FGVvF+KK
         G5PKa2xm9ICuVP4RtRMx1DZuwKeQ32CqzBIgVhWgUFdpqgRd7EvsMZSIjvtFdVDcgpko
         6GH3kcuDV2SwxpVbLcBgtMYRLg0zD0M3/hWa4mzJ8KLje1yPLHGAibX56N2jOgXPVOj7
         Bg82LappZVU5yBe3t7pSKSPJBOq0rp7WbPxfzkatYZLmQ/yg6NDcQ3dtNezP76EHsXJH
         1mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994224; x=1795599024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uD1tBuYOug83rEirqNXlPEIbnE3sowo0Gmaf/KHGZnI=;
        b=j2EyH2Q/PDW+gPBmhFX+cfpQ2c3CN6Nr1Uy2h6WeqEPPE/GOyc8XPZk/ZjwLWw3t2D
         hBkIIQefSr2xwljvzoiXGmDQ1Jwwef32biAMzXbkrP20seZChBSpgZOgxyBiPE9okGVt
         daUedNCDbepsrMd85W4Gs/c22+d4Db3kuF5E49tIOtYmI2Q9qhX9+bS+KS7WWqohJUHb
         qeasUraPWW9Mu4/tSA0YlXim+m8NXTmeZLAUEN/u1TcmplzFg4YD1Btm9w4NvtUNrOHI
         aUKlJpKNLcdQQFUwtF3g4lQ2MtxYr7svRalXCezOWBSXo9zWkxh3FaYoQRuIYExlADI0
         8yLA==
X-Forwarded-Encrypted: i=1; AL+hErESku3osSG9g72Vn3ySX63jKLULYT+GhIXgeUa3UAOKaLuVBhCSj0Fg9z926iD/t4aigRO3378eZbAa550=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ITIaF7N346MVEi22jaXvPU+NOrMgAZ/6GDUQX0csC7DryKS3J
	dovMfnB47xdJeiPy5JeSUHTZkVlVG3pJHXVH+qVcXxDg6cL4sODdeOQ2
X-Gm-Gg: AZFdTZfqnoRxjx3KhfIjz0uk8WNyNBohmutBtmWPQGCBhxkiC0GI3DiO8TtEw84jJKO
	Bi/Ndulf6deO2Uh5QWGIgxMEZlP7f6JVr0AR26M3wVUSn6m6DMPQvloZpW5YpBCLTtsU/vPTepI
	eyiPMqlc/R0VFpzIpNzFZ9DWUc0nHXF9Vls9Kj5pYC/f1LBjibmLp4UbKSqgP8IKvVxW5FS0SYL
	nB/QgGnksTnAiDKIYMJyr8CdBDZbWo+6TD9nzRDuFBR3zdz0oSoY6R7jVrjETUtkTy5yRAz2doA
	BvH6GXlfLyoniD5odWl1sWvxbVq1qyyxeu1/Y9WIlTonBSBwBUXOfJDJcs+qiuiuuqNCHqZGnAM
	JxVG2BzrVZxDOSsHZucUeRfhCafQxAk8DQ8T2vX7W+n+SSihcTa4Enmbcz0VAk40seBpzI+/FMe
	33hmeClQi+0ySscmdtQqNlLcKosw+/x603kJ9q0h4P0n4b4jRJOyXh81/majTLluUE1+Gy7qu2O
	hpHJf6YSIiSwsYsiFSrGXQswmJpAQEjG7qa1BBus7JmApkYoWrXSRQNRSZ5q+p8wYuiy7moPLY8
	vz4Qv+bj+aBSybKOgaSvMaVKn4bb3AbVhzJTg7DpbaVD6bj2lf2tfropBl9I7Jk0Et5xOmA3UOb
	R+wURBrxdS2eXnHhYXz0Ih4Q2X47T/D168YSkQqAurL1Ed8GT0t+66iOlQzGENbSwBsaFzvfUpP
	OyYSiVLKgixd+poNnuLj4N/m3dWd3emx3cENj75RHMMIi3hyM2+OXD
X-Received: by 2002:a05:6000:46c3:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-4a6333b29bcmr2724653f8f.8.1794994223763;
        Wed, 18 Nov 2026 01:30:23 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:23 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 6/6] net: mvneta: serve the TX queues in weighted round robin
Date: Wed, 18 Nov 2026 10:30:12 +0100
Message-ID: <20261118093012.90121-7-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
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

Under load, some TX queues get no service at all. With four TCP
streams on a 100 Mbit/s link, up to three streams sent nothing for 20
seconds. The TX queue arbiter is left at its reset default, which
serves all queues in fixed priority, and the stack spreads the flows
over the queues.

Give the TX queues the same WRR weight, the smallest one that is
larger than the largest packet, and clear the fixed priority. The
Armada 370 and XP manuals list separate registers for the version 1
arbiter, which the driver runs unless a shaper is set, so write both
register sets. On the Armada 385 they are the same registers, as
writing one set and reading the other shows.

Keep the fixed priority while an mqprio offload is set up, as its
traffic classes may rely on it, and clear it when the offload is
removed. A rejected setup leaves it as it was, and after a rejected
replace it applies to all flows until the qdisc is deleted. A class
that fills the link starves the lower classes, and as the fixed
priority is set per queue, the queues of one class still starve each
other.

Observed on machines in real use. OpenWrt users reported it as a
multi-flow lockout on a Linksys WRT1200AC, and OpenWrt has worked
around it since 2017 by sending all TX traffic of its 32-bit boards
through queue 0. Reproduced on a Turris Omnia (Armada 385). With this
patch each busy TX queue gets the same share and no stream stalls,
4 x 23.5 Mbit/s on a 100 Mbit/s link and 4 x 232 Mbit/s on a 1 Gbit/s
link. With an mqprio offload a higher queue still has priority over a
lower one. Only the Armada 385 was tested. No kernel selftest covers
the TX queue arbiter.

Fixes: ee40a116ebf1 ("net: mvneta: fix improper tx queue usage in mvneta_tx()")
Link: https://github.com/openwrt/openwrt/issues/5411
Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
v4: The fixed priority and the weights are also written to the version
1 registers. A setup that the driver rejects no longer clears the fixed
priority. Discovery statement added.
---
 drivers/net/ethernet/marvell/mvneta.c | 56 ++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 89ade2ed7ce4..35409695d3d7 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -118,6 +118,7 @@
 #define      MVNETA_HSGMII_SERDES_PROTO		 0x1107
 #define MVNETA_TYPE_PRIO                         0x24bc
 #define      MVNETA_FORCE_UNI                    BIT(21)
+#define MVETH_TXQ_FIXED_PRIO_REG                 0x24dc
 #define MVNETA_TXQ_CMD_1                         0x24e4
 #define MVNETA_TXQ_CMD                           0x2448
 #define      MVNETA_TXQ_DISABLE_SHIFT            8
@@ -196,6 +197,7 @@
 #define      MVNETA_RXQ_ENABLE_MASK              0x000000ff
 #define MVETH_TXQ_TOKEN_COUNT_REG(q)             (0x2700 + ((q) << 4))
 #define MVETH_TXQ_TOKEN_CFG_REG(q)               (0x2704 + ((q) << 4))
+#define MVETH_TXQ_WRR_ARB_REG(q)                 (0x2708 + ((q) << 4))
 #define MVNETA_GMAC_CTRL_0                       0x2c00
 #define      MVNETA_GMAC_MAX_RX_SIZE_SHIFT       2
 #define      MVNETA_GMAC_MAX_RX_SIZE_MASK        0x7ffc
@@ -253,6 +255,8 @@
 #define MVNETA_TXQ_CMD1_REG			 0x3e00
 #define      MVNETA_TXQ_CMD1_BW_LIM_SEL_V1	 BIT(3)
 #define      MVNETA_TXQ_CMD1_BW_LIM_EN		 BIT(0)
+#define MVNETA_TXQ_FIXED_PRIO_REG		 0x3e04
+#define      MVNETA_TXQ_FIXED_PRIO_ALL		 0xff
 #define MVNETA_REFILL_NUM_CLK_REG		 0x3e08
 #define      MVNETA_REFILL_MAX_NUM_CLK		 0x0000ffff
 #define MVNETA_TX_MTU                            0x3e0c
@@ -264,6 +268,8 @@
 #define      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX	 0x0007ffff
 #define MVNETA_TXQ_TOKEN_SIZE_REG(q)             (0x3e40 + ((q) << 2))
 #define      MVNETA_TXQ_TOKEN_SIZE_MAX           0x7fffffff
+#define MVNETA_TXQ_WRR_ARB_REG(q)		 (0x3e80 + ((q) << 2))
+#define      MVNETA_TXQ_WRR_WEIGHT_MASK		 0xff
 
 /* The values of the bucket refill base period and refill period are taken from
  * the reference manual, and adds up to a base resolution of 10Kbps. This allows
@@ -518,6 +524,8 @@ struct mvneta_port {
 	 */
 	spinlock_t lock;
 	bool is_stopped;
+	/* An mqprio offload keeps the TX queues in fixed priority */
+	bool txq_fixed_prio;
 
 	u32 cause_rx_tx;
 	struct napi_struct napi;
@@ -1632,6 +1640,39 @@ static void mvneta_txq_max_tx_size_set(struct mvneta_port *pp, int max_tx_size)
 	}
 }
 
+static void mvneta_txq_wrr_weight(struct mvneta_port *pp, u32 reg, u32 weight)
+{
+	u32 val = mvreg_read(pp, reg);
+
+	val &= ~MVNETA_TXQ_WRR_WEIGHT_MASK;
+	mvreg_write(pp, reg, val | weight);
+}
+
+/* With the default fixed priority, a busy queue starves the others.
+ * The Armada 370 and XP manuals list separate registers for the
+ * version 1 arbiter, which runs without a shaper, so set both.
+ */
+static void mvneta_txq_wrr_set(struct mvneta_port *pp, int max_tx_size)
+{
+	/* In units of 256 bytes, must exceed the largest packet */
+	u32 weight = max_tx_size / 256 + 1;
+	int queue;
+
+	for (queue = 0; queue < txq_number; queue++) {
+		mvneta_txq_wrr_weight(pp, MVNETA_TXQ_WRR_ARB_REG(queue), weight);
+		mvneta_txq_wrr_weight(pp, MVETH_TXQ_WRR_ARB_REG(queue), weight);
+	}
+}
+
+/* Only the traffic classes of an mqprio offload keep the fixed priority */
+static void mvneta_txq_fixed_prio_set(struct mvneta_port *pp)
+{
+	u32 val = pp->txq_fixed_prio ? MVNETA_TXQ_FIXED_PRIO_ALL : 0;
+
+	mvreg_write(pp, MVNETA_TXQ_FIXED_PRIO_REG, val);
+	mvreg_write(pp, MVETH_TXQ_FIXED_PRIO_REG, val);
+}
+
 /* Set unicast address */
 static void mvneta_set_ucast_addr(struct mvneta_port *pp, u8 last_nibble,
 				  int queue)
@@ -3765,6 +3806,8 @@ static void mvneta_start_dev(struct mvneta_port *pp)
 
 	mvneta_max_rx_size_set(pp, pp->pkt_size);
 	mvneta_txq_max_tx_size_set(pp, pp->pkt_size);
+	mvneta_txq_wrr_set(pp, pp->pkt_size);
+	mvneta_txq_fixed_prio_set(pp);
 	mvneta_restore_per_queue_rate_limit(pp);
 
 	/* start the Rx/Tx activity */
@@ -5345,9 +5388,20 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 static int mvneta_setup_tc(struct net_device *dev, enum tc_setup_type type,
 			   void *type_data)
 {
+	struct mvneta_port *pp = netdev_priv(dev);
+	struct tc_mqprio_qopt_offload *mqprio;
+	int ret;
+
 	switch (type) {
 	case TC_SETUP_QDISC_MQPRIO:
-		return mvneta_setup_mqprio(dev, type_data);
+		mqprio = type_data;
+		ret = mvneta_setup_mqprio(dev, mqprio);
+		if (ret)
+			return ret;
+
+		pp->txq_fixed_prio = mqprio->qopt.num_tc;
+		mvneta_txq_fixed_prio_set(pp);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.54.0 (Apple Git-157)

