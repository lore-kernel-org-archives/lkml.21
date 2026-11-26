Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729490;
	b=gs2L3pA47ZOCaeappjNoSwJEBfou/JdWDeHWiIi+ownOOfc850Me13cMHDS2kSY5gAjl
	 BfzGN382sPRARN98thtxMITxU8T0smR/mxXy4g3vpW8ai1RoEhxV+oCYd1lnRp1llIgeh
	 dz/NTPh157eDuE42a3cmmjp0ZTWk8zh0uw6Pe4i3UmpFgoEzmfWJ9K26OpTdb9pGeObBP
	 YdbY0QIY0UIJUKEWGPQs17YS5+0JjF+ecoiiO7o9ypCyqXl7dWH5ik927Ui6nJgW75n7Y
	 lkKFocDsIruBQlPKtLqxPhc8I1cvyDVZPh7hk1+qlpSgW78IdyYJXBz0qkKYNVOAjcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
	b=AjAC+IHGzqoaiv9JwZ5V/aPISOeYW2wSgjIhD8ri1uvbSPmZWIXv2jeTE1nRhbib5FGG
	 OiTsEYI+LASXz+MZRLNR7tLtchaNkApNc0tWLEYVowobkP4/B/OSoPfYBTacxzs0gPe4p
	 CHRzVMS8vjqlO8BfRkpv/sBLLk1tUhCP0GiReubYlUnHoZOV8HUFTT7pqkInKfuket2p6
	 48oOadwOCiKaGwcsQd/vVbasGzV5Twz+Mv/6CerbhgpO1IQPSEkclOSWCC0yK9WQboc68
	 dEO93tQ5+TWLb+oX4Pb14GnwC3sw/WH9UKF0aTc5xVIquLYV4Saw7ugMUpLJM5nnaFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpeY+1JD;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0C5606A6AC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0C5606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpeY+1JD
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4aa5833c263so7192083f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729488; x=1796334288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=tpeY+1JD7JdsK39iv7Tn0SmamSGWPwbVoc9MtOdugigAxwZ40Ja5uBxqt89+q9I2r5
         /AetbVX8x3QrgypYN3Z3lKd7zOfzb5xym/ZH5a+Q/ntnjgc37H6MjQMYutOhe8613eLF
         8fkxwg9SLhzna+wBGH9Wo4bv1R6Y6fqYU5/JpjOjA9PHolbbt5E49DnCtpIzs4Kszfyf
         rDw/2Sp+vG/D7aAoVkxUTIxW0+HjPGTWtu3Uu9tK7PHcNov6scW9d6LrrblBoKSaAk/0
         T8zJ5QsmMuRzBEmJwYVjkH8sc7OleK1OexJpgWOywkhRyUa4uRCEbUfAyLJx3MzW0nIJ
         HmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729488; x=1796334288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=2tsCEDD21BGfel+YLEJidh8n6y9916vTS3AkqNWhKnRUTG3b4g6i2ArNlAeo0NvIAX
         d8PeNzW7Oo0epWZX86Wo0+WG/H6tbIshPgfQC5rT4gl6Nuzu3am9cbsA5kqNX/bcuUnx
         OZ4lgjo72jiLnE0SmcyNXkif41LQx6RHdI+KF8SFZdLYT2pcwQRo8mxdQ2gZaofAR19F
         oTTzpXq+V92q68b2UBfPAIqLe+ITDyffjajt4usOmQ1b+j0xuJE4pXCg/bKWU/xumVA8
         qFU6k8PX2SGlkK57VqnuQxQMvx8OBGQB1JaZjK3s/SyaGamMn8wSQqCwvfWE69MTC1so
         ABsw==
X-Forwarded-Encrypted: i=1; AL+hErEcwH5dvfIZJK+Yis9QbAXkUoWqQnIfLCsv3etM+NzTbJAQrMR6GNAOorxHGG45AsXojP8HkZoSv0EDvYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O4GwoTUuPKpYlDYGuveULuTu72RIX3a5DJktTqfmh0kofuHSj
	49XETZPCJ2rYxBxnvjmcsheYH57e0kiIZbTlmhNzG/zw4ZjCnQxFgpHX
