Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222107;
	b=tgqh5H03DPLdn/Ii/fVHRGobHxuYed0xwe7FJmQDsciW/6q6XSe1Z81cF3Ko6sQuTR+I
	 gPg+aqA8FHRyN1MF2afaJ5J/0Q4kYkMX+5SKFkW1FX90U8DrCFiYWjOKfvGHkAXqc5QL0
	 cYAfxwpiKCiJ5i+t5HGFAnEG3xdDtCI60+qSZ9lTEZ8iWDib0bnOhtLEx79aelRG10Owq
	 5CaLoNSTDudixKIdz21lvxrZt5buI8zv+sWJwuDjIU7LS/IHF7EI/tbgr8qqZNW14U7V2
	 R61RDjNi4uIajFKdKE+q5HO8ljVU1/GOIlBu+ZziDHpgPu2ZThOpQebTZ0nmf99z5wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwfzvTv0x0cb0+KwHKdlTWaN0+a4w378ig/9ybBrmuY=;
	b=cZekn6G+gjPOANYGT2KNkVSJbfsoUucvIfp+bmncaIwbo/LmwhUtj1Dsms0kfFmOcptv
	 QX2JG9dAcB1ML7IWEexBbiokvvZASVzyuyvzlt/X4Sayl7LvtfMVdLoes9m9/5pJ1XSIh
	 s+24f5BGtIY9x/UfbXT6eAPGbxNmOYj2Axx1wYy/UWLF+qXo1Q5/bvITdd5tU10EdLagh
	 cXeMy0jvhbUGHCX/spmP+2URaW86zH74hqaScM+RF1wnWhVDl6hw17/tWzro/zKVLjbhS
	 NAyzo75j1yHiGop+lQ0tfsWjt/Eg9PHowRKG13XaqDsgiSHEsK0AKbBIpw2RCIsDjpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXgr5u+6;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB6860A380E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB6860A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXgr5u+6
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1903871c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222104; x=1795826904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwfzvTv0x0cb0+KwHKdlTWaN0+a4w378ig/9ybBrmuY=;
        b=bXgr5u+6ih3KVrxqwFMuyBXs8vSIs9EdY9cgCC/4mkj1SVtcMA0sD1+9QNPGkShfjT
         Q+5XEAre6TojMjEO1zYtL+xjHftp3xhF+nAb6LQvfh/SBATvhSIjEPRMbGboM1qCywly
         uPHM7qioGeVFZ8DupT1bnmwDYAXSR0suLYxS2SWZTVnFjyVLQneaaEwMHv89Ev0GycDm
         vlMk75Rb8KIYISHHOYOlaovX91q5tWsQafIFXi9B6vOTueJc/Jt/+NnhIP1uyUmkD1ev
         aP5P4Z6SNTPsA//ibAfhDRNlm7pp6PgE2LKrDvkVJpVtAxEhYpEaCzTKeWdZMt4gRt5i
         9N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222104; x=1795826904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwfzvTv0x0cb0+KwHKdlTWaN0+a4w378ig/9ybBrmuY=;
        b=W9Zp8KkavVAyP4DwjcvrewztCVkCQasQE9tebDpebq0WyqyxEyPk5SVzODXA8k7Ims
         WG8NYrT4C8KpdwKoqj1bZFzwWhaoJ57kaUDpQPC/9StwAlifZFAho8YaaCVCPw/SAOxO
         ywPJ1geU68R2O6WRnrfAg5r2Cw15pIhxj4FQZb+cCtg1bMO/a5ex3Hbx9cyIwPksPTje
         oTdnJQc+4iUMa7PfYtig+Ez5pGRSX8g5+iQ/NOg7LdHeV7cHIaLaziTrjJy1wpDT4ZP3
         Bkc3TYso9FBB4GYcbHJY/M5jDp7y5gZIo+VRAyESPu63JtIwXA8bpQSJtZgwAuQqMlfW
         l9+Q==
X-Forwarded-Encrypted: i=1; AL+hErEMbiXknjIuOKKN1FxBdVmbJrBNuvLnD9A+eBR4J6ZlgWCJV0uF7uXyCN3gqCWou6Txhdfb0uTBMx+dulc=@vger.kernel.org
X-Gm-Message-State: APuU4Z83vR6O+nmn5ND6mzd1cPfNE6qd1TtQORBR3Vmj0rWTVOfrItIQ
	UV0ay7PnKWDO5r6lBG2rHO+YNiZBAb0VTX7lIi2JWG2Fy+WP2EH6VjTM
