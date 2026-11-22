Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353551;
	b=pIRcZaYDOTBf/fvR0ayakJx3iLF1W6/MCFKmgTuCf8jttF5Ix+0Yicm95Bd49coekQ1a
	 GTloYlK4esTPTg37gXGw2CVSMiqoPdcPpfA8F7a2wlJ2O43IWFlFm4aENaeUUGSxYUihR
	 m6x48EdxB7pKhj8oFgiXOsVTTVtJZwGUWINzSRjT6tS/o5sMIiQDRPnQODUe27sSoP3V1
	 r3CHz6TvkN8AabkEzQysg928OJa/aoBBc6NfAIm/ST6xqmDb7wyq04WTDJV5m5SWsRF8a
	 Nk0+boFfgIM1Eg/lfd7I45Ndf0XsQayp5MWdo8zboJbscnaL7PWVaecvp6bBcVnZuaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yvLY4RG0UMfUAbLJyiddDRoKxLti/A2PByI+AUFnw3g=;
	b=F93xr5191zn8qVzw1atFvuCluZd4Xc/ZHA/WeYpc1yWFsAxzbWujbVW2Hu9QjoLdU6Gn
	 hWUEdpYxrQPvn4M9FKLVbd18BCnIs8c/GoKTlf7hUQdp1pD/N+LUCmb314IZVXSuWNL92
	 rLgkZqbOKBOsTB+E6TnIOadRvvvvOborsn6xSyKbaE8U3+/FITVUE81wgRtYPbeKlYQxy
	 EU0VU3uid7+piQNQfi694Qaq9e+Q8WHYuf2Nmx3/KFZ2u+vecYCxUIglZNE2c9FGmkzMc
	 SKM6npq2cHkF3O/k8hNnGCOkk93S/Z9JtQBJ9A5sQmXncHk5vQ7A3Pk+IoJvf8PalcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2R99fRH;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2599606A69A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2599606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2R99fRH
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ada7d53082so27080711fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353549; x=1795958349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvLY4RG0UMfUAbLJyiddDRoKxLti/A2PByI+AUFnw3g=;
        b=m2R99fRHeR91i1TjVrirxXEJlb3mMgDTF1qIotkCIotfQ/pBtpsY9hQX5Kh3Cvh99M
         R9X2+gz5jPoYuyCIWHeaovJTwPa69D4c2xdCOPvfOD2Y/YoM8yMrk8cgjZ+OCTUKabnz
         HgTH4b/GvS1tIc7rKFW7Uc9g+vKqoTzMkJLVDQYluJ2+qePDP5NDa5QrFDLlUgtcNa1n
         P/4FgtOo4yAXvDBVPKszBRsihX7sh9evPH7J80imLQ89T4u2akBT91aR6JVCGWjKJWtG
         OonHxeiK3HXFc8SpnMdspI/JIVxNIHOptzcZHAJAQOHVYsJmCsHEXJ7eKNpxZrCdFKrH
         y1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353549; x=1795958349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvLY4RG0UMfUAbLJyiddDRoKxLti/A2PByI+AUFnw3g=;
        b=Ao3ZTz5/SJKZvjqeFtw7vyInfCpiYVAHIziJ+UWi/UsZrkiVit4XnnyxRVj1HYtFLf
         lul4QRnREstNicYMkqKHipyueqd+3/OT/csJrIKVXW8XO0A78nviIUtbGFQziZ49hP2m
         AsZcSgccLQjvP11gTeVB1Yk9zsbErFawk9M5tZTsElRcIVFj414Ka2rTZQDIV2e6ES0L
         2WHJyUR+NqP38TWRD+Zm7Cmah5Gj8qFPwDTTEZ7mWpM3uzCBU1Qrh80meKjb3B9kBU0e
         XWw41HL5dn+uzVR3GkThVlNTcfttQr6pbgLv4nWry+usNlHwKMsjqQlkSsLiGRsgb0YX
         0+LQ==
X-Forwarded-Encrypted: i=1; AL+hErElQVVDDFgS0XPt6TYrgra9CS9Apoysg0NRYk1F2A1P2YLZROGnBGD4t/2+y8Ydj1vbzUOlwqJwlSxvMMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PnarFgx96FSz/S3KxYl5z/WUOmEvirVnGOmsOTNHwesuzEO2s
	IvT2PQvEpdBpMmnIQGtXc2DJGRozUtlDVInc6jx2N5WNOlsDMyacq2Sm
