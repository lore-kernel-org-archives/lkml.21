Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151862;
	b=kKt4xZUlm3BpgrnJfhvmx2gyv+X1tOg8aP1dQeY8SYGjmt8jWV51GCvvMayl11dTpID6
	 q0v2WnbhivkN1LlUVkG54PE4NfNJf47X9MVuaQtIcm3S/cptlbUyX1MAyeBZU1F9IGZyg
	 uPH9EMceqYgwfhgAVSV3O7t4iTdr4SzaUbqyC0kiYgTvl1DHq0YrU/Bs2BfRpY+wZwAK6
	 f80w7ucY0gbCdNetwfdnPnOkBYpjb0rp0TnK1SoreYp23MX36wopIvTYM5+p0DtG+6TFi
	 79peeYMtydkA39LFgvPgzsvkjzCHaKxcw9YgOfyTKemxFEs1Us4VqYCzcK7rxWyNyRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
	b=MHFUTelYXeRBTw3Q/yc0jyV3j/hO32+xSjOBbGopIzg+tAisFeDN+Dq1Hupi10XLgmlX
	 5mPjIAIZ6ECFq/z4zfN46nYNG31Q3ULWA+9zWYFa9OVmM1Js9Qvo+T8dDSR4AEm6sB3oz
	 C+TdrF+JfzeLJr/Ww3SLdXK/RYzZ6+vFfOGMUwFrxezXwaw2oUNPIC1EABKhWNI7dlZuj
	 H8w+2S+CGZLyzo12r2lQPCPgKG+hahg7g4PDm0aUhI4ojwoXroQ9k6XfWHsTrvMEtw/fR
	 rAeFXpOqrSaeDXf2pxQPtyyCJh8P6twwn2OC+lIyK3973QswCDJ2C19GKvPccOvzTqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Py5PPwUT;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664A60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3664A60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Py5PPwUT
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so199254a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151861; x=1795756661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
        b=i9wiK3SOUabioEGaIPREnQBs8WLqsvGBj+Xu6EGV4ghFytJDxtuM5r9hRu0mojLjGL
         Kjjw+6KLYLQb+ARSr5njrukEmJP2iW0ZA/gw2Qs0KSTJLGaAJblwsUh2W72FIuAXVK50
         GKKjpBsAagpVZ87r/KQowGOoU/lqi/WQqg7V9di7LOQpYAUYktjr58pbeCKByyLu/hz7
         9SmEFXg5OIWwr+5MYhlVgh2XszEqNExDrZxRJbdQxdtV0LIIEP2RCApSZTOgh+Nskd/a
         0Rn7xcQdzhcNjSoo1nat9Xs6eVUt/Unh8J+phK4VyTfy4d9+GsVeXJG834h8HtPd++R3
         gNtA==
X-Forwarded-Encrypted: i=1; AL+hErHL4gRWO0yVq9R/G/i2Pw+tT2G5Bu0AeZdWp9MY5wXXfUalDvt9LHIcrx5ZC0bY0hEEJI2E38YyBwt+e7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JkPtQUzfTbvfUNb0XJDwXb7b1OV3wF9QnPJOGSReBIbO3egTG
	clfyNGj4gDTjfWN98yfz7D2SmnHsX3FICAh7tBeqGioPDJKfF1FNyGuMY2Q2gYVbbO+6AxG5ndV
	tFIfQ+jKM66TO0XYUidOvaNrIr9GKfdu28Q93SX3Y2sGVWkN0StdwxnqXOi5PxTh0pKV0TfHZdY
	qKw0m5CWpraK8wawwzVauUvUMrhY8j0IQY4rdfcx9AY8g05oGLW4BoScGME2BEp7V9sIqKf3jQ7
	4iuiTLYFvc0NQd43SwGxsjh
