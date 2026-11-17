Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943965;
	b=pr8AsHhoqa+KMsUvAq//XaEmShvGdNTSOG0wm6BYOF8SfYvvOrAWVDNKS9izexLJzyoe
	 gSL1GYACrAnjgt762s0WABd2Ggw0xEWvovzxyY1P6DU/IUrJzJ0Rd892HOhFNF7epqnGC
	 v/lH55fw8piWfezEPD/5zbxiOYaprNfu6e/scUd3i71aTUYldLhbAH6XI7mkhv3zR/Aoo
	 ThkghYF6h9mJR66PlAyfopN1IYrCA53qBrdCTnxvZRKdeKhWQRUUa8NbBWv7a8yRl6BqP
	 AXrooZfIg9s3uu7rmE+/b46wo+WTxbowo5fvfxZHqqRU9XQJ2GaNSjz9BRili2b3iCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G0JmgKTq1UAcHJFg5FuOL28yG0XVNqgNLW2rv/cyKjk=;
	b=jCQLX8xt1Mf69+6EgPsMK84sOTvi/O+AqS9S6+svRDUN3QOv91rW4Y63d1VaPNyfiDxY
	 ABYIWhMCKGbEqXvaTXwbWgmcAy1cnfvulEk6OrNBXWx+TDZVYhegAQK3x8VdLWVUx0k0s
	 FPtW5isa6IJiIeAiY80FAarWxF2H4bOjgefIHsxbtEMjuyfOUKw2221aLrya54widzmP/
	 LGdmvkz3VmCyPk+Kl2k/hwYYFJUckB7Nit2/B9HnQ+CP4XxrwBILU/YbybBJh2pzvCZpe
	 b6K8cNRoQJ5eLgTSZXDUMHZ2veigRIZ/iV5yQmV8566MJvzBFopeZz/ssHHaI5I7enA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMgohH2I;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F2860A2607
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F2860A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMgohH2I
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-372bdb942dbso314258eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943964; x=1795548764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0JmgKTq1UAcHJFg5FuOL28yG0XVNqgNLW2rv/cyKjk=;
        b=bMgohH2IfrpZCOO1qjvqGdCZJAOXH8xw8KniJoIN69kX1cnoLbEICXW8Bn0xxc3qTX
         /c8wDUnF6gJrbGBq8jUBFlnbbEsijV03UPiBCX1M0rp88U6S4KWY08Y4pCPbOJU4XAv2
         BRpriQhUgi8vxPioiuEv/f7/SWa3gizHsfz63FFhQJQ+BvRnrhD4zbP3ZOfFJ2TU1rRu
         LKKzB8agZY60iCTIUfaU/6WyxNTq3xntv4OHENnysp8zMssmfwYnIm6yblZUdl4iE2oK
         OfRIc1RZm2EV84I4tUQE2PIigYwMomyO0AwPmgRdagm2tWdq+YDbKkMFvQWNU5r4M79v
         AR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943964; x=1795548764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0JmgKTq1UAcHJFg5FuOL28yG0XVNqgNLW2rv/cyKjk=;
        b=upIWiRBAjLR+0dRwFk+aSVKB0gQw1PJ1oLB1yYxNUw7bOmcXA3mg8DGjnEg+eQBaXv
         xlijsMngxdiaMvYvp6E9QIr5MsnVFN3AxTy/piNlDaQBQq6n4c9SsZyUeSc6OMXcsD8X
         VuUv0HrVlmzwNNbXaNh0nLpqMaVxRbNHqxgwRqL8FIYx+PiXczjsOqObC3gZLxJdoYjq
         /gD4QATeF/fShFNnO2C3zx0RTw0SRAf4MjcmJbBAr0t7FQnfhRchBimZIxsaMdumyRzt
         knwB2HG9C8/26lGOVRSLut77bmuFTvQ93lBQtPVrjMxoGhLTUU3yYXf2MrPq6bUCltrx
         FV+w==
