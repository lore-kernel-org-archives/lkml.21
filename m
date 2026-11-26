Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672564;
	b=yevOLkoYjg+XKfRLPFJr1Ld0oO2iU6RHfwAO+nVTB62Bq/3fm2nRZdWVc4PN65iaOH3g
	 qs5+LSXCfUEN9SZFCDBqRD3trAyYwZbSmur4ySQ96PWMZ4c0/AP+iO600t69KkIYqlZ1o
	 vcoj+YpO2fovdFseqIuhtqNroOoEIl2YoLu49B17NWuNZ7POsq6Rb5WKKRXkhpm9mS6d6
	 g0BNDMm7mREfA2+zRrnq4IarLlOvBKi0A8v5qA7vXgVwU6/JVii2Kpy8KkfJ8j52VENII
	 XkY9EgRmC8SDUqv5dsjNgAriOsV9nwN+S2LarTbU748B+4Z17WJSKKFYTxI/HPgDtbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f9W/X3ZSGPrXignHGoNXmPj3EgNkTGQgkxY9HizUk10=;
	b=noHWDxCy4E+HEDbdDzfPytP3v3B/Kd9W2IC/uFbxG9LzU6O9X8AIXk584YxKbgQEDD8l
	 IRa5pC2HhI63Sb8fgVjA1E4ukeXS0P8fna36ZNsEZHIBliI+Z9P7IUbaRIIonAsE/IiFS
	 mMPvjEVTrZcsyL2N59+FUAWaLe4bBcYXMztVaLfRhfGzNs6Aa7nanLaNLTCWfJpJtBZTu
	 ya36mXgd/l6z6q3hIMsF7QrAQZVyvzQWkjsioq1WmE/vCsF2yuiF3xYrK2KbOtQJiDLUN
	 jZWju+zf7GuGuIrLEshQoHc1fjSz+INde3p7HXEgOcT0mDFilDLI+WUCu4bNlt9xCFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FG7buiis;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57476606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57476606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FG7buiis
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3980442a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672564; x=1796277364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9W/X3ZSGPrXignHGoNXmPj3EgNkTGQgkxY9HizUk10=;
        b=FG7buiisxYEulSoe5M2X3xjYextDw1OYO1+X5KmGszrbI37LvW5D07w8n+bLsGW7gt
         4rlNqEcBrnPBma4oBOENKENfKWv7oxElu9Aau0onjsMPsqVcRqldA6FeeyfZRw754GCR
         OcolyDEpVjr57AAjMJdUqPT4SVbiSRIX8xuURu3O0Ju0/YWnO/SX31fVtpFCCzyaxWLf
         DfKEQ8BFCK0AdpsccnD7cfiCkEtl961oRBW4voZ21WPK+PAc57f3mZufvcRjJoI1Pp0Z
         f0Tl3iQhOIc4JwYJA7gQEKa97J08fTdlnvpvHVZLPbn32wJcoP7h4nrqaofWdfmrq/ks
         e1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672564; x=1796277364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9W/X3ZSGPrXignHGoNXmPj3EgNkTGQgkxY9HizUk10=;
        b=N4YbVyGdvXa+YEV1WSzt5a/4iqRBaId5PifXtRIXKm5bo+dZpHjrdgD3e5YAS/dYFJ
         p/ne8Q1xK69odorRL1flsgWSVq6IbTED0BxajNEvTtLYGzRzfVMCHkDuZEbVK1oL79FJ
         jd1gFSrerWY8c4SkawKU00tlQpTU4M+WFoU8h0DmumpUJCbdvJcrQL1cfIpdhWsdhhaq
         nPPpeDsQzftHjb0EtUwUF+pBFHTsL9piZdY5FizXWHjlUTWdK4H2WV+FgixTO9CIkIkA
         ix2JxRuefpizFOXRKgG88OlT118ukvgCDk7KO6O/94857fHr+d8pQAdeyTgTfrcaLDRG
         ux/Q==
X-Forwarded-Encrypted: i=1; AL+hErFn/3CojPHaroh/seEmiDzYFWAADgdKN9Xr+AyZoiFKKP/jS3ftI7ziHJu0solZ6KhUj4E8VNXYKNxVmfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nHn6RRU0kCItWRrANXbBe02a5EBYWw9yKdhnY61pSDqnF2O+1
	CbZjuPz6rw8e6lMIPl2LwKtDNvKE6OGjgZQN5GCjK1iI8gEgCLa8cyf+0ZB6NAxS
