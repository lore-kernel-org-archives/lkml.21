Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408386;
	b=O7xFXGVRho4AKgZdLK3FRadHU5/6pcwPrWmWIhLPkxqFDTMSSjkzfSEBqKOlyuVmd3Gs
	 4rHtk8SU1ePLBA85udx4Umkql/dSxEXHuDR4vCVrLMYGIo/oir33L+YSwCplOuiuUE1Vt
	 /qzQo2toWz6hyLgueqzj8oQmNLkH9HeD5yNBDQvUQi+5+tM3zl1Z3w1UX4AXQiAGYIX6D
	 +01K2+tMz6mpt7CBOScH5f6Gq60DOMcCHC9sUoGUnVC8MtDVeTdj7yGV1y9KZuvQVnrS3
	 O0h1o1KjIj2XTYpQwpguD9fWefBI/PimIrn1jMaLOv3LCQnh/WrF6BDxmlRvtMFrkjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y6e/BeRDCHwL9lJy6sv4fZMewSON2DSwfj/kfxjgV7E=;
	b=RvzcBhMlnKwiBjEasI60sbqY3NzBCfUOnnH8/njB+Ao/267uAkOs+6oXUtmiWaip8t7I
	 BTJ5tmrk1eRpKnAQsBYk/HOs6bFW/REB+dcMzBnMRA6IosaesgFzrbstMeLxWb/i70+hx
	 AXfXU/0dWzf0EDiTNbM93YuSCZeyrR26pRaOs+f6DU39nT+jVh1hC/1f+XiXGwdF0gpU/
	 70q40wLx9yg6jCCelatyHe905aM+BHmvyiN2PiSPKTYfbPzJFmk+95JgUq5wIzzB5cgXF
	 y0vqDYAxrpCruHG6LnCjVRwtTuQp6SelDJYDhkJlCR+JNooh82Sucz4Z/94BXq5unfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfj4nWJJ;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985D606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3985D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfj4nWJJ
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2005303a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408385; x=1796013185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6e/BeRDCHwL9lJy6sv4fZMewSON2DSwfj/kfxjgV7E=;
        b=tfj4nWJJO2T5kdwSDZdZ94OG9uxTcTk5BL6AauZfuelugf5+lu0cjif81c5TUikZ+D
         TmdhmOj8QQJlC20Qx+/zAfgM+bO2z9rDlWIsofT1e0/Z44D/4z2nfwbgK7Ayx2ckjI70
         Dhqh0hsIrR+4TT33Ro2mcdN30umuQMyfE8TJnE5F3K4dDFMStgWUnO9XhTaJrSJ8v07K
         OteA9wsI1b9Gc/T1IZf0MpGBh5BLDGE3/J+mA+T50KaXMibc4qrbkBVNTxu7bwK0mGEe
         Ua1bg2Br2l5RL3mRhixB5+5c9IPzmCl5RFqu7bdQAWmzzgMxwVfTAOf0jJzVuDnHJVNn
         tCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408385; x=1796013185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6e/BeRDCHwL9lJy6sv4fZMewSON2DSwfj/kfxjgV7E=;
        b=oiKI0t62z2dxOwRuX1qURnEDOi4Ge/Kr4GxAdWVO1rzmgH/McY/TWBR94cHYxwfibR
         5YCKQu62C2vrgjEorvLqj8oGNRu1GGeohN7vTxnacOtMj6alTQJqjp1KXhlrObyYu6/n
         7qMd3H2Xx9f5BJh/wp8aDmoeaLORdYafPSl44EnbhBlis0pldBM8XvP+NxYWnJKMnhDV
         eveSZiJHwLPVs+e06Ljqj95fVNfs7w9mzkvPPciZPASb3Xg91JmygbGkobSqUEcMlCtR
         3fW56iNkJ5p7Wa/EtVgIeJNeFltoU9MtghD5gZEDP1KjqOgLV0iy+5HDiy/x2yPbCL4R
         IFwQ==
X-Forwarded-Encrypted: i=1; AL+hErHzZhOcAY/qpbAFjDIv9PdBTXBvNhQMaaFz6TThi7sco3kkKc3rHodmcsi/jCJtS/Ok1Gc8ycUTDTyhWkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z93VBEluKRMbOZ7Uwv8SqybdrwwZQOTjzUM2IvKH24/3+his7ad
	LeqUWFeo7XdvCjgc0im0Hj3HV7WQNp47PQ0KHgH9Jb5eG8ogKZ8dDCDYBJUx7w3B
