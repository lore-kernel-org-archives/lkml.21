Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886197;
	b=v4bMNPjGxz1JO/35fYEDoNpL+GRsh9s2j2LnEw0EfWHmtFen25xq0Vd9AmVNs1HlZeRH
	 3DJR7qSEJkELiF5EnxhSIbieKJEBK+yNLoHRO/kmpVdtIZJQCDVOToDNSsUvWtt6csB35
	 svdbH2Ll7AAvhrAL5pjODhZQvX8UCtZMohvtZ9rwOxIxgGXgGqpZy+wqGTVJ0EDhCCFqT
	 Tg2URBPrYyCYWnJsme0JE2oochFDJau8zs/2bF2tycAmnurmWhm+TNjnXMf9GPUe6SRtV
	 srGw08LD2l2957V65qBRrlLn/LedN0sGHjqv8eUHTh/lmaSqT6dO4HgpVWyOEA/xt5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jNYMppZjg59SlB0crJWhtTM6xqZHIPZ/g2F/6Oot1Wc=;
	b=B/bcQPAmRwOacZZznauewb/6jM3GrKyJ8OfzRpqkrFeSz1VxmCSdFnpvlQDlrXbSNP3u
	 c+gUT0KQtM+KeH8Lm6/OtlndRAEJQAgyJ4JUl15QFIKwvJigyVkBubF99OopfoU+ZSvH6
	 qz9T4zxf+M8l+8xSK9+9PHivyw5UKcLS6TAhuqgBGuNJrIa4xlUhkNX8tBSav1Cgxrlwa
	 6nRpYFZWUmFK5sSdlayk+/mmlyEq2TDxsJobTtAY4CVJzZdTAurVaAWIN3RmPxbtBKuVs
	 Lbp/CpYxeihFvK7XsTkkYQNIjNPy5Y7hn0aOoPlhh+F28Oh8K/qw7xZ/jJElqWsRE/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="powU/vWO";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC8606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=powU/vWO
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a358881793so4764783f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886195; x=1796490995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNYMppZjg59SlB0crJWhtTM6xqZHIPZ/g2F/6Oot1Wc=;
        b=powU/vWOkwVis6mGpRrjwGKrNsgqlTKVlPb07gSGwanEmuaeV7CUp68phmpSEtUV9P
         Av2tBnGEVgjRixC7EETpi3qAalgy3cNXp9tcguJefO6xIHSwbuwY7kMPz0oqMpb+wABS
         GNls0EcCEGk6eVwfwfqY3PuINmVypN213Hg2ns4nSYdMmzpIwGsoQL7Yco/qytGyh2g7
         DhrHm2lMG2KL/YKXRuti3wVMBv5YYuepucDflGrfa68GaMhtg9XbS9Z23h+YNMeZLPYn
         pJvtTPvZkCRrdcBFvLX+OikClerWLofp2NCIfK+LNnv0rxoTExiqhwXGklf2sudcDxrd
         NapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886195; x=1796490995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNYMppZjg59SlB0crJWhtTM6xqZHIPZ/g2F/6Oot1Wc=;
        b=pLv52GRC2M1RoG6mRaZ42XXbKfn3yBHybN23SC6WPypWdQwfXmGBl07TQInfMXnpZJ
         wFT5Rz8Ggcj/TvgDcH9uvZ7qez7hTsP41euVTW/2Yf3XeC/3txmX34hSw/lXM+0TgCaT
         okja2JRezD3xmUetPGg+EbXhUPXITu4lppqLgGQLwKZgquERBkS/VuL7aRRIwpQPsZkR
         CEqZ+MmFAqarrU0RwwgpQwBgV1Pce/6oWooMRxR8GGuFakPRY3+j1rWy/AHgPYTtBSwV
         AWoi/ON4OsGrcIM9ieHG/a74fIfuG1n8/1BO+gJr/qrN4JeUFxzXD295sHdpkHlj1hVD
         gt+g==
X-Forwarded-Encrypted: i=1; AL+hErHR+Wc4ptE9Y1tFAJzPgxtZYKHojF67CRruej9SrlVJVB6xk85eaNJCvovNWfcqp33ANCG4Pi9Ycq310R0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RDCZ2wQ5qKt2aIxY+RTVJaGIpN982JYNhtX2UNzWabiJd1qrd
	6DuyrvrhsinZHjFwIMN039kAHfCIKcL1y3SqQO2MYlFueJzisT8kOh8y
