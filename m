Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590372;
	b=bBHUt4Yr8PccvYfeAJgwwyjiAr1gL7higTRjPAPF2q/DO1DUtvF808lyTqNjXlVZVlEn
	 31lVJ+/eMEnB2n3pIUAWQlx+IDFHwixH7FZjy7/u8lDm1u6ovfYKyRLOEMtrO2mvmm3Gm
	 Di1hEMVCoSckZE5941mEIvn4rQMHw9pYsdCwQX4DZv11N6ANpB9Bpu4010zdPbw/OEz7B
	 KvxZkCD9N2BIK41vLrD7q6Ya5qSmoPswY6CwEGq+hw/142bxSEbBHG3qsbYSsFisUBW9c
	 qao97zCjajc0nbFTf6tS5GctfFHijCO0bLiUuhzIvoN2vDtP/wTEXvc6nytvjbll1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aJPhEyG57IouNR/chtFBozYSYgr3OK8Rm98T6dNYaMk=;
	b=zS31VQ0u4u3OQ14cJZEOU/96ymZKX1SIlkEFfRfCmKUVZOSoDnyapvIJ7z4eeVw/zgBN
	 +DiUJK98hI8gk3gnm3Kk/VWp0CCyO/Gqsgxqjz0NLPo7KAwt4tbDRv35gspE0XtLYr0Gr
	 npFD4TbA94uaQ+2xSG89tL6jW+QW+H/UeWTrTIFvEWFsrGAGQWd+G+LKhOGCj4JXBtqcD
	 TcaTrT3GjIkL4qf2IUycrx0osu3RSxaRmTokxKaADOnVvyhhgliKdMjNnDVctv5BXewKj
	 QfuxkQRUhv8qtKvPWN9nFjWVH8Srw4cnYJ0svEC1h6WsAiWNndYcTSb0E7b7Vpb24oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zy0kG2li;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A2A60A2611
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A2A60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zy0kG2li
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso2269500a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590371; x=1796195171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJPhEyG57IouNR/chtFBozYSYgr3OK8Rm98T6dNYaMk=;
        b=zy0kG2li6wqOrnA6DyZGdlDJjXIYzH4nKAnN+0yv4Dou+pwaNqPyFd+B/0srum2CiV
         mHxhRXM/XCZoUr+UavjjldIfIVvOeOTn9ucsuJPVZpMnc5X+lpHGtabQWgWbEhOCC4cN
         nvMWNs733XJIUhwepCB/mPJ4tnOTx8i4wIUkgWNfgW2INuY7nYll++zsw2XepyT+we+K
         ab8pJF6W9iohH7aniZcEgt5ymlQlVs/yMgVXcObqmlxNNLNgbmYOiyTANgCkYj9F83hx
         zwEUJKy7xdoOIr5dpBsCdZ01obqYfEc7NJP4hIYyy+8vnM4g/9fn0SC8B7TpN2opJIjP
         qmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590371; x=1796195171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJPhEyG57IouNR/chtFBozYSYgr3OK8Rm98T6dNYaMk=;
        b=AODDN/SeHp7/qOQ/4LMmz2eVTWuRMw24urbT5uXoPomdPyfxox3V1JEDpLbIMK5wJ8
         MxEEH0rwq5cC3pu8zwIb7kjZhsiQectQ74ZFI0IUSrzlhRjcKerErskwPOAijCNGJ1QH
         mtoDCLCapSi6H221keYjG848fbxUHBzosDIgj93ACptRuL+bdfU1F4eYX71ZontFIGX+
         yEMojutZFncg7NAKq74AvFXKIcjv1dPSNHEgHYDn6RElAmKAiFwvd+8wNCOyHaCoYhml
         nzmeBeDzDpFVKVGPXhnNKBHrARMPA9KH/1ynvzbgYgEPSJ/xDWNGGotHRnJQfBeE9qL0
         wS7Q==
X-Forwarded-Encrypted: i=1; AL+hErG6FuN22NVlT7RaWxqMASEEwvC9S3glTevCQ/AmLMRCIkemzMFpJLQXV++uUhQ3z96a8JdVVwUNhMXZ60o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sEaF3gdNJ8m76tvMD5NU15ZNdwu1RkE2k39XDOWVTcRWeg9Lm
	69Onr/HT633pC9sTIiq53BuulO3VPbl+3g7RF7rXsG8ACyA1lSbRsOQ0
