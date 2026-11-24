Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534248;
	b=GgVZIiXk2XcyYTjFlhlpvy1iwVVRPYLDiGnioSzAVQGvSDYGxmpiu2Q/sflpensoiMXF
	 ONapI/upgl/e6hhPdmYv4gda2Zfea2kGHppMTdVdegQ0pQ0QH4omRYr8dOxuwueO6PTSX
	 Go4CQOGQ0J0tdfWfApKhuPpPqznYSXppIbRqEmmoCVKE8BtetMhJnB++Bc87LHT6lALxZ
	 Mk0MHeiXkuT+BbIm5WtERP7h3QdvN0H7b8RABCqROQRjQw9c9ICKfEdI3Xfhqdv5ye5il
	 4pkOSFaiWrvgxhW1HSepYEiiT2pOj1CN97F6o1aN+ZJWohpLaMpL55qBHKiDO5mhAhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vfjq/bA54698vpa+UUFXUPUZ2VgCOvKkSPLtAbzZju0=;
	b=cMoZixSmc6x0PDzCU8xXyJL4jkBlGfd+BlzymBhnbnQwjJIA3ySJXcgbLuyIwHYvutVT
	 1QhzXhbcl8UwO2w+P2k0wsfHHub3+FXUO9SXqDxqzZ00u18nnHRTaNpDG1yy6NhxfpM6T
	 VV8QFFQlF5D1s2zigyFmK/2SwVS0ZaJw0Wh2hYXeCajWL03t6w1y8U/1q/H4clX8zMMEq
	 uJR/3eQ1FKObRh5qUDYn0xhgFacrgmgu+0LKlAt8PL2nQuovd3twozewExHW/o8Z+20sX
	 RqF5jmzJn35v1iS1IQuPblDLNz9/hH7YIxpVhryvD0SYH6VOsyk4mMhrudA3F3OdmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7QcER5o;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6793E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7QcER5o
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-94961bfe1a0so307182085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534247; x=1796139047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfjq/bA54698vpa+UUFXUPUZ2VgCOvKkSPLtAbzZju0=;
        b=O7QcER5oq7Kls3YTU9w9IabWj7DY/stXowmd8Q/wYvMGoG0EQrjBWKhinRDB/xfvP9
         YLH9MMSYUS6HTHNOaW1VNy5vufJdh3SmSbNh1hxMzXxpXGworRhWh83HUI2Td2Q7kx/6
         QvvIieR45R6Bdx44+Zsd6uFleFPT0uVJZqb1ToL2PXzuVL4kILSvYJ3IzNjCwHVk3JsJ
         v1/OKmKKJEvHXpTZRSHjtfHB1rD/NI6NMIW03DoveSgUoKOUu+yGAqnHynJkalWctkUA
         EyYkaKGwel436nxTvbwwgenwG1LsxgRzhUwijUfWJ7n+DC5zZ0jE71/7+99i4fn8NMhJ
         DQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534247; x=1796139047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfjq/bA54698vpa+UUFXUPUZ2VgCOvKkSPLtAbzZju0=;
        b=hsBvoiUD2Y+4esb815klHZX3HDznlFOjgM946uCg+HwSnzg1FRrToSDIpPhdLxLATI
         gdzKp0TvsWmVkjjaGmbe67HeS/HQOWmApncY0QgK9h/tqAIWNtKF72kW3Zlaui6TG4HM
         NyukeiYNTMxuFgGYxOG18vt5tIeNHhD6oK6nAVucqo3HUapcn8ivhqn2eCyt+k+KLEvE
         /gTkbADO2TIeRZI4dsilxoV8foJcgbqkKbO1MaHkKvU/pcADFmG/kOUCKOz7+w1YLTAD
         OD0hsAkqUPgqadRcCUImQ6RwMxJ7o/mZUw1P4ct/0krSF1YoKI25kPxohV7BxnOHT3wx
         VQtQ==
