Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729491;
	b=kJTIymqo6hUcYkxD99Np1uhiVAtonlL4Po2+lv2NWYj1Ch8x32Dx0CHwYtL2Nk5pLz1a
	 ffWl/T22LGC2Lcq74844ervshnQwPZDv5rwjw4CWPLrYqyAt6Sp9SHETJoe3cODsgxISO
	 uREQvdoBOLcy7UAw0hHExLb0GG0OWZoDb14voC2j0oZ1nJdMy6yvzVToQiy0nytSfiUQF
	 EHiV3qNs26OidXuLCptm50b58uu2rYg60sop8nvYfyfczh29gzJePVsjquh9g783T5y1J
	 sfEMylXvNHUsu9vvblLlv815X/BHcevkeJFoJU9Pi9QYodcM+sCKl2rEUYvNRrvAVHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
	b=CRODcK94A4cPX5EdJu0RnY2m+NawmaOoncT6boltHfDHcz4rmKDR6Ma9iB/i654b+Suu
	 fpW+MAyPNonFJqRDBrIu64kQ0pqVnQxSNBiRdJ/e1hpl5lw6aS028Yr4y3TfDyHVxZzEy
	 aNIns58xa1ufgqTk4FY4owuePbuz+10qwdBVrQUOAQ65r5xc88nHSaDpmvaoWsiBpMiqu
	 YYFikv45it4diSTLabFUH+qIh8L44W2zGfFHCAuOPcevgGOkpp+EY5SxANdP4CmfbiYzc
	 FkXDcSYHSb3fs+YpVVipovGsmPwZv+Eu6blUdR65PCDXQXWsHa8Lci2SqvACnl+zfDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwKl4KS6;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE6D606A69D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE6D606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwKl4KS6
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3953264f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729489; x=1796334289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=iwKl4KS6tBb4Ht70/muqBqFScubPFa81IfWIRUCeGaMvoVfF+YqzImETSFbx0L6Rv9
         PybrGzV6vJVszvh0qhUIHiwYxOv2i+H+ltVPTjqTkBY/Q7klv+QflVz+bw965x+e+t5E
         ZmHGDminqVLqUw7Qk5eG5oCmiVmrtp4NXgmcSXnlM1fj0pvV2HK5CA8cCT8vPcDoFMzx
         4gzq9Z+oFRdqDnuz/8opvbk/zXTlQuMefM+tNSsjcgHjGWvOZQ6qSHfpEasUzaB9r8/x
         0t0sKx/NHor7gWU5gXag02542FdP+K1pzxyVbSPRYzx/fTB8rTz7UmFdPZJh8oMQDb1t
         1kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729489; x=1796334289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=fCKxmYAnp5kE5xNJSJzWedoKNQxWWjpgdr8ZyFaBwDvTdfQY0HUEctC0hmHDX2EYqc
         2anK9yrJmdur5U6hZiJIY7Y9+EV0XF7bd2iPTi+lmhemUPQQ7hBl8HHxi97BKASl8bXU
         3x/htDdlurwOJHDjCOw03WFTSlXjbWXPt5qwxvPvPdquOy/0YE39/j1CyS7a/hYZY9dn
         gQsxNbtfhpvobMhSOMi+28p+laYBK7Xy+fMpFpuCV+qORdyqi7ekqEIAgztdnk8ITfQ5
         l2K8HU1QOkZ4QTXGZtvqWP0UT79JxJVloL5Co4urV0MSJeGs7QwfcNrnNek39042rlyp
         7R9Q==
X-Forwarded-Encrypted: i=1; AL+hErHq6KT5ML+0IDy2ljIETJEdLsX4JFOvKkXyhC0ndnpWof/C1qd4VDrv2xKn6y7pesSXHHwIP69ZoCsIR8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TRNAHUmAde7sAZXXzUwQIdMr8gB9eXRlTWVgs+YbMHqLiu9no
	9VWiX8mE/EUQu/jpkovGd6N0pX4hLzL/WQGVED7usqga4w3Sfh96wwrQ