X-Gm-Gg: AZFdTZcvc7HPWdl+h+oA52BFmat9/kXWyCJD7iaR2uq9owz5J9sew38nfSvaO4AegyB
	LB41n5KvB2MniIpNFSwNQRn31U0Mumfv5h0HKwCxhyCVctf1vOifnNVy2s99dyoG6W8lvVKnyJU
	JybL2UEFo8u8HLaXTWzcewxyipX+B2Y3TflseK7wvhZ+YO5K9GhRtBWTmZLrJSMQq9muTXTer9+
	Ob/r+IrvJGTNL683ZSp5KmT+5I7EbQ+SChgq3Vb+DEUrTbmpgu04Y2qr3O8Dhofbc0QAkl7oz02
	vjHgo4/Hcd2IupZrJxR2aIfSDTwkfjeYyEUmh5ngPm6yQ0jnrgAY5xes5JjjkopZXXZ1f6nStqU
	ZvU5IAq9cGOBZcaAc9M/B0EDsx3JC31SOWhVJ9/7UlCVJCBmeqdFhvXPkhVNQxbvoPOEkfKAfcd
	g5u66z4HgRgdepKifnpLzxM6AgdIyXDIVgAE8Tyr3tt3Z0DtiYP8WdKjY9ak7x5PZSzwzI9gkef
	TRwoYRQys3XeKOC6yK1W1bNniGXE3mMNCAB4scucTjqZYALibT8IVK3RnvN3QPznq9BbPXCHDdE
	K9wZDadQmo1hzCWAA9q3y/hES3oFXRH+Qw5YqQ==
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr55058904f8f.34.1795886195360;
        Sat, 28 Nov 2026 09:16:35 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:16:34 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 28 Nov 2026 18:15:25 +0100
Subject: [PATCH 7/7] drm/vkms: add KUnit coverage for the 3D LUT and
 multiplier colorops
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
Message-Id: <20261128-colorop-v1-7-dd79919f822b@gmail.com>
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

The 3D LUT test uses a 2x2x2 identity LUT with inputs that reach all six
tetrahedra, and checks that values outside [0, 1] saturate. The
multiplier test covers gains of 1.0, 0.5, 2.0 and -0.5.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 105 +++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 0d68de6462d9..15f71a977ed9 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -205,6 +205,108 @@ static void vkms_color_test_lut32_single_entry(struct kunit *test)
 						     0xffff, LUT_RED));
 }
 
