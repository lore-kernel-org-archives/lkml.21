Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430439;
	b=AaRUMHCNaTXxaybPAiJQhKjiIVDjGIqCrCjK9/zKBRATa+8RMKADJ6hCiFrGyyphZGyb
	 whyCLB1fZFd8sygEuk1Cgvu410reZkaW55VUlH8R4s4rYNO5IL6776Rood2p0+dRFc439
	 ZFufaeknROEaRt7PmaKatgi1U+GD+G4FU1+HoWEa5657gSfz/42zTrJAPEfcbJJLlgoAK
	 Q1bmflDgRSIH1aRDtXc4x2Z3Y9bS5RDCh47Wp2kXIkoB8X5dq7vIysRY5WGc66eyaazXo
	 dgmlwtAbGTeO1mmmFAivVqv3XCYDfHWIGaG9dvRcqmO+PwmkogQ/OeM4dDjaXCLz3Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AoHPrlw7cHKhLG/2C7Mmh2Ph3LLuU0qyTHH6DFLMjMo=;
	b=eiunuAPWQwguWVSCIlUKyGQo4m4yDAveaQNSC0TmrPawfMFd1i+fFMtl/czj2tqZ/qe1
	 djOUNFb/42kTKfdEHzRKFQFzTdOHyYSAEac+tsD6Jct9tfFYxdI4yaQJaRKbHa4rKujld
	 p7CbpKA1plBbRaMQAvbB1xvr7zqIoW6edI/SzZq4TynHykGW1UE/kRxUs9l9m/Qt2yair
	 KayFNtQFXYlH/IghNyMfvDnHBBxVhxbMZfp+Y5k+iX+LOcwqY0u1GwocaMzRq0xlXSUjt
	 aJrtMliqZNObDKgrVVVakx9/pjcBHbdDgR1wVh9D2UOC4H8z62rYRiLHwM8NHcp8UwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NU2bShVh;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7093E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NU2bShVh
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386b8f2f671so171652eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430438; x=1796035238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AoHPrlw7cHKhLG/2C7Mmh2Ph3LLuU0qyTHH6DFLMjMo=;
        b=NU2bShVh8f3IRVK7GpGP4qsoxe22YPQwXZ+v4H0IRPaSgkaZOgGQJUXyJHLqCZ35G4
         l+IqmDevDc5dPwt8wNEi42LmqwP0qHx4lI35uza0O82UgzpHYF7cBMIT5r27eaU9LaHE
         2OtU332J8V5USXOsLDK0qBJnY8ey6XonX4tf2QwSlGw4o2gKZaXojrUXGnlbaa+IOrS/
         ea+OqRDFX94Zb+nVXysPRSKS9rUXY6euIlQTyzhDSy2c1wJtec6k5ZRiG8t21qJZjKFQ
         FY3uCxmi80rw6H26Jib2w3LHA6R3OYW8OPoH4ZW3iHJNMlYpajb08PyFpXk7+49tXb6u
         wyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430438; x=1796035238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AoHPrlw7cHKhLG/2C7Mmh2Ph3LLuU0qyTHH6DFLMjMo=;
        b=BYBcdPpRE1vfMTfekWg8i+orzkTpGXYPXqpeIgmd2AtklY/lWz3h+QmvP4coI321FK
         nypwkwIs+G4svgVhn07RhvI49q8qmU3Zyyiry3diibnF+7rG9bk+uQ80zNSccTxu8hcr
         ZBUqXarm4ZbWzHY/jO9roGAJwm4uFIGIVsF10hJRcsZjTlbN77Fhh3vKdKsYtZimGG37
         JXXS+CJlVU3ZxyPwyXwNlwHpSOb1nI3igSpPyI74xn0G49RmvoPaZ5jSQGK88J0dUt1A
         zWM3v63TQO8/M3Oo1h6cH34WiqAjTrFNeHOhkfns5KKLkryb450ANE8gQp4ue9UdbGP6
         IQLw==
X-Forwarded-Encrypted: i=1; AL+hErE2pa/OUneOcwMHKm7/sO4OCNdY2tj96o/aLsqDHecegD0+zpLcFRUngc/EJf+3RiXYIl9IDuOIaA/LjG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LTXF7j8sSjAo68EvMeaGHnHK6MuNd5BmdpVx8Xb8SpxNDnFxi
	tZLLbd0mtmoL9JjFlf+R6HcLP49PIprcdK8gyg1S+dpnynM0JNpL/y+3vGwhUvHqUIA=