X-Gm-Gg: AZFdTZeq34+jzunhguoqlndlrK1EYUIgs4NewT+Gz37kBM1RJdPWf//uCO4/R1QObte
	z5La1xlDiRCkfoWi2Vbaz18cpQ3NiQ+btrPbfCe0Wr1fbuNlX7WPjxmvMJKdz1aSf784q+4Gixm
	7sqMQUadOD7EV0Mefm9vzamKJRTY5eWxPkfsmwqNuUOLSoNXjde9E7YWR5brrusTi8SWFbPV8LS
	CLKf/mtjT0iIi2R12S2no9oGN4fgMhF7Y2XYkDhJJpmk3M0XC8b7qIFAoLYeWovoTmWWTSI1Nn2
	o5seyA3ucPAs2bJnismwj2UIztl9ne+g+6LAmigk5j0efhsn6paqYhzgPKKgGSlx2hIHO+NN0n1
	Ep0LFMCnqStk5e9bBjUwU0WREzmj2tu01KpO95+WnJyGFk2Zi42L45SBwIDYHfJT4s1TRJ4tQSl
	PGhL9mChUhzFCsbV0qvzYieuurFI2gK92beq6N4a3OMme9OolbYIPEkPGEDPfJmoWdi3Q1z09iu
	0toN4UQJOWkoi30G/7tVmEU/CAX85ms07IYdpFx1rNMTT14wytlFfahJ9bd9b8r1qn9rYTCSrC1
	1zkeDZcv6rHnTYiSrWZ6jxHD+w+bK1lLxTcMKL0fEEzI72T/D54zxKUuOGZC1ZMujcv/C/mZdGj
	UOxyPVl+U3mFm6lPEg5ZRnNQvbKJiYerriPSPrNUTgMLRZTLZwKNNkqNQ1zVm8sZCEaAr3A==
X-Received: by 2002:a17:90b:2516:b0:3b4:b16b:c98b with SMTP id 98e67ed59e1d1-3b4b16bcb44mr5997a91.62.1795408385452;
        Sun, 22 Nov 2026 20:33:05 -0800 (PST)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm45389145ad.50.2026.11.22.20.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:33:05 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] lib/test_bitmap: cover unused tail bits in bitmap_cut()
Date: Mon, 23 Nov 2026 13:31:54 +0900
Message-ID: <9350566bc24af03c9dbd9c7dff0691769edcaf32.1795407826.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795407826.git.kimjinseob88@gmail.com>
References: <cover.1795407826.git.kimjinseob88@gmail.com>
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

Exercise 33-, 65-, and 127-bit bitmaps with pairs of inputs that
differ only in the first unused storage bit. Check the valid output
against a per-bit reference and compare it with the output from the
second input.

Cover in-place and disjoint buffers and both directions of partial
overlap when the bitmap spans multiple words. Check that disjoint
source storage is preserved.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 lib/test_bitmap.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index eb925d576..104fc23a4 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -1145,6 +1145,7 @@ static struct test_bitmap_cut test_cut[] = {
 static void __init test_bitmap_cut(void)
 {
 	unsigned long b[5], *in = &b[1], *out = &b[0];	/* Partial overlap */
+	unsigned int initial_failures = failed_tests;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(test_cut); i++) {
@@ -1154,10 +1155,97 @@ static void __init test_bitmap_cut(void)
 
 		bitmap_cut(out, in, t->first, t->cut, t->nbits);
 
-		expect_eq_bitmap(t->expected, out, t->nbits);
+		if (expect_eq_bitmap(t->expected, out, t->nbits))
+			pr_warn("bitmap_cut existing row=%d first=%u cut=%u nbits=%u\n",
+				i + 1, t->first, t->cut, t->nbits);
 	}
+
+	pr_info("bitmap_cut existing rows=%zu failures=%u\n", ARRAY_SIZE(test_cut),
+		failed_tests - initial_failures);
 }
 
