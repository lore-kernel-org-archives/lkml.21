Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148364;
	b=H0+ulb3jnU2I+SdONGAdYPnKdkWI6itqQRMf0YZZK/MYiW3sq7A4j9BoDkIzpAn/GlTK
	 pLkmS6hiKyOYSNLQSgUHX8rTBtjrnIwzOhyXBhJlxP70DDCqCLPAzkez5LJFt5KG1nWlt
	 d00r0USc1QoZOjGub2RICQbqsVUd9JZZ1sqM5bsuuVNaSTitbSHYElPGy8e6gp1jM9bj+
	 9Cs77ulHQGWM48stD+T9gJNi8UHOAVP5ellYMYV4accqxpXZ1t4ZuAxwHFWaJj7CmAxVt
	 O5HxGL1bWRaHwKHAQb3NWGTUtpYiEXgzmeftHfbqndvzXP09+oq2DtvUmDf5YYNk7Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hnkDMtwt0yq1d4PAeYVaT2YC+Oe3WZGJ26Fjv0oSbVo=;
	b=Cof8whJX8VFW6JW2TLQcJyqK0MpjwHWdYL3Tb54rDNM1fVB9qozyVwPqS/6vgnc+RKj4
	 IIoAz+PSoS5diT7ZbmOSPs7kkmjKTIc9Suegu/b5/+Vq2mLpkwVTi+CR9tHkcqgIfeY5H
	 zaisPH19wX+8zdRLNtJdWIdj46MXCIzesuA9iCxg748Bb4JZbaRqQT3lFqq8aq/N1ve0n
	 M6pC2mEyLzEifSic4sNRyYYQyA4Q8If+lZf+XzHoVHMw6rap196fPY2E0FNOgBgjeVPBs
	 cWB7FrGL/Df2r5Cq3vGGQeXA404P8p3ZpM5/ouxEFClFD1ntmI6GBgv0bwG2aFy5KjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4lWuamG;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45F60A263E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB45F60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4lWuamG
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4944abeso435920c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795148363; x=1795753163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnkDMtwt0yq1d4PAeYVaT2YC+Oe3WZGJ26Fjv0oSbVo=;
        b=j4lWuamGqrp+0FhEODMdJBWWdsX6PMg1oouTQ3/954T41wnfXZFMj8i8/+vMchGMZj
         LC10Lmyy8DRFpHCxbHBKJoh6Tz/kTowRjskS9V7gSh0RUBa9Z6EsNdbsRVMpPsUmpfmb
         1vzghRzlxZgYvSYFqHQoC8gVDiMJ09sdNgLs5l2zl41cKqUSgiK0jJVhn6AEwI/bVgSm
         C2sIZasWoWIzrJJv4/052BkqzZxs3KU5izVuxLXNDke46pFtHS13cFhiCgIjt9eHwaOx
         WjVK7cbO7n6+7QCAC7ErR4wab/cUymy9hYrqh4iZRU/Nxuf4FgaYjJ6yOIhRDKcmDNxz
         jRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148363; x=1795753163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnkDMtwt0yq1d4PAeYVaT2YC+Oe3WZGJ26Fjv0oSbVo=;
        b=pd54j81wJT1vZFTsGoaMjdRZ7QaR0uoVjLjXaM+PTgU2c6jqA0X+BdXbOsijhFPF2B
         tN3dcERU/4/b/cM0OiH1/Qcu0huKyXA9UR3txi7MI6WC3rhHDfeP5u/PFRmwdsbYprFI
         dZ4NKv5AGhepSVt5n29L3oVv+x0aOORRT8S72pucE3RCU+be7U1MNxGnY43gT7gaxYM4
         +s/+A1G9XITiFU9snbxWy2+Nc5frWZO1qT2+5tmp1V37w8c3cCsWmbOm/jcEQLe5USGB
         fCMMCDD1vf5oP9omRsLxpN0HMCXRHP8CCrcWETjSPS+HLfR/siNdVyBOQw2PEew6BGT9
         Hd4A==
X-Forwarded-Encrypted: i=1; AL+hErF1EeSj9CWUR+Uh+yivpJneslHybWYR+Iq2JfssUCCDijrkrzH3Me0yb6ZjpOFZQHxhHeJSDw964f0kpxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/27Eskauv9On8BIH98kejoEkB/EtQSfN8+5PEe+tCYmtjHRS5R
	/re/5EDq+YYQOmQXktGonLfy85Knqx05aeW6p+O5Vwv+hJp3lNHLhfkU
X-Gm-Gg: AYBFou2zGRrNNhNtQRV6eXh32q4a6azV2DTpF9jUH7sB4pRY2jhtfGLwR5VhC7SStm3
	A8w5JoXzuUMZ6wn8hbw150Tq+LXQ2E86tBB49OOSxnNlLdKA03xwcaMwRkSTbou5XGiW/IYh37W
	uug+Ya5bL4qJouyO7uVG04kdX4+zCFhxhVY34ApxRjfA4aWtFvDeqCt/vXC9ZZr76n9taO7A8Dj
	UFKJQZwLTmtrugFMvt7qgssnx7HMG+fz9G53dOSQEHpG7N3E+M6QI3k8DhOyugidXtclyw6K/Cg
	L0D+Qly4y1SMX4yJoC9ueS6i/o1zXGkbV6qSKljPRTz9iPkbjWCT0LQQcnsccj31tMbvYBUpXLX
	We5D3crvbzAnIJh11F1jEq2+gz2hydrxAfIYV/GLq1k1bYjjnUwBS3IJRCDaZrUdUErFMLc2Myz
	azbzu4Xq/xFwl+mYH8IR+nE9S4bd8Lc7nKompPa2SnskMEpCarngD9bMaFZZNM5mKYIPJx2iXLx
	LyjXI7E6RjqVaPXQHTtWiOJHdPrbqaXyu0csitJ7o+Uk/9TEc5p25W7cEswkOmFsDGYiOYxEnme
	BuO0ydQ1f8L5uZ5GR8Wvjm0DT18nzz4sNz6hD3ILNg==