X-Gm-Gg: AZFdTZdKXe0ETNDyEznb0qsxOLamvVZ3q2RrbyPCeYeDaDiKh2vQikxs8YvJqzReBYA
	4x0kHuD6bHoUFDBBnTsjhBqg2jdhrDBgzieu0w6Iz+x/XofDJns+AzCqZgKhwPuAJr/iaz7Sxw3
	JFLXNVFYvyeBFh3K5jI/r4/kKz23nnAr/2lEkuYVb4vGHLVLCQGVti6+qYb6GSfs/T8MklyUalz
	FHua4ZwCkMWVpr20CqvOr6lIhJNZiMgBukpuFwW0hc9PJU9LEtAyqGsXOkxcLZ1VROx7JqFLjbR
	5pytvMJgr4wGHk7ey2uyUtrw18G5TT6tiOWAWSub6cngoPhFR7MyEk1OksIK4U3b1IWvcMfMyv8
	cxt4zBrjg1gdCxQWCQyV6YWeMO61Rodn9YZXgp3fq/1bWS2vjf/A5CX2gOKakTrQzIVJdMYN6Eg
	FyJKlhl/GGE2wPqqhAECYVMUOwX6DP5XW9IKQ2N5r3THU=
X-Received: by 2002:a17:90a:e70c:b0:3b3:c04e:4b61 with SMTP id 98e67ed59e1d1-3b41cafe407mr1790173a91.47.1795151861486;
        Thu, 19 Nov 2026 21:17:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ab582a3sm1290945a91.0.2026.11.19.21.17.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so143413685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151860; x=1795756660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
        b=Py5PPwUTJuIt01eE0rpaxU++v+P2vnNqR0uQaJQBUlD9WRPg9tozw/8qkek3+AKim+
         u5bK4Mwp7th/4Mv6MsZGbLCWmvlhipF7jznpmu1rB9rxInS2VMrN7R3p2CgAL8NSR+Os
         WFkDEifQrLMnKcyMB4AnpzPvL1+vI0eiSmcVs=
X-Forwarded-Encrypted: i=1; AL+hErGeoO28tk3dEjqi0a8vsybT6qX01LL/gcc0utfm5SJvZrOvuFvXJH62djwrFgHuA+hKdIyXBbmKNynfnFk=@vger.kernel.org
X-Received: by 2002:a05:620a:1725:b0:93e:f931:a886 with SMTP id af79cd13be357-949bab0ee9bmr323843585a.57.1795151859888;
        Thu, 19 Nov 2026 21:17:39 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:93e:f931:a886 with SMTP id af79cd13be357-949bab0ee9bmr323840985a.57.1795151859420;
        Thu, 19 Nov 2026 21:17:39 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:38 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Carlos Soto <carlos.soto@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v4 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Thu, 19 Nov 2026 21:16:53 -0800
Message-Id: <20261120051653.1433677-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
References: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add Clause 45 read/write support to the UniMAC MDIO bus controller driver
by implementing the read_c45/write_c45 bus callbacks. Each access performs
the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) under
the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
MDIO_CFG is only written when the mode actually changes.

Also skip the BMSR workaround read in unimac_mdio_reset() for children
compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
expected to respond to C22 accesses.

Note that providing read_c45/write_c45 also makes the MDIO core scan for
C45 PHYs at registration time, on addresses that are not masked and do not
already have a C22 device.

This includes the platform device that GENET instantiates when it is probed
without a Device Tree node (e.g.: ACPI), which does not mask any address.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 125 +++++++++++++++++++++++++++--
 1 file changed, 117 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index f8e5c1811d96..a79830566abb 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -24,10 +24,16 @@
 #define  MDIO_OP_SHIFT		26
 #define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
 #define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
+#define  MDIO_ADDR_C45		(0 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C45		(1 << MDIO_OP_SHIFT)
+#define  MDIO_RD_C45		(3 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
 #define  MDIO_REG_MASK		0x1F
+#define  MDIO_DEVAD_SHIFT	16
+#define  MDIO_DEVAD_MASK	GENMASK(20, 16)
+#define  MDIO_C45_REG_MASK	GENMASK(15, 0)
 
 #define MDIO_CFG		0x04
 #define  MDIO_C22		(1 << 0)
@@ -97,7 +103,53 @@ static int unimac_mdio_poll(void *wait_func_data)
 					MDIO_CMD);
 }
 
