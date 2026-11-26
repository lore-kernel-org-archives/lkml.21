Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673152;
	b=oz1oOJgS7gzBBeLuRfOEUZkGS46Jbsn7SBzlGZf3IatWMZfgl9qBoeF0nmGeypQ4M+ms
	 LibjeM0Z7QTdNcQzwig/RH3/f9gejOdm5kP/sERME4PrbG2dI1AvZATO8AAlnN0NyU7XI
	 ffuLGMRlSjiI76a7ytmgqat1Xl+hdBmB6LaSxOyKruGwFiE/1wNu+ObRlvrqyeQ4gUHUI
	 4yHeMRMKQfk0e83FqAaebF8B9MWShDjosO3nCtTA8NjyBf3HnBQXBMN6Z7xcUbW/BOBKy
	 wjFgqoMERPDU5Sw1kZkRaPaxgbvGgCW20ORcogXLfEoLBHiTIsgFiz2sYyd8a2pBfyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K2w/1aODXGS11yhT735RxqUDNCVWG/JQybAS9j/Br5k=;
	b=0N2GV8GjAl2910YohR4vOtEGCzPWPhHlvTSHjsK9U3RrqmjYsXwZlsAqy0V8R/fjjOta
	 sYfEbGonqwfLggFVNflaDD0v7AtmQxQagUqskVD2a8whKgYCacxhGLPMIOWqYtPEBqHCY
	 3a/eRpUQ9nRG60WRjFb3H/4LzVM03UUl2POWjXGk7jLa+yobvggUHsjAl6GOhKS4hezly
	 2sObJFwaNve7vLysVj7XacQjSDToR84Y1g/0pmbKTzrGB6m6cbwAhe2h85OKG4O3j/oCz
	 0a7B3Gk21PXkBnqlltJevuaHw3CmSaGZz/ONIqsLY7utCnPm122cF4VLRlJJOk2J+cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srQXsOnU;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B76B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srQXsOnU
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso6135733a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673151; x=1796277951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2w/1aODXGS11yhT735RxqUDNCVWG/JQybAS9j/Br5k=;
        b=srQXsOnUbIe+yOvXGizDiHcRFTgXgUPec+iEgJL1LEhpt3YAOtiqM05U4GLRXt0O9/
         xkDUz/3GJ4yr3FIv+na6BI7SeML9XpT5NXqoxbKwJnb8Y//JjMBX7TSRjuRWHcUIKvoy
         xpZIo5OwRAbfjJytv4UbC6X6LuDUnb5iahRKKQXYGG+xXalz1c5I/w00YfmZcb/XlLao
         4BCh7002fVseUAfru66L0WlX+B5QT9wXXaE9HUtox53ft1b8Byr8st8kn3rVQOnDmmTY
         VRa25e7sKqRXPXH07S2KT9PrHYjy4DsGFALIBKVBndb4dTjj1jUez6OtBOyinsSYydDu
         PXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673151; x=1796277951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2w/1aODXGS11yhT735RxqUDNCVWG/JQybAS9j/Br5k=;
        b=E7lLUePyruY6As4i9L2RVDGFLiKjzjyNNAju4t+OVkpbWGA9pQjasQjyYYyA4sV7zi
         3Mo8dHH7wJaOy/B+3hdhsYtQ8kYKfhgJm3/Y9YBYZ7sd6lQ6XpG1g77+T+904JuIoSQo
         ATRmVErx8kqDi5uFwWQUni+OE4ULsM8XVLxmnU/TC9DP5dgPwaiyTJKJgTceTGSi7ufF
         BHJlrZRMpkZRVxJFiqFYXvOmnqp7gFqw0BTyuS5F1ai9cUqElX9HCcqZf+rOlhCIiDNu
         3TOVEU5i/K8ubn3pT/GxedRml4IJkq7b1cqF8rvNs/icuLkr5n72ZWjy9aJd+QJFvhzD
         MMuQ==
X-Forwarded-Encrypted: i=1; AL+hErEyABIn6VP1kBBClRGtOzIl813hUxWM7QUHTy7JWU6KX1hHgQCVkefaJ4YifXSSWG/VFlCEeDTAhP2XL9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y1bC4uOL0/qY18V8K9SSy92IhDnJfBgkiwuaL55eXrXJu5+tf
	m0gKEg8DLwpzlPLgBjRkzHbuLjLenE8zsiULCr3LkjjqQN/ZsLBegKKh
X-Gm-Gg: AZFdTZfST+nbmfZxxFzIk+vMawR1wG4r+/yyr182ZoydPmU6kpJsMYcALpH1ZmPAAhL
	yTjeLtqy9KC2MODIEYY3PM44OTTNvB2nb/kKjk4SOhbcjimGoD+6iMH5nDmBS21GvR6kGrO98UV
	eyB1lDG2mayoDYMXOOCOxw1oCB7WiHVI/sokgqp9AAT1Eofn6Ero5Wv6W3f6O7IT1l+leVJIdEJ
	kupYd1gcWUQAnMo8Ubgg2bmTR0Pe5pgCVpvJciPzVJQtjNEmXWC+0a9ndq5oDeiV11qcHfzAG32
	krCBTcG2pVqxnMePgTqjKz/L3EncCODp/fpex3vRiAkQJxE7q9MlyQHRDmtcHaCuPaDFr70eMJe
	oRjMfY1Jf4JquXRNFDrFnkRtrM0UAXdGX9nNGJ1cjgkurfwKp7WclZtfsHrkOXoZtcMOVwXLtiP
	GZSg5KaZyQsbOKPGwPgzVfohE96fsjVj2pfc4F0drmpOdeJJBUcPBcJCrPZJysfQ8yqAVQxO+6k
	tzny5/hx52fzRMr895tcb+K55FLUPhBlt+HO/uoCUOWkoIKP7H28BgJhRk5YRzeZbPGzsZJtQRI
	pU4pjD/i6AX52+clp1jcSKaaFOrfnMruX68VFuH+FzvNm3aLAw==
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr14060282a91.37.1795673151496;
        Wed, 25 Nov 2026 22:05:51 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm33465721a91.14.2026.11.25.22.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:05:51 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] crypto: tcrypt: avoid 32-bit overflow in throughput calculation
Date: Thu, 26 Nov 2026 00:05:48 -0600
Message-ID: <20261126060548.24746-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126055600.23172-1-artem122novak@gmail.com>
References: <20261126055600.23172-1-artem122novak@gmail.com>
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

Fixes: beb63da739f7 ("crypto: tcrypt - Add speed tests for async hashing")

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