X-Received: by 2002:a05:701a:cccd:20b0:1b5:3819:f8f with SMTP id a92af1059eb24-1b55692aa4emr1650809c88.36.1795148362798;
        Thu, 19 Nov 2026 20:19:22 -0800 (PST)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm3124341c88.7.2026.11.19.20.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:19:22 -0800 (PST)
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
To: hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	kanchanapsridhar2026@gmail.com,
	linux-kernel@vger.kernel.org
Cc: rientjes@google.com,
	willy@infradead.org,
	senozhatsky@chromium.org
Subject: [PATCH v4 4/8] crypto: acomp - Add API to get a compression algorithm's batch-size.
Date: Thu, 19 Nov 2026 20:19:02 -0800
Message-Id: <20261120041906.5785-5-kanchanapsridhar2026@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
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

This commit adds a @batch_size data member to struct acomp_alg.

An acomp_alg compression algorithm that supports batching of
compressions and decompressions must provide a @batch_size greater
than 1, representing the maximum batch-size that the compressor
supports, so that kernel users of crypto_acomp, such as zswap, can
allocate resources for submitting multiple compress/decompress jobs that
can be batched, and invoke batching of [de]compressions.

The new crypto_acomp_batch_size() API queries the crypto_acomp's
acomp_alg for the batch-size. If the acomp_alg has registered a
@batch_size greater than 1, this is returned. If not, a default of "1"
is returned.

zswap can invoke crypto_acomp_batch_size() to query the maximum number
of requests that can be batch [de]compressed. Based on this, zswap
can use the minimum of any zswap-specific upper limits for batch-size
and the compressor's max @batch_size, to allocate batching resources.

This enables zswap to compress/decompress multiple pages as a batch
to improve swapout/swapin performance and memory savings.

Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 crypto/acompress.c                  | 14 ++++++++++++++
 include/crypto/acompress.h          | 12 ++++++++++++
 include/crypto/internal/acompress.h |  3 +++
 3 files changed, 29 insertions(+)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index ac4dc52668b8..df9e42f519c3 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -327,6 +327,20 @@ int crypto_acomp_decompress(struct acomp_req *req)
 }
 EXPORT_SYMBOL_GPL(crypto_acomp_decompress);
 
+unsigned int crypto_acomp_batch_size(struct crypto_acomp *tfm)
+{
+	if (acomp_is_async(tfm) &&
+	    (crypto_comp_alg_common(tfm)->base.cra_type == &crypto_acomp_type)) {
+		struct acomp_alg *alg = crypto_acomp_alg(tfm);
+
+		if (alg && alg->batch_size > 1)
+			return alg->batch_size;
+	}
+
+	return 1;
+}
+EXPORT_SYMBOL_GPL(crypto_acomp_batch_size);
+
 void comp_prepare_alg(struct comp_alg_common *alg)
 {
 	struct crypto_alg *base = &alg->base;
diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 93fa02ce818b..3ce4704dc879 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -593,6 +593,18 @@ int crypto_acomp_compress(struct acomp_req *req);
  */
 int crypto_acomp_decompress(struct acomp_req *req);
 
+/**
+ * crypto_acomp_batch_size() -- Get the algorithm's batch size
+ *
+ * Function returns the algorithm's batch size for batching operations
+ *
+ * @tfm:	ACOMPRESS tfm handle allocated with crypto_alloc_acomp()
+ *
+ * Return:	@tfm's acomp_alg's @batch_size, if it has defined a
+ *		@batch_size greater than 1; else return 1.
+ */
+unsigned int crypto_acomp_batch_size(struct crypto_acomp *tfm);
+
 static inline struct acomp_req *acomp_request_on_stack_init(
 	char *buf, struct crypto_acomp *tfm)
 {
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 0c0d3fc8a9fc..2d4d302d1b3f 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -28,6 +28,8 @@
  *
  * @compress:	Function performs a compress operation
  * @decompress:	Function performs a de-compress operation
+ * @batch_size:	Maximum batch-size for batching compress/decompress
+ *		operations.
  * @init:	Initialize the cryptographic transformation object.
  *		This function is used to initialize the cryptographic
  *		transformation object. This function is called only once at
@@ -47,6 +49,7 @@
 struct acomp_alg {
 	int (*compress)(struct acomp_req *req);
 	int (*decompress)(struct acomp_req *req);
+	unsigned int batch_size;
 	int (*init)(struct crypto_acomp *tfm);
 	void (*exit)(struct crypto_acomp *tfm);
 
-- 
2.39.5