X-Gm-Message-State: APuU4Z+ojGHV98K4qjPaRJWc5zLF7pRXdb1z137sRjAF0Osi4YDxwK53
	MDwiyqW1WOYWaGWwPM8olXo95ZXuzDReJCEIzmMpQocKhfTrHVCXJ+f9tVumww==
X-Gm-Gg: AZFdTZfEVR9yw/Yinw/UTO8DMXKhfj3W5T99eNOCgxvsPqDwrfREM56qGp9yW9rmOrK
	mwF9X1JtHXIDIJcUszIifRlV0sHVDy496Rqi7olmEDhjl9LgvCZ4NV+/zn4M03StmtEQEw5izZG
	ZLt3cXSi9lolilWnKfBjTsYMm/Al65IwMu+uinLzoF5pm02/lmyvb1mNPWQFLec0tIN+lVapMs1
	9XOmwj/TsIEfQtQw7oCtOSWuXraB9gMZrGloXWR4DNwkJIPIJrX9rrR4N8sqcHEOuFMLMx17qcH
	XySNcHXZyevXBmREatonrVMPlhUt7vUlJpE3tWys7Nf2ilQ1NUrmP3QomSJpHJAuoAI0alruqw8
	7k2ih1BuQ5f0lnY0NUxdlfTRudkWnj7COrPyPLoFpjZVoGJw53fy0qveLMkX3/q1WEHVYxMzRXE
	ie3lrW3i+AQYof/HkGvgRoW42nMgu3fuARUURO7MZ6ZSVh3x4KaDOrhUI3TrTmBZqwriftpI6Zs
	7dRxCccn4r4AbYoSd/e1oQm4pweH19axrXurU4xB9iQV4chvwUhOzPrU+VfbGTQPt6h/aMqVjY3
	n5uF6XdgI+wRaU6RvH6k64in8sVEUIdkGi5SKnzK3o405FBslplVefELrUZPvIZMxNBHw7ipEMg
	uoOmGnxa6JKH2AextPRTPfXOoMX2Utabm/YkJLPE79SKpAMNz//sHqeLK5bXhTwvnY1O//KC+WA
	==
X-Received: by 2002:a05:620a:838a:b0:943:e946:8c6d with SMTP id af79cd13be357-949bab6e501mr2412050085a.72.1795534244602;
        Tue, 24 Nov 2026 07:30:44 -0800 (PST)
Received: from nickserv.taila7d40.ts.net ([72.225.160.232])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949caf98d34sm852700485a.2.2026.11.24.07.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:30:44 -0800 (PST)
From: Nick Terrell <nickrterrell@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Nick Terrell <terrelln@fb.com>,
	Nick Terrell <nickrterrell@gmail.com>,
	Kernel Team <Kernel-team@fb.com>,
	David Sterba <dsterba@suse.com>
Subject: [PATCH v2] zstd: decompress: prevent stale literal leaks after output buffer wraps
Date: Tue, 24 Nov 2026 07:49:33 -0800
Message-ID: <20261124154933.108631-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.48.1
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

From: Nick Terrell <terrelln@fb.com>

After the streaming output buffer wraps, the external dictionary and
current prefix must share the frame history window. Retaining expired
history can allow malformed offsets to expose uninitialized bytes or
literals from earlier decompressions on the same context.

Once a full window has been decoded, limit external history to the
portion not occupied by the current prefix. Apply this bound before
subsequent blocks even when output remains contiguous. Also zero the
wildcopy padding after decoder-owned literals, including both parts of a
split literal buffer, so permitted over-reads only see initialized bytes.

This is a port of upstream zstd commit 0c9d297531a9 ("decompress:
prevent stale literal leaks after output buffer wraps").

Link: https://github.com/meta/zstd/commit/0c9d297531a9f15a717ff24604afc0843b3b1427

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 lib/zstd/decompress/zstd_decompress_block.c | 35 +++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/zstd/decompress/zstd_decompress_block.c b/lib/zstd/decompress/zstd_decompress_block.c
index 710eb0ffd5a3..96d9bc67e3a4 100644
--- a/lib/zstd/decompress/zstd_decompress_block.c
+++ b/lib/zstd/decompress/zstd_decompress_block.c
@@ -124,6 +124,25 @@ static void ZSTD_allocateLiteralsBuffer(ZSTD_DCtx* dctx, void* const dst, const
     }
 }
 