X-Gm-Gg: AZFdTZfMTak5PHjPlJWikfprCLTxh31J8c/HsC4BL9P43WU74/LCYgMfQ4BggiTtn+Z
	KJnUDwpRi4cyqTh9U0owDZ/ymYQg5w+xnkT9PIIJgW6DBOY4m9zCaOT2uf16pl09ZlpFtCNQBCv
	55WFrKJPhOf8TsiO9Nf+GsfuFlv3KKZ8OGaREDcZgBq/ml1VmFYmFrzVNtOSEHdV4j4eJ9YSxbc
	2vUslfJB10n2pDnCtmwtY9mjZKAjezDC93G7bicA0UimjHb1m/56NFl9HDZV8V6mbje1iRTyg9n
	HhWBBMYbgS0Fr0sj/CyT7WerG3J1cjYgzbOd9TWd4t1WX61103zq+V07B29k4ENjEj1vyQk+sQl
	VxaftbjVKi8OIglAAT6yhwM8qP8Q5LGTjQFuANAws/RsfsXkU6lB9NVaPm9lsJLu7xaRAVqfyY6
	qOTLqZm5Y/fTJrNEPPiHFdtFDeuq79vHwoLcLpT9zziC+6VbNPfvOV2qMYzwY0i6IFMAqgT/MGd
	j72TWwWuK3gDSbp15RfE6BmUvplhsl9ruF33mZ/G6Iyfa2RVCDxiVa/alU7wn8PLO9oBo9oZP3x
	DKKNgh6avXvPgOb9b+ZhLbVlVt7noVZKxZ6q2FmvH4+fd11SMunK8BYt7N402nh9MpDBD0J+4XN
	WG6r7dZLVT2y4dMnq0JnlRp1BWWoTat5d6g1iOb0tu2DfzPlKSdtLaG9KBph8+iyVy3A8tH+Z/z
	HdBcRHa9NX+ruKM3N4mE4y3Km6elpWNSbyS2v7Xq98+soq1QEp+rkN34K1g61NeTXTnugtgWOfc
	NvyNZEHfPx/9pxBYlPH3rk1ZhjHf731YsJKfKLyURQ=
X-Received: by 2002:a05:6000:2406:b0:4af:e519:ccd1 with SMTP id ffacd0b85a97d-4afe519ced4mr37199366f8f.49.1795729489344;
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
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
Subject: [PATCH 07/11] drm/sun4i: Add H616 TCON TV support
Date: Thu, 26 Nov 2026 22:44:29 +0100
Message-ID: <20261126214433.3562326-8-jernej.skrabec@gmail.com>
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

It needs additional quirk to enable HDMI pads.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 0cbd6ae66c4e..3596537c500b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1297,6 +1297,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 				   tcon->id);
 	}
 
+	if (tcon->quirks->hdmi_pad)
+		regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
+				   SUN4I_TCON_GCTL_PAD_SEL,
+				   SUN4I_TCON_GCTL_PAD_SEL);
+
 	list_add_tail(&tcon->list, &drv->tcon_list);
 
 	return 0;
@@ -1585,6 +1590,13 @@ static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
 	.set_mux		= sun8i_r40_tcon_tv_set_mux,
 };
 
+static const struct sun4i_tcon_quirks sun50i_h616_tv_quirks = {
+	.has_channel_1		= true,
+	.polarity_in_ch0	= true,
+	.hdmi_pad		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON */
 const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-tcon", .data = &sun4i_a10_quirks },
@@ -1605,6 +1617,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
+	{ .compatible = "allwinner,sun50i-h616-tcon-tv", .data = &sun50i_h616_tv_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23fe4a..98bee2bd96d2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -19,6 +19,7 @@
 
 #define SUN4I_TCON_GCTL_REG			0x0
 #define SUN4I_TCON_GCTL_TCON_ENABLE			BIT(31)
+#define SUN4I_TCON_GCTL_PAD_SEL				BIT(1)
 #define SUN4I_TCON_GCTL_IOMAP_MASK			BIT(0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON1			(1 << 0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON0			(0 << 0)
@@ -243,6 +244,7 @@ struct sun4i_tcon_quirks {
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
 	bool	polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
+	bool	hdmi_pad;	/* h616 has to enable pad for HDMI */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */
-- 
2.43.0

