Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452528;
	b=XNFNbYxzHlOrt2+fsk7QMiiAnD5O0WgktvNoKXEXkcZy6xlxzvqcHTjRvQtioHhjr91h
	 z/cxVfom6XOgkJp7QUrjCByPukCY2vYukTNqMwtRg5MO/s28f6dpiZKy0BAcfloZ4HlAS
	 +YmLmeyJ/EY8irhFNrI3LG6PfKllyAGwm9F/vl3uVttHtuX63NCeUOtisXJQ9jEdKBqI9
	 u/xqAKMpZ5yiISNCbA67CrWV5Dlc+MOiSeDD9APQyfbAj6ZRWjkCiymgQg5R9Tv+pYhIJ
	 VupXnTa+qMunSpV7P3Iw+YMVM6Rc6cM4Eq7fwkKz4L70HIaPtXoz9B8wOl6G3iJnzPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452528;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=71Th2TF1+CZbBFg8quMQHhhil1oILjqdxWZFapcLOtU=;
	b=Dn4NZkblNU7bBg/+zazzhj8VSZYu+TWewnOR9iOuj4utULHLUHSQZldvMOB2ckJ9MGjq
	 rq7VE6TWT5Vi3WntHxoyT3m5KIhmoai8BvnDyzky1f2XcLXSBk0KDKRETUYSkK4wzG/VF
	 x3T2BltRLT44UeZXst/NsSsqsxs0SrW861CMOoQlCwZG+X4K6brppJG+BfgI0YqJggZtR
	 pnjzcD8NKlA6gVp+ll8xJg6aL3b/gc9iZtOrEA5jagt7CIHxm+Gast1eykLez70GxIYd1
	 O2/aUf7TmxNnbjHCa47a2kG8i2IICntFNhmsNarXLHuSb9WQwjJszAnK/JiMVYMqtjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YAL7vSIM;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73B606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F73B606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YAL7vSIM
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2f07a960666so16006195ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452527; x=1796057327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71Th2TF1+CZbBFg8quMQHhhil1oILjqdxWZFapcLOtU=;
        b=SKhn6F7hrXAi29NKxP12ZvGwo2aBOy9b7cvxm9gHtDMLYjqbkEAtiNxSTcOmQeq2vO
         5CBv9umIwbdPP4foCUCnjZyp2xJCARVRD9RjYprDc/gNYFxyIJnd9tpqIkYITQ4vGd/H
         meWs+U4KXNFlUFqEKn7EwLq+6fO2OISh4fC6Lo6LT+lvw9aMSv9itVJqWGOOc9DVx64V
         7mFTCFGO5nwWtRvbjFVE/lEtl5EQoK6cJ6Mbr51Lz2Q5t4gdcqcmV3dMARqQ/HPihIzF
         wM/wPcWSImNQ7umAum430BmeKf3XbFFPAR7FGcUj08tbmZ6rQJ97mPGb88vqHUIhALKY
         Ti+Q==
X-Forwarded-Encrypted: i=1; AL+hErEv1f4aHzfK+JHt37XV54EWPJvRyxUGEeZExWV1tfwJjRIEpOSycASMkoG4rSa5EjZP9h665x5E9osjL0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uoCFcT0jKY61JgvBPvVb00dOJhhWXKMfiYtwipfj5lO1eWi/J
	pLNb7m4w5f98ENsJ22paNARq9jsrrXELN2rWfUyAWqHD9Zj1neDrdi20VMw/ew+h9mbgyx/Cic5
	+xhL4ffUeI7QcGxG0EifYN6p1T5CXYfqVmxl/Ysbog4Q32iYisI9/4/biRoPX3BA3Zf3jUNpIxJ
	/iHnS+W/vR1IEICHKTaxZoJzId8TO/a6wKQvG92Hk1GshWpCktWjs2DD/0yT4gEEG1/yf2Zu4k2
	vy7UxATXMVXkmRGH4Xmt70J