X-Gm-Gg: AZFdTZfDXNW4UMDRJaOWVZFKu3ijjsBAbh5Tgq5tS8XBcck7K0X4Qp9DTSqfZg8gien
	HlLxjmEH6oZKdaxNK2Ga6xLhkTbEaYbgkizs9C/p4jje1Jcs+DY/eW5eoKeF9FMixHPsz5KAKV3
	8bH+49dA2DZpnbcycdBvuoVjTJgDsBrUdI2PJLCBcgCSydw8OTTxRpVrOb1SJAxeI5PwpYnhkJJ
	TuPA+xOf2kk7aZJGZOHZ1SBBlA9MEq/9dDA8ltgU23fXgXL0hwyqRKK431zNgwtsYR6/Y/qtdXr
	8r0mlHe20Haxf7Ib5IEQ5/4Mq510avcfhTwxgfvjRvMhyH9onvcgWLj99+oyoy1M2mnmgwdfInN
	M2BE/YpyefXG77Cr5AN7+gEmI7ImtXbjVcZe/NAw+gr0oSA7n1rUXxLBT/D/Zu1KoBVGtqIA2GT
	conn+JHAVraCPDj/rIrVWHH9HJXA9GmqmukI5s2Q/OvtHRFSrmi3GOFNDYGqfxtW5rFBcCorbPd
	7XnCLgZz3jJovzP1OJC0Qa1JCO6E55AJM4FPkyR+oiVV/wvuekqftVWBePu71+gPe3jHDnWQWTy
	t4PQzEWsfHnQvTFArAnRc/0A9B3v6fkSY4Wq2i0iZqgV0EJ24w==
X-Received: by 2002:a17:90b:3843:b0:3b5:29e:11b3 with SMTP id 98e67ed59e1d1-3b5029e144emr2879706a91.61.1795672563597;
        Wed, 25 Nov 2026 21:56:03 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm30760213a91.11.2026.11.25.21.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:56:03 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: anirudh.venkataramanan@intel.com,
	mark.d.rustad@intel.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] crypto: tcrypt: avoid 32-bit overflow in throughput calculation
Date: Wed, 25 Nov 2026 23:56:00 -0600
Message-ID: <20261126055600.23172-1-artem122novak@gmail.com>
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

Cast bcount to u64 before multiplying by blen to prevent 32-bit
overflow when calculating throughput on 32-bit architectures.

Fixes: fdaeb224e2bf ("crypto: tcrypt - Use pr_cont to print test results")
Fixes: 3e3dc25fe7d5 ("crypto: Resolve shadow warnings")

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 crypto/tcrypt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
index e6834bdde9b9..1e6132045c24 100644
--- a/crypto/tcrypt.c
+++ b/crypto/tcrypt.c
@@ -28,6 +28,7 @@
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/scatterlist.h>
@@ -734,6 +735,7 @@ static int test_ahash_jiffies_digest(struct tcrypt_ahash_request *treq,
 {
 	struct ahash_request *req = treq->req;
 	unsigned long start, end;
+	u64 bytes;
 	int bcount;
 	int ret;
 
@@ -744,8 +746,9 @@ static int test_ahash_jiffies_digest(struct tcrypt_ahash_request *treq,
 			return ret;
 	}
 
-	pr_cont("%6u opers/sec, %9lu bytes/sec\n",
-		bcount / secs, ((long)bcount * blen) / secs);
+	bytes = div_u64((u64)bcount * blen, secs);
+	pr_cont("%6u opers/sec, %9llu bytes/sec\n",
+		bcount / secs, (unsigned long long)bytes);
 
 	return 0;
 }
@@ -755,6 +758,7 @@ static int test_ahash_jiffies(struct tcrypt_ahash_request *treq, int blen,
 {
 	struct ahash_request *req = treq->req;
 	unsigned long start, end;
+	u64 bytes;
 	int bcount, pcount;
 	int ret;
 
@@ -777,8 +781,9 @@ static int test_ahash_jiffies(struct tcrypt_ahash_request *treq, int blen,
 			return ret;
 	}
 
-	pr_cont("%6u opers/sec, %9lu bytes/sec\n",
-		bcount / secs, ((long)bcount * blen) / secs);
+	bytes = div_u64((u64)bcount * blen, secs);
+	pr_cont("%6u opers/sec, %9llu bytes/sec\n",
+		bcount / secs, (unsigned long long)bytes);
 
 	return 0;
 }
-- 
2.56.1

