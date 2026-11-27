Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767071;
	b=bqcqz5ougC/NJmN+/ogxs96tXqGyQu7SBz9Xqc4ICR5WogH4JePh45K7FJ7IkDe6LTzy
	 YYUe4snA8i7t69tAkogarG/OHApyvUvqn2rJTGUMPDfssmC0RYoThPLaMY7ixwk/40b1w
	 bxSV6B4gsVT4pIwQ6G5+RYHvULupVFFFgDzaDWh2WBMKM0uL5s0vIIO1KlQrRLvoFxMhD
	 lTTMIXTFH/vW7rZZdc4HmfT8KDdXwxM9pGGV7sjgEjBSyWGLvw9H6DoRCHtC4PlUIcMpa
	 9ttWR3M5u/0f9c7W7dLHcqkh3GsHNjOMLtz0CmyQsdC7axP1JDe3IbplmDicEW3zTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vJH/+bwAYrknt5ggzmxUwQOnnQMN1PCmldtA01IpSCc=;
	b=FTl5u596zhyxfUDyoT+24C7WCMYbqqVEnNpUb8X7BP3H33nkJAdobm0v+G9tmxidc+mC
	 1UaclfNTvETVYZmibNzTx6er4kV6WpU9wZDnkfWeodBiA+OFtmkbuCgA3crh+mS5cXEtl
	 cx1qR7rv7cwoeI5lztrdBQTSkJFOeCi5F2idXmHw9Nwk4hCDwZIJ8+PWq7Ym0ePQesv2m
	 /fev/ZGJv3zm/YZWr3c45aiOS9YVepc5i+FKzTIo/bwC2w8OJX7dfz0R3nchlRsyYpccl
	 8U6Ua7VMJEPYROwfzT72yVg+pQY3IZfJsemcobwot8B9UCbxrqvpKB/Y83RwfjsEQaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFxSjTVc;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D6D606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D6D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFxSjTVc
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38431138772so10139289eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795767070; x=1796371870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJH/+bwAYrknt5ggzmxUwQOnnQMN1PCmldtA01IpSCc=;
        b=rFxSjTVcod12OYqSxSq7QF8z194ZntGPxmCYkbvFrH5o9bkYBXmtf7WiElTlbZPHZW
         AR2ItULjFzlrAq9ZbTzRNvdi/B+dfo8i0ZJ5LLFP8XL0cUS+WDwniwjpKMJKrcMvz4WQ
         GmkL3Im9e+ctjbRss9UAKMBaOJ4eIVuKsO6+RtWQwiKBxeaof3z5oGyLBM5TQ5CABISU
         U0Ywu8lCHqGxjBHqtiQt+3s+3Vnmtx79Gkf80DVL+UkBnawvsefRpAiig8xgmV/VnCMM
         /EmgHt+3X6o1lqLWfGTmTsDGzGzRyrhzxL/GF7YY0ezZW9KnNGrSraVLIgaWH8REy2gO
         cyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795767070; x=1796371870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJH/+bwAYrknt5ggzmxUwQOnnQMN1PCmldtA01IpSCc=;
        b=FylD9XCUChFQ9IuYZ0paT4z3uCv2A0GuGypHPbw+XiuqIjoeyRF69AQNUaIevrIzEn
         FeEGGQ0y0+rPhahr4LHoEisA/rSx/TbCjosdj4/8yadtuR2dSBWi0mg2Zmn7QoS37pUO
         OIrMiOkMP7+vNsKHVDV27e953PXItBFOZVHL5cTvAr8CUYgPVQmSQ8+iQJSddXwqhZZM
         Ey1DggE29al6I9p+qZWFe6ztYRUveIb//WYS8CVa3dhE3q47lrb5w09BXdJJGAy3ofJD
         iyltLgUL4MAdCUhgMrR3kGVMGVO93dKOO0PbKtzgmncRh9JrkjGIkXOHMKSnouW8T7iw
         CF/g==