X-Gm-Gg: AZFdTZdwHT+PAF7SWFLOOGMVUmtyFXBh3L/5/M1l8XNIv2waFm9acK0fS0Kl7IYPW+/
	6E7dYAmtqcJkMlt8p30k1HR8V4X+AFINwqtBW7zPn48UZ5pDKbDuZi9jUjiHMKSgcsIhgq5xQG8
	L3dNSKri/7zQgCTeSRsipYTG00y2MWj9oHuaXbaciju/hptGJrEpapqEdksmMK4SDg9sBpS3WfR
	DLOxYF+gpAEQpzzeZC/LG6pEfaPbl3hLjLahDZeSU8dlYGVut7dVu11TLYzJC9ZzrOsBZm+tjE+
	+S6EZEHpebCTXOPJ7mk/9JDM9EZ/p1+ST4nX15bV2rxE6nR4BVzzJSO8Iz4VWnG4uzGvmmKB9q9
	x/xcxfHknzyI7acuZ8mte/tRoBPkXRuVMx8BcS73J4ti5MAJW9XUmxSIYJLnO5mdvrShiylctn4
	P/jERolGdum9QBuNmxLM2wpCx5hkUyvqLGBznH0sTYuqE=
X-Received: by 2002:a17:90b:5543:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b41caeca54mr10918892a91.36.1795452527447;
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm9421713a91.4.2026.11.23.08.48.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210a12765eso19527326d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452525; x=1796057325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71Th2TF1+CZbBFg8quMQHhhil1oILjqdxWZFapcLOtU=;
        b=YAL7vSIMKbdkLW4npFQMVDc5yYAWlmCBpLtsoRXNJ57OSvB+tIuXdBRPMlhzoM0m8/
         sGgp6igafA8e9WbPNkUj0xgCn850vnHY2PYHsazJFnSqrunbVvg2YCui8Ywzk3EjQeD8
         XL0qBjbrTRJcnV+giNRWRKiMZu1uNEXHDbIRg=
X-Forwarded-Encrypted: i=1; AL+hErHbU51Pr6CmFVSPO63OPOrS/utXkDd8ceiUvWbZG0QD2IBqxxyZxUrJv6ajGf5soz5X3XfzTNVnHlff5zI=@vger.kernel.org
X-Received: by 2002:a05:620a:8387:b0:939:f49c:1b30 with SMTP id af79cd13be357-949ba99cd63mr1846267885a.13.1795452525222;
        Mon, 23 Nov 2026 08:48:45 -0800 (PST)
X-Received: by 2002:a05:620a:8387:b0:939:f49c:1b30 with SMTP id af79cd13be357-949ba99cd63mr1846263485a.13.1795452524624;
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
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
Subject: [PATCH net-next v6 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Mon, 23 Nov 2026 08:48:32 -0800
Message-Id: <20261123164835.1733304-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
References: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
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

get_phy_c22_id() maps a bus read error of -EIO or -ENODEV to -ENODEV, so
that mdiobus_scan_bus_c22() carries on with the next address when nothing
answers. get_phy_c45_ids() only does so for phy_c45_probe_present(); a
failed read of the devices in package registers is turned into -EIO, which
mdiobus_scan_bus_c45() treats as fatal and which makes the whole
__mdiobus_register() fail.

MDIO controllers that report a read from an empty address as a bus error
(e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
with unmasked addresses therefore cannot be registered: the C45 scan fails
on the first empty address. mdio-bcm-unimac does not provide read_c45()
yet, this is enabled by "net: mdio: mdio-bcm-unimac: Add Clause 45
support" later in this series.

Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
mapping as get_phy_c22_id() to the two places that look for a device at an
address: the loop over the MMDs and the MMD 0 fallback. In the loop, an MMD
whose read fails that way is handled like one that reads as all Fs, except
that the remaining MMDs are not probed: the scan goes straight to MMD 0,
and -ENODEV is only returned if that does not answer either, so PHYs that
only respond on MMD 0 are still found while an empty address costs a
bounded number of bus reads.

Errors from the vendor MMD presence check done while reading the
identifiers and from the reads of the per-MMD identifiers themselves,
which only happen once a device has answered, are not mapped, so a PHY
that fails midway is not silently skipped. The kernel-doc therefore
documents "a negative error code" rather than -EIO as the only
alternative.

This is not limited to mdiobus_scan_bus_c45(): get_phy_c45_ids() is reached
through get_phy_device(bus, addr, true) and phy_get_c45_ids() by every C45
caller. For those, a failed devices in package read is now reported as
-ENODEV instead of -EIO, which is what C22 callers already get:

- fwnode_mdiobus_register_phy() for "ethernet-phy-ieee802.3-c45" nodes:
  __of_mdiobus_parse_phys() logs that the device is missing and registers
  the bus without it, instead of failing the registration.
- sfp_sm_probe_phy(): a module whose PHY does not answer ends up with "no
  PHY detected" after the usual retries, instead of going to SFP_S_FAIL.
- gpy_probe() through phy_get_c45_ids(): the driver core treats -ENODEV as
  a silent match rejection rather than a probe failure.

Fixes: 17b447539408 ("net: phy: c45 scanning: Don't consider -ENODEV fatal")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 50 ++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..2f17c9d4a2b9 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -780,7 +780,7 @@ static int phy_c45_probe_present(struct mii_bus *bus, int prtad, int devad)
  * Description: reads devices in package registers of a MMD at @dev_addr
  * from PHY at @addr on @bus.
  *
- * Returns: 0 on success, -EIO on failure.
+ * Returns: 0 on success, or the negative error code from the bus read.
  */
 static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 				   u32 *devices_in_package)
@@ -789,17 +789,30 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS2);
 	if (phy_reg < 0)
