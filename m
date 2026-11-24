Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546718;
	b=YTMa0z8VEP+c/fE3b6ppM7VR2ueUn4Be+rkChwEUp3TyFKePHMfM4OiKVpsDHp8fDjLR
	 +Fj/qTxAhbUSfu3jmWqZv6dLoKwiEw1zrZ4DoDnRvdmHJOc33ZIyBQmSyg2slC54iW7su
	 OdMI+SJU43fyIxc8WYpAz+vn6qXoec4RxwbagKHcONTg5jIRWctFpRD9etBVnMb2p1XfJ
	 SopQbuFoCxyddJIkR40SU0I5d9L63ZL8iQKFvPCvvgnV45jlqCRqOgW6pYpnyoDBLP+T8
	 kMecpBpL/iG2HYIU863wuqkajqSUz2A+xRFL07nE2jvpY6bqgBHXCWQELzIqVAVy39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546718;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=aliirPXFY+qx7skKhpH0Dji/xTdYBn4uxxTPQjnsb3M=;
	b=DmEG0wofnOsvVcBlxIPVlMDeV/CBvMXARxe3GWoHjzhnKSptOH83gnMYer9TJaZszbnD
	 ondGhx98UYRGVVNh6hTFyXHC7k398q1bHV6dIaT1OZB+xrezDsWInzaBbyJ3k8bE47h1U
	 8bpxnMZuwwVcxe4ASpi10gE7w/ycP2PG2FRDzD/Tyl2KuMigBICy3Tngmb4HYn5EAFz1X
	 2guZgBlnRiFvjfKbF1TMaM2gIYTQNEko9Pr2nBU0J5Iyor2hkdb/rpCLyPjEvL/fQyk5d
	 u8o3xW5XyEZBSU4GaD0oV0CFb2qG5/yC4pEgoVszDlOWcPMFD9trxEISB/kQM7CL6zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Y/mB046p";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFD606A68C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EFD606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y/mB046p
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2736065a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546717; x=1796151517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aliirPXFY+qx7skKhpH0Dji/xTdYBn4uxxTPQjnsb3M=;
        b=brXvcG22ts4+C/A9aO7zw+e9ae6cbPJ2B0Lpa4YPdSG33yDxEkcQQWFhqusFCf+fHd
         gnqTvYbsdmSnvY+PaUfD6vEqQUXN60UCdxQRB4e8SwUV0+hU7QWXJ7Dl1SJX+fs6hfCb
         Q5nbNF28FxihDG513IEtku8cwWNHeGI9aw0bdzrGWLfHRvawKujwuEf8I+RA7uN5xPCk
         ionbCoqcnlcnu1o8+Z2i6qCtjx7eDNqER9nzdEJ6n8Bi8BZ4EvGSYLufNxc6WWFLx2v7
         3HFR7hlfWEMZ26J02SNt3smnJwLqZ61bewRcV65OKcckEiOfmJyKiGztpmwPuf/pOVFR
         HjBw==
X-Forwarded-Encrypted: i=1; AL+hErFPCm30/hzjJ9s3qr6HoC/4TgmbpTXrk4kbIp/hnmtQgkcgCDJLC0hc0k8nCUjD5FTbklFcnpBX6kg4Yb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nrY403CpwjxYMVa12HRLXV9f+Q9SEidfvErK8eeb+tcTd7Rd+
	Qh1Ibt9CYq5mT5b36x40q2sp9x1yfWM4JBSa6c1Dr3fSQvT1G45DjFo/ecaBXplytEcVP8mN5FF
	Ff+ZBlpVrXbferO7uD/VPGIrwJZnOEXh+tw/0erXPZ5bby04S+WQCwSDW1H+JDJuw53WBoWzLmp
	DFZaVLEzoJmDAc4bGIaLAYsBpC/tekkX1NfDHrZVvzAsOWX1ITQBlFgpwEo+6Vb8JnbJ8O2r4wf
	0WD+KyALdoHZq9rwqnmPzfw
X-Gm-Gg: AZFdTZdEKWXqRybHijSkAE9n9RG43BuS/Gk1qbVpbOWF8mm0+38VvDjjE2SZZ9QF0Q0
	LPwtJpvZZ3cR+oCLYvl96IDWBpt7FwAj7Bmgyf+oCLte9QY3xW7HaJLdBLp5J7pSjrNyTG+gVBy
	Bg/6CrP+uX1D4E1vcecAeHCvVmKN/XEZJs2iAjCBWezD9/UGmtqp07Uk2pY94YlfV3cMSYE2pKG
	dRxdtSm4F58q3F8nkq9I3Hf/z2cwe+wE/47TB3Yx42Uodwlxg4FCocc4du274H9UBRfPffqWijl
	eonz213v5hHmtVVpOI5eIPqfHPj9juDCRzvtlBRHE2OwUp2rflM+EwF4Oys7fNovuBIDlPltiO/
	3h1RH5MjVqhWjZls65E0EIk8TLM5gyVItrxJcfBSQ/9PXZd/wo9uEfBQHXP8Ha3hF38SDc3EtyC
	944+/A1+0PZRnPpWipDsozn3x0dlPNLGUtAh7dRtz0D+M=
X-Received: by 2002:a17:90a:c10e:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b41c9080c5mr10615399a91.18.1795546716600;
        Tue, 24 Nov 2026 10:58:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae59fa2sm10854901a91.8.2026.11.24.10.58.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:58:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso5574595eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795546715; x=1796151515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aliirPXFY+qx7skKhpH0Dji/xTdYBn4uxxTPQjnsb3M=;
        b=Y/mB046p4pW+a6T6qFZ6WiaoZkS57rX3xM8yxOwzyqvCmgZNvVkS+pdGDuXpT8MDAV
         JqFff2G83P4ab6qzcaYgrxfwiuj7cFPsInDKai5x62G3rhph3Bd0kv1b5v4mbQCyZ5at
         +96+QOxdaFdt98BkiUPVunO5tuESx/VWhOe0w=
