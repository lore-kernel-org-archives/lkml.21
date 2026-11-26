Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729492;
	b=I0ArKfGKX0vhMcieFI7OQ5gx3Yo98xkrtkhevi4tj+X0KcrFFFkMN8p+KmV8ybcp7NGR
	 F+a9bXfzJgrFjSQ7yiITZoea46UXVU48IOhkyQPOLYZAuHjfPncpVkfL3kReYUD/J6Ksn
	 cK0zvygsk+4rVxkcwuWJnobbSs3JfoEEkKKcM42sY+wllaYGzOq4M5LBL8YxopEjpw3p2
	 QAVgvwxpxqB/cJB0BEoJIEQ0PVjZnIMTwOzQrc5p+n9eCGLYdFIZzjolth3Th3jkpOeZb
	 dq2/zBU8DwXwQtGv0byKhfv1sQfuI65SkFeSkIzsTHuzL6GHR5OgeqsoS9djkPKQb6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
	b=DTGm7BaEmEyvnqbwjMhxalbkeQjZf+EkHBJs6DTAlWaqJ/hbd6M6E3HcOBu7fuZxO33t
	 zL4zKwF6st3I6tbT4J33OkA3mP7LXGoD4qyxD+EoEQ4GrnPCpCtDifBALveWOzIECzgec
	 NL6qSvbbFpX6TmYnaxpQgmoybux75Nyf/OuNEaU8nZtp9btzkedE5A7HYRuYxfd0moQhl
	 5i6H5mvunQqwxQdO7RZfpYIl0c/d87gVwrKYPu7mcYdlrQX6D3TpVYfOcUrhGKnW3tW/f
	 0OVCS7UN8ciYT9Ej58BetCz56wzjaz+9vi/uxNvGfo/QMDx/jhW4Kzfoj25lSQ5Z3GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKtNbXei;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45979606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45979606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKtNbXei
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so76549275e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729491; x=1796334291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=qKtNbXeil35KMLpy7Naa/w5DSyVtCdRy/WdIPRGurKV2J8jaVFVgqtne08azwhhR3S
         PJyzvSp9CTQJZqZsxhpiT77N7Sob9YaxOjtsoJCo6lq4dUM01qGsBFtyn3VwO1n9mYQn
         psxkOumX+QITPvxkNnpzKPuQev5GoUhjv/tNyW6P9JCJbqm31hS6tAB+ypEF1JRFH8pn
         AxnEZid3OmH087UaAPi2H/48Il+aBPDBsnNcmFdZ0JEK7yF3R8ebFIsYUMM7DxHhSjOd
         8g3RjLbPSdq4wB+znfRUoFE3hO45u1ElabBxq8MHVdVnr5mBc73s3cBsWjvD6DdsXY47
         F+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729491; x=1796334291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=jsIlUnRbqhflmaL1ARhGViJ4BOiBb31u2ykMMQakJP6diMp4EL6GkZG8uBXRY6ki2B
         eU2GSAnKWEkoOuDipQuFO79s/ADtpKnxqr+6mUqbKUqykE4230ZYDf2RRTITmZYAaWLn
         STNBxbyozaeitVRMfYflVPjC2ccvzB1VAJno2ITzlgKdu8MUhTkSj2DmLMZ8/7UOligm
         RuMa8VoUr6X67vIcirYKMrq3RXMTok6Jbf2+x4+PomAyAX0B7ZUe+0BGSXZkZ8Ka91qZ
         b9Dn3fh4+RLrrhu+HuCe//dVJR296E/XZ90H4XioV3EAZvj2UOQNk8IEx6vBmvhaIisX
         9aHQ==