X-Gm-Gg: AZFdTZcuZ0+Xp3DwTSYB2IytVjZj/nbYngVoxbjarFyufRRkhhdscRvw3C4LoRy5RGP
	6OrQuC+iX6DRSEHVUpJLknoSjdXhzI4+zWDfPuFgH5jcFSdxI5lnL5Nu/ZKFfnGtS6JBv97exuM
	p3QfrPzmBk/Y+2/IzBYfmjIXS7z96wKnNCU7cL+YDf48FQ/wH9avt/+FTK22+u/LGEyrBkUAKJD
	CoNms6y+CypXlqCZ4CdubJwq/APbimdzqRJYCFUGTgCrqPpa8UAdUqmYDVG5bHVnoQSkyiOVTt7
	a71jNMk22hQN4sImtwuRR7LFxKR4DURLh07pL53z8ATlU8roBr1d7BKZ3oOZTCRh4r/oOBi8QwF
	MYhpLiI3bsHMhjeo8skfXtVkCo5ViX33907krpwooEUdOOQLgDOyh0NwgWFEMdck2iFFBPORvML
	yD+dRDiUQsm+sivSsgN082m3i8FGnL4zH6LADaKkqIJ36oSnLqqh4oLcxreBFvO2R0e2nerVGEP
	hdrElvIqXRf8Sj3r8X+JbjcvSwi48ZmdaevgywzB3Tn/x/I2ZO600ax6ae77Mc73yV++OfjubEy
	f9nP5Pud4NZL8sQp1wjZy1KRK/MKGg==
X-Received: by 2002:a2e:9fc2:0:b0:3ae:c43:d892 with SMTP id 38308e7fff4ca-3ae7b71b82fmr22898481fa.1.1795353548911;
        Sun, 22 Nov 2026 05:19:08 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:08 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 3/3] net: phy: dap8211r: add PHY LED control support
Date: Sun, 22 Nov 2026 16:18:56 +0300
Message-ID: <20261122131900.2951586-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

Add support for hardware-controlled LEDs and brightness on the DAP8211R
PHY. The chip exposes three LEDs that can be programmed to react to link,
speed, duplex, and TX/RX activity or be driven via the force mode.

Add the dap8211r_write_ext() helper to access extended registers via the
PHY indirect access registers, and implement callbacks for:
led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
led_hw_control_get().

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 240 +++++++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..b0fb3cf89b55 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/ethtool.h>
 #include <linux/kernel.h>
@@ -57,6 +58,49 @@
  */
 #define DAP8211R_DEFAULT_DEL_SEL	0xD
 
+#define DAP8211R_LED_ID_0		0
+#define DAP8211R_LED_ID_1		1
+#define DAP8211R_LED_ID_2		2
+
+/*
+ * LED_COMCON force mode bits, per LED:
+ * bit 2 - FORCE_EN (enable force mode for this LED)
+ * bit 1:0 - FORCE_MODE: 00 = OFF, 01 = ON, 10 = blink mode1, 11 = blink mode2
+ *
+ * Only ON/OFF is supported.
+ */
+#define DAP8211R_LED_COMCON		0xA00B
+#define DAP8211R_LED_FORCE_MODE_EN	BIT(2)
+#define DAP8211R_LED_FORCE_MODE_MASK	GENMASK(1, 0)
+#define DAP8211R_LED_FORCE_MODE_ON	FIELD_PREP(DAP8211R_LED_FORCE_MODE_MASK, 1)
+
+#define DAP8211R_LED_FORCE_EN(idx)	(DAP8211R_LED_FORCE_MODE_EN << 3 * (idx))
+#define DAP8211R_LED_FORCE_ON(idx)	(DAP8211R_LED_FORCE_MODE_ON << 3 * (idx))
+#define DAP8211R_LED_FORCE_MASK(idx)	(DAP8211R_LED_FORCE_MODE_MASK << 3 * (idx))
+
+#define DAP8211R_LED_0_CON		0xA00C
+#define DAP8211R_LED_ACT_BLINK		BIT(13)
+#define DAP8211R_LED_FULL_DUPLEX	BIT(12)
+#define DAP8211R_LED_HALF_DUPLEX	BIT(11)
+#define DAP8211R_LED_TX			BIT(10)
+#define DAP8211R_LED_RX			BIT(9)
+#define DAP8211R_LED_LINK_1000		BIT(6)
+#define DAP8211R_LED_LINK_100		BIT(5)
+#define DAP8211R_LED_LINK_10		BIT(4)
+
+#define DAP8211R_LED_LINK		(DAP8211R_LED_LINK_10	| \
+					DAP8211R_LED_LINK_100	| \
+					DAP8211R_LED_LINK_1000)
+
+#define DAP8211R_LED_SUPPORTED_TRG	(BIT(TRIGGER_NETDEV_LINK)	| \
+					BIT(TRIGGER_NETDEV_LINK_10)	| \
+					BIT(TRIGGER_NETDEV_LINK_100)	| \
+					BIT(TRIGGER_NETDEV_LINK_1000)	| \
+					BIT(TRIGGER_NETDEV_TX)		| \
+					BIT(TRIGGER_NETDEV_RX)		| \
+					BIT(TRIGGER_NETDEV_HALF_DUPLEX)	| \
+					BIT(TRIGGER_NETDEV_FULL_DUPLEX))
+
 static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
 					      1050, 1200, 1350, 1500, 1650, 1800,
 					      1950, 2100, 2250};
