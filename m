Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480567;
	b=3AXVk7TDyH4zC6O5A7OU/p5ILndk9LG8+iBosr2CGoscnHsHUTFKHQ+3Bszpnh4Ihcf9
	 WCIhtRZfkI4oCmlS+pFapfK0ADv79tfYp1w31u8td1pujzZkpSHaa9lPtfXWz6uMUksUq
	 MDFKUH0vHBXnz/wY7tnNcGqUFBMIOTIxo13JIZsmMIRp7w1AtHfJ38vblaKWvlqBwy2Ar
	 Ty0To6VteHHQSMSTeXF/Mfdy0dx+phyi+FUodi3KR21p32Cy/CaYQVPw7ayraeUlwGK1i
	 Czac+1/SFMtFaLwdtKxJ8Wp/n8WYahKkceM+2UUk5gUND01MJTEqD4sRLtWG0abJ+/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wpD+A3zS6yZKtxBGq/xZfogVf4Yr261dCIU+g/u8beI=;
	b=esklFqLtb7pPjOg0k26Hnl+V7hdXRBRXhj8kU3EdNA/U7g4Z3F5ZtdcZwJvyMwkpT8Nj
	 8+6PnHgeYhkL6FCTXmPLIGsz5S3VxiEMzewZ6P5rv5EuZTEFqjFTOsqL6XsesSyE9Qaf6
	 H7Z8JmwOMkpOushdNBMBQ3dkIxb2JxKPk45YL8AVnkF1SDdITEamdImmZJGlZkEcTPMyQ
	 Z0cfyFbZXSE4pzsl4ByFufyvJbn1zQ6z6oNUduB2d7E/gIPk4Nec7oznmwIw/9NKhRC54
	 1sw2CKgSDEisjp6VyqZOuS7umT6sLOsFwzZW1dVgZ5kwCqapfuHmE3XOxRVI0F7P+QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tmq55zDw;
	arc=none smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAA606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CAA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tmq55zDw
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-568042aaf90so557039b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795480566; x=1796085366; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wpD+A3zS6yZKtxBGq/xZfogVf4Yr261dCIU+g/u8beI=;
        b=Tmq55zDwbCldQjFbCf2Ny6J5BgZ6ahOd0Jp76NDyMd+tZwg6magvtYwWF5O0mpOVy3
         S5Aatdr0XxubrMz9o2iRoq0Pd7z9+hqlyUaf/QSdGR02tM4EkL8BEH+PCcAbytMfsDAk
         G1s/j72s25ASKGn4E1HGp05KsNQ2OKuyxoP3iJyhrdMlrxOYM2vpgqFueJmg+HJs4zcV
         ju9FYYfqtfXRMHyPqA/SANSJ9wGni3TTMLbLzHKv4n/EOf9Bj+9nEvTfdogGfx8sOQP0
         icTB++8mtBOMSsrxK4fY7iB/Oo2VeyaPmnBrFQexlhyIzNv0yIak2P+9E5mL0PTF/q+X
         hUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480566; x=1796085366;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wpD+A3zS6yZKtxBGq/xZfogVf4Yr261dCIU+g/u8beI=;
        b=NUeRVbeRgpoQB0vjJlNPbxGG4ZdvJWSi9UB71wDpBiZdShDdZD5BxZ5r4wwCO5pwso
         ni9p85WS+HY89AAnKwVdcqBqzTwOMnWB1Fgp0GVPllMsEgflNv5aVjci4XGWaHDAHCl5
         D85Geb9n5H06SbHguTXvmWIANbmxGVSZvAPSMSeQZrfJ3UQk+Hb2JMih3PXLlesF6Lwn
         dDRJp6ruWi9ISpscKcYa1I0eMLmefHOOK1so8VzHW5uQrn5w8xDReyCpfZUywR3fRHLv
         VUvNOObDDx/o4QEQJFmJg3ymN8N3TWqNkmOM8z7J5Ws/Qbwz7Yb/vXr0DvdqLCXO8cLY
         PAwg==
X-Forwarded-Encrypted: i=1; AL+hErH16vPUXQEjp8Ig4eaxRAH/qcaOnorAtd0uGcH4fm88NYAHA35dUJAMuFyT3+XyD4ZQ5veB0s+qeT6UHkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sy9zLi9Kox3JfdT30yk1FFFN+HOT42BDtt03aNxsabeqIjcH3
	JrJLTtOFgbUzjdoYMnHWQO54W9kkw2otLZuRZ+d8OcYoMZvfRQoGHdZtGl7OFeqKA9YkPQ==
X-Gm-Gg: AZFdTZeAOKMIV8gozlYKyu7TZhpeqDWpe2oNR5MOA4e14lACmJHhwX6itWT3xWv2JIa
	aeRDaw7VREZZ5/uiN3R/DLM3jemCCtv/ScDbozjlQ138NDwlHcJV5c67xyApx8p2EDbdVHocVkW
	iUjR84y3otw+r9Lr+ra/8RNyypTlPPpa75N2ENYd6CXbGv8Y8IMsJX2ZHQZAHZjggxMzeBaVP30
	NQgZApYk9RfOYeJuyBQcqulR4tkA+OM7wcVUqDrM3oC21jADX0s1wyF8CZwdNdh/8aQBQpU0DMh
	Z4jfLQpBSDvZ01a3vzgcB9fZQ3JybaPhjFtS/T71aYHs2OYTFhJWl9rm9mBLMoDiHbWqDlNgajf
	CVCjeCAcHCcZxTbjriVhpJj9kDwj1N3qXoVwqkrN5x7XzE5XBTToMyD9hGA0K8aOnxUrQk1rV0O
	hsSpYo2NUIMnscIqxWd8Pvtxyh+W5tLej9LuvxqCyn04Y25PdkH+sXgGLfQz6C+CtQUb4FtSglX
	fAYy4h8x8KmGAMJItdmzDhlIvL/xY0uOm5GqpIWgAcz/RWZyLljubDZBBxzsRcPQw9gI42XEsqf
	KsEARHTvsGlsHV+CXYjYAd4s