X-Forwarded-Encrypted: i=1; AL+hErHo+iyNWER82MaYvhxsgwpcYpzXs+LDTN4LuT+j9VwePrR55qog4rqM2ZEZc5q9DVTBgwyQu2G4eJsH8z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E2A3AMzfuzT/Ob+/Q1IPgw/bBfWoQampVAUmfnNshwVjbHnYD
	0PcrrN10KWLkoHLKJfuEHDZKMjM/icYXYIWa7mTgtarG+dVopei9LZix
X-Gm-Gg: AZFdTZeSNvYd71afcJUphYpWTbXgQinCXlvWEE48PXEOSMyc/OzNLdI1sg1X8H9dHun
	BA1itUvBKBC64mj6l3tjW/R6z1y2e9lFTSOZARwEEk1WvylNl9siYHrb0shJcXeWjcw14qdoD7n
	JVm7wsa2AssKyoXbXOGeqYmE0QJxOCt3A2fu0vV6fqU3mduvaEs+axUxn05IhkYkm0x8PioM4Yu
	j0uOJStjx56w1/oOxkiW/n29uLMZByf93pNTHMI1aHIWkox/WmVjRWS1mcWtC7UcuVBKqjTsjEr
	DA0Z7rRa/l/Y/FKVNIUwYDcThZuA/U+rltpK2kObX4+aH3K/jRtMt1g5kx4ac4VN+oZtB+mKeGO
	UDeRAo56FdWFdCGCwOCzpO1xg0qCDYTLM0fUVTnp7O6VKsJLhgQb7ykuMrfYHWCWzb23pzp+Esw
	kMjpHXl6MsnYKHi7P121L1Q/gu9LFOr3zyjMIy7dOwYjceUi/b1fL0oy4I7mK+PxAffAcQLsOMa
	WPSK8au8vWRYVYSlWRFb0/qKM2ddppxT4oyLsr1EaGZFna6hsR5yIa8XPYxK4p1IJyioLuHw+p+
	3V0cqbaECrPaNYN5uEtyOPQig8V2PcJgwkyIQmzAkcSfHvkPtJMpkbqMGfRJ8eWnfPY9xgF0UJE
	G6dLH3L/kEzOcEETC5ytByaxkGYzIZRJ39d6pfr4PUvYElivd8LMS86cM+FZ3KWh7xCP5DQHi2F
	nkJ6z4Q2WK0ZJXs61m49CGgSciwo8m6XVFOaFtbCrjk9IPl8sRqqF+ggtN0/h9UjklrO1IPmGDU
	smd1xQKdl+WAfcHaa6UbNnq0T6QFzkVieo8DsPM1w==
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr445462945e9.17.1795729490644;
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
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
Subject: [PATCH 08/11] drm/sun4i: Add support for H616 HDMI PHY
Date: Thu, 26 Nov 2026 22:44:30 +0100
Message-ID: <20261126214433.3562326-9-jernej.skrabec@gmail.com>
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

H616 HDMI PHY is a standard Synopsys HDMI 2.0 TX PHY, like on H6, but it
needs its own configuration table. Values are taken from the BSP.

The BSP also sets undocumented bit 15 of MSM_CTRL at 594 MHz. 4K@60 works
fine without it, same as on H6, so it's left out.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 170 +++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 0d284804e11f..8bef4806c65b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -124,6 +124,165 @@ static const struct dw_hdmi_phy_config sun50i_h6_phy_config[] = {
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
 
