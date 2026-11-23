Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418702;
	b=IomCKVEOu66NqwX8ujo3KnWZ66wGQwSaueSf7RLM3TAUTmT40f+EAipc7VlLlTu6S82C
	 BFAXPdboMWP89H5wcWA+tZCE+zG1f/paOxC6vXE+IrQ85TC55JXy9f08Vcd2Uc+uOjw68
	 hhp57Y27Pvgef58E5/560/cKnUu+OjtExi+JAd3KZ+bSa/EVyUbfG5NPDDSAjju8cUJG8
	 CR/8HaNx0PdKcex5sdO8/bjjGezoI7zeEN4cUc6b1rXzbesv1yKqVO+1CE/XIeGrRSegs
	 HUTYpQr7GsUt7iGAKKw6LjlE683wqocsZ4I1cgs6IdHybmCkd9aVnOtjcPJCwzrHRDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
	b=FV4Lyqf2BJn01aUOQcPn1x2gkbTUDhpC0Qv7RymWreWOL8ZMxJ6e+T1FI2SOoD9/gHJ2
	 XXsyYADXpKuF5x+ap0noGApVjLN6HPNvfBKh99NpVYASdTq9PDPbShHX+N5nxNoq1xvYv
	 9dnuwns+XE9Gs8pb7kuBSJQMx7sJhhJorIJ4ZxJxY6BRyl34ghZ0KDFzHiFEWrSpZdjZ3
	 4iLA4M7BTmFQ/LCpI8VqdEt4s0NBVY4j10qGD/4kevoNiMuW2m7sgCvwk7QJKehEsm1uW
	 +y5pIMlnLrnKqX5QZTvvjzD3H9Ec6BZYMFNDcdmUFKWjVrY5s9dX02dK2Nnruy9i0yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fZvI2ggW;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D6A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fZvI2ggW
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0621eec70so15473855ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795418701; x=1796023501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
        b=fZvI2ggWZDeuzqAZ/ZjEAMAhzf5E/YLJLMwUG2gIB+ka6EyBpyUHEZIrsni9eJNf8E
         Uvaw/dkgfluINPC/XL2I5EWUjAQg6sgvaYn1ld1V1apEtUK9uyD6eOaVa4021lQy0VLv
         JCNTZSQHzoYZnkqmZ8tpvPSVtFIxZ99pPVQ+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418701; x=1796023501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
        b=cvQCsg70paNV7Ft6fQrCnWqWF7rbNTIoci1eaOr9csNOIRlDfWjDdK5YOdw5sjwcIa
         fc1vY7CaIODc+QaS0548E5tPitzVaML4AwyN+IAEkzENn1ZxAr2d0bfQ6MIYOAm8rvQh
         MybCQimn4HugEEcwXRr/qdztBln3HjFLCA2lu7FWhr4nYG50g3PKFRF44cOFLkdNwdZm
         ZvOKVZ1EOX4KTU876cupxMq70zBtPsHzophbiOLKTDzjpSO0LBt6HqS/BcTjhqsXClDG
         yOC4WMw7Gwdst7j+jyMfCEHSDGnJRy6Ydo3cprmVqHsjibDqskwER3yPQIVJIF6HWSnu
         7d/w==
X-Forwarded-Encrypted: i=1; AL+hErGrodZvLFZoDFf5tSEdEz1zCD6JaDrkQ1azCm/efqfOPPVhK3qVkR2PozfWNOvtuHgm2j8K/aQq02yakuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xB786B46unLK3FUpX4XVNAC76HMoq3B5Ix3SdFtHdCHMft4sY
	xQD0vF3k9627N+mt4MeoizmyTuwT3OHJUaaTONGrwYGlZwsq3KAo9ECpCfLAmvskQg==
X-Gm-Gg: AZFdTZd52G6lxgxq5m62NFyCnMCZvXdXuScK4HosJOAZWzZRN5vGjTTvP4Vl9eqAxUb
	9weW2qlZ65YIkMrnm5wn+EqVA9ctUQQdgVnURfh1AT/pl7TaEYKYaU+w1hsALMVsu7I8K/gv4u3
	JptKGzAVZ3yXCWlQ3u7Ba/VOp9vr3tqWz/H4UeQyaGCZ6S8/A4Cp29uh04dDkrvTIX492oZeuYM
	XTnW5bqD9LXnuo2eymWHAZ+pupQVHdWovGT/SQFFLsDJYQI/3HTlM6F7mlCKWrhMmqDI1ptT+Fp
	nNZZKch80TJVPsuiL8Z//GBGAmkwsHot9elSwIftrxNEsy5q+hJYlfTMAfNdSdnrZsPgv5OclB+
	9xbU4pEc0XLjbhQYOVXt+E+vQ3z17FqTL+rW2oKuXDdiFNY5Uievgci9O7NcR9chQ0E/UL/AAPv
	a1NXhUeazPQZQfLCXVRF0sUULHd+h2SDo50nJ0CrjfFrOCtbUtG6AuqPK+j0nhSvzHrdQXcjIZj
	X5wOLwhSYiDqBATlCDZLJQfDU3Nc1OudVOuPqyMYlyO1NI5DC9JwWifgUzIvZq6ZT9MKVSiemgk
	jEx4cP0Hgl6bfSypxpvhyAl57VuaPTXLeYJUlYUpluHkQdaz2preRfA/+hl6
