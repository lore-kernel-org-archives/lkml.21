Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049999;
	b=mLabNWyBX/vkH3YCPd2G1eB6HwNDp+hzMFQklQpPAAEFnvXwVrVPl0uiA5WTSUZRyC2/
	 D5iTnU0n+k4ZQmm7K3KLD/KOdGnJmBIo2smscwnu/8grY0VX1TyYs/fBOc+OYduYDel+O
	 Gf2cspjItXkn5q8AjcUzb8TIU/b52XbP26TRYm9BD3TVp1KqM0oveJh2/F+AiVMSxkFKk
	 akcTuaynsrdI8PMk3l24gfaRvRoeiqTxiEHUWeJ/1M8PStTcdoVF8t8aWpl/AbEzUdcZB
	 S4k3/7M0k6334qrtdMH2hZEyBZqiwUGW/e1WcYrPLIWCxVFT4sv8/kOW1Bm+JPOcyHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049999;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
	b=miuKObwV5OnwPwJMQsijJ0gSmQ4+tgT2zwDaMPivxtRvsuRIpcWtx/mLtsbZHBTzXa4Q
	 A3wd+j8BJBPn0DQXdmMIl2KdWRuz8U4UzI6qBpaQbDGDUldCJL+Pvh6oNcOZQY3R2dJUi
	 AzaPzJmedXFbn3EcitUcY56U77bvMNtaKPaLjhwhuXY9ZqxqQdGcoVjhx/gxlA4alD45c
	 WMCbJU4cbTP8QAl/qX2JKCfr/QwN+0jbMHtXo/YpQFHZ0Kdr/ZUPmPExAv9qci4QGKba8
	 23RSE5b0PEACdlMPVtn5HqD9ZeCpHpm1VmMlA36446LxQRqe8agwqeAUHGkBXE41TKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EOsVzpWg;
	arc=none smtp.remote-ip=209.85.219.98
Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EC8606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EC8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EOsVzpWg
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-9212a5a66f8so325606d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049998; x=1795654798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=Cja6Ln8konbs5CPE7hF49ehHUILgDVbs4O8Qqj8j0zzQ0wzoCkfyywOUTv8hFmm7E4
         PJeQaD7QrkgJ9N/4kYalReBlDLqeIDSFhtCxS02J09xp3mBvO/PCx/E0qce3qEI7ibSs
         U9Va2TQ0b8UWyxKPrCsFDkes9HlQ9Q6Ge6vtgOTOTohwguh+wzTymOvfzUmXsyQPLcXu
         tCc46EHPlMi+JEuavcGewlOH2yNK6NcbPjxsji4wDu54ALXGYnqAOAlqzh0/u2PG+nwd
         N9JQxek8Tfkxwhy+B+d9IQOypBdiXd7Xj0NOZfsCVZCOu/Edczi52+9Fjjjqs5wTywI7
         NBYQ==
X-Forwarded-Encrypted: i=1; AL+hErGtn9DX13sahLcPiV9o5OvFVjX/u3Dvd2EVy4AYcxU4697a5imMyR1rDXhaueUYl2Pkv+3xLx8KjPwEC0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gPPXffcIF0IiDkq409/PHXa8n+31UWYE+NiW7nnVVp2FC74R9
	a/KjzrKM8HOG8umfcuRi+W8XAgOx3wYcWlKm6ctbQ6w6XzvKRvjmajhflEckmx4A9nmZk17BQj/
	9yALyy1vAgQxZZkZ58zjcP4ATR/OTo+ZzPk7NurgDzF/TAE87W4Jo1nXtPC0F3iWrwSYxmqq3yo
	G/mXvvkcg+Qb8V1bCLokwJE9pREoLp1mTT+Ju43zg/njYoLu9Qfv2Ev24w8q9Hli3R6So93/N+u
	9fAvQZtcFRR+voJdkPw4PAs
X-Gm-Gg: AZFdTZeHJwvH3IoWNNJaY6hQeUDV4TmBQY3Z/UZjU0VFNf5idx5rh5K6dLHY5KvycGP
	h4JBQgb7CGT8vYLCk0suHVrS9tHL/NoYEWgHk5a7fD/3rFzwXjF7JIqYwb9pERcgcHP/qaJUqgY
	G7hs8NEBn1b3p8sZeBJh3H1sAXtPjyvKLg0P9e2YH4gvHCV+Gcb74zz8hXsKRwYaedWZlgVYgxI
	RmD6CYV5uH8cZgCaPcr+njQMYq3OicwM7X6C1L4KUUcqvT7jtku/or0UFg20D8iLBf0BGzm/9mH
	c4RDaOWf85b+ADSF6mGC9Mgn3l392ORgaGj3LGji2xz5V/XIDyju5wQEdGeB1jW3fqmFBgBPJsz
	uhYKH1ygVdLjcdM/i/yveCl1eV1atWUpOpm7kVzJZGQxw3iRFd7G1roqFsPweoRUkEtDcPaledS
	U7+7i7Q4zOQTAaxamxpVhhwxNcTupgOmtuDH4ejN4R+GM=