X-Gm-Gg: AZFdTZe9CUyGbRuxuWBGHB94v66Q61KXY+pd6X3kcxfilH+i/NH0sYmJ7tg1rM+gbEq
	uBiwN2O400j2gV2b8Qo7mRuiJDfkJNq3WJoz+G1FTmibsBxCMN15dVwuXSURPygrd7Cbnku1dqB
	wFGRarVAF46fX3360VvL2Eq0myjFcr+UtdUmQu82AHh6OkIi8TjGX2LmOaFoqPXfV0cgJ8uYIS7
	naIcbNeyOhzRepdAm0+D5W200vr9hJuaWyjgNkW+UXpVbsAT9UmvXKC8crWuKkwj50s2rqntrQ1
	Me0ZZ6J+5dQ5v0UWl0Jt/mNgZ/V78jPSjbtOzzGMbMfSnuF13lGgahZvouhgXd2uOT3zDtX9p0e
	j6uy2z5p8MBe1L2CajmnHlGs9IFef6Cu5k4Y5PZh+lCympk6hJUaPjvze7OJ30j6s9ViWZOKKbL
	yfut8JyvTAIlUAVPpxdYAy9gRvsB1jUJe9TEJ9blDgK09BUPagt5nbUyj5bWl66Mvn79pGxw/PC
	U1nv7XCLUQu4ewr051oVLg2uR7qy40Ceu7Ivrus5ueSR+WyhaPSLA3Kna8lz2nlBwd98cDUoSJH
	u/Fixsi1MjmjBPC4B/IPjIRlt3h5971yWr3b1yOumCPKjV3wthsPmF8azP3GOk4=
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr14865389a91.40.1795590371429;
        Tue, 24 Nov 2026 23:06:11 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:11 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 4/4] media: zoran: add KUnit tests for capture format negotiation
Date: Wed, 25 Nov 2026 16:05:48 +0900
Message-ID: <20261125070548.28989-5-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125070548.28989-1-hiyoukou@gmail.com>
References: <20261125070548.28989-1-hiyoukou@gmail.com>
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

Check that zoran_v4l_set_format() leaves zr->buffer_size and
zr->v4l_settings describing the last accepted format when a format is
rejected, and that an accepted format leaves the two consistent with
each other.

zr_vb2_queue_setup() sizes the capture buffers from zr->buffer_size
while zr36057_set_memgrab() and zr_set_buf() program the chip from
zr->v4l_settings, so a disagreement between them makes the chip DMA a
frame that does not fit the buffers it was given.

The tests are included into zoran_driver.c because the function under
test is static.

Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/pci/zoran/Kconfig             |  14 +++
 drivers/media/pci/zoran/zoran_driver.c      |   4 +
 drivers/media/pci/zoran/zoran_driver_test.c | 123 ++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/media/pci/zoran/zoran_driver_test.c

diff --git a/drivers/media/pci/zoran/Kconfig b/drivers/media/pci/zoran/Kconfig
index 3fb3e27e04a8..fd3d3c2e5ff5 100644
--- a/drivers/media/pci/zoran/Kconfig
+++ b/drivers/media/pci/zoran/Kconfig
@@ -24,6 +24,20 @@ config VIDEO_ZORAN
 	  To compile this driver as a module, choose M here: the
 	  module will be called zr36067.
 
+config VIDEO_ZORAN_KUNIT_TEST
+	bool "KUnit tests for the Zoran driver" if !KUNIT_ALL_TESTS
+	depends on VIDEO_ZORAN && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable the KUnit tests for the Zoran capture format negotiation.
+	  They check that a format which fails validation leaves the buffer
+	  size and the capture geometry describing the previously accepted
+	  format.
+
+	  For more information on KUnit see Documentation/dev-tools/kunit.
+
+	  If you are unsure, say N.
+
 config VIDEO_ZORAN_DC30
 	bool "Pinnacle/Miro DC30(+) support"
 	depends on VIDEO_ZORAN
diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index ec8ed5601f50..894653a97fb0 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -976,3 +976,7 @@ void zoran_queue_exit(struct zoran *zr)
 {
 	vb2_queue_release(zr->video_dev->queue);
 }
