Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450880;
	b=wIkgQMGw3/Jqr80MbGFYpugJ2ZbcqaRBlTIUjUf76YEMggHAmlE+MU4f8jQ89xw7mUJQ
	 eXlTKtoM3VNowcN/5inCds4aBUHatmdqIRhEiipw3ZWLmE7+Tr/qL/ccRMKDfOYSy8u+l
	 X8HD6p57pUO/khVFi5C0+7NraX3YvX58eLnFXhgFdvO6f5T56impk9cPJo0n3iuvqfwrk
	 Dcu54Lz7ucXyCyiYrZgDmYJE9U2JDQFCcPUXZR1YyMVBbbzUOpamUMp4J0Yx5CmjHkhCu
	 qcnN0bB9Mfexd6puhuG2WqfooCBMGzcnSp6+cLAweL7eTnNuWeUeQybpWJ7rFQRgv/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SZTWBMmt2DFM0xgpeL4tW3LgzfUZb1ELoVM7m/gJHa0=;
	b=acwBMZShSNvSaHCuIrQHZeQTBJvPJ2BxsnD7+DrloAfGOyJOgM02QLKzq9qNvs0tZvdX
	 5SCwD5jqjrHtssUeC5vhZqhrb55aruBrnnx+96O2QXbf71gJm5MoWUgigJc/PY0mKmWN9
	 y/j2/guW71T8YANXuAlSekYChl8TUTp9x4lb4VHJvd9APqJj8otW2q29bpQ8ZjN3ITzET
	 MjLDJQHFut2aarZ+cEYmAwFXBSg/ywZXqPKtjHiMAcac4vbnYPorXV5Q5r2LGnse4KjZ8
	 kiIkO2D16WriF6G5u5OZTgJnwmpQ8+8crjP+aeKc3w9FWt/UvXhqOVgMaIviyq3WZcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KOML2vYa;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF2606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EF2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KOML2vYa
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so33810225e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450878; x=1796055678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZTWBMmt2DFM0xgpeL4tW3LgzfUZb1ELoVM7m/gJHa0=;
        b=KOML2vYaelXNlkRN8Zge+di5AQ/UsrV4XQ+aBRJsObDKZRi8BBqKuEm13FlwB5U9mu
         WslDUJDsa+EVlPtgsU4ADvYAYWuM/Nars+Tkvz0A1xGkoTVYBQlqGHbrRkT3HYMmNSb/
         000GCvqsXAqsA3zgUeOehOOks7QoNSFiqHnKwB53mn6hzNw/OzHflxiUobNY6H0rTaQn
         RhNFVQqZQDbMXJN2RkCdMklI8yVBO8he3OZRNCnBvvGo7qEZLl44v0S1nYKhZ16dxHqT
         u2eA1oLXj3E8Jiv1Ad7ttGApwaE+fytw4RjHmqeLhxiDkdRTkx+FEqHz7CZrPEFCd7vU
         qtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450878; x=1796055678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZTWBMmt2DFM0xgpeL4tW3LgzfUZb1ELoVM7m/gJHa0=;
        b=q+yuycmThY22xqP6KHSunDj/fB9PEnziLvcaMvBIDktiVBLCgjTWqJCMcX991pEWsY
         vt1oIkVItGFBN8NOY62C2y+lBc3SpFu3bB1FBJPVvwYJDg/G8riY15m0OalcsgH1Bh9H
         1NqxJpy7uhOGClJ4PF5pSS8Nz9XO0XBbM7Pkwu4TQvYcwQYfigXixvBUlLGmLO+jKrAa
         OMOYyYHVsVfIqCHBcCV1LpnvaSH2B80qz8P5tRBYqjMxKdP/UxExocu/BLfW8j7Zpa1a
         ttH9deBwt4ecdIBjabHBDRcMTpqgAvftpR8NEe1QAj6eM21hZp4XuSkOXzq+AWOgrhzG
         cqAQ==
X-Forwarded-Encrypted: i=1; AL+hErFS/MAvW9byxZFguyRdt6kLE8KSV/72Q01oPBwSD8X+9XqMKJH/DcOoTynsBvc24freMFJ+cIKrkkZaydk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9viuisve0AZZFqSU23qrY5BFRqwKe4N8KjY/r4cvZln8eYHRkq
	JJ4ydyDDrhJsMDbIw04yEfPm5N/Wbmj5uIqvwkVi9HCnTY/KVYwGrSaO