X-Gm-Gg: AYBFou0H73WEYy0cZ2xGkHMqXwtOIYLztbqqMqVk/i0cj46Q5376iQh285vKmVQaj62
	wM/LYW7E2QAWutABnX5lf3TNTIEB/jfP1SDjNBmDGEwdUULzbrJJUtwOpC6hf0EMrWWczWOo/TN
	SLU8hpyL/ubMAeEiYVlDO3F+UjbS6WAmndIll4TQFEBaS6tHmexVD3uIc30Au8pEYESCg14xySk
	1quC2W4kA/Rrr/QUfCZT+2wlWAkWYLt4+VdKbd6O9wAm42odO2bkaeRAbC0M0eW+E7f/Zq6oLQF
	7M+sEPVCtln8+rLIkpRAvU0/DKN9zGcZmMHEkRBpV48JdruOqAfTkzuV0hMYZEovqw4HwZUVX0h
	BbghL+z7ErSI2yInKjLuf6Ky8FBYCYecPWWRm7lrmw4aru1Ky4VGzESF8hC1g3jA1T2eVZ3re5A
	rZaNWKpSdEgGhY+WGU8hvqQ7fY1d1maD+L8kkQmZq6DPjFuj96wATmFeCdZg5sIeK+vlw2SjHbW
	DbWY0V89SX/VEz8TiXU8W0yU2DT5EfYNd+l393cDldhwvK+yaHOZxLKfR6dVBrUroDpJJiavfmL
	7RAQdoaC
X-Received: by 2002:a05:7022:295:10b0:183:e993:7901 with SMTP id a92af1059eb24-1b556898be9mr4256668c88.17.1795222104119;
        Fri, 20 Nov 2026 16:48:24 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:23 -0800 (PST)
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
Subject: [PATCH net v4 08/10] net: phy: smsc: wait for LAN83C183 power-down recovery
Date: Fri, 20 Nov 2026 16:48:07 -0800
Message-ID: <20261121004809.1690280-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

The LAN83C183 uses the generic PHY driver, which returns immediately
after clearing BMCR_PDOWN. Section 1.11 of the datasheet allows 500 ms
before normal operation is restored. Starting the Au1000 MAC before the
MII clocks recover can hang the MTX-1 when reopening its interface.

Add a LAN83C183 driver entry and resume callback. Wait for recovery only
when BMCR_PDOWN was actually cleared, and propagate MDIO errors without
waiting. Resuming an already awake PHY does not incur the delay.

This supplies the PHY recovery delay; it does not by itself fix the
Au1000 MAC/PHY ordering on reopen. The companion patch, "net: au1000:
keep the MAC stopped until the PHY link is ready", resumes the PHY
synchronously before MAC initialization and stops the MAC before PHY
suspend. Both changes are needed to address the MTX-1 reopen hang.
Keep this PHY change first so the recovery delay is available when the
MAC sequencing fix is applied.

The specific PHY driver must be bound before the MAC attaches the PHY.
For a built-in au1000 MAC used during early boot, enable CONFIG_SMSC_PHY=y.
Module configurations must arrange for smsc.ko to be loaded before PHY
attachment. If attachment falls back to genphy, loading smsc.ko later
does not replace that binding and the recovery delay will not run.
MTX-1 validation used CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=y;
the boot logs confirmed attachment to the SMSC LAN83C183 driver.

The LAN83C183 and LSI L80227 document the same LSI/SEEQ OUI and model 4,
so this ID match also binds the L80227 and applies the same conservative
500 ms delay when clearing power-down. The entry otherwise uses generic
PHY helpers and does not program SMSC-specific registers. Hardware
validation is limited to the LAN83C183; the L80227 was not tested.

Sashiko AI review identified the dependency, binding prerequisite and
shared PHY ID.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
Link: https://datasheet.octopart.com/L80223-LSI-datasheet-11757091.pdf#page=73
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/phy/Kconfig |  2 +-
 drivers/net/phy/smsc.c  | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 30e9d22c8d1a..10466b2574eb 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -421,7 +421,7 @@ config SMSC_PHY
 	tristate "SMSC PHYs"
 	select CRC16
 	help
-	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
+	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs
 
 config STE10XP
 	tristate "STMicroelectronics STe10Xp PHYs"
diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index 48487149c225..c0713017e54b 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mii.h>
@@ -684,8 +685,33 @@ int smsc_phy_probe(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(smsc_phy_probe);
 
+static int lan83c183_resume(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
+	if (ret < 0)
+		return ret;
+
+	/* The PHY needs up to 500 ms to restore operation after power-down. */
+	if (ret)
+		msleep(500);
+
+	return 0;
+}
+
 static struct phy_driver smsc_phy_driver[] = {
 {
+	/* LSI/SEEQ OUI 00:a0:7d, model 4; shared with L80227. */
+	.phy_id		= 0x0016f840,
+	.phy_id_mask	= 0xfffffff0,
+	.name		= "SMSC LAN83C183",
+
+	.get_features	= genphy_read_abilities,
+	.suspend	= genphy_suspend,
+	.resume		= lan83c183_resume,
+	.set_loopback	= genphy_loopback,
+}, {
 	.phy_id		= 0x0007c0a0, /* OUI=0x00800f, Model#=0x0a */
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "SMSC LAN83C185",
@@ -887,6 +913,7 @@ MODULE_AUTHOR("Herbert Valerio Riedel");
 MODULE_LICENSE("GPL");
 
 static const struct mdio_device_id __maybe_unused smsc_tbl[] = {
+	{ 0x0016f840, 0xfffffff0 },
 	{ 0x0007c0a0, 0xfffffff0 },
 	{ 0x0007c0b0, 0xfffffff0 },
 	{ 0x0007c0c0, 0xfffffff0 },
-- 
2.53.0

