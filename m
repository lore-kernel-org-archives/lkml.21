Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886172;
	b=naZc5S1AndLv3LwiL6yRJjVrGaNm8OOM7tAFEIonFyhdjGivvxnRrX+L3+DiulDpAAtz
	 QurZfPLCF1bt9KthtHJG7OqhaVPj2sYzQtfsfJcJIOgyUvrR4z3OBMFR/pQXhHJ8tOOiJ
	 sCqnDNAhsWPpLHOkuSID5x0Fk0AzlBAU6rgYmpOuwfHcQkMuwb9B0NUM+S6/xxMUsolZi
	 DgbqDPrIYrqjOvnniMGiL13zswyTTORnaIE2XkYvrOOTTdxEwPzCt6hfjEqmoO9u0ZJsf
	 PEOgdG5PWfihkWcRyrc4oyBrvjQm2LqKJVIhhNB1TdLiw1qEgsFFG8lw96iHMGjAGgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2ZxV2xEqsnONcYdp4yXmDN2ul3Nqgcm2H/bI+3LUGKI=;
	b=WcbMRQk+0LP2SnHio6Hft8dD1Y3GMz1n6b0KQWslGEDfdbonQBZJRbeJXoETBzI0Mzfy
	 yjmiLWQj7y8+rzhSjxrjmgCyFqzzdHMSL2HI8DUfjWrN4c18WcTxZvp2iizHsODDZRYeb
	 BnaGbtN0bVfdamTL4RMyUogVRX4BH35av/+fcTSm9x2U9mTqWqFc3AmMFiIZRy7Yp1TdR
	 vj00lzhY8EQCR1H6JlcZbQCdc3YBsvts5rhtwVaWM31fC7jrD+mQ2D2wHrRicVOoUosSx
	 fr5D8j4edjUK280bcUmmVGTBVyzntBXZCJIM6LX5nStAIMkCxil0B3OiU8ovOgit5jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJSJQt65;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A66606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJSJQt65
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so8585476f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886170; x=1796490970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZxV2xEqsnONcYdp4yXmDN2ul3Nqgcm2H/bI+3LUGKI=;
        b=qJSJQt65ypXLlIkf4licjrHP/889ZJY5nm8wL54KmrOzEnpjhcvHfxabfbL772mqjP
         A6z1L88zwEqqn0xQ2bDuljM7ffV0DvyxaSqmJPlQ8fQgkonFszvbw0GiP+i37nvkfOiQ
         xND5zgKQ+obwr58KmDBod5pRoSNyzKpvUp0wgnL8Cihh1t9y0tcZO85vu5h7igu08oms
         H1SF1Obkkcc5f3m++p4XS0QNW0R8W7q8OwwozTNDCIuSsJJr9eRRkOqtXrMBDFgNs+a1
         EXGgIblUBXzhzh4gjnvMV+qYtY4Op4wJH2h/58rGPKHgnHa5bFL6roA39yvzRwvwajXj
         hPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886170; x=1796490970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZxV2xEqsnONcYdp4yXmDN2ul3Nqgcm2H/bI+3LUGKI=;
        b=gQz5hHHiFnf6FtCp+6nBNYZd2eKNFaBRngkQBvf9fF+ROCFgpPrVxx251VuN33Igqm
         UYpoI9yTou+VMqzFn1ErsAOh1I+8zH0tez/uyoOtlFfIdqYWc1yoORb0gpWdqdxqjNk+
         N7wEjaMOtZpRZf4MRTei4+lF/0jG4NoRKPVi4upXWahU+sQvaKFNhqcnKgO97XOI3Due
         lHgQzGg70ZjyjOMiLjRmSJNfAa7q/Wgamn9VqsgXzISW3KVYeDu/1/PLdrpJen/mzEAD
         Z7jileBo0L5OLnahoVa6T7pl7RaChuid3IV4NIWYOOQ8u+Z5oshUitxSTn+rtl+7rJ2k
         dBhQ==