+/*
+ * Values are from the BSP. Like on H6, PLL settings depend on the TMDS clock
+ * band. The BSP has its own values for CEA clocks, which also apply to
+ * their 1000/1001 variants. PLLGMPCTRL is always 3.
+ */
+static const struct dw_hdmi_mpll_config sun50i_h616_mpll_cfg[] = {
+	{
+		30666000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40f3, 0x0003 },
+		},
+	},
+	{
+		36800000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		46000000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		61333000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		73600000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		92000000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		122666000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		147200000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		184000000, {
+			{ 0x0051, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		226666000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		272000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		340000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		593400000, {
+			{ 0x1a40, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		594000000, {
+			{ 0x1a7c, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		~0UL, {
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+		},
+	}
+};
+
+static const struct dw_hdmi_curr_ctrl sun50i_h616_cur_ctr[] = {
+	/* pixelclk    bpp8    bpp10   bpp12 */
+	{ 26995000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 27032000,  { 0x0012, 0x0000, 0x0000 }, },
+	{ 30666000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 36800000,  { 0x0000, 0x0000, 0x0008 }, },
+	{ 46000000,  { 0x0000, 0x0008, 0x0008 }, },
+	{ 61333000,  { 0x0008, 0x0008, 0x0008 }, },
+	{ 73600000,  { 0x0008, 0x0008, 0x001b }, },
+	{ 74175000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 74250000,  { 0x0013, 0x0013, 0x0013 }, },
+	{ 92000000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 122666000, { 0x001b, 0x001a, 0x001b }, },
+	{ 147200000, { 0x001b, 0x001a, 0x0034 }, },
+	{ 148350000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 148500000, { 0x0019, 0x0019, 0x0019 }, },
+	{ 184000000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 226666000, { 0x0036, 0x0033, 0x0034 }, },
+	{ 272000000, { 0x0036, 0x0033, 0x001b }, },
+	{ 296700000, { 0x0036, 0x001b, 0x001b }, },
+	{ 297000000, { 0x0019, 0x001b, 0x0019 }, },
+	{ 340000000, { 0x0036, 0x001b, 0x001b }, },
+	{ 593400000, { 0x003f, 0x001b, 0x001b }, },
+	{ 594000000, { 0x0010, 0x001b, 0x001b }, },
+	{ ~0UL,       { 0x0000, 0x0000, 0x0000 }, }
+};
+
+static const struct dw_hdmi_phy_config sun50i_h616_phy_config[] = {
+	/*pixelclk   symbol   term   vlev*/
+	{ 26995000,  0x8009, 0x0004, 0x0232 },
+	{ 27032000,  0x8009, 0x0007, 0x02b0 },
+	{ 74175000,  0x8009, 0x0004, 0x0232 },
+	{ 74250000,  0x8019, 0x0004, 0x0290 },
+	{ 148250000, 0x8009, 0x0004, 0x0232 },
+	{ 148350000, 0x8009, 0x0004, 0x0230 },
+	{ 148500000, 0x8019, 0x0004, 0x0290 },
+	{ 218250000, 0x8009, 0x0004, 0x0230 },
+	{ 288000000, 0x8009, 0x0004, 0x0273 },
+	{ 296700000, 0x8029, 0x0004, 0x0273 },
+	{ 297000000, 0x8039, 0x0004, 0x022b },
+	{ 340000000, 0x8029, 0x0004, 0x0273 },
+	{ 593400000, 0x8039, 0x0004, 0x014a },
+	{ 594000000, 0x8029, 0x0000, 0x008a },
+	{ ~0UL,      0x0000, 0x0000, 0x0000 }
+};
+
 static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
 					const struct drm_display_mode *mode)
 {
@@ -626,6 +785,13 @@ static const struct sun8i_hdmi_phy_variant sun50i_h6_hdmi_phy = {
 	.phy_init = &sun50i_hdmi_phy_init_h6,
 };
 
+static const struct sun8i_hdmi_phy_variant sun50i_h616_hdmi_phy = {
+	.cur_ctr  = sun50i_h616_cur_ctr,
+	.mpll_cfg = sun50i_h616_mpll_cfg,
+	.phy_cfg  = sun50i_h616_phy_config,
+	.phy_init = &sun50i_hdmi_phy_init_h6,
+};
+
 static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-hdmi-phy",
@@ -647,6 +813,10 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-hdmi-phy",
 		.data = &sun50i_h6_hdmi_phy,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-hdmi-phy",
+		.data = &sun50i_h616_hdmi_phy,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.43.0