-		return -EIO;
+		return phy_reg;
 	*devices_in_package = phy_reg << 16;
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS1);
 	if (phy_reg < 0)
-		return -EIO;
+		return phy_reg;
 	*devices_in_package |= phy_reg;
 
 	return 0;
 }
 
+/* get_phy_c45_probe_err - map a bus error seen while looking for a device.
+ * @err: negative error code returned by a bus read
+ *
+ * Like get_phy_c22_id(), report -ENODEV when the bus read failed with -EIO or
+ * -ENODEV, which is how a controller signals that nothing answered at this
+ * address, so that bus scanning carries on with the next address. Anything
+ * else is reported as -EIO.
+ */
+static int get_phy_c45_probe_err(int err)
+{
+	return (err == -EIO || err == -ENODEV) ? -ENODEV : -EIO;
+}
+
 /**
  * get_phy_c45_ids - reads the specified addr for its 802.3-c45 IDs.
  * @bus: the target MII bus
@@ -810,8 +823,10 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
  * the PHY identifiers for each device. Return the "devices in package"
  * and identifiers in @c45_ids.
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid or no device responds.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * if no MMD responds (including when the bus reports -EIO or -ENODEV for the
+ * reads that look for a device), or a negative error code from a failed bus
+ * access otherwise (usually %-EIO).
  */
 static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 			   struct phy_c45_device_ids *c45_ids)
@@ -844,8 +859,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 				continue;
 		}
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
-		if (phy_reg < 0)
-			return -EIO;
+		if (phy_reg < 0) {
+			ret = get_phy_c45_probe_err(phy_reg);
+			if (ret != -ENODEV)
+				return ret;
+
+			/* The MMD did not answer: treat it like a read of all
+			 * Fs, which is what controllers that do not check the
+			 * turnaround return, and go straight to the MMD 0
+			 * probe below. Do not probe the remaining MMDs, each
+			 * one costs two bus reads on a slow bus.
+			 */
+			devs_in_pkg = 0xffffffff;
+			break;
+		}
 	}
 
 	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
@@ -855,7 +882,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			/* returning -ENODEV doesn't stop bus scanning */
+			return get_phy_c45_probe_err(phy_reg);
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
@@ -1077,8 +1105,10 @@ EXPORT_SYMBOL(phy_device_remove);
  * phy_get_c45_ids - Read 802.3-c45 IDs for phy device.
  * @phydev: phy_device structure to read 802.3-c45 IDs
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * no MMD responds (this includes a bus read failing with -EIO or -ENODEV while
+ * looking for a device), or a negative error code from a failed bus access
+ * otherwise (usually %-EIO).
  */
 int phy_get_c45_ids(struct phy_device *phydev)
 {
-- 
2.34.1