X-Forwarded-Encrypted: i=1; AL+hErGUntNRuRW9c2xq9CQ6M3AkGUbLAzh8Fgz2lPHUI/3PLMxM5XEiUs851HAtnP7ntjYVDoY6lPnXKDBdFTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z815j/6FURGzwFBzgl57ZMGV61D2eRFjTG/ZI/icGaNcWy4iW9q
	J2N2wm//h6d+MsLGh4EA9kPMyv4n0roHRPLnSzH/yAEK8KEBjJ/biWdQ
X-Gm-Gg: AZFdTZd/A52NqoYE8b3W6Op8LIYb4oYXi3hqxM7DqU/bOzjHx8U0JTht1IapBn0ESV2
	S0HIlubKVMvzkMIJzIlP8VaDeet0bLsmqQj31Vizj4ycmBLoNQ2k8nlYl3M9Utj1uZu9HwLM1h8
	M4Y4gPS5K26xnbFhuFE16y3jMXm1g5Jbrr4IB1tqakGByltf1HGOmIZN2aqUwv4EYtTe9EPRq4y
	nEOSp6d1e1a3NQvMglr6C+ikatZup1niHEl3bSzEhe9P7758Er3LSv5Llk266XwCX644aeM14U4
	YCeRP6jZI5P9Vfh375PbCW6vh0PPXnfvixcUXCA1t6hj8OIb6k8ckiIxi43y9UXowFeosmSOACq
	VZ9O8kDx2ACeJgc8ummW3yV+wMvVfAMspEMxXx+q1362TCodievB2h8fW0gNVqo0ye/cAx2PNBu
	Ml5GqKmZCD5phC0fbjNAdpf6ld9FYZUcUZZJOJ90NZxshifqz3DbMOlLQeUgq3CrvqS4XHM73M1
	UfwRM/A8mNArWwgjMhWLEWCw8sbFuzg3g4vqgr2fFdjBKd6nL746Qr7vGWoeki3aPkKkto49ewT
	9+4uFOsj1rD/Om6M/psOh0zzgcCOxg==
X-Received: by 2002:a05:7300:4307:b0:376:c352:2fcb with SMTP id 5a478bee46e88-38281020584mr469973eec.9.1794943963823;
        Tue, 17 Nov 2026 11:32:43 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:42 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 09/10] net: au1000: keep the MAC stopped until the PHY link is ready
Date: Tue, 17 Nov 2026 11:32:22 -0800
Message-ID: <20261117193223.2795612-10-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

phy_stop() powers down the PHY when the interface is closed. The driver
leaves MAC receive/transmit enabled on link-down and enables them during
initialization before the PHY resumes. MTX-1 can hang when the MAC runs
while its MII clocks are absent or still recovering.

Stop the MAC on link-down before phylib suspends the PHY. On open, clear
the driver's acknowledged link cache and synchronously resume the PHY
to restore its MII clocks and honor its recovery delay before MAC
initialization. Preserve the existing au1000_init() before phy_start()
ordering so the PHY worker cannot access MDIO or enable traffic during
setup. Leave RX/TX stopped until a link-up callback configures duplex
and enables traffic.

Use the acknowledged link and duplex cache under the device lock during
initialization, retaining it for watchdog recovery. Keep the reset-time
hard stop for paths without a preceding link-down callback. On resume
failure reset the MAC and release the IRQ. Remove the unreachable
initialization-error branch, since au1000_init() always returns zero.
Reconcile the initialization and probe comments: initialization forces
a reset itself, and PHY resume may already have enabled the MAC for
MDIO accesses.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 49 ++++++++++++++++++---------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index cb2f3333ba9f..98a75aba92e1 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -456,7 +456,8 @@ au1000_adjust_link(struct net_device *dev)
 		/* link state changed */
 
 		if (!phydev->link) {
-			/* link went down */
+			/* Stop the MAC before the PHY can remove its clocks. */
+			au1000_hard_stop(dev);
 			aup->old_speed = 0;
 			aup->old_duplex = -1;
 		}
