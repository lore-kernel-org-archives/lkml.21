Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151855;
	b=tBCI7d1rF6Rcu8Lzj+Wi1KJVTwodlcBYPVqnX8tDFd55ZahkYpbZBX9RhXU5NN55pgnh
	 2vzeQ5Awr7Cy9QZdf1gQMhg1X/hUma0PYSySF+7G1WMvvMQwocrBhWr8W2rZ83LuIMWwy
	 ojUi3fgsmHmWnNljP4BfP2D5SF/mANguMwPlixHl8eLvGJRZtGokZ3TkXjX/7cbo6zPJa
	 OIBdnl5XhxF5eXOYF4CdY50MZHOU+bLttaoPt4ftjj7rJXbO7cE+MLN/kubb0UY6godsW
	 k0Rzmd5uICR8VCSNAVQ+7lAgD+BGVh3/RqWpo4g50HJH4tgkQaQ2PIQuUkKxAjgxLPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151855;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
	b=rTNR6UzZ8bGQoY3cP6ujAoYMfUIdHGhBsCCfavz+UlnCqwHlbFvJZf5qZvkVLO7r3il5
	 m5RtsfRVOrw1mSq1t0K2Kzo6jDsXH8HVhtFr2nyzUDDP1uShiDWK0Aear0tLl62rCDy6M
	 h/6R/lqjcPQrGc3b8XYNxGH/P/WtyoQO8t9Eahz/5QgPfJBKB395tSQmZ/E4FOPfQs10h
	 rq+2KXAVaeHukbbin15x+juT+zSWD+bi6wiX0C8TVDB3fML9N0Aq1og3VjEQ553xwM3W2
	 MGyROmEdwWwKj2VxX4Zk0QI8o9mBCWjE80MExMm0mXiktl2fmGpAdPbXKKDHr8bTjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WnMsA6F5;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0260A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A0260A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WnMsA6F5
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so511438a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151855; x=1795756655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=bA8CitarAF2tPN5HYHoodDomCyV+DIvS7EG1eu2VGwUFb5cSsfD3BsteTMzfNv0Q24
         sC6ckvycfXIutP0ICpOw6hJcCBGclo9J4+UZliwmodoRT7fG8bx0RlY/YFiwCrywgpoU
         3WTODaJoWDEO6M73rAKWc6h1inPc+2BomZov0JGKNOAcLXOteii4FWh8qeU6JRp//i//
         S+/dXF3h01W3nDr6KIY76+5OODvD66q+wQ2JVFiza6AGWRuwOjzgpk+CEkEQktZY/pin
         x/wppCMCnx+eOMKo5hUt/VKMongWYd95dY53Cwi0+Jbno+0zixdEtRGr5tmNdsO9NQAN
         rV4Q==
X-Forwarded-Encrypted: i=1; AL+hErEBQm63KBxJPQsksVgK9BwdxzcblTkSsTIMNdfyXHEUYMHtU7ojoNfZ+R0Zf0QI+pqLl2RSPpD291/1N4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vwfV32wIYlKXvH5eIHnslNfmZehSbUce1/d2GTM1w+v6s30yg
	O7yzT1lE91AM8VFPR3DFA6pYVmO7lrqd0sExuEuD1YQTD6NIpjzMJKsaVyq+9N+OKOHQqDZp0sX
	8DXA43MPdZeHOFCuGQdWNEWatNFNB3LypVtqG5XRQ4WDiuqStEDRuuMq8KDUvqvKH7gumB45o6g
	xMzLHpZ5XX/qyFNIvYrb5ctQtcG6z9jneducXr11bKXj/fCv4x9grRiCmklyxw/OSkjg+3M/+Q1
	wUDyQvLd7qffaFuOp+QzzdD
X-Gm-Gg: AZFdTZdybJjLeVubPHLs5sR2osi/mYSA5X+DX7WEAhHv5JNTGx1yD4rG143xifdJunq
	NdLmeFgOo5jAS0+3AxGyH1sa0X1lPLDA2QHhvj4LGVX5P/E8z+uSuXCWHTKW3ybzNvOoQreQBRW
	2qgBwDjSxtOAWVHqS4qwQHERCm0H6Kk/ZFW6v4KIGzxSMdNCCdtaj5I+oOlYVuS5Ks37F5LVf4J
	KakorletKw+2bGGjtH2ZQBxELaSRktImlDBGzX7ugKjn5d5rLOKVZIx7qfKIIiC7jGaMcon3FoD
	rXQ+dbnV2QCIhAvpZMq0awC/o2yUV1WQOFnCr2lmeRJjCVwUxkLypxXoxWF+sdWeE4dY1xfVrgK
	V1I71J95cwh4t9GvK79udp0uVzRFU10UPozQlM56OAd0jadLCzTAqjLOFbZxhnDMVsahio8Um+X
	2vUR+Llq1ej06i2aMNpqCog9YD9JAPD91pZvWcy3+ihq4=
X-Received: by 2002:a17:90b:4483:b0:3b4:1bf1:9894 with SMTP id 98e67ed59e1d1-3b41c8ff6c2mr1437879a91.33.1795151854844;
        Thu, 19 Nov 2026 21:17:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add89d3sm1267413a91.4.2026.11.19.21.17.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso90748185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151853; x=1795756653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=WnMsA6F5qnLQLWHLIrohQO9Wxh6vZR3FQieeEXR+lH6+LzZjdqdfswRtsO6lEVXnGG
         dHpI3wkWVzyu7A66e8Az5Vhq8rZVqwcF8Afxpw6sorQCj0wq8t+2PW1VaO27JSY4WZTW
         9+O8Z2193bPb5FVF1+aMODCIInwetm31m7yv4=
X-Forwarded-Encrypted: i=1; AL+hErGEASlg5NH+glaeLbR5YAKkz+rZG9M580RS5OVNd3zVP+LbXZMR/HliFw6H/A18B5HN0vvKJ1DDl2S3rlg=@vger.kernel.org
X-Received: by 2002:a05:620a:6496:b0:93f:3219:835f with SMTP id af79cd13be357-949bab74e1emr297835185a.81.1795151853102;
        Thu, 19 Nov 2026 21:17:33 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:93f:3219:835f with SMTP id af79cd13be357-949bab74e1emr297832785a.81.1795151852570;
        Thu, 19 Nov 2026 21:17:32 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:31 -0800 (PST)
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
Date: Thu, 19 Nov 2026 21:16:50 -0800
Message-Id: <20261120051653.1433677-2-florian.fainelli@broadcom.com>
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

