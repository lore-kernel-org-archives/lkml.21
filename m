Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958838;
	b=N8hJP9HOxh39rGIng99aWbG8nohnH7sZ7hfd+4r2tMB0Ex0zYufF29YZYRM32bvT1pIl
	 OrYKb3yVV0/HjQ43JYJm5OE56h1SU1yvTlrQSjukDl5+Hl62gmJ5fW6YDvQrvwH7x+fEj
	 4GXEPoaDDNAQwzmzbHzQmWfJ9rymvQxsV/Ldha+YIXeyk5cqNJmsbu480c9aAke2xRiJV
	 a8RvdQN5EbYvrb1OdystgImYyOl4LZYWAf34iefOZrDWwBwWxAkJ1XqP9D8qi68iVBH06
	 yEFtop7UmGwAdSTdKNO5s+VwQc81Wl0pPTu7HbG1lKFLUl17lYrUdjh1XQ+WBIeXtFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958838;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PL+n1mALsSLmLKb2oPWwk2zFcY0qbXGwLsQIm50Rdk0=;
	b=qglNFLHU+e3C7PBSNnpXRsVz6fhReedmou7RLev8U9Dz5KoiYWdpfpkn3jmLH5URi4fe
	 FtwyGvW6YLSCxc9918lBhLw/MhasZyOE6tduKSP6Yy/8XSw2wSfQfGXjfARxuIinTCYfU
	 7NOAftb4XE9K/fJDVO7VRV4fN4xt+eJkubvGGenMklye66/Zd2NwupW4QcxIPGpYPp6tR
	 TKgGnmzxvlIzDyo710LdDbl7MAoF3irMmKQgQS0LzcVwBekHinTDGbNdOLtiMtPC4VLFm
	 5MjKn1gAGxeQv69JDJ2C1WPvE+lptTiZLg0oxqdOE3RTQzd2ugIZ73E5HzMwr1xUjlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="fcQXwg/5";
	arc=none smtp.remote-ip=209.85.160.100
Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com [209.85.160.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA933606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA933606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fcQXwg/5
Received: by mail-oa1-f100.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso150376fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958836; x=1795563636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PL+n1mALsSLmLKb2oPWwk2zFcY0qbXGwLsQIm50Rdk0=;
        b=Pxj9D7uYMDGbAh9yrozTRDZsJBbdIhOpe8NDivTTvc03nEeBad58fNilCejT2DUGVn
         MpqoDoNvBROF2QXmyANOAob3xa5ye03VModl8xBcHNNtPgr/mx2nrG22bLZnEaJ80htI
         NvRZKrTxhz8qpWVGCH0L7IDhHK7SwGGEg+vEE4QYW7kZOP+4pfP5qKuAQsQtAS5iLh9I
         ZOojBQBWwZALmWOo4DcMjOl05zZ/X4JeyGDqEr7bhaCGZa5ea9aQKPswYBIQ1a7Pi3+o
         9aMKzL4aRqYVe0XU2wZ3FAm7/ROcUvpYoK2s4q3czAJ1WmVm83jJcMEqs7VS76DmxSks
         vx6Q==
X-Forwarded-Encrypted: i=1; AL+hErHVD2kinUudO7r5R0E5UIu2hhtfABtU4SDfqayrhTXQG44xfuG91SRP9PzVBZJx6u8OAYXLk7wp+zY1OUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zUXMyDR6RiBFQj89WW4Sg0c2NxUhd8mdxrRx9MGj//G+hpBRK
	0kk9SWonDiffj64VAGLXtYYPatJXfGAG/mgpc+ecx2OHCqCTBMPzNTzgYGxB93A8h5BxCEN6/n5
	be1s2zA9jJ9z0EWLXAFwqGcgGa6xz60HOUsZYYFdZFT2hC6M5IzJfOB3P3kx03DTXXW55F/3TLL
	GOKhnZ17GmHvSo3pDvKCiiaJGqW77V7pdt3xPT1WtfgENS6z3mrOdYtcEpIBIEeUu3fvnpJ3De0
	hPDKJdWpoejIukkJrbt0Aoy
X-Gm-Gg: AYBFou2d29j+gMbaHfCiEu8JXJb1zjgZE9UHMk1z+hMDjy+HQOcOE37TD+FamhPZQqB
	XvlzDCTYfxfq4nJ425IBaH3FTQ8aERT8YazcsNOK3M5rXKygVM3gBw014BTWPvD3Jv+O00ZvCft
	xWySbk0cp4uv4fnTPwR2rFc+5oI8yl9yyJmky+P1pGbytyyOL+3uDqclz/HjOJdiDJ/Zv3qeLX1
	sY8AgmHUQxkFDOKNGeSTRqYdUFzIFJmCnEv++aAczJMNsA+EhbNWZaHB/uRnWbDELGHpTwHEkYy
	Zn2QakrgD1RFA6TSBe/pjO3BkXWIUi7Fg/TGpEq3n1HTsRrElycvznf4BVOmZAU4JVSBqVgc4py
	g4jjYxyUNW596fDm/o0kcpfftKSu+nAM08CqY6G/5vEgZrJFjUE4/0pm6viXMp9bf0aX50T5eSL
	Gvp+m5LqP7NFAetp/ewu6/kNB9AUFilA3zY3kfHyic
X-Received: by 2002:a05:6870:1424:b0:491:2ed8:33e6 with SMTP id 586e51a60fabf-4b75f1311e1mr645229fac.59.1794958836326;
        Tue, 17 Nov 2026 15:40:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4b74560b241sm9560fac.12.2026.11.17.15.40.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:40:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-862a543c4bcso426771a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958835; x=1795563635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PL+n1mALsSLmLKb2oPWwk2zFcY0qbXGwLsQIm50Rdk0=;
        b=fcQXwg/5RXFDLAZnOb4QpU8E0udxNRaIKXWhL7f7wYHSv2ImerwgcgfPHkZubuw+8J
         GzuiHzVqCHf1l/HZk740GPRD5rzkc0v78iTdY1Wh4FsPr0PFTfhSD9seEGXrihYzAFIs
         hh4o5LZ5xNkqgSoerdpWAqvcGY/ZDYwdhImus=
X-Forwarded-Encrypted: i=1; AL+hErEiwMMBWHNb2kSoEIyQefhRk0Ia9fwEG4gXgeez6JmLLKW2cI6VWumpxjEby9660Jzsm9OJGWwLmcMyb8M=@vger.kernel.org
X-Received: by 2002:a05:7022:287:10b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b543d4dbb6mr881625c88.41.1794958336831;
        Tue, 17 Nov 2026 15:32:16 -0800 (PST)
X-Received: by 2002:a05:7022:287:10b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b543d4dbb6mr881593c88.41.1794958336123;
        Tue, 17 Nov 2026 15:32:16 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:15 -0800 (PST)
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
Subject: [PATCH net-next v3 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Tue, 17 Nov 2026 15:31:46 -0800
Message-Id: <20261117233149.1693881-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
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
address: the loop over the MMDs and the MMD 0 fallback. Errors from the
reads of the per-MMD identifiers, which only happen once a device has
answered, are still reported as -EIO.

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..4071041e1051 100644
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
@@ -845,7 +858,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		}
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			/* returning -ENODEV doesn't stop bus scanning */
+			return get_phy_c45_probe_err(phy_reg);
 	}
 
 	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
@@ -855,7 +869,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			return get_phy_c45_probe_err(phy_reg);
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
-- 
2.34.1