X-Forwarded-Encrypted: i=1; AL+hErGZWcO+/dONh2SLv7jXx0hNWxHGo2Uhi8+RPuAGJC8PkZbb63vLk0hPUPPi/TAtzaRJ5y3QLe5OROzTWTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8us0fSGmLaXdjgqBAblW9tGqOeZbC+ozmxqD85+p/rzZoaEATj
	ag1V0/bxDxYjBhi0vezpKFo9/KrmdHozW0tY4WogdrspZzety3fYp4Zf
X-Gm-Gg: AZFdTZdr7C8/Gj8fu5OzpjsfG3y/aPdwTVDIWOX+vkle6P69cq1NHR9n60BzPM/WuFU
	rtEkNTV+drNRzEDkJ96+EQVF0GKZETmtREU0B555++jIZFuFBwlSoDnOJZHPjbk4mAmjkJsImUF
	knppQaq+eVZn7hwV8uOqM+nu72ApZDGqRnTgWCqKpzOhn85YLXy34KmK58i3L9s1zb8vid7TN92
	56a8oYCRmJEYRZ29rDI72lG1toYLbJOPzfRi0aYfPFQ/E0mBFQ9kM+PvRt4LXfueFXwaCqe7+YJ
	fZyQrOjcJ6S6ugDiMbx6eOwGwUuE59yi5mFP0Qnk70yoK3L/hbJyXZubVSIb5LDP2mc0sXHSHSd
	F8NuouRDGTtD0hcu7E61p+5B7VH6iIAqH1emc2V0C1zBwW9SYiwZ7pXJdNrEhg78F0SPodtslDt
	xLzRqscWnWx3EeECOvcsFiy2h14y31c0KH7X9hErcRH3PRkVNPMlOV7SJffOAieMwyHjg/uEga3
	8CAMgbZJ/8dhx/GjX103MC8RugRsQVasY/ox+5ASDiroExJ7IpScf88ZOM9z6OWp8qLqVK2TrOx
	Fzh/mk2ltC7lJBrcIXrsJNdjDG2URPAQV0PBmA==
X-Received: by 2002:a5d:5888:0:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-4abb514607bmr54403429f8f.57.1795886170353;
        Sat, 28 Nov 2026 09:16:10 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:16:09 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 28 Nov 2026 18:15:22 +0100
Subject: [PATCH 4/7] drm/vkms: add a programmable 1D LUT colorop
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
Message-Id: <20261128-colorop-v1-4-dd79919f822b@gmail.com>
References: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
In-Reply-To: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Alex Hung <alex.hung@amd.com>, 
 Robert Mader <robert.mader@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, Simon Ser <contact@emersion.fr>, 
 Daniel Stone <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The two curve stages apply a curve built into the driver, so userspace
can pick one but cannot supply a table.

Add a 1D LUT colorop with 256 entries and linear interpolation, and look
the entries up in the composer from the blob it carries. The values are
U0.32 and are scaled to the 16-bit range the composer works in.

Add KUnit coverage for the interpolation, including a table that
decreases.

The existing colorops and their order are unchanged.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 89 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c          | 19 ++++++
 drivers/gpu/drm/vkms/vkms_composer.c         | 80 +++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.h         |  2 +
 drivers/gpu/drm/vkms/vkms_drv.h              |  3 +
 5 files changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index c3c61037cb71..0d68de6462d9 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -120,6 +120,91 @@ static void vkms_color_test_linear(struct kunit *test)
 	}
 }
 