X-Received: by 2002:ad4:4ea5:0:b0:91e:a3a7:eabe with SMTP id 6a1803df08f44-92114ee07d6mr72773076d6.31.1795049997378;
        Wed, 18 Nov 2026 16:59:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-92114e3d514sm544856d6.31.2026.11.18.16.59.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:59:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-921170b7de5so19826276d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049997; x=1795654797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=EOsVzpWgNVOdLi5C8NZVVP0Afe72NSY6d6SZluF9E4W1BEvtO42pVinsvAZTVVM1eF
         1GfkGrG4mun3ffg+yTddpALZWFKjANRmUrKj1yp91uIiNfnuYstsV3vye7ziiDkto86m
         qj/eOFN/5oinQCoKb0g2r3L8DmHoIFKSaTFcY=
X-Forwarded-Encrypted: i=1; AL+hErEBc5WUSNIH22eVPS8rwmr1KYaqIMK/wqu6nkCMNGeOs3kekfppEJghO5qnp9Z0lVXjq7ZRtcw/jPdvxuc=@vger.kernel.org
X-Received: by 2002:a05:6214:5545:b0:921:1242:f2a6 with SMTP id 6a1803df08f44-92114e6805cmr70001536d6.15.1795049996411;
        Wed, 18 Nov 2026 16:59:56 -0800 (PST)
X-Received: by 2002:a05:6214:5545:b0:921:1242:f2a6 with SMTP id 6a1803df08f44-92114e6805cmr70001276d6.15.1795049995797;
        Wed, 18 Nov 2026 16:59:55 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:55 -0800 (PST)
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
Subject: [PATCH net-next v4 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Wed, 18 Nov 2026 16:59:40 -0800
Message-Id: <20261119005943.999981-2-florian.fainelli@broadcom.com>
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

get_phy_c22_id() maps a bus read error of -EIO or -ENODEV to -ENODEV, so
that mdiobus_scan_bus_c22() carries on with the next address when nothing
answers. get_phy_c45_ids() only does so for phy_c45_probe_present(); a
failed read of the devices in package registers is turned into -EIO, which
mdiobus_scan_bus_c45() treats as fatal and which makes the whole
__mdiobus_register() fail.

MDIO controllers that report a read from an empty address as a bus error
(e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
with unmasked addresses therefore cannot be registered: the C45 scan fails
on the first empty address.

Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
mapping as get_phy_c22_id() to the two places that look for a device at an
address: the loop over the MMDs and the MMD 0 fallback. In the loop, an MMD
whose read fails that way is handled like one that reads as all Fs, except
that the remaining MMDs are not probed: the scan goes straight to MMD 0, and
-ENODEV is only returned if that does not answer either, so PHYs that only
respond on MMD 0 are still found while an empty address costs a bounded
number of bus reads.
Errors from the reads of the per-MMD identifiers, which only happen once a
device has answered, are still reported as -EIO.

Fixes: 17b447539408 ("net: phy: c45 scanning: Don't consider -ENODEV fatal")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 48 ++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..79f3fa1e9a03 100644
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
@@ -810,8 +823,9 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
  * the PHY identifiers for each device. Return the "devices in package"
  * and identifiers in @c45_ids.
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid or no device responds.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * if no MMD responds (including when the bus reports -EIO or -ENODEV for the
+ * reads that look for a device), or %-EIO on any other bus access error.
  */
 static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 			   struct phy_c45_device_ids *c45_ids)
@@ -844,8 +858,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
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
@@ -855,7 +881,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			/* returning -ENODEV doesn't stop bus scanning */
+			return get_phy_c45_probe_err(phy_reg);
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
@@ -1077,8 +1104,9 @@ EXPORT_SYMBOL(phy_device_remove);
  * phy_get_c45_ids - Read 802.3-c45 IDs for phy device.
  * @phydev: phy_device structure to read 802.3-c45 IDs
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * no MMD responds (this includes a bus read failing with -EIO or -ENODEV while
+ * looking for a device), or %-EIO on any other bus access error.
  */
 int phy_get_c45_ids(struct phy_device *phydev)
 {
-- 
2.34.1