-static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+static u32 unimac_mdio_c45_devad(int devad)
+{
+	return ((u32)devad << MDIO_DEVAD_SHIFT) & MDIO_DEVAD_MASK;
+}
+
+static int unimac_mdio_addr_c45(struct unimac_mdio_priv *priv,
+				int phy_id, int devad, int reg)
+{
+	u32 cmd;
+	int ret;
+
+	/* Prepare the addr c45 operation */
+	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
+	unimac_mdio_writel(priv, cmd, MDIO_CMD);
+
+	/* Start MDIO transaction */
+	unimac_mdio_start(priv);
+
+	ret = priv->wait_func(priv->wait_func_data);
+	if (ret)
+		return ret;
+
+	/* Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0
+	 * even when they timed out with the controller still busy. The data
+	 * cycle must not be started before the ADDR cycle has completed, so
+	 * make sure the controller is idle.
+	 */
+	return unimac_mdio_poll(priv);
+}
+
+static void unimac_mdio_set_clause(struct unimac_mdio_priv *priv, bool is_c45)
+{
+	u32 cfg = unimac_mdio_readl(priv, MDIO_CFG);
+	u32 new_cfg = cfg;
+
+	if (is_c45)
+		new_cfg &= ~MDIO_C22;
+	else
+		new_cfg |= MDIO_C22;
+
+	if (new_cfg != cfg)
+		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);
+}
+
+static int unimac_mdio_do_read(struct mii_bus *bus, int phy_id, int devad,
+			       int reg, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	int ret;
@@ -108,8 +160,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
-		(reg << MDIO_REG_SHIFT);
+	unimac_mdio_set_clause(priv, is_c45);
+	if (is_c45) {
+		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
+		if (ret)
+			goto out;
+
+		cmd = MDIO_RD_C45 | (phy_id << MDIO_PMD_SHIFT) |
+			unimac_mdio_c45_devad(devad) |
+			(reg & MDIO_C45_REG_MASK);
+	} else {
+		cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+			(reg << MDIO_REG_SHIFT);
+	}
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -137,8 +200,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 	return ret;
 }
 
-static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
-			     int reg, u16 val)
+static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int devad,
+				int reg, u16 val, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	u32 cmd;
@@ -149,18 +212,50 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
-		(reg << MDIO_REG_SHIFT) | (0xffff & val);
+	unimac_mdio_set_clause(priv, is_c45);
+	if (is_c45) {
+		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
+		if (ret)
+			goto out;
+
+		cmd = MDIO_WR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+			unimac_mdio_c45_devad(devad) | (0xffff & val);
+	} else {
+		cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
+			(reg << MDIO_REG_SHIFT) | (0xffff & val);
+	}
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	unimac_mdio_start(priv);
 
 	ret = priv->wait_func(priv->wait_func_data);
+out:
 	clk_disable_unprepare(priv->clk);
 
 	return ret;
 }
 
+static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+{
+	return unimac_mdio_do_read(bus, phy_id, 0, reg, false);
+}
+
+static int unimac_mdio_write(struct mii_bus *bus, int phy_id, int reg, u16 val)
+{
+	return unimac_mdio_do_write(bus, phy_id, 0, reg, val, false);
+}
+
+static int unimac_mdio_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	return unimac_mdio_do_read(bus, addr, dev, reg, true);
+}
+
+static int unimac_mdio_write_c45(struct mii_bus *bus, int addr, int dev,
+				 int reg, u16 val)
+{
+	return unimac_mdio_do_write(bus, addr, dev, reg, val, true);
+}
+
 /* Workaround for integrated BCM7xxx Gigabit PHYs which have a problem with
  * their internal MDIO management controller making them fail to successfully
  * be read from or written to for the first transaction.  We insert a dummy
@@ -191,6 +286,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
 			if (addr < 0)
 				continue;
 
+			if (of_device_is_compatible(child,
+						    "ethernet-phy-ieee802.3-c45"))
+				continue;
+
 			read_mask |= 1 << addr;
 		}
 	}
@@ -302,6 +401,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	bus->read_c45 = unimac_mdio_read_c45;
+	bus->write_c45 = unimac_mdio_write_c45;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
@@ -337,8 +438,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
 static int __maybe_unused unimac_mdio_resume(struct device *d)
 {
 	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
+	int ret;
+
+	/* MDIO_CFG is also modified by the MDIO accessors to switch between
+	 * Clause 22 and Clause 45, which run under the bus lock.
+	 */
+	mutex_lock(&priv->mii_bus->mdio_lock);
+	ret = unimac_mdio_clk_set(priv);
+	mutex_unlock(&priv->mii_bus->mdio_lock);
 
-	return unimac_mdio_clk_set(priv);
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(unimac_mdio_pm_ops,
-- 
2.34.1