+/*
+ * A two-entry LUT that maps 0 to 0 and 1.0 to 1.0 is the identity, so every
+ * input has to come back unchanged, including the ones between the entries.
+ */
+static const struct drm_color_lut32 test_lut32_identity[] = {
+	{ 0x00000000, 0x00000000, 0x00000000, 0 },
+	{ 0xffffffff, 0xffffffff, 0xffffffff, 0 },
+};
+
+static void vkms_color_test_lut32_identity(struct kunit *test)
+{
+	static const u16 inputs[] = { 0x0000, 0x4000, 0x8000, 0xc000, 0xffff };
+
+	for (size_t i = 0; i < ARRAY_SIZE(inputs); i++)
+		KUNIT_EXPECT_EQ(test, inputs[i],
+				apply_lut32_to_channel_value(test_lut32_identity,
+							     ARRAY_SIZE(test_lut32_identity),
+							     inputs[i], LUT_RED));
+}
+
+/*
+ * Three entries at 0, 0.5 and 1.0. The values tested here fall exactly on
+ * the entries or halfway between two of them, so the expected output is
+ * exact.
+ */
+static const struct drm_color_lut32 test_lut32_three_points[] = {
+	{ 0x00000000, 0x00000000, 0x00000000, 0 },
+	{ 0x80000000, 0x80000000, 0x80000000, 0 },
+	{ 0xffffffff, 0xffffffff, 0xffffffff, 0 },
+};
+
+static void vkms_color_test_lut32_three_points(struct kunit *test)
+{
+	static const struct {
+		u16 input;
+		u16 expected;
+	} cases[] = {
+		{ 0x0000, 0x0000 },
+		{ 0x4000, 0x4000 },
+		{ 0x8000, 0x8000 },
+		{ 0xc000, 0xc000 },
+		{ 0xffff, 0xffff },
+	};
+
+	for (size_t i = 0; i < ARRAY_SIZE(cases); i++)
+		KUNIT_EXPECT_EQ(test, cases[i].expected,
+				apply_lut32_to_channel_value(test_lut32_three_points,
+							     ARRAY_SIZE(test_lut32_three_points),
+							     cases[i].input, LUT_RED));
+}
+
+/* A single-entry LUT returns that entry for every input. */
+static const struct drm_color_lut32 test_lut32_single[] = {
+	{ 0x12345678, 0x12345678, 0x12345678, 0 },
+};
+
+/* A decreasing table must round the same way an increasing one does. */
+static const struct drm_color_lut32 test_lut32_descending[] = {
+	{ 0xffffffff, 0xffffffff, 0xffffffff, 0 },
+	{ 0x00000000, 0x00000000, 0x00000000, 0 },
+};
+
+static void vkms_color_test_lut32_descending(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0xffff,
+			apply_lut32_to_channel_value(test_lut32_descending, 2,
+						     0x0000, LUT_RED));
+	KUNIT_EXPECT_EQ(test, 0x7fff,
+			apply_lut32_to_channel_value(test_lut32_descending, 2,
+						     0x8000, LUT_RED));
+	KUNIT_EXPECT_EQ(test, 0x0000,
+			apply_lut32_to_channel_value(test_lut32_descending, 2,
+						     0xffff, LUT_RED));
+}
+
+static void vkms_color_test_lut32_single_entry(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0x1234,
+			apply_lut32_to_channel_value(test_lut32_single, 1,
+						     0x0000, LUT_RED));
+	KUNIT_EXPECT_EQ(test, 0x1234,
+			apply_lut32_to_channel_value(test_lut32_single, 1,
+						     0xffff, LUT_RED));
+}
+
 static void vkms_color_srgb_inv_srgb(struct kunit *test)
 {
 	u16 srgb, final;
@@ -385,6 +470,10 @@ static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_get_uniform_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
 	KUNIT_CASE(vkms_color_test_linear),
+	KUNIT_CASE(vkms_color_test_lut32_identity),
+	KUNIT_CASE(vkms_color_test_lut32_three_points),
+	KUNIT_CASE(vkms_color_test_lut32_single_entry),
+	KUNIT_CASE(vkms_color_test_lut32_descending),
 	KUNIT_CASE(vkms_color_srgb_inv_srgb),
 	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
 	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 01b1ed2a5991..584305b0abfd 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -119,6 +119,25 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i - 1], ops[i]);
 
+	i++;
+
+	/* 6th op: 1D LUT */
+	ops[i] = kzalloc_obj(*ops[i]);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, &vkms_colorop_funcs,
+						  VKMS_LUT1D_SIZE,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 2cd909bc8adc..e00d1d0b2f2d 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <linux/bits.h>
 #include <linux/crc32.h>
+#include <linux/limits.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_colorop.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fixed.h>
@@ -198,6 +201,61 @@ VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut
 }
 EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
 
