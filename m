Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737630;
	b=MlzQR63Ki27H7qmzjQpQipteZ3rS4Heelsgoijmy2o1Sx7gVykKlmctzcNV4oEhpEQ0y
	 ojrDxFYtDSuhmAPLzFxXclaW2EbaRelnrU62winv/MvTQHuw65/qxoRBDQR9hXae0JuWN
	 320GnFVtqLR4xpUn0N0rxjDmytLfDw6JDo1jzwL+Rz6EkPqq2JvGUR/en+6zCkLVQL5uV
	 BvbGre33NfuaXl01xw6dq8+FZFKQJ3BRpWM5zDzJgz+sIN6/4RvmieEWc0E/8cO4CCca5
	 ADQMrXc3j2I5iMohFymWibpNAuOEJ7cLKEog2EYN26klC1nsXFMrawMCTiYxH3M3kcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BeaediEPiyvNCVsEZncQlv8H37LBayA0CIHeGsXXEqs=;
	b=1vE7dz8Hht0Y+LvojsgX9c+1q0f+WTID+HS7ifr5RoHqWlblY2bp0BR1fupNSq2kzNRY
	 yjKfbYHcKgtZgI341+dvE8MGApTGPxCbtv6PuZt9w5Sg8eIHjCxiFJ+JJCKi2XGu0w2ID
	 T2u1COgaQD5AmKGQn853zulpdkxVfL+761wJmnsb7rzz1keJe6RFeAMu6vIR+8qFu9dlL
	 a8Uilai/DDv+1nbsziaSrGQ1AjIXPSEqBNPvCs4dOk2ieBMBPEfPg3limXRxtud12As5R
	 V3uqEQbH1c9o4/9Rf42bZ3siRiRFB+YT2dbfDiA8TiWp0tO1YK/w+FhUxOLxogeAW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieiPBByc;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFBC606A685
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFBC606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieiPBByc
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490f38e9688so5242245f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737628; x=1796342428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeaediEPiyvNCVsEZncQlv8H37LBayA0CIHeGsXXEqs=;
        b=ieiPBBycSaIialON0r3egXgkOds8V+lp3Rx2UO+1Y0rc9nyNj3E8dmAyRMl2/P9BD+
         PFavVZZmNjPcy7UAGi2wzMcobZ2cJAlGDv6z2NcQ2h/93ltnk/WP52gnS4fQqtwyBm51
         JqSI9cstk3F74SB1inEcLmKqWtQ5P3Pynl7ma6L4ZLchz00VchONifCfcSvxYRGEuDVt
         MTYR2mBKPkbYTv3mB1WR8QnfVdLFNnmSdLxkcK9nDw/rVstI0vvaFQlTTXWkrTlfl1T4
         NXGMmYwxxS2+y2mrp9fs6RC0GPtI4QyfsZGg4gMlis+dVpm+L+R/pcwBgk4EGuKQ3HbA
         82Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737628; x=1796342428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeaediEPiyvNCVsEZncQlv8H37LBayA0CIHeGsXXEqs=;
        b=ELkb83+7FfnlaksvKji0Njz/ltkGW6z8pbT0wEZSzph1ZwRIAIlx2o2Ouxx7SdlFn9
         uRgcFAtEm/Bh7WfEWXY6bbugZGEWUGtdYleI7wjHDPLfiF4IJyWekqrSekD9HddwhNdk
         c0nT17JIrRhpzcJG8smz+qxwLSI/q4mage2weTb8RMeyz1D4gtDfZ0oemThgbkpadm2h
         UVogCqWNbxdVq7Bt2Mb3sEgyoLTz1bw9MMNkiTREAHBP5EQbFp95VwJLIfhH/CN6/tEF
         MZ8qy9wQNwn+qWCQHiC6ZabOAGmXB7gtCOZhotT/X9sNRcmQFpeuseeXhHCO5Glic4a2
         v8og==
X-Forwarded-Encrypted: i=1; AL+hErEgAgr+5sNdLI0ppyvfb4rvpyOxCgbQg3eUBf+08M5Yk79NVq32NXHMPMqSdf/CLmCZ1KhrnVpvus2Ccjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QP0apbikrU2zjDOtnuYY53cu4CXKDTE7XU07wbtE4wqxRC2vx
	ijhs82zK2AGxsMmAfnFUr/2qdcelr5FcjvNfggNwcoNNwSTIdqWtLK8D