X-Gm-Gg: AZFdTZdY3J7NTM4tbXthXRkC+4ser/WOKkI6NY4/mVztFpBfm1O8cMNtD2t6HlXJVV8
	dCD5iB702DNSvao0Pw4lDPfgxzZg73M1SGn5FGy877a/lKSDKD/gVdtJhD426xsc0vDk2Sa6S0q
	yNoLUUkABn6aFHyM+cUKMkjtVyjgfWa7QkDw978OKDTYQEfB2ckkgJ6K6gnveeg/WpMcmsFtVD4
	gryf6A+1jYrBEJjV4a9ZnXekLph0C4axOL1LyHQQRn/eRwEXc1AmRL4br0mBvZtrN12m/vEt5pw
	M63GuELlaLOfZybhmI8TL+ZAKt2cPLk2ley8gJUBXxnSlsLdulX4Grmq6JD78+O+pyIRTG5IgDz
	1qucljAAXk1urWNyG9m5oH1UJI877r55b0VcPhtyNRnBAB0nm5WB9fBBiKLRc9HdxomF0Fo/chw
	/hv9BJY2DffP7RuSf8tLyaX3lkTfpykHmOYh5y9nnh7fIn4WXuo9qTJIuHc94FJ8LOtZxS58pmA
	KFL9dQ3JVee05rlvA3Bvccpdi73A5oqjjG5/mVUUw48/ZnaZoYjy0cIdJIfCxICfITh339NF6AI
	1AiWiIlJDZFFbJ5EF4YNvuIjnvT6Jcz04ZJPcP4ygWHQng==
X-Received: by 2002:a05:7300:ff49:b0:36e:b05e:9a74 with SMTP id 5a478bee46e88-38570c30013mr9891055eec.30.1795430438356;
        Mon, 23 Nov 2026 02:40:38 -0800 (PST)
Received: from kernel ([45.251.35.85])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm43882172eec.4.2026.11.23.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:40:37 -0800 (PST)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH] crypto: xcbc - use init_tfm & exit_tfm instead of cra_int & cra_exit
Date: Mon, 23 Nov 2026 16:10:30 +0530
Message-ID: <20261123104030.5378-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The cra_init and cra_exit fields of struct crypto_alg are deprecated.
Switch to the shash-speicific init_tfm & exit_tfm callbacks, which take
a struct crypto_shash directly.

This also removes (void *) cast of tfm->__crt_alg and the manual
crypto_instance_ctx() conversion and drops a stray semicolon after
xcbc_init_tfm().

No functional change.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 crypto/xcbc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/crypto/xcbc.c b/crypto/xcbc.c
index 6c5f6766fdd6..6bb3cddb391b 100644
--- a/crypto/xcbc.c
+++ b/crypto/xcbc.c
@@ -102,13 +102,14 @@ static int crypto_xcbc_digest_finup(struct shash_desc *pdesc, const u8 *src,
 	return 0;
 }
 
-static int xcbc_init_tfm(struct crypto_tfm *tfm)
+static int xcbc_init_tfm(struct crypto_shash *tfm)
 {
+	struct shash_instance *inst = shash_alg_instance(tfm);
+	struct xcbc_tfm_ctx *ctx = crypto_shash_ctx(tfm);
+	struct crypto_cipher_spawn *spawn;
 	struct crypto_cipher *cipher;
-	struct crypto_instance *inst = (void *)tfm->__crt_alg;
-	struct crypto_cipher_spawn *spawn = crypto_instance_ctx(inst);
-	struct xcbc_tfm_ctx *ctx = crypto_tfm_ctx(tfm);
 
+	spawn = shash_instance_ctx(inst);
 	cipher = crypto_spawn_cipher(spawn);
 	if (IS_ERR(cipher))
 		return PTR_ERR(cipher);
@@ -116,11 +117,11 @@ static int xcbc_init_tfm(struct crypto_tfm *tfm)
 	ctx->child = cipher;
 
 	return 0;
-};
+}
 
-static void xcbc_exit_tfm(struct crypto_tfm *tfm)
+static void xcbc_exit_tfm(struct crypto_shash *tfm)
 {
-	struct xcbc_tfm_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct xcbc_tfm_ctx *ctx = crypto_shash_ctx(tfm);
 	crypto_free_cipher(ctx->child);
 }
 
@@ -165,8 +166,8 @@ static int xcbc_create(struct crypto_template *tmpl, struct rtattr **tb)
 	inst->alg.digestsize = alg->cra_blocksize;
 	inst->alg.descsize = alg->cra_blocksize;
 
-	inst->alg.base.cra_init = xcbc_init_tfm;
-	inst->alg.base.cra_exit = xcbc_exit_tfm;
+	inst->alg.init_tfm = xcbc_init_tfm;
+	inst->alg.exit_tfm = xcbc_exit_tfm;
 
 	inst->alg.init = crypto_xcbc_digest_init;
 	inst->alg.update = crypto_xcbc_digest_update;
-- 
2.53.0