+#define BITMAP_CUT_TEST_MAX_BITS 127
+
+static void __init test_bitmap_cut_padding_case(unsigned int nbits, unsigned int first,
+					       unsigned long *dst, unsigned long *src,
+					       const char *layout, bool separate)
+{
+	DECLARE_BITMAP(input, BITMAP_CUT_TEST_MAX_BITS);
+	DECLARE_BITMAP(expected, BITMAP_CUT_TEST_MAX_BITS);
+	DECLARE_BITMAP(clean, BITMAP_CUT_TEST_MAX_BITS);
+	unsigned int bit;
+	size_t bytes = bitmap_size(nbits);
+
+	bitmap_zero(input, nbits);
+	bitmap_zero(expected, nbits);
+
+	if (first) {
+		/* Preserve bit 1, remove bit 2, and move the bits above it. */
+		__set_bit(1, input);
+		__set_bit(2, input);
+		__set_bit(4, input);
+		__set_bit(nbits - 1, input);
+	}
+
+	for (bit = 0; bit < nbits; bit++) {
+		unsigned int source = bit + (bit >= first);
+
+		if (source < nbits && test_bit(source, input))
+			__set_bit(bit, expected);
+	}
+
+	bitmap_copy(src, input, nbits);
+	bitmap_cut(dst, src, first, 1, nbits);
+	if (expect_eq_bitmap(expected, dst, nbits))
+		pr_warn("bitmap_cut clean nbits=%u first=%u layout=%s\n", nbits, first, layout);
+	if (separate && expect_eq_uint(0, memcmp(src, input, bytes) != 0))
+		pr_warn("bitmap_cut clean input changed nbits=%u first=%u\n", nbits, first);
+	bitmap_copy(clean, dst, nbits);
+
+	/* The first padding bit is in storage, but outside the bitmap. */
+	__set_bit(nbits, input);
+	bitmap_copy(src, input, nbits);
+	bitmap_cut(dst, src, first, 1, nbits);
+	if (expect_eq_bitmap(clean, dst, nbits))
+		pr_warn("bitmap_cut padding nbits=%u first=%u layout=%s\n", nbits, first, layout);
+	if (separate && expect_eq_uint(0, memcmp(src, input, bytes) != 0))
+		pr_warn("bitmap_cut padded input changed nbits=%u first=%u\n", nbits, first);
+}
+
+static void __init test_bitmap_cut_padding(void)
+{
+	static const unsigned int sizes[] = { 33, 65, BITMAP_CUT_TEST_MAX_BITS };
+	static const unsigned int starts[] = { 0, 2 };
+	unsigned long buf[2 * BITS_TO_LONGS(BITMAP_CUT_TEST_MAX_BITS)];
+	unsigned int initial_failures = failed_tests;
+	unsigned int i, j, pairs = 0;
+
+	for (i = 0; i < ARRAY_SIZE(sizes); i++) {
+		unsigned int nbits = sizes[i];
+		unsigned int len = BITS_TO_LONGS(nbits);
+
+		for (j = 0; j < ARRAY_SIZE(starts); j++) {
+			test_bitmap_cut_padding_case(nbits, starts[j], buf, buf, "in-place", false);
+			test_bitmap_cut_padding_case(nbits, starts[j], buf, buf + len,
+						     "separate", true);
+			pairs += 2;
+
+			if (len > 1) {
+				test_bitmap_cut_padding_case(nbits, starts[j], buf, buf + 1,
+							     "dst-before-src", false);
+				test_bitmap_cut_padding_case(nbits, starts[j], buf + 1, buf,
+							     "dst-after-src", false);
+				pairs += 2;
+			}
+		}
+	}
+
+	pr_info("bitmap_cut padding pairs=%u failures=%u\n", pairs,
+		failed_tests - initial_failures);
+}
+
+#undef BITMAP_CUT_TEST_MAX_BITS
+
 struct test_bitmap_print {
 	const unsigned long *bitmap;
 	unsigned long nbits;
@@ -1587,6 +1675,7 @@ static void __init selftest(void)
 	test_bitmap_printlist();
 	test_mem_optimisations();
 	test_bitmap_cut();
+	test_bitmap_cut_padding();
 	test_bitmap_print_buf();
 	test_bitmap_const_eval();
 	test_bitmap_read_write();