X-Forwarded-Encrypted: i=1; AL+hErFdw6z1aI3VvKUK1vbh5tqWwtD+BZyJZW8zZwZkcIGe8XNjlo8NozB4xXt+Cr5eBIfyZOYYIiGmIJF3MoQ=@vger.kernel.org
X-Received: by 2002:a05:701b:4583:20b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b55247f0e4mr15195498c88.4.1795546714341;
        Tue, 24 Nov 2026 10:58:34 -0800 (PST)
X-Received: by 2002:a05:701b:4583:20b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b55247f0e4mr15195461c88.4.1795546713531;
        Tue, 24 Nov 2026 10:58:33 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm41712779c88.13.2026.11.24.10.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:32 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Carlos Soto <carlos.soto@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
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
Subject: [PATCH net-next v7 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Tue, 24 Nov 2026 10:58:20 -0800
Message-Id: <20261124185820.3954716-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
References: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
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

Since MDIO_CFG also holds the clock divider, unimac_mdio_resume() now takes
the bus lock around unimac_mdio_clk_set() so that it cannot race with the
read-modify-write done by the accessors. Resume may therefore wait for an
MDIO access that is in flight.

Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0 even
when the controller is still busy. For C45 this would let the data cycle
or the next access's MDIO_CFG switch start while a frame is in flight, and
return the command bits instead of the read data. Check that the controller
is idle after every cycle, C22 ones included, and report a timeout instead.

Also skip the BMSR workaround read in unimac_mdio_reset() for children
compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
expected to respond to C22 accesses.

Note that providing read_c45/write_c45 also makes the MDIO core scan for
C45 PHYs at registration time, on addresses that are not masked and do not
already have a C22 device. This is not the case when the bus is registered
from a Device Tree node, which masks all addresses.

The platform device that GENET instantiates when it is probed without a
Device Tree node (e.g.: ACPI) does not mask any address, so it is scanned
too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a timeout
per frame since GENET's interrupt is not registered yet when the bus is
registered. That makes the scan slower at probe time on such systems, the
same way the C22 scan already is.

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 136 ++++++++++++++++++++++++++---
 1 file changed, 126 insertions(+), 10 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index f8e5c1811d96..b01e99327b56 100644
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
@@ -97,7 +103,60 @@ static int unimac_mdio_poll(void *wait_func_data)
 					MDIO_CMD);
 }
 
-static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+/* Wait for a cycle to complete. Some wait_func implementations (e.g.:
+ * bcmgenet_mii_wait()) return 0 even when they timed out with the controller
+ * still busy, in which case MDIO_CMD[15:0] holds the command rather than the
+ * data, and MDIO_CFG or MDIO_CMD must not be touched before the frame is
+ * over. Make sure the controller is idle after every cycle.
+ */
+static int unimac_mdio_wait(struct unimac_mdio_priv *priv)
+{
+	int ret;
+
+	ret = priv->wait_func(priv->wait_func_data);
+	if (ret)
+		return ret;
+
+	return unimac_mdio_poll(priv);
+}
+
+static u32 unimac_mdio_c45_devad(int devad)
+{
+	return ((u32)devad << MDIO_DEVAD_SHIFT) & MDIO_DEVAD_MASK;
+}
+
+static int unimac_mdio_addr_c45(struct unimac_mdio_priv *priv,
+				int phy_id, int devad, int reg)
+{
+	u32 cmd;
+
+	/* Prepare the addr c45 operation */
+	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
+	unimac_mdio_writel(priv, cmd, MDIO_CMD);
+
+	/* Start MDIO transaction */
+	unimac_mdio_start(priv);
+
+	return unimac_mdio_wait(priv);
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
@@ -108,14 +167,25 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
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
 	unimac_mdio_start(priv);
 
-	ret = priv->wait_func(priv->wait_func_data);
+	ret = unimac_mdio_wait(priv);
 	if (ret)
 		goto out;
 
@@ -137,8 +207,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 	return ret;
 }
 
-static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
-			     int reg, u16 val)
+static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int devad,
+				int reg, u16 val, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	u32 cmd;
@@ -149,18 +219,50 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
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
 
-	ret = priv->wait_func(priv->wait_func_data);
+	ret = unimac_mdio_wait(priv);
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
@@ -191,6 +293,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
 			if (addr < 0)
 				continue;
 
+			if (of_device_is_compatible(child,
+						    "ethernet-phy-ieee802.3-c45"))
+				continue;
+
 			read_mask |= 1 << addr;
 		}
 	}
@@ -302,6 +408,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	bus->read_c45 = unimac_mdio_read_c45;
+	bus->write_c45 = unimac_mdio_write_c45;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
@@ -337,8 +445,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
 static int __maybe_unused unimac_mdio_resume(struct device *d)
 {
 	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
+	int ret;
 
-	return unimac_mdio_clk_set(priv);
+	/* MDIO_CFG is also modified by the MDIO accessors to switch between
+	 * Clause 22 and Clause 45, which run under the bus lock.
+	 */
+	mutex_lock(&priv->mii_bus->mdio_lock);
+	ret = unimac_mdio_clk_set(priv);
+	mutex_unlock(&priv->mii_bus->mdio_lock);
+
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(unimac_mdio_pm_ops,
-- 
2.34.1

