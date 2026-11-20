Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148360;
	b=eSTo7njaVRvR+ypEPs1ELljtA1mq2eUVO+FYMupWIgOQMkx0oU46kEmMVLf+bLK0hxMN
	 B1bqIQHB6B3A/vm2y9/4KCC4+9RF+sn5ofBdLxo1nSeiVKq9XzPWleemenLx1pjbzF31v
	 h7sERyBE1AB+9rKPJIsuNqjUgGjKQhLiMQwiReoEQlC07wssyOxTnOzbBRbRWKeZJNdLm
	 u0dZUBYBgUtwPOQVo3jnKPGhYTMV6UD/zB6ZttDh2ctncZd7E8rw74u1hJ/vrqpB9juvY
	 B9hpWLakdJShR1C7B/urYhyLUVcrEIeGxgGWDfgekzfxnlB8MS+PfA39Lz2/5SK/IkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
	b=tGOSCk4PVDASv9PfSkKkMUr5sm26Mm4rsAN7AhFEO1Lz3MzG8cwTP8XWWZDCWC+SlmIV
	 hlckTvBAeUbUR0Q3oMh112LD/5PNWS1jtH96jZvl5SS4zocUTh5Izay4n7ibcAxkFdqie
	 ePR/4YejC4f7Ys6GA/B98k7zFN55tOS0J/J/1aKVhiu9Hlrw44ujIeQKnNPWWSlBgiWku
	 2eGedZDK/VeOZnJzzTUMZP4hPBz0zSGnSjmqz6FXKBACeULDUCF7CEX6nJjb7YAxWecCB
	 c+74jYEZkFo1KS+Zj0j4dGs/6I0FBIrrumgQT51P78LMe8vpBQRhk/xqNm0CCgb3dsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNegSPzX;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102060A2609
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7102060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNegSPzX
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944abeso435892c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795148359; x=1795753159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
        b=uNegSPzXnDVSp6U+PQgVpDwSdYRu4V/jg1FcRakX55BuZjFeTj6bX4kZLWOULCnxiL
         g4d9XJX2Ddj+8qpJfeT3dZxokf647N/G7Z8COkeh4peFUYmeLby9cLzRn0YTt6GU3ZCe
         2/5q6ME9OKXglnxHTvjqC9beGaVVlJP0E7x6dd1M9Xqwz0C4/QbbLeLZQ7BhYtzcKbDn
         V+tQ8fk2e1mGtB290AQn8rdPCBQJvUJDmVMWpRJadi4OrNd1FYyoekSQ3MaG/mRjUA/J
         8stXY7zdQ/S1c6P6jgGV9OhWRXXTf4i8SVbySX43Ab9sdNakt2DuCB1aHIpQBHSojL4L
         sRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148359; x=1795753159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=utdVWrZ7wDvsHiY5NKnbSY5PtnmQf+otNqNinuRgHkM=;
        b=qY2x4NgyR1Dkl43K20UohKrfGiAfQRkyUDCsBhDNY00Y7wh1HQMYnGnM8CGFAVtV71
         jtTpsiS8oVs4BT9R3NtAQOUbLW2sHdy+7Mb8AWADzx0SI3GsWqyd4U868uxhcXmJVah/
         QMNTw00DFuB9LsAf7iCUxdHZOHEjZAAHZ0FbFkIIyOGH0anjLrfyQLdd5TUeOMMGZ/sF
         LDE/xaVCM8E2ajAID0HrWnT3MkuYFCEojqpuUfUoypvqowob888xZ0GNPgJkLuYy0Uoj
         lCcPcsvl8n0K67AlRLKQlGKEhqbx/7t11J5UHs/Jg7lGjx5IlxCDGXw5ZX/xmApJPzc5
         LVxw==
X-Forwarded-Encrypted: i=1; AL+hErE7hClUFygdbjajd8sjnnGKFoBApLV81GxLdopDMDIhI3AAwjerxo3ouNWzWXN8v8oRNtV3CMFPU0e0/lQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t0DbriKwhcaHwuI8QCPPb21ODzS1Kia6EXLEc8uOVg9hdDtGp
	JDAmKpOtJiEbSEr7nNMd9tVIIAdePfC1bABl5+RH/QloaQy2RdlGIqlsPj6y+jNl