X-Forwarded-Encrypted: i=1; AL+hErGD/0UPzbqwkP50nr7/6bgVphMv93OzT6QdRGkNE+xkNRyj3j8FE9B8sAPVnIF4ozXs078Lv3vJaPFHVtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9neFQz0vfKjh/ZhBpSjGy9W7u15QKfCVYg1Iqcj4DxDYk2VSvS
	NNNA7DEiKJNWWZIbVk0QHV6+8we3OgjAOq66o8i53MG/eUd0Kn+WZa+8
X-Gm-Gg: AZFdTZdzkZXkIOdmGdCeO9BGaFc65LWIBcMbshxsPDZEaC2hkt7WYH411zEwrCpvU1e
	ULLIZqKEM3Y8zdI8IgkBBMrK/x1WirhOKOS3P6vACTwY9ZwB+QWr6DD12VTacS2kg7JMXI24Wns
	gfMZHA2UeRsF64eIype4UYmvzRT25Dij7j0N3ZHdxYIXQHzUhRYt9yi0G65M5ohasC7HuN1nXyG
	huwwb5RA18R3Ti3NV4j8tNBxUTDcK7y1JosdQYUEv7Am201UXUAl8YKOeSuDMu7ILD/PSrll9mZ
	jSe9vNgFv/lbZnECASucC7RTt8I9snmOEWvDOnmW6MvJYt7141zcc5l3p/zfQo2qV0GBrYcYMF8
	yjp/vJg8Xi5kM73KfvEEWCCFqNmQXjRTzxrStFwcE0y0MsBFey7lNiVFq8hy3QTjlrOzlNoXb7U
	LC4u74eKQ5bPuJPyl8Lo2aXU5vSasux3BKguLbME0hxZXqmeml2H8ukheJsEFxzm2DYro8r7UC+
	qYbvryRkF58AXoEHDhD+qlTnMLebEk3Az8ka48zNcUxe1w1U+Rn6sLMeNrM1jPzQCl3NvhLkFUW
	S0HUzvC9bO0Js61kL0FDQL4WdGf+/g==
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr35349467eec.21.1795767070240;
        Fri, 27 Nov 2026 00:11:10 -0800 (PST)
Received: from fedora ([2401:4900:8898:76e7:b41a:e5d0:b45:7cf9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm39746815eec.0.2026.11.27.00.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:11:09 -0800 (PST)
From: Vedant Dave <vedantdave354@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vedant Dave <vedantdave354@gmail.com>
Subject: [PATCH] lib/crc: Fix kernel-doc for crc32init_le_generic
Date: Fri, 27 Nov 2026 13:40:01 +0530
Message-ID: <20261127081001.327898-1-vedantdave354@gmail.com>
X-Mailer: git-send-email 2.56.1
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

kernel-doc -none -Wall lib/crc/gen_crc32table.c reports:

  function parameter 'polynomial' not described in 'crc32init_le_generic'
  function parameter 'tab' not described in 'crc32init_le_generic'
  expecting prototype for crc32init_le(). Prototype was for
  crc32init_le_generic() instead

The kernel-doc comment is named crc32init_le() but sits above
crc32init_le_generic(), and it does not describe the @polynomial and
@tab parameters. Rename the comment to match the function and
document both parameters.

Comment-only change with no functional difference. After the change,
kernel-doc reports no warnings for this file.

An AI coding assistant helped draft this change. I reviewed it and
understand it.

Signed-off-by: Vedant Dave <vedantdave354@gmail.com>
---
 lib/crc/gen_crc32table.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/crc/gen_crc32table.c b/lib/crc/gen_crc32table.c
index 9a7f31658..b9ec94a68 100644
--- a/lib/crc/gen_crc32table.c
+++ b/lib/crc/gen_crc32table.c
@@ -9,7 +9,9 @@ static uint32_t crc32table_be[256];
 static uint32_t crc32ctable_le[256];
 
 /**
- * crc32init_le() - allocate and initialize LE table data
+ * crc32init_le_generic() - allocate and initialize LE table data
+ * @polynomial: CRC polynomial to use
+ * @tab: 256-entry table to fill
  *
  * crc is the crc of the byte i; other entries are filled in based on the
  * fact that crctable[i^j] = crctable[i] ^ crctable[j].
-- 
2.56.1