+static u16 lut32_channel_value(const struct drm_color_lut32 *entry,
+			       enum lut_channel channel)
+{
+	switch (channel) {
+	case LUT_RED:
+		return drm_color_lut32_extract(entry->red, BITS_PER_TYPE(u16));
+	case LUT_GREEN:
+		return drm_color_lut32_extract(entry->green, BITS_PER_TYPE(u16));
+	case LUT_BLUE:
+		return drm_color_lut32_extract(entry->blue, BITS_PER_TYPE(u16));
+	case LUT_RESERVED:
+		break;
+	}
+
+	return 0;
+}
+
+/*
+ * Apply a uniformly spaced 1D LUT to one channel, interpolating linearly
+ * between the two entries around the input value.
+ */
+VISIBLE_IF_KUNIT u16 apply_lut32_to_channel_value(const struct drm_color_lut32 *lut,
+						  u32 lut_size, u16 channel_value,
+						  enum lut_channel channel)
+{
+	u64 position;
+	u32 index, fraction;
+	s64 delta, result;
+	u16 floor_value, ceil_value;
+
+	if (!lut_size)
+		return channel_value;
+
+	if (lut_size == 1)
+		return lut32_channel_value(&lut[0], channel);
+
+	position = (u64)channel_value * (lut_size - 1);
+	index = position / U16_MAX;
+
+	if (index >= lut_size - 1)
+		return lut32_channel_value(&lut[lut_size - 1], channel);
+
+	fraction = position - (u64)index * U16_MAX;
+
+	floor_value = lut32_channel_value(&lut[index], channel);
+	ceil_value = lut32_channel_value(&lut[index + 1], channel);
+
+	delta = (s64)ceil_value - (s64)floor_value;
+	result = (s64)floor_value +
+		 DIV_ROUND_CLOSEST(delta * fraction, (s64)U16_MAX);
+
+	return (u16)clamp(result, 0LL, (s64)U16_MAX);
+}
+EXPORT_SYMBOL_IF_KUNIT(apply_lut32_to_channel_value);
+
 
 static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
 {
@@ -270,6 +328,25 @@ static void apply_1d_curve(struct pixel_argb_s32 *pixel,
 	}
 }
 
+static void apply_1d_lut(struct pixel_argb_s32 *pixel,
+			 const struct vkms_colorop_state *state)
+{
+	const struct drm_colorop *colorop = state->colorop;
+	const struct drm_color_lut32 *lut;
+
+	if (!state->data)
+		return;
+
+	lut = state->data->data;
+
+	pixel->r = apply_lut32_to_channel_value(lut, colorop->size,
+						clamp_val(pixel->r, 0, 0xffff), LUT_RED);
+	pixel->g = apply_lut32_to_channel_value(lut, colorop->size,
+						clamp_val(pixel->g, 0, 0xffff), LUT_GREEN);
+	pixel->b = apply_lut32_to_channel_value(lut, colorop->size,
+						clamp_val(pixel->b, 0, 0xffff), LUT_BLUE);
+}
+
 static void apply_colorop(struct pixel_argb_s32 *pixel,
 			  const struct vkms_colorop_state *state)
 {
@@ -283,6 +360,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel,
 		if (state->data)
 			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *)state->data->data);
 		break;
+	case DRM_COLOROP_1D_LUT:
+		apply_1d_lut(pixel, state);
+		break;
 	case DRM_COLOROP_FIXED_MATRIX:
 		break;
 	default:
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index fa003af12f85..6da85efc5524 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -22,6 +22,8 @@ u16 lerp_u16(u16 a, u16 b, s64 t);
 s64 get_uniform_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
 u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 			       enum lut_channel channel);
+u16 apply_lut32_to_channel_value(const struct drm_color_lut32 *lut, u32 lut_size,
+				 u16 channel_value, enum lut_channel channel);
 void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
 #endif
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 1c5205aa6e0c..05fba864cf36 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -35,6 +35,9 @@
 
 #define VKMS_GAMMA_LUT_SIZE 256
 
+/* Entries in the 1D LUT colorop of a plane's color pipeline. */
+#define VKMS_LUT1D_SIZE 256
+
 /**
  * struct vkms_frame_info - Structure to store the state of a frame
  *

-- 
2.56.1