X-Gm-Gg: AYBFou0zwPAxaVw7nBESOxmq9Vnlznrx6f4/JWQEPmGUiUW0jPX4AzrD9EOy58dYAt+
	8HbrTYEolQeFX/M2t9q8Nf7dAX5cvePLzSYvDjp2A7aeBrwL2GmIVG9Yxvf7A7lvVgIEbE5teqH
	o/VVRUr1yJu01yG595TAbVOsIENX+M9C3E4yY2BRyz5a6F2Gs/3tCpjEnRLobDJKoXyGhmh9GdK
	P7dZ5TSf2K1xcnbIFuybQxHm2r2G8OtLzaa2W61rhco09ZeFnLVELTgltLPBU5uFrDJk9Sn3H9G
	A8Lb+4Uo7bCXSPFkB1C4olhcUwu9336wjHuX1RUFaPYVLbVetBAexPAjJwuVzTvg7qEz/VMOx8y
	MNYQq1t7XwM2XDloO4KXZrFyKyoQU+ANkZF4BHBcgxxyC4O6dXh3N5DhhMMdtgYn4FPWkWUilC4
	El96r0uOSPofVnGegposP8gqsNnA8+2dcIbm73mDNE6WCAYmQQ2I+l23vfV0fmDzuYQtNlOxWOs
	ZKZJHgTDlQMdTo+4olLgur9+NXh4ree01caP/E73sYazpvdcZDNdzb2LgWvPyHCuyk8N0ZptPQz
	3suGeDXYGQaY2Pmwr5A0iwvQOJR4LZdG/alSfYE1lQ==
X-Received: by 2002:a05:7023:a8b:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b5568feb77mr1636832c88.25.1795148359482;
        Thu, 19 Nov 2026 20:19:19 -0800 (PST)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm3124341c88.7.2026.11.19.20.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:19:18 -0800 (PST)
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
Subject: [PATCH v4 2/8] crypto: acomp - Add bit to indicate segmentation support.
Date: Thu, 19 Nov 2026 20:19:00 -0800
Message-Id: <20261120041906.5785-3-kanchanapsridhar2026@gmail.com>
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

This patch adds segmentation support for compression.

Add a bit to the crypto_alg flags to indicate support for segmentation.
Also add a helper for acomp to test whether a given tfm supports
segmentation.

Co-developed-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 include/crypto/algapi.h             | 5 +++++
 include/crypto/internal/acompress.h | 5 +++++
 include/linux/crypto.h              | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index 05deea9dac5e..7d406cfe5751 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -280,6 +280,11 @@ static inline bool crypto_tfm_req_virt(struct crypto_tfm *tfm)
 	return tfm->__crt_alg->cra_flags & CRYPTO_ALG_REQ_VIRT;
 }
 
+static inline bool crypto_tfm_req_seg(struct crypto_tfm *tfm)
+{
+	return tfm->__crt_alg->cra_flags & CRYPTO_ALG_REQ_SEG;
+}
+
 static inline u32 crypto_request_flags(struct crypto_async_request *req)
 {
 	return req->flags & ~CRYPTO_TFM_REQ_ON_STACK;
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 9cd37df32dc4..93ae59623f13 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -189,6 +189,11 @@ static inline bool crypto_acomp_req_virt(struct crypto_acomp *tfm)
 	return crypto_tfm_req_virt(&tfm->base);
 }
 
+static inline bool crypto_acomp_req_seg(struct crypto_acomp *tfm)
+{
+	return crypto_tfm_req_seg(&tfm->base);
+}
+
 void crypto_acomp_free_streams(struct crypto_acomp_streams *s);
 int crypto_acomp_alloc_streams(struct crypto_acomp_streams *s);
 
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index b7c97f1c47c9..78c699ac3f82 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -139,6 +139,9 @@
 /* Set if the algorithm cannot have a fallback (e.g., phmac). */
 #define CRYPTO_ALG_NO_FALLBACK		0x00080000
 
+/* Set if the algorithm supports segmentation. */
+#define CRYPTO_ALG_REQ_SEG		0x00100000
+
 /* The high bits 0xff000000 are reserved for type-specific flags. */
 
 /*
-- 
2.39.5