X-Received: by 2002:a17:903:1acc:b0:2f0:a113:4e46 with SMTP id d9443c01a7336-2f0a1134e76mr11816085ad.48.1795418701534;
        Sun, 22 Nov 2026 23:25:01 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:fde8:799d:8c83:f2ab])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84294sm47180345ad.9.2026.11.22.23.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:25:01 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/exynos: Set supported modifiers during plane init
Date: Mon, 23 Nov 2026 15:24:54 +0800
Message-ID: <20261123072455.2221408-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
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

The exynos driver currently checks the modifier in a helper called by
the plane atomic check helper callback. This check only concerns whether
the selected plane supports the tiled format or not. This is tied to
the plane's hardware capability.

Turns out the tiled support was added around the same time modifiers
were being plumbed through DRM planes. The latter provided a way to
describe per-plane modifier support.

Add a field to the hardware plane capability struct to allow adding
an optional list of supported modifiers. This is passed to
drm_universal_plane_init(). This also allows the core to generate
and pass to userspace a list of supported modifiers for each plane.

Also provide a .format_mod_supported callback to restrict
DRM_FORMAT_MOD_SAMSUNG_64_32_TILE to DRM_FORMAT_NV12, matching
framebuffer_check() so the mixer VP plane does not advertise the tiled
modifier for DRM_FORMAT_NV21, and validate modifiers against the plane's
modifier list.

EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
check is now done by the DRM atomic check.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Add .format_mod_supported callback to restrict
  DRM_FORMAT_MOD_SAMSUNG_64_32_TILE to DRM_FORMAT_NV12 (Inki)
- Fix typo in commit message ("down" -> "done")
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 49 +++++++++--------------
 drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++-
 3 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b126cd129944..ab0edb826261 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -92,7 +92,6 @@ struct exynos_drm_plane {
 #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
 #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
 #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
-#define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
 #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND	(1 << 4)
 #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND	(1 << 5)
 
@@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
 	const uint32_t *pixel_formats;
 	unsigned int num_pixel_formats;
 	unsigned int capabilities;
+	const uint64_t *modifiers;
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 020e8c9cf7de..92ed00e2b6f9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
@@ -161,6 +162,23 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
 	kfree(old_exynos_state);
 }
 
+static bool exynos_plane_format_mod_supported(struct drm_plane *plane,
+					      u32 format, u64 modifier)
+{
+	unsigned int i;
+
+	if (modifier == DRM_FORMAT_MOD_SAMSUNG_64_32_TILE &&
+	    format != DRM_FORMAT_NV12)
+		return false;
+
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (plane->modifiers[i] == modifier)
+			return true;
+	}
+
+	return false;
+}
+
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -168,32 +186,9 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.atomic_create_state = exynos_drm_plane_create_state,
 	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
+	.format_mod_supported = exynos_plane_format_mod_supported,
 };
 
-static int
-exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
-			      struct exynos_drm_plane_state *state)
-{
-	struct drm_framebuffer *fb = state->base.fb;
-	struct drm_device *dev = fb->dev;
-
-	switch (fb->modifier) {
-	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
-		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
-			return -ENOTSUPP;
-		break;
-
-	case DRM_FORMAT_MOD_LINEAR:
-		break;
-
-	default:
-		DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifier");
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
 static int
 exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 			    struct exynos_drm_plane_state *state)
@@ -241,10 +236,6 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
-	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
-	if (ret)
-		return ret;
-
 	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
@@ -308,7 +299,7 @@ int exynos_plane_init(struct drm_device *dev,
 				       &exynos_plane_funcs,
 				       config->pixel_formats,
 				       config->num_pixel_formats,
-				       NULL, config->type, NULL);
+				       config->modifiers, config->type, NULL);
 	if (err) {
 		DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 9b210ff7449f..5da871e5ac9c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -93,6 +93,12 @@ static const uint32_t vp_formats[] = {
 	DRM_FORMAT_NV21,
 };
 
+static const uint64_t vp_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
+	DRM_FORMAT_MOD_INVALID
+};
+
 struct mixer_context {
 	struct platform_device *pdev;
 	struct device		*dev;
@@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.num_pixel_formats = ARRAY_SIZE(vp_formats),
 		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE |
 				EXYNOS_DRM_PLANE_CAP_ZPOS |
-				EXYNOS_DRM_PLANE_CAP_TILE |
 				EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
+		.modifiers = vp_modifiers,
 	},
 };
 
-- 
2.56.1.831.g720f3f5937-goog