+/*
+ * Zeros the bytes directly after the decompressed literals so that over-reads
+ * only read zeros, rather than potentially uninitialized memory, or bytes from
+ * prior decompressions.
+ */
+static void ZSTD_zeroLiteralsBufferPadding(ZSTD_DCtx* dctx, size_t litSize)
+{
+    if (dctx->litBufferLocation == ZSTD_split) {
+        BYTE* const litBufferEnd = dctx->litBuffer + litSize - ZSTD_LITBUFFEREXTRASIZE;
+        assert(litBufferEnd == dctx->litBufferEnd);
+        ZSTD_memset(litBufferEnd, 0, WILDCOPY_OVERLENGTH);
+        ZSTD_memset(dctx->litExtraBuffer + ZSTD_LITBUFFEREXTRASIZE, 0, WILDCOPY_OVERLENGTH);
+    } else {
+        BYTE* const litBufferEnd = dctx->litBuffer + litSize;
+        assert(litBufferEnd == dctx->litBufferEnd);
+        ZSTD_memset(litBufferEnd, 0, WILDCOPY_OVERLENGTH);
+    }
+}
+
 /*! ZSTD_decodeLiteralsBlock() :
  * Where it is possible to do so without being stomped by the output during decompression, the literals block will be stored
  * in the dstBuffer.  If there is room to do so, it will be stored in full in the excess dst space after where the current
@@ -241,6 +260,7 @@ static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
 
                 RETURN_ERROR_IF(HUF_isError(hufSuccess), corruption_detected, "");
 
+                ZSTD_zeroLiteralsBufferPadding(dctx, litSize);
                 dctx->litPtr = dctx->litBuffer;
                 dctx->litSize = litSize;
                 dctx->litEntropy = 1;
@@ -284,6 +304,7 @@ static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
                     {
                         ZSTD_memcpy(dctx->litBuffer, istart + lhSize, litSize);
                     }
+                    ZSTD_zeroLiteralsBufferPadding(dctx, litSize);
                     dctx->litPtr = dctx->litBuffer;
                     dctx->litSize = litSize;
                     return lhSize+litSize;
@@ -330,6 +351,7 @@ static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
                 {
                     ZSTD_memset(dctx->litBuffer, istart[lhSize], litSize);
                 }
+                ZSTD_zeroLiteralsBufferPadding(dctx, litSize);
                 dctx->litPtr = dctx->litBuffer;
                 dctx->litSize = litSize;
                 return lhSize+1;
@@ -2184,6 +2206,19 @@ void ZSTD_checkContinuity(ZSTD_DCtx* dctx, const void* dst, size_t dstSize)
         dctx->prefixStart = dst;
         dctx->previousDstEnd = dst;
     }
+    /* The external dictionary and current prefix share the frame window.
+     * As the prefix grows after a wrap, retaining a full external window
+     * could let corrupt offsets alias the destination and expose stale literals.
+     * decodedSize > 0 ensures the frame header has initialized windowSize.
+     * Only kicks in after decoding windowSize bytes because the entire dictionary is
+     * valid as long as a single byte of the dictionary is in the window.
+     */
+    if (dstSize > 0 && dctx->isFrameDecompression && dctx->decodedSize > 0 && dctx->decodedSize >= dctx->fParams.windowSize) {
+        size_t const prefixSize = (size_t)((const char*)dctx->previousDstEnd - (const char*)dctx->prefixStart);
+        size_t const extDictSize = (size_t)((const char*)dctx->prefixStart - (const char*)dctx->virtualStart);
+        U64 const maxExtDictSize = prefixSize < dctx->fParams.windowSize ? dctx->fParams.windowSize - prefixSize : 0;
+        dctx->virtualStart = (const char*)dctx->prefixStart - (size_t)MIN((U64)extDictSize, maxExtDictSize);
+    }
 }
 
 
-- 
2.48.1