X-Gm-Gg: AZFdTZfpIadrTwVpyV7LQjv0i/FATFXc/WkmVzL9EHxVpLQzfzBtA3l/X8jEZNOQ8CW
	jdTDvkdIBClds51HcDH3z1q2LiNhPG+OL80RU0vvZNNiwW1dytRKVc9Rg/YwSKxikbatTPsfGql
	v6zmTLLEhbsqEEC0bW7Tl12L8+TIbXh2lQeyKCjaf6KARLChmi5HD+YTEcJ1T0T9OMEG0VxTEhm
	YhdB8Z94XVvNKjNZzMXkx5OACpZnAYuwFvJK4kMjfkC0jBldM/8x78SWQ3Bpv2k/R3INa9BdbyF
	sh4RxzzsWpvLt7+NOIDUy+57n8aHgRuB+qR0hyGhUKIqDn+s7HUUp8HTKU9rJvjlmoPIl1F8ReF
	2tqTuKsaFi895o88+UQPYyk6xRAntzpJJICjFORak9SWQCSfxBYz+X4xQf1FEbmJdnu+BGLNRfT
	qvCQdLEQHJCYpoHD45xcWsJUFaVqZTuUb1I6iv57BZZ+IWPeLD7mR0syVWfsEE0yxgrGwQf7VSI
	lRAF3Sc2Sui8YWMEdvlF0bE15BeEin+t5nXsEqYg6qoB1E6VqmraVW/GtbiUNz8+DbKi+21pDqY
	hXnRkR9wRsNVZD858x8MjzD90GL9h+HQfbikb2jJ
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr244134215e9.10.1795450878450;
        Mon, 23 Nov 2026 08:21:18 -0800 (PST)
Received: from [10.56.169.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm18863696f8f.35.2026.11.23.08.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:21:17 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Mon, 23 Nov 2026 17:20:28 +0100
Subject: [PATCH RESEND 3/4] drm/vkms: add a KUnit test for the precomputed
 LUT table
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
Message-Id: <20261123-lut-v1-3-5556c89a2ebd@gmail.com>
References: <20261123-lut-v1-0-5556c89a2ebd@gmail.com>
In-Reply-To: <20261123-lut-v1-0-5556c89a2ebd@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

build_lut_table() turns a per-pixel interpolation into a table lookup, so
a wrong entry changes the composed output with no other symptom.

Compare every entry against apply_lut_to_channel_value() for the same
channel and value, for a 4-entry LUT whose channels differ and for the
256-entry sRGB one. The check stops at the first mismatch and prints its
channel, value and both results.

The tables are built with apply_lut_to_channel_value(), so this proves the
lookup matches the interpolation, not that the LUT arithmetic is right;
vkms_color_srgb_inv_srgb() covers the latter.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 1a1c7cac2f15..cdbb74d16b5e 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -88,6 +88,21 @@ static const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
+/* Channels differ, so a table built with the wrong channel does not match. */
+static struct drm_color_lut test_distinct_array[] = {
+	{ 0x0000, 0x0000, 0x0000, 0 },
+	{ 0x1000, 0x6000, 0xb000, 0 },
+	{ 0x2000, 0x4000, 0x9000, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+static const struct vkms_color_lut test_distinct_lut = {
+	.base = test_distinct_array,
+	.lut_length = ARRAY_SIZE(test_distinct_array),
+	/* drm_fixp_div(drm_int2fixp(lut_length - 1), drm_int2fixp(0xffff)) */
+	.channel_value2index_ratio = 0x30003ll
+};
+
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	s64 lut_index;
@@ -393,6 +408,44 @@ static void vkms_color_ctm_3x4_bt709(struct kunit *test)
 	KUNIT_EXPECT_LT(test, out.b, 0x100);
 }
 
+static void vkms_color_test_check_lut_table(struct kunit *test,
+					    const struct vkms_color_lut *lut,
+					    const u16 *table)
+{
+	int i;
+
+	for (i = 0; i < LUT_RESERVED * LUT_TABLE_ENTRIES; i++) {
+		enum lut_channel channel = i / LUT_TABLE_ENTRIES;
+		u16 value = i % LUT_TABLE_ENTRIES;
+		u16 expected = apply_lut_to_channel_value(lut, value, channel);
+
+		if (table[i] != expected) {
+			KUNIT_FAIL(test, "channel %d, value %#06x: 0x%04x != 0x%04x",
+				   channel, value, table[i], expected);
+			return;
+		}
+	}
+}
+
+static void vkms_color_test_build_lut_table(struct kunit *test)
+{
+	const struct vkms_color_lut *luts[] = {
+		&test_distinct_lut,
+		&srgb_eotf,
+	};
+	u16 *table;
+	int l;
+
+	table = kunit_kzalloc(test, LUT_RESERVED * LUT_TABLE_ENTRIES * sizeof(*table),
+			      GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, table);
+
+	for (l = 0; l < ARRAY_SIZE(luts); l++) {
+		build_lut_table(luts[l], table);
+		vkms_color_test_check_lut_table(test, luts[l], table);
+	}
+}
+
 static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_get_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
@@ -400,6 +453,7 @@ static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_srgb_inv_srgb),
 	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
 	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
+	KUNIT_CASE(vkms_color_test_build_lut_table),
 	{}
 };
 

-- 
2.56.1

