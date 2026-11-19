Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050006;
	b=Ju06YFRGrZnualwCXajcJ82nAvtxL+LBUJFYRf/YRhjkzObXTu6NHTPykKBzbpQAx8SE
	 5kdb8ginUQbj5igTgvAyUbQ3qhPotmDjhSd1A2afPNfki2MBudmkBeaDQFlREdXu+LQ2K
	 /tWhVRUBhu9ywD5tAZap5yqdXH1mEEk68FJQss5JfpdsQGGFtq72BwrdQIyXy+xJ4d1uf
	 s7KFjxF/apxIPwDYSj039GMW54U1qqFWdXR50fDPVbacyXRPEXmuHuorHsMEH1/caDN2V
	 BFSlA64oO3e++dvMsTDqNVdziH0Z3R5vjU9yE809oYYI1F3dIfmwzHb/IjYTPmeTiTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050006;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
	b=CoCXdUIEaWv5bZZPV3s7hDZ9RLOmavv9XWoggcH2e3jeTW7DIVXFMghf61NnK+CcgGUg
	 rIf6f+8sQfUrsAge634tb2SEfp27GDqzZsvCyUYrauH5048Ujj3nhnoDjLfNOcW9e18oq
	 8IOf7VaqyMz+OnKUq1HjbRzJt2qdkok3qlJhzHZ5ZO6FDsyeSkdXV2bqkprM9yBPNFxnC
	 OK3/K1FAQHB1xavbG040S78P02vS7Kvop7EZxCb9+OLpnmHc2QZ3IyarMV2BXFpoNIFzP
	 Iys1ZbUzD08ASmVZYx+F5KwJyF8iXUbm6s3LL+84GoZXqVLBmcGeXNgLQxnU29MJlpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OQnHwK+A;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A0760A3830
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A0760A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OQnHwK+A
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1178548a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050005; x=1795654805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
        b=HaHwN03Qy31zqT9/bikXtGCoK1pqSn1JWSwAt+fsXDXVn8iIexx/TR+KWgHU+fgyeD
         wF9wj+Hg2u3PSxQmsKABwQ0bubANh0XNBgY4psQ00viflK06rzv5TG/FcD9HjW/Ogdfn
         20G+u0/rLYp/WpQVsTwSfPkhWS/cl+pNnprIxsByBghqq8HpnJ8VWiwhQiJBRN9Wtlml
         ZC+zXUj0dJm4zu4PB4AmBK7twA113UEkkegtXVMdvR8/dCWH3MS1ztoUKZbeGMNFeJur
         d+m8jQELYGYFTLM1XDSOI4Et5jM+Lkc/X6eY/dWpooAkGNQeVRj3Wh94HiavcMM5JGBh
         Ef4A==
X-Forwarded-Encrypted: i=1; AL+hErHQpKRYMsVM3/PaNyGl38wvcMA6tP0ySlYkGmt+efPmvkilBI4+CFt8fSPtEb/28VrkRbPp70KFQOq+TTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OwLFbHxkhgQaGEmB4vY582RfVqvdO+S4xBxG3+75ud3tKgbHZ
	JG7gywn62ym4k+7ZTSSzp9FfOik/fgC7d5zEI44e8nnfRO/QJv80jtImdgWbAP3ReDb1ohLD+Qm
	aBfM1iM74vOWxjf3/KNkWRSmNuor9K8PKI04slv0VSXhb0wGyQjqz51SHM4/NrxuGc/XcNTiJ6E
	EtO+4Py+TRZkYauRsSVUAnlSXekhLjT+3TqIaU+2v5iAm63xTWYRUipPgr4jB4NRKqlbn1soMpQ
	g6fQ3JPJp+lxEARhdfSGwYA
X-Gm-Gg: AZFdTZe2q5bbnEaACVYSr7hlJME6vKknW+YRDXO7hHpkgodA797npnKFZTiq3Xh54eO
	LEid6lSVK0qiYC1gBqArX893D4Q2GE46d674m4Tc/5jJxB0sEAIFTuVnzGbCM8lq9BdjE29m6LD
	US/ut+rL5dzm9cO8muy4t5scOi0SuQAAuNy7bIe1av4rODYmIXMhfUimf8B8OQF9qabhQsC7biH
	qOLQgLsbyv9ryKo5LWBmtElfaUpRZ7fl4q3ln09Yms5JMYorZ3wIhYvf480S1fV4J1tIpXkJowi
	BOdvOUmblFgmQbFNwcXt+bWSRYjV9yRZNgtvLd2mi3bGqN3+PqOkU6wWvRjX0CGVKaMmvmOD6JN
	glutP6uO6Cughs3X1SIMwbVOu6+zrDr0OU6xo3vgYK+7zR7XvXMrlMLE2u+G4LUYnJoaoKHcm+P
	vHjJzbIPzB+lPEJt0sLNobpZy0WcJfRvg8GfN0hRW7
X-Received: by 2002:a17:90b:4c8f:b0:3b0:cc3e:68b5 with SMTP id 98e67ed59e1d1-3b3d07a0017mr4278660a91.21.1795050005228;
        Wed, 18 Nov 2026 17:00:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40296e947sm49761a91.3.2026.11.18.17.00.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:00:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210ad74fdeso27677956d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795050004; x=1795654804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
        b=OQnHwK+A1nevL5OEEouCi0evRs25YI88u8qUUc2DZqneyxeV97/ZD9XO+NimgogDTQ
         qiaDu/6T6362pKayYGxmjg6G0hyxXkj7eocE7Yselh/4dfP+SottZZh4K+DyuPaaV95Y
         eRqtQXh+tU1fGpddZv8syQI4qJ7EQ88fOhxEU=
X-Forwarded-Encrypted: i=1; AL+hErHC4jPNvYUhQ7VIkvL5YYDDuD6JUPD8BKzSiLsT5l6Imiqpr8lIqSXLfThmkZP0mwV4H9wFSGw5YPDBl5c=@vger.kernel.org
X-Received: by 2002:a05:6214:4806:b0:921:27a1:a4e5 with SMTP id 6a1803df08f44-92127a1b798mr12064166d6.28.1795050003486;
        Wed, 18 Nov 2026 17:00:03 -0800 (PST)
X-Received: by 2002:a05:6214:4806:b0:921:27a1:a4e5 with SMTP id 6a1803df08f44-92127a1b798mr12063596d6.28.1795050002747;
        Wed, 18 Nov 2026 17:00:02 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.17.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:00:02 -0800 (PST)
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
Date: Wed, 18 Nov 2026 16:59:43 -0800
Message-Id: <20261119005943.999981-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119005943.999981-1-florian.fainelli@broadcom.com>
References: <20261119005943.999981-1-florian.fainelli@broadcom.com>
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