@@ -688,13 +689,11 @@ static const struct ethtool_ops au1000_ethtool_ops = {
 static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
 
 /*
- * Initialize the interface.
+ * Reset and initialize the interface.
  *
- * When the device powers up, the clocks are disabled and the
- * mac is in reset state.  When the interface is closed, we
- * do the same -- reset the device and disable the clocks to
- * conserve power. Thus, whenever au1000_init() is called,
- * the device should already be in reset state.
+ * The PHY must be resumed before initializing the MAC. MDIO accesses
+ * during PHY resume may have already enabled the MAC clocks and released
+ * reset; au1000_enable_mac(dev, 1) forces a reset regardless of that state.
  */
 static int au1000_init(struct net_device *dev)
 {
@@ -729,12 +728,12 @@ static int au1000_init(struct net_device *dev)
 
 	wmb(); /* drain writebuffer */
 
-	control = MAC_RX_ENABLE | MAC_TX_ENABLE;
+	control = 0;
 #ifndef CONFIG_CPU_LITTLE_ENDIAN
 	control |= MAC_BIG_ENDIAN;
 #endif
 	if (dev->phydev) {
-		if (dev->phydev->link && (DUPLEX_FULL == dev->phydev->duplex))
+		if (aup->old_link && aup->old_duplex == DUPLEX_FULL)
 			control |= MAC_FULL_DUPLEX;
 		else
 			control |= MAC_DISABLE_RX_OWN;
@@ -744,6 +743,10 @@ static int au1000_init(struct net_device *dev)
 
 	control = au1000_rx_mode(dev, control);
 
+	/* Only use link state acknowledged by au1000_adjust_link(). */
+	if (!dev->phydev || aup->old_link)
+		control |= MAC_RX_ENABLE | MAC_TX_ENABLE;
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
@@ -918,6 +921,7 @@ static irqreturn_t au1000_interrupt(int irq, void *dev_id)
 
 static int au1000_open(struct net_device *dev)
 {
+	unsigned long flags;
 	int retval;
 	struct au1000_private *aup = netdev_priv(dev);
 
@@ -930,13 +934,21 @@ static int au1000_open(struct net_device *dev)
 		return retval;
 	}
 
-	retval = au1000_init(dev);
-	if (retval) {
-		netdev_err(dev, "error in au1000_init\n");
-		free_irq(dev->irq, dev);
-		return retval;
+	spin_lock_irqsave(&aup->lock, flags);
+	aup->old_link = 0;
+	aup->old_speed = 0;
+	aup->old_duplex = -1;
+	spin_unlock_irqrestore(&aup->lock, flags);
+
+	/* Restore the MII clocks without starting the PHY state machine. */
+	if (dev->phydev) {
+		retval = phy_resume(dev->phydev);
+		if (retval)
+			goto err_reset;
 	}
 
+	au1000_init(dev);
+
 	if (dev->phydev)
 		phy_start(dev->phydev);
 
@@ -945,6 +957,11 @@ static int au1000_open(struct net_device *dev)
 	netif_dbg(aup, drv, dev, "open: Initialization done.\n");
 
 	return 0;
+
+err_reset:
+	au1000_reset_mac(dev);
+	free_irq(dev->irq, dev);
+	return retval;
 }
 
 static int au1000_close(struct net_device *dev)
@@ -1306,8 +1323,8 @@ static int au1000_probe(struct platform_device *pdev)
 	dev->watchdog_timeo = ETH_TX_TIMEOUT;
 
 	/*
-	 * The boot code uses the ethernet controller, so reset it to start
-	 * fresh.  au1000_init() expects that the device is in reset state.
+	 * The boot code uses the ethernet controller, so stop it and gate
+	 * its clock until the driver needs it.
 	 */
 	au1000_reset_mac(dev);
 
-- 
2.53.0