@@ -87,6 +131,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
@@ -114,6 +183,173 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
 	return ret;
 }
 
+/**
+ * dap8211r_led_brightness_set() - Modify the LEDs common control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @value: ON/OFF value for force mode of the LED
+ *
+ * Enables force mode and sets the LED to ON/OFF state.
+ * It will be disabled when hardware LED control is requested.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_brightness_set(struct phy_device *phydev, u8 index,
+				       enum led_brightness value)
+{
+	u16 set, mask;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		mask = DAP8211R_LED_FORCE_MASK(index);
+		set = DAP8211R_LED_FORCE_EN(index);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (value != LED_OFF)
+		set |= DAP8211R_LED_FORCE_ON(index);
+
+	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, mask, set);
+}
+
+/**
+ * dap8211r_led_hw_is_supported() - Check if the requested LED rules are supported
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Validates the requested combination of rules which can be represented in the
+ * hardware register.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index,
+ *         or -EOPNOTSUPP if any requested rule is not supported by the PHY
+ */
+static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return (rules & ~DAP8211R_LED_SUPPORTED_TRG) ? -EOPNOTSUPP : 0;
+}
+
+/**
+ * dap8211r_led_hw_control_set() - Write the LED control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Disables force mode and translates the requested trigger rules into
+ * the corresponding bit positions of the LED control register and writes
+ * the resulting value to the PHY.
+ *
+ * Note that the ACT_BLINK bit (13) must be set together with TX/RX rules,
+ * otherwise the LED will not blink on traffic if no other rule (such as
+ * link or duplex) is active.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	u16 led_mode = 0, led_reg;
+	int ret;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, DAP8211R_LED_FORCE_EN(index), 0);
+	if (ret)
+		return ret;
+
+	if (test_bit(TRIGGER_NETDEV_LINK, &rules))
+		led_mode |= DAP8211R_LED_LINK;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+		led_mode |= DAP8211R_LED_LINK_10;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+		led_mode |= DAP8211R_LED_LINK_100;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+		led_mode |= DAP8211R_LED_LINK_1000;
+
+	if (test_bit(TRIGGER_NETDEV_RX, &rules))
+		led_mode |= DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_TX, &rules))
+		led_mode |= DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_HALF_DUPLEX;
+
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_FULL_DUPLEX;
+
+	return dap8211r_write_ext(phydev, led_reg, led_mode);
+}
+
+/**
+ * dap8211r_led_hw_control_get() - Read the current LED configuration
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Pointer to a bitmask where the current rules will be stored
+ *
+ * Reads the LED control register and translates the hardware bit
+ * positions back into the corresponding netdev trigger rules bitmask.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
+{
+	u16 led_reg;
+	int led_mode = 0;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	led_mode = dap8211r_read_ext(phydev, led_reg);
+	if (led_mode < 0)
+		return led_mode;
+
+	if (led_mode & DAP8211R_LED_LINK_10)
+		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_100)
+		__set_bit(TRIGGER_NETDEV_LINK_100, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_1000)
+		__set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+
+	if (led_mode & DAP8211R_LED_RX)
+		__set_bit(TRIGGER_NETDEV_RX, rules);
+
+	if (led_mode & DAP8211R_LED_TX)
+		__set_bit(TRIGGER_NETDEV_TX, rules);
+
+	if (led_mode & DAP8211R_LED_HALF_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+
+	if (led_mode & DAP8211R_LED_FULL_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+
+	return 0;
+}
+
 /**
  * dap8211r_config_init() - Initialize PHY
  * @phydev: PHY device structure
@@ -202,6 +438,10 @@ static struct phy_driver dap8211r_driver[] = {
 		.config_aneg	= genphy_config_aneg,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
+		.led_brightness_set	= dap8211r_led_brightness_set,
+		.led_hw_is_supported	= dap8211r_led_hw_is_supported,
+		.led_hw_control_set	= dap8211r_led_hw_control_set,
+		.led_hw_control_get	= dap8211r_led_hw_control_get,
 	},
 };
 module_phy_driver(dap8211r_driver);
-- 
2.43.0

