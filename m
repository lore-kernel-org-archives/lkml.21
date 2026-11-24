Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503422;
	b=QMzzNbri/lgIV7I5c2g+2X60VbBCra4IljcRO2F5P6cvi6WFswV8jtjtUa2VJhAqCMsW
	 PGEGmr6XKlZTV32hsSYhPELUI9IaNYR7bYVdbfy9k4j7e/2EkcvE9eSzV7bPRHpTtZ44H
	 Xf/ZwQx3q5z9L8eMcEE0roSwFlFGGoK03bQGez6rr70P78JUMiiT1nIEIdQuSBpTjlJEY
	 ohWuJ+5ZIJHV9LlRkRFRVlpdKBG7xW4+Doll8eP7XDJheZsMKM9lbFE6c9P9zoDIEv16S
	 UIqu2sGTTA28E2hTmjT0rjhaQJ3uEwbdymPeGF6ffsQSRwCHtaqoXIELrdXP0MEFGRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=;
	b=KmiL8kcWOXHGxkpyuojaeXh8qLPoPOTMLB9MEa84RrHuargrptuUdqMVfmt3cMAKVzw4
	 ZPdBSpvFViSyvt1p8MkHVaGV6lQ6/uesAwHhYBXF4hDcQsl0YKdsq8oLR6nUGT6WkuKBQ
	 VBH3g9Kl2nOQnjHTy7SgiDcBuCBn0YSi81lwbHE5zF2jFZEpsw4ZhCf6TpqM2ht27kNcm
	 mhtw7KgZaNDer+nl+9igVhgihSLhHnXVvh090WiXLZeS7tBbvJiyFaj8DVS892bC7mIzC
	 H3wmaMbXgRJMcjTwBfThEQGFBka2SRIBNggRjp+AIdDW2FlOkUBE4NwIb2PPlqsViRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2fzgBTQ;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A31606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2fzgBTQ
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04e3bf46dso29106475ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503422; x=1796108222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=;
        b=X2fzgBTQBUUgafJfw6TglJ7HoYs5NAlzBMgEkbAAsUlVviA1rfcI7g0YJqHmp/jVBp
         4hrGAgKgdI1P4IUxJ+zDW8VHGaoP6Ee5+J2fW9fuDfVgqju2lBXRkdLdGuOGfjmyUw7i
         f+AykNCdrgxazxPBkaG9Ug4vUdntIxVVCgRjka6HoE2t9c2nYQ+83xNltZOkJx0mouJ6
         OJ1CEjAPCwaZchW3dpVhHgDXLLEb3CloczmxTO6qLZBP9IrKO+ftc9hLNXFYhMMjPu+c
         RlKMnK5/3T91nBCp5sCUudIPMP0pf4bQGLRDcRj5E1F5udIZqViM8H4JJ514Dz+PSWmc
         AWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503422; x=1796108222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=;
        b=TWvy+EAoFImaJf3QEz8rF5s0U5MQQ9ySk4f17m9FwMoNWYghviUN76DtKqqNszkOM4
         irGUHEKG16A1s4FbUMtPZWtm1JnJBge6QecVvQii1HoohinmiQYdAeeYJcxQuTiUuQEs
         TaQdbSAV/MLefd9TZrov8Xim+AdEL5+fWTZZm2gZapzU32LRShk8gYu5EQ4q3ndnG7R2
         VqhKNg8B1htFUVgipB01i43z1WtE+Jq+eOiZj/q8yO4blG7d+7bkXlTtf5CgiUjQ/NCq
         1oyZfUNc1xTRXFn4veuCHPLADZRyHVSFjg/3OjeVnOnqnGEQes4fjg+GAVmbivGnr2Ot
         XRUA==
X-Forwarded-Encrypted: i=1; AL+hErFBwGbZoOQou751lEsnCw0UYl/l3QO+sjHIdhvAGB+n1KQT2SWsuOB2Ai454H4DmpedF7nwxJEP/icU5G0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LBJumkEYYGg2OacHQoCTzJCEb578vRENsxBEqMWPPbkud37Gd
	btdwugC7WpHetTG2/Dbe+JpB0YQLwjy2zA2hRlWBwDpjFLzUG9iXQlci
X-Gm-Gg: AZFdTZdPSDJ2RfqvLD3YAzr28e8zeg5PT6XGAZJ2vyg7DURplqeu98vzfBgM/Ufb1jh
	f93P8R80e6whWtB9RiVC4VOOc3fPQZZLrxu3HtWXY4c2sE85O4fwi6jj5lpIvIZVtI0swuAmu+3
	RTnipVUBwClXdkabDenmKBWjBZvJ4XCueWlz8JYr7XAd+6wCeTjuC57PAjX1jjIUx1GwqzDtjEz
	52PltiK0Tf4s2PokFUMg/POt0+3Z/tzZLsqIFkt+twMgra5JnvbWvmejwOJ0y/EMA7BScJ47l0i
	i2FH34l8wHDunI5td9rwa3O8Z3eZyOzS5/5+wxsT1PQdGsJqB+HOMCr28h9co/2UBo1ATkCDX/L
	0H4ThEu+PXheHW7I0jYxME3YvIKFSufkybdRoO7DLuIglGYDapm7Dd7mclk3CgcFQE0yvs3v7L/
	4NOMnSK+nsP4GYVZgVnG0AZXZw1MupQ7YuC7SSdbX1G2swz7isjWd1nf2O72HYpZoXmCM5YNS6v
	kLRNwgzIH/xvrV9gyz7eCIGPP3nHr7C/bFqnRgMl/IxHfHcknCARthIPvM9g2T9CpujpUG4eMqY
	8u3W+z5+426xtdVFhOq2MjEooZ52aCiUCn72AKHiLAkbPmFfh2ldTE4=
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr142785705ad.0.1795503421589;
        Mon, 23 Nov 2026 22:57:01 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:01 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 1/2] arm64: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:49 +0800
Message-Id: <20261124065650.1968930-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
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

The shared cmd_lz4 rule passes -l to the lz4 tool, producing the
legacy LZ4 format (magic 0x184C2102).  That is the format understood
by the kernel's own decompressor, lib/decompress_unlz4, whose users
are the self-extracting images of other architectures (all of which
compress their payloads with the *_with_size variants) and the
lz4-compressed initramfs.  An arm64 boot image is not consumed by the
kernel itself though: it is decompressed by the bootloader.

U-Boot, which supports booting compressed arm64 kernels with 'booti'
(boot/image.c image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts
the standard LZ4 frame (magic 0x184D2204) and returns
-EPROTONOSUPPORT for anything else.  Its host tooling (binman)
likewise emits standard frames.  As a result, an arm64 Image.lz4
built today cannot be decompressed by U-Boot at all.

Emit the standard LZ4 frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..19b26aa83203 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -28,8 +28,15 @@ $(obj)/Image.bz2: $(obj)/Image FORCE
 $(obj)/Image.gz: $(obj)/Image FORCE
 	+$(call if_changed,gzip)
 
+# The shared cmd_lz4 passes -l, producing the legacy LZ4 format that
+# matches the kernel's own decompressor.  Image.lz4 is decompressed by
+# the bootloader though, and U-Boot only supports the standard LZ4 frame
+# format, so use a local rule that omits -l.
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) -9 - - > $@
+
 $(obj)/Image.lz4: $(obj)/Image FORCE
-	$(call if_changed,lz4)
+	$(call if_changed,lz4_std)
 
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
-- 
2.34.1