X-Gm-Gg: AZFdTZefQf6VFb5fLueG+HckdZSOl0pCw8sKOsKtxwZP4wNLhdcvGI4WBxAaqACq3zB
	y0OTq6b8k1Mbz2XyN+m5Uhqpl4uHr6EtajU3AgAAdbga2jF0FIrmpyZiFSz0B+JiAFaFjqEqU6x
	8aSQY7Cij8HE1eJ8cz/eqyTwzuC3X9udHNGz89agTuyih22c8oftNX9EsTzgbo0Q2nPFtjnbw16
	0ATCU6jDZJ+RJhBVQXiDsObo9/4rw96qE5sOuahTUSXYeAGx2SCjfgO7jhVlaNf67xqfTA3EaZd
	ssP2wfJR497ti1dD5z4zxP0T8SnNVjq/s0bmDIRXc8gnukoLv4jigbedpFR+IlXJ/NOZQLUWi+V
	BSF0lRBIS2DO07Cu/AhqqABuPzolUVXpQK+Xy80GHoHz2tLPciGgPaDlgJoUaKLnQn7gTIA2WPP
	7RP6wjm+BPv8D8RcO3JGM1rxYibT07Un4xyraCCDkVweuySZDTx3hx50ZW9HaiVGS/8PX77it33
	yQ61OH6ww4YCmzcXP2P+tsvY0+U4UCHLtANZgIEx0UaETe80IP0Z3orqT8PPfjNVPKn648bVGuZ
	ingMLjUlvuej8Sa+CYf/ofSy4aPoI5NF+bjawp0lnjbhJGAtqZfnfuFjtjbASx8voaSs+PYlO1g
	xKKxkISA/Fl4q5TuntA==
X-Received: by 2002:adf:e00e:0:10b0:4bb:c87d:62bd with SMTP id ffacd0b85a97d-4bbc87d6304mr6603804f8f.23.1795737628291;
        Thu, 26 Nov 2026 16:00:28 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:27 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: samitolvanen@google.com,
	torvalds@linux-foundation.org,
	ljs@kernel.org,
	david.laight.linux@gmail.com,
	sashal@kernel.org,
	lzsx618@gmail.com,
	zuoan.penguin@gmail.com,
	petr.pavlu@suse.com,
	jani.nikula@intel.com,
	xur@google.com,
	sidnayyar@google.com,
	robertusdchris@gmail.com,
	acourbot@nvidia.com,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 2/5] scripts: restore support for 64-bit pointers in host hash functions
Date: Fri, 27 Nov 2026 00:00:12 +0000
Message-ID: <20261127000015.3662267-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127000015.3662267-1-julianbraha@gmail.com>
References: <20261127000015.3662267-1-julianbraha@gmail.com>
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

This partially reverts commit f93d6bfbd2f7 ("kconfig: use hash table to
reuse expressions").

When the kernel's hash headers were copied over for host usage, hash_ptr()
was also simplified to remove the bit count parameter, with only the "fast
32bit" path in use.

With the bit count parameter restored, let's restore support for passing a
64-bit pointer to hash_ptr(), rather than truncating to 32 bits.

Like other headers in tools/, use __SIZEOF_LONG__ to check the host word
size, as opposed to the in-kernel BITS_PER_LONG.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/include/hash.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/include/hash.h b/scripts/include/hash.h
index ae0d3fc8d470..08e901b8a43d 100644
--- a/scripts/include/hash.h
+++ b/scripts/include/hash.h
@@ -12,17 +12,29 @@ static inline unsigned int hash_str(const char *s)
 	return hash;
 }
 
+#if __SIZEOF_LONG__ == 4
+#define hash_long(val, bits) hash_32(val, bits)
+#else
+#define hash_long(val, bits) hash_64(val, bits)
+#endif
+
 /* simplified version of functions from include/linux/hash.h */
 #define GOLDEN_RATIO_32 0x61C88647
+#define GOLDEN_RATIO_64 0x61C8864680B583EBull
 
 static inline unsigned int hash_32(unsigned int val, unsigned int bits)
 {
 	return bits ? (val * GOLDEN_RATIO_32) >> (32 - bits) : 0;
 }
 
+static inline unsigned int hash_64(unsigned long long val, unsigned int bits)
+{
+	return bits ? (val * GOLDEN_RATIO_64) >> (64 - bits) : 0;
+}
+
 static inline unsigned int hash_ptr(const void *ptr, unsigned int bits)
 {
-	return hash_32((unsigned int)(unsigned long)ptr, bits);
+	return hash_long((unsigned long)ptr, bits);
 }
 
 #endif /* HASH_H */
-- 
2.56.0

