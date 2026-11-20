Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205121;
	b=CTNyNcF5rBLeTrhuTq/mIIJXgkqdOPIX182D19UEVzwLTCR1glLxlvZeq45K3N4ymyMG
	 Zrx6obPVrxlSQ7Q+51qHA7KP40MtVTdtuZGF5MSk1Y9Ae/eLhkXB7IzjbcJK4Tf7ANM1x
	 PpTUIYfvdRTL383W/BDvfURJ2SkE2tGtAbudmOoC5CJ4BCfV6D2k9ys2zdkFWH3e76qHM
	 6U3Bmm72EXwkbt27ZZYn9zum5WO97gk+K5ZIxCYFMlT3nVjeOzlIGv2jV07cCAadOR8kE
	 jMDTjRUIbdsGfEH+zCt5aep2XIo02aU7HIiiAq4vVQr4PK8fQH3QzoCOHd58lFAv8AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=;
	b=NZChDrujgHIh0ssTQVLnkQbHDGgLMhW2PeKmIP0IxJKqVwVQDIAixed06E6iPfaV2OsD
	 5+pNbkAcV8PGADi8wbaKynbEvcHvc6M0H7eCQiI5uWCjTlEJW68muy94i+gUEcw9jPlH7
	 hcgqxJYjD6W6ym/uty5dWqAzkfUMb363Bxf3sgbf98KktWVWJkE103lbiUmPVrJeUN8SG
	 tpTPZRClebqOh5zOTZLWsRINnxg/OEvSac+l9iBatg7e6OiMndaAXFfeW8tH6jSrNoqIi
	 kKg+OhAeIKpicVGkMTV5//D+z89QW+/qdHGBWZVIR3MZevksDIv/qU8mECXnQFyWRiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rslWGKtk;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20EA606A6D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20EA606A6D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rslWGKtk
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4932b13c4ccso801657fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205118; x=1795809918; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=;
        b=rslWGKtktcjkas19+WmQFN+Nxf27A+CM0X1E42/0e9mi53VpeMyZWqBkfGvQMqzywC
         /lzzqDMqlIO91W1lB1YYak4ZeFjJuPUJ1CVtS2qW1Gz1c5puScAiULhmuwN2iQQG0aJw
         p06qrQXNcIHc06i347bQFoPNYXVykSl8f4iT5Zl1XvvLVQaNv1AZWiF2Iph3vEjqglda
         lctWTTYKN/TT8OljOaLL7k+9hNRMmYW8b99GQoke9gOXmqr6FiWVYCDA3Uuf4VixwAGz
         2TQ50r5dugIyBxo4blpS6ots7kLN1bUMoaF8GvmcYJ+fYai5u8vkXwDFkUI1QNZQzJ+7
         rEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205118; x=1795809918;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=;
        b=SvGPVQBkQeCsboF5i35Q5HL+MA9YqFjKsM0ozs8ABDRPdCd2Cjc+jdR/3+gzgDwpgW
         iYUr8iSt7sz+nP4Yi1pZAUAsuL5ayJ837BvnrctgYGgIyBH47K7cOFxHqMQ2eFEmz3aW
         XgoSB/jVZY8o0KtxgWP7eFPYhFTuhbTpmGbnoGLs+1PtNFIc/5rh8wtE4uSs2rhdLS2p
         rBb/rZdK7G9jyxrxUj+sAho5BCCQa6+U3apNDkDA1rL06S2oDtRrAdj62v+T5wMngZZS
         2UmAOh2OjaYbH3FboiSp2pG+RCxG06VVso00qiO0n1re9KRhFkdz4Fm7zHGLCVdEZmlJ
         Ds9A==
X-Forwarded-Encrypted: i=1; AL+hErHEj+WBKSySyML2lt7egtBTyqxkF+j+8IMBKFrm8Cxdr2DXJ1AWqrfImmddq4xAjWeJ1bkYPkmXJTn5LSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mraxcG+2aejXfwv0kWfNtRXeHGrGuZRVvdakep8yUuyh+t1wP
	6K0nT5uPp6XcZ5UrwVecAUpY+xwUffCxHQAZUp/qO5IgtPnpwV3mFyfx
X-Gm-Gg: AZFdTZf/3NF7sYznE8BvonZ9byXU13sMe8JlCmD6SxBLU77zk8PIuBRH2s6B89Z9dKC
	hxbOrkYse5t2UOBmyXn2JZFC/WioLuWwl9it1KqDICwucdKjjuutGlaQleVxDXVG4cc9sq4w6FS
	wo8zY6EZa8IQO/T2unMgKAsoasukdFqSzLBigNksrtKUeX9eX2yab9Few1IZS23AFm7bhrj+Yxn
	/0H/qswXRCljEatzDm1kZskBmRoG3Tc654w8rJhrBrGelpuJMsoM40DwDLPKmj2UmZzA8X6Ic8r
	CTrV5vZz/yIYnpmO6EoaLUX+tRVP89x3uYH5B0LVdzi4i9DgZtz3vD3fnMWX+mblbhgat+zZpJl
	yB0VTfNPrcEXwRmRr4ruwog1RfE3VIGXQxq2xwm00Lgg2cJ/aBtlzHj2Q61U8RA7HdeM4XrtZUo
	L22bp5XqbUvip4u99EZ0OHQC7BvR1ofZxUGF4S7mesVcJeVfY233Q1pIryMduID/67IQejhsL8y
	Af8GgE978fdLiNbcdUE/70jvyekfi3D2TMhaimSeoFL1ChmJOdKRGEaM4G/Me0Lnm80BOfi+xZh
	my4hvsU4sO9Iv4676C+BBu29SbJCWzxYlK8zJr2vsQ6HKgK/s7vrKf6kv3aIAaKdDr0B8fLzDGO
	9FJiresGLOQdh0KIbgZw=
X-Received: by 2002:a05:6870:4db:b0:4ad:8d9f:98a3 with SMTP id 586e51a60fabf-4bc87de13e3mr3153094fac.35.1795205118467;
        Fri, 20 Nov 2026 12:05:18 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm4122200fac.4.2026.11.20.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:05:17 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 14:05:16 -0600
Subject: [PATCH] drm/mediatek: ovl: Report coverage blending on older SoCs
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
Message-Id: <20261120-rbrue-suez-mtk-ovl-coverage-v1-1-35040085fc37@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuEPC9ghkjtVcSHtv7OoK6SuiKO3
 V3wO8C3coMbGkda2dGtWZ05kg7E5ZbmCWIXjsTjbjyoahDPvkDagq8833ep/SGldniaIHoMRTW
 nkHXPA/HLcbXPfz+dt+0HCGu2Qm0AAAA=
X-Change-ID: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795205116; l=4367;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=h4Tvd2gLk6BmOFdUxw3JC3W2Yz6nDyqzW/jYqV5h1bo=;
 b=jygRYnIZ6A4BG1IGZuzzTo8JDeciKHrqpHygmrw7zjCsTulx4jjcQ4bzto4hZFbM6Q7yhLwFt
 4qkyVhGaLPOCo2whLDjeAKzLnJWJLoLWJ/JFUVijZG41BSFtOvQ8ye8
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

The plane state now defaults to Coverage instead of Pre-multiplied. Both
are non-zero, so mtk_ovl_layer_config() programs the same registers as
before.

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
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 5445870716f9..81a4143f294d 100644
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
@@ -667,6 +663,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -677,6 +674,7 @@ static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -686,6 +684,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -695,6 +694,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -704,6 +704,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