+/*
+ * A 2x2x2 identity LUT: every corner maps the axis index to the same
+ * value, so any input has to come back unchanged. The entries are ordered
+ * with red as the fastest moving index, as the uapi documents.
+ */
+static const struct drm_color_lut32 test_lut3d_identity[] = {
+	{ 0x00000000, 0x00000000, 0x00000000, 0 },
+	{ 0xffffffff, 0x00000000, 0x00000000, 0 },
+	{ 0x00000000, 0xffffffff, 0x00000000, 0 },
+	{ 0xffffffff, 0xffffffff, 0x00000000, 0 },
+	{ 0x00000000, 0x00000000, 0xffffffff, 0 },
+	{ 0xffffffff, 0x00000000, 0xffffffff, 0 },
+	{ 0x00000000, 0xffffffff, 0xffffffff, 0 },
+	{ 0xffffffff, 0xffffffff, 0xffffffff, 0 },
+};
+
+static void vkms_color_test_lut3d_identity(struct kunit *test)
+{
+	static const struct {
+		u16 r, g, b;
+	} cases[] = {
+		{ 0x0000, 0x0000, 0x0000 },
+		{ 0xffff, 0xffff, 0xffff },
+		{ 0x8000, 0x8000, 0x8000 },
+		{ 0xffff, 0x0000, 0x0000 },
+		{ 0x0000, 0xffff, 0x0000 },
+		{ 0x0000, 0x0000, 0xffff },
+		{ 0x8000, 0x4000, 0x1000 },
+		/* One input per tetrahedron the lists above do not reach. */
+		{ 0x9000, 0x1000, 0x5000 },
+		{ 0x5000, 0x1000, 0x9000 },
+		{ 0x1000, 0x9000, 0x5000 },
+		{ 0x1000, 0x5000, 0x9000 },
+	};
+
+	for (size_t i = 0; i < ARRAY_SIZE(cases); i++) {
+		struct pixel_argb_s32 pixel = {
+			.r = cases[i].r,
+			.g = cases[i].g,
+			.b = cases[i].b,
+			.a = 0xffff,
+		};
+
+		apply_3dlut_to_pixel(&pixel, test_lut3d_identity, 2);
+
+		KUNIT_EXPECT_EQ(test, cases[i].r, pixel.r);
+		KUNIT_EXPECT_EQ(test, cases[i].g, pixel.g);
+		KUNIT_EXPECT_EQ(test, cases[i].b, pixel.b);
+		KUNIT_EXPECT_EQ(test, 0xffff, pixel.a);
+	}
+}
+
+/* A value outside [0, 1] saturates at the LUT input instead of wrapping. */
+static void vkms_color_test_lut3d_clamp(struct kunit *test)
+{
+	struct pixel_argb_s32 pixel = {
+		.r = -1,
+		.g = 0x10000,
+		.b = 0xffff,
+		.a = 0xffff,
+	};
+
+	apply_3dlut_to_pixel(&pixel, test_lut3d_identity, 2);
+
+	KUNIT_EXPECT_EQ(test, 0x0000, pixel.r);
+	KUNIT_EXPECT_EQ(test, 0xffff, pixel.g);
+	KUNIT_EXPECT_EQ(test, 0xffff, pixel.b);
+}
+
+static void vkms_color_test_multiplier(struct kunit *test)
+{
+	struct pixel_argb_s32 pixel;
+
+	/* 1.0 leaves the pixel unchanged. */
+	pixel = (struct pixel_argb_s32){ .r = 0x8000, .g = 0x4000, .b = 0x2000 };
+	apply_multiplier_to_pixel(&pixel, 1ULL << 32);
+	KUNIT_EXPECT_EQ(test, 0x8000, pixel.r);
+	KUNIT_EXPECT_EQ(test, 0x4000, pixel.g);
+	KUNIT_EXPECT_EQ(test, 0x2000, pixel.b);
+
+	/* 0.5 halves every channel. */
+	pixel = (struct pixel_argb_s32){ .r = 0x8000, .g = 0x4000, .b = 0x2000 };
+	apply_multiplier_to_pixel(&pixel, 1ULL << 31);
+	KUNIT_EXPECT_EQ(test, 0x4000, pixel.r);
+	KUNIT_EXPECT_EQ(test, 0x2000, pixel.g);
+	KUNIT_EXPECT_EQ(test, 0x1000, pixel.b);
+
+	/* 2.0 doubles every channel. */
+	pixel = (struct pixel_argb_s32){ .r = 0x4000, .g = 0x2000, .b = 0x1000 };
+	apply_multiplier_to_pixel(&pixel, 1ULL << 33);
+	KUNIT_EXPECT_EQ(test, 0x8000, pixel.r);
+	KUNIT_EXPECT_EQ(test, 0x4000, pixel.g);
+	KUNIT_EXPECT_EQ(test, 0x2000, pixel.b);
+
+	/* A negative gain flips the sign; the composer clamps it at the end. */
+	pixel = (struct pixel_argb_s32){ .r = 0x8000, .g = 0x4000, .b = 0x2000 };
+	apply_multiplier_to_pixel(&pixel, (1ULL << 63) | (1ULL << 31));
+	KUNIT_EXPECT_EQ(test, -0x4000, pixel.r);
+	KUNIT_EXPECT_EQ(test, -0x2000, pixel.g);
+	KUNIT_EXPECT_EQ(test, -0x1000, pixel.b);
+}
+
 static void vkms_color_srgb_inv_srgb(struct kunit *test)
 {
 	u16 srgb, final;
@@ -474,6 +576,9 @@ static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_lut32_three_points),
 	KUNIT_CASE(vkms_color_test_lut32_single_entry),
 	KUNIT_CASE(vkms_color_test_lut32_descending),
+	KUNIT_CASE(vkms_color_test_lut3d_identity),
+	KUNIT_CASE(vkms_color_test_lut3d_clamp),
+	KUNIT_CASE(vkms_color_test_multiplier),
 	KUNIT_CASE(vkms_color_srgb_inv_srgb),
 	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
 	KUNIT_CASE(vkms_color_ctm_3x4_bt709),

-- 
2.56.1

