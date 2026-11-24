Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482614;
	b=ijp/yXirAKkqY/ljBeq650H3mDipLf4slvBp9PFK8DST3sQv1bsQ5c/Rx1UcE+AliRhw
	 xayLxGzkXStSdN4cbl1EaKxMQLIo9JvCMOVQCCFQ4SjsK6WiCU8d8X575ouEy9yCd9kRp
	 AZTIICKAjwNjdvQ2yJb1BdnV0V7AKrPMZJxIt+1O+zcmBT5Fu0//Ewzh9Wp6Vcn3yIUsY
	 VN3Z12bRMOXLtL/tmyPIX5wh/GDkslTUjAnwPZX7hVjZQgkfZjJ7qwD8VUKnYFGhAjj4c
	 XPLikhIkunwtjQYJ6k4hKup5KMUECXHvu1G7j3F/m+DhaRCmScWcDUoGGF7PO8pueWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HRU0XeLrk6Q2b316iu1H0IwK/Vua4ixlA/1cR9uFdFY=;
	b=0OjXeih9rcxLbIj8yMRjVkSn7vs8l6hl+xtc26RVB9U+x/AVuIqEOIQgvld7Nlqktma3
	 cfjBy0RiOIqz4tDd0Ykgf+VJIZVrUdsEhOKidco4zBhwPJi+kSkwl5ePeMkRgLFyOIM5P
	 i7xL8ces6yyzEBs0GNJy+PEQcbQn2feEjNmBAxF4rKRxMo97x5devyvhQFnYOc1A7mmkH
	 biFcEn3Zx18VdWzfaxj/ZOeOXKW9H45M8o5P4XSGZD+NENcqmirtRJ5PbbGupicIIHfbD
	 7kDH8A2Rd3OmAGVBEgsYejagMfDCK9SBEDqpfn2c9m1xpIOTZs7gbJdC3tZY6ejOkQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnxoDUac;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B1F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnxoDUac
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363316fa0cso43332761cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795482612; x=1796087412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRU0XeLrk6Q2b316iu1H0IwK/Vua4ixlA/1cR9uFdFY=;
        b=tnxoDUacHqQwg8KZ6+JTm2lRLHFDcm/9NEDE6reNbwh9HgxUx6g9lGI+TzmpM/1Wbh
         pVRKr/QDJu/YOPctn6NUZW10zH1L/lOQwVOxMzEBZ6VKwUMTdrCwfvEQAjhZVFNPHh7l
         Bt0lPGMMV5wzWWumQJYayKIszXL0jthvSOTH4eUAC1R2Q7B5zdl9A4kl/IdrXXO3Znk9
         hts6FuXYmn7tI1wdy+d4w2sTcMP0eMFt7xfELX7nyoPxsGQVJHpkzZaR3UnYUGA+9fZl
         JBIqQJHZ8NZwJNidxLLGENoSuHAxJoCkhtx5coPeAvri3r7L39XE0rMAKIteSmM6Zabi
         ZyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795482612; x=1796087412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRU0XeLrk6Q2b316iu1H0IwK/Vua4ixlA/1cR9uFdFY=;
        b=sRNZoAsrguCRL9Hpca6U+sZupaYKRU4H9OScqrZti5CH0SCFbDLr5OeNiyH844xm+t
         d+MvAuPh1V/lhYe3N69UMZrR4Mdc4ncSDzSWVvQwv0g4TjCDhGq5hstxgBfk/uSmHDB1
         navAY7pvU3GM2o/Z8ZjVsbhAPVD/cqHsgXMwcpQWqG+WnRzgsLmBJj8oC25tUt+Vzuov
         p4YndJBTnqUqc8VuiYJW5Cn098hhGjkCSO6mQh0ZhVtM9RUarLnR+NEK9dhmCTD1Yoki
         wjtkYsF4dTd0CIsAbvCTUnAntKBWBDVpr0pW/9vXDXPfn9U99AwvuSW1/4KUTtTOzR5T
         qrmA==
X-Gm-Message-State: APuU4Z9tGnnbrLcu7BywrjbRUX2hA0iaDVUD/UmYRzpXdzd5QQtB8qRV
	ZJWmOIuXRjlNzsLZYUjPtLFHDet3tdR1BFHnelLk5EZqKUnEyNTKwIfHwnIH7A==
X-Gm-Gg: AZFdTZeAZnFarmxBay1ZVRYJOOipKzq++jWQGxOUpSbF3NiCdeYjApllaK+x0qj+RBz
	VvOxRYo8HRCMoogdzSR/zW//Ag+x9AbhRQBMRQoUn0t3Ywlk7CXqDcm4AedTI5rJHJeLn/ahgl+
	/kDaxrsflJYH+VUHMgJ46opSjxnawneMsUYKMsjwIpdNSgiooOVIF3QBynOv5k3QTReCpt/1xEw
	cHqFFczpPbt7ylI4oq9UC+TVSATVmte5dYYQYt1QihqNEPgsqQOTHYzH7ZjNZnOQgTgGJsLkgrn
	DSvaOQjhw7UBCfIDCXHDX8hCDNwZhrGdwJvenPLcBSDvx8Cdd+Acylr9RE624V5F/dhGH259Sgt
	4kt7k+s21U2b7RatlS+76BsiCfatI9xKl/w22MCX2yWjusjjzedm/NfR4qAEPnc4lKgaU+edE1O
	yxqU5Z8ovQasUc86zdZw9iPTCZUrI4jY3ry0/ojptFV0zVO91uacBRVf4eSgYsBIGgdkC7RKV2t
	u1UTx+hloAg68/PYlyibgQ1Btf/d0rs0snK/8iv1ab4NFP8GqeKKNWwhQxW34fxBeVn45DJQlWn
	PHspatXT9cB4pftigvU7AdA+fMugxa+wAndEYqEBozirIV8TIqozwGJWW/svKgpSO/wBNEvElTC
	YszceCuxqAqh/1G/I1RyymR+FJ6DOM2oqllVIVL41Tw==
X-Received: by 2002:a05:622a:2507:b0:55d:535f:fb26 with SMTP id d75a77b69052e-55d76a2070fmr254467371cf.40.1795482612589;
        Mon, 23 Nov 2026 17:10:12 -0800 (PST)
Received: from nickserv.taila7d40.ts.net ([72.225.160.232])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm113904101cf.28.2026.11.23.17.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:10:12 -0800 (PST)
From: Nick Terrell <nickrterrell@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Nick Terrell <terrelln@fb.com>,
	Nick Terrell <nickrterrell@gmail.com>,
	Kernel Team <Kernel-team@fb.com>,
	David Sterba <dsterba@suse.com>
Subject: [PATCH] zstd: decompress: prevent stale literal leaks after output buffer wraps
Date: Mon, 23 Nov 2026 17:27:31 -0800
Message-ID: <20261124012731.87451-1-nickrterrell@gmail.com>
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
index 710eb0ffd5a3..dc7975d5b644 100644
--- a/lib/zstd/decompress/zstd_decompress_block.c
+++ b/lib/zstd/decompress/zstd_decompress_block.c
@@ -124,6 +124,25 @@ static void ZSTD_allocateLiteralsBuffer(ZSTD_DCtx* dctx, void* const dst, const
     }
 }
 
+/**
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