X-Gm-Gg: AZFdTZfl2O6RzVyTxXQZgbZ7qcNWVr9IUfdQOiQIFGDyJrfBlKoz1oUdMswdEvyqpux
	wdMY7OIXiZbvosPifR/HmKUMR6BSuDaYzq6A8r2tQFO2cyU85IeUA48ls0WtVUqGr9JuP5l69Ho
	tv9PwKI/pfZ0c1ak/scCRiA9y09nzjmwptZZjF0nPfqc4RqVt8Gqsc7ffurLPektmrgU1KFC0+c
	amFoAF3wArGYYP4NJcb8IzMK62tnQCyFECUxoVrDHf6yQhsHh5HNx7aP+aJ0XXY0syfLMy55r/o
	vi3CQ//SGjV5ZbaqVbaxnIlDYH+Bgq0+WkxWWFTpcz7MFXcA3V0Xf3PevLk9bW5XKQnXA6zB23g
	cnkadVWSP0IpAyQ8cCGqDv9+cAd+/hOGiPqNIJkg4lMzcRqNY50A53ZX1bsf8r+PXgvkjcoAgM7
	QNEZ2ZB6bT58wzB1hxIE2HaLozQMd3MS2Xlglxte05GutxhcNAF8lPCIEkVX1Wo+aNfX7tlV95r
	oI0C/H2O/yMRE8WhrBSluJ8u/yajMGb6VAMDr/7MAbqXJYEXcta8Sz2jJ1wOlbA8k0rIb68KgSS
	Eb46/b9ukIHqpie6eGohv6IYIseyhZ7fxRPRWVmh/fORgXa+n8EBpueiOdNkctmDX2P7yjyOddQ
	xHIT3StboXRY2yJl8G6VocZgRzxi3IaSN2BXzJAkgSfvGZ9li+HaUAcohXaK9J7w5KOU42sWhHn
	rupqXjzG5iVyg8chTGyjKHAtnHjZZx+kIFVMnPT8w0lzcySAiANFOLqJBVkTyYN9ypBmYS7aUjt
	67zLVXD9QC0zV6uIXJBvM/gDNkHfiTSe5ZgYDYu3Q==
X-Received: by 2002:a05:6000:2c13:b0:4a7:9630:7b57 with SMTP id ffacd0b85a97d-4abb43dece6mr43971087f8f.44.1795729488089;
        Thu, 26 Nov 2026 13:44:48 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:47 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] drm/sun4i: tcon: Add support for R40 LCD
Date: Thu, 26 Nov 2026 22:44:28 +0100
Message-ID: <20261126214433.3562326-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

R40 TCON LCD supports LVDS output. It shares the mux function with
TCON TV, so use the same set_mux callback.

Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1 drives
the second PHY, so in single link mode it has to program the second
analog register instead of the first one. Add a LVDS PHY setup callback
which selects the register based on the TCON index.

Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 49 ++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 77b6026bc895..0cbd6ae66c4e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -139,24 +139,25 @@ static void sun4i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 			   SUN4I_TCON0_LVDS_ANA0_EN_MB);
 }
 
-static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
-				      const struct drm_encoder *encoder)
+static void sun6i_tcon_setup_lvds_phy_reg(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder,
+					  unsigned int reg)
 {
 	u8 val;
 
-	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write(tcon->regs, reg,
 		     SUN6I_TCON0_LVDS_ANA0_C(2) |
 		     SUN6I_TCON0_LVDS_ANA0_V(3) |
 		     SUN6I_TCON0_LVDS_ANA0_PD(2) |
 		     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
 
@@ -165,11 +166,17 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 	else
 		val = 0xf;
 
-	regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write_bits(tcon->regs, reg,
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
 }
 
+static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+				      const struct drm_encoder *encoder)
+{
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, SUN4I_TCON0_LVDS_ANA0_REG);
+}
+
 static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 				       const struct drm_encoder *encoder,
 				       bool enabled)
@@ -1410,6 +1417,27 @@ static int sun6i_tcon_set_mux(struct sun4i_tcon *tcon,
 	return 0;
 }
 
+static void sun8i_r40_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder)
+{
+	unsigned int reg = SUN4I_TCON0_LVDS_ANA0_REG;
+	struct device_node *port;
+
+	/*
+	 * Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1
+	 * drives the second LVDS PHY (LVDS1 pins), so in single link mode
+	 * it has to configure its second analog register.
+	 */
+	port = of_graph_get_port_by_id(tcon->dev->of_node, 0);
+	if (port) {
+		if (sun4i_tcon_of_get_id_from_port(port) == 1)
+			reg = SUN4I_TCON0_LVDS_ANA1_REG;
+		of_node_put(port);
+	}
+
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, reg);
+}
+
 static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 				     const struct drm_encoder *encoder)
 {
@@ -1521,6 +1549,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun8i_r40_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1562,6 +1598,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.43.0