X-Received: by 2002:a05:6808:1483:b0:4d6:9283:1bdf with SMTP id 5614622812f47-57a0c29f7bamr14157637b6e.60.1795480566115;
        Mon, 23 Nov 2026 16:36:06 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250fa1sm9563952b6e.5.2026.11.23.16.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:36:04 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 23 Nov 2026 18:35:55 -0600
Subject: [PATCH v2] drm/mediatek: ovl: Report coverage blending on older
 SoCs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rbrue-suez-mtk-ovl-coverage-v2-1-4149e2ed5fee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/33NQQ6CMBBA0as0s2ZMp4BWVt7DsCh1gEagpoVGJ
 dzdSFy7/Yv3V4gcHEeoxAqBk4vOT1AJlQmwvZk6RneDSoCS6khEGkMTFsa48BvH+Y4+DWh94mA
 6RjprS9QY3VABmYBH4NY9d/1aZwJ6F2cfXvss0bf+XCX/uomQMC9lIaUuW5ufLt1o3HCwfoR62
 7YP/uIBXsYAAAA=
X-Change-ID: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795480563; l=5868;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=rWPjygIN23+DBnZBmFUqc49c7iHVLHNqhnAs+aTYCK8=;
 b=XSMIVCcnAR5FgtDLKy7jJhaRZTYV9dECaHiOwLWsXl0N1yoLco/3sS9q6cQ7ebgO71F8ogNWn
 QX6pNuS/SfhDl3o1aIGoSfZHPSN/6CZj0RAYQvL+A9cjaAgseBWl6Ew
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Since commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed"), every OVL plane on MT2701, MT8167, MT8173
and MT8183 warns at boot:

  [drm] [PLANE:37:plane-0] pixel format with alpha exposed but blend
  mode not setup. Please fix.

These OVLs expose ARGB formats but don't have blend_modes in their driver
data, so no "pixel blend mode" property is created. They can't blend
premultiplied pixels: mtk_ovl_fmt_convert() always selects the
non-premultiplied color formats for them, which is the DRM "Coverage"
equation. Since commit 9813e158d13d ("drm/drm_blend: allow blend mode
property without PREMULTI") a coverage-only property is allowed, so
advertise it and drop the comment saying it couldn't be created.

The plane state then defaults to Coverage (1) instead of Pre-multiplied
(0), and mtk_ovl_layer_config() enables alpha blending for any non-zero
blend mode. On these SoCs that would set OVL_CON_AEN for XRGB formats
too, which they can't ignore the pixel alpha of, the breakage fixed by
commit 995d4d558eea ("drm/mediatek: ovl: Fix XRGB format breakage for
blend_modes unsupported SoCs"). Only look at the blend mode on SoCs that
support premultiplied blending, as mtk_ovl_fmt_convert() does, so these
SoCs keep enabling alpha blending for formats with alpha only.

Tested on MT8173 (Amazon Fire HD 10 2017). The warning is gone, every
plane reports a "pixel blend mode" of Coverage, and the OVL0 layer
registers are unchanged.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since 7.3, MT8173 and the other OVLs without premultiplied alpha log
"pixel format with alpha exposed but blend mode not setup" for every
plane at boot. They blend in coverage mode, and the blend mode helper
now accepts a coverage-only property, so this patch advertises that.
No register changes; tested on MT8173 (Amazon Fire HD 10 2017).

This patch was developed with the help of an LLM.
---
Changes in v2:
- Keep OVL_CON_AEN off for XRGB formats on the coverage-only SoCs: the
  blend mode now defaults to Coverage (1), not 0, so only look at it
  where premultiplied blending is supported (Sashiko).
- Correct the commit message, which said both defaults were non-zero.
- Link to v1: https://lore.kernel.org/r/20261120-rbrue-suez-mtk-ovl-coverage-v1-1-35040085fc37@gmail.com
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 5445870716f9..efa19d02ccc1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -412,12 +412,8 @@ static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
 	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
 	 *
 	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
-	 * If not, use coverage mode instead to set it to the supported color formats.
-	 *
-	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
-	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
-	 * will get an error return from drm_plane_create_blend_mode_property() and
-	 * state->base.pixel_blend_mode should not be used.
+	 * If not, the hardware only blends in coverage mode, which is the only mode
+	 * those platforms advertise.
 	 */
 	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
 		blend_mode = state->base.pixel_blend_mode;
@@ -516,10 +512,11 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		con |= state->base.alpha & OVL_CON_ALPHA;
 
 		/*
-		 * For blend_modes supported SoCs, always enable alpha blending.
-		 * For blend_modes unsupported SoCs, enable alpha blending when has_alpha is set.
+		 * For SoCs supporting premultiplied blending, always enable alpha blending.
+		 * For coverage-only SoCs, enable alpha blending when has_alpha is set.
 		 */
-		if (blend_mode || state->base.fb->format->has_alpha)
+		if ((blend_mode && (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))) ||
+		    state->base.fb->format->has_alpha)
 			con |= OVL_CON_AEN;
 
 		/*
@@ -667,6 +664,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -677,6 +675,7 @@ static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -686,6 +685,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -695,6 +695,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -704,6 +705,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