+
+#if IS_ENABLED(CONFIG_VIDEO_ZORAN_KUNIT_TEST)
+#include "zoran_driver_test.c"
+#endif
diff --git a/drivers/media/pci/zoran/zoran_driver_test.c b/drivers/media/pci/zoran/zoran_driver_test.c
new file mode 100644
index 000000000000..424b2fd065c8
--- /dev/null
+++ b/drivers/media/pci/zoran/zoran_driver_test.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit tests for the Zoran capture format negotiation.
+ *
+ * This file is included at the end of zoran_driver.c so that the tests can
+ * reach zoran_v4l_set_format(), which is static.
+ */
+
+#include <kunit/test.h>
+
+/* zoran_card.c: PAL square pixel timings, the largest supported geometry. */
+static const struct tvnorm zoran_test_pal = { 944, 768, 83, 880, 625, 576, 16 };
+
+static const struct zoran_format *zoran_test_format(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < NUM_FORMATS; i++)
+		if (zoran_formats[i].fourcc == fourcc)
+			return &zoran_formats[i];
+
+	return NULL;
+}
+
+static struct zoran *zoran_test_alloc(struct kunit *test)
+{
+	struct zoran *zr;
+
+	zr = kunit_kzalloc(test, sizeof(*zr), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, zr);
+
+	/*
+	 * zoran_v4l_set_format() only reads zr->timing and only reports
+	 * through pci_dbg(), so a zeroed struct pci_dev is enough.
+	 */
+	zr->pci_dev = kunit_kzalloc(test, sizeof(*zr->pci_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, zr->pci_dev);
+	zr->timing = &zoran_test_pal;
+
+	return zr;
+}
+
+/*
+ * A format that fails validation must leave the device state describing the
+ * last format that was accepted.  zr_vb2_queue_setup() sizes the capture
+ * buffers from zr->buffer_size while zr36057_set_memgrab() and zr_set_buf()
+ * program the chip from zr->v4l_settings, so the two must never disagree.
+ */
+static void zoran_set_format_rejected_keeps_state(struct kunit *test)
+{
+	const struct zoran_format *bgr32, *rgb555, *bgr24;
+	struct zoran *zr = zoran_test_alloc(test);
+
+	bgr32 = zoran_test_format(V4L2_PIX_FMT_BGR32);
+	rgb555 = zoran_test_format(V4L2_PIX_FMT_RGB555);
+	bgr24 = zoran_test_format(V4L2_PIX_FMT_BGR24);
+	KUNIT_ASSERT_NOT_NULL(test, bgr32);
+	KUNIT_ASSERT_NOT_NULL(test, rgb555);
+	KUNIT_ASSERT_NOT_NULL(test, bgr24);
+
+	/* 4 bytes per pixel, so the line alignment check cannot trigger. */
+	KUNIT_ASSERT_EQ(test, 0, zoran_v4l_set_format(zr, 768, 576, bgr32));
+	KUNIT_EXPECT_EQ(test, 768u * 576 * 4, zr->buffer_size);
+	KUNIT_EXPECT_EQ(test, 768, zr->v4l_settings.width);
+	KUNIT_EXPECT_EQ(test, 576, zr->v4l_settings.height);
+	KUNIT_EXPECT_EQ(test, 768 * 4, zr->v4l_settings.bytesperline);
+
+	/* 2 bytes per pixel and an odd width: rejected by the alignment check. */
+	KUNIT_EXPECT_EQ(test, -EINVAL, zoran_v4l_set_format(zr, 33, 24, rgb555));
+	KUNIT_EXPECT_EQ(test, 768u * 576 * 4, zr->buffer_size);
+	KUNIT_EXPECT_EQ(test, 768, zr->v4l_settings.width);
+	KUNIT_EXPECT_EQ(test, 576, zr->v4l_settings.height);
+	KUNIT_EXPECT_EQ(test, 768 * 4, zr->v4l_settings.bytesperline);
+
+	/* 3 bytes per pixel and a width that is not a multiple of four. */
+	KUNIT_EXPECT_EQ(test, -EINVAL, zoran_v4l_set_format(zr, 33, 24, bgr24));
+	KUNIT_EXPECT_EQ(test, 768u * 576 * 4, zr->buffer_size);
+	KUNIT_EXPECT_EQ(test, 768 * 4, zr->v4l_settings.bytesperline);
+}
+
+/* An accepted format must describe the same frame through both fields. */
+static void zoran_set_format_accepted_is_consistent(struct kunit *test)
+{
+	const struct zoran_format *fmt = zoran_test_format(V4L2_PIX_FMT_YUYV);
+	struct zoran *zr = zoran_test_alloc(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, fmt);
+
+	KUNIT_ASSERT_EQ(test, 0, zoran_v4l_set_format(zr, 704, 576, fmt));
+	KUNIT_EXPECT_EQ(test, (unsigned int)(zr->v4l_settings.bytesperline *
+					     zr->v4l_settings.height),
+			zr->buffer_size);
+}
+
+/* Geometry outside the active area is rejected before anything is stored. */
+static void zoran_set_format_out_of_range(struct kunit *test)
+{
+	const struct zoran_format *fmt = zoran_test_format(V4L2_PIX_FMT_BGR32);
+	struct zoran *zr = zoran_test_alloc(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, fmt);
+
+	KUNIT_EXPECT_EQ(test, -EINVAL, zoran_v4l_set_format(zr, 769, 576, fmt));
+	KUNIT_EXPECT_EQ(test, 0u, zr->buffer_size);
+	KUNIT_EXPECT_EQ(test, -EINVAL, zoran_v4l_set_format(zr, 768, 577, fmt));
+	KUNIT_EXPECT_EQ(test, 0u, zr->buffer_size);
+	KUNIT_EXPECT_EQ(test, -EINVAL, zoran_v4l_set_format(zr, 31, 24, fmt));
+	KUNIT_EXPECT_EQ(test, 0u, zr->buffer_size);
+}
+
+static struct kunit_case zoran_test_cases[] = {
+	KUNIT_CASE(zoran_set_format_rejected_keeps_state),
+	KUNIT_CASE(zoran_set_format_accepted_is_consistent),
+	KUNIT_CASE(zoran_set_format_out_of_range),
+	{}
+};
+
+static struct kunit_suite zoran_test_suite = {
+	.name = "zoran",
+	.test_cases = zoran_test_cases,
+};
+
+kunit_test_suite(zoran_test_suite);
-- 
2.43.0

