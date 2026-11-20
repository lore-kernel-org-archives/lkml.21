Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172746;
	b=wavvafEGyhogReYWhpvbeRY7XPv7dvYAg1AgX+ALghkJeYzvE07EAoFaP/FK7SLjfC8d
	 0DDW8y8eJDn+RAvJGslWoinLZG5f+5w4JlERwMnuV/5xLx+62m6sg3dtn7kbcdbRxyspN
	 VfbNKeSRZ5bTo5KsO/efCLCpF60a3JIPRsk20RUR7v0V3/a7432oTekMklryT4Z5GUEC3
	 WzDR2PkqfqoabFHJdXSmirlLXepKzn0rJgUhJS4mYBYY+B5vBMJF7yhCgBT3whaUXCuS8
	 Kxmri0cVZ9KKFjUEniQxoFh6xQDI/rEm8dD/+tqHlV1D6NY8zobdureqZspmAymO9kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i9H1Qf5VeBDEAJ+KENGPjuJrwt4TmksckkFthv/+CKg=;
	b=cKbdecb259aH/34UGqE3mizsdD61QJ6bzWludSLSVOeKHZoydfrPLbn4Oa/4dStDK94v
	 hrZIhBGskXWMdDgvu7DfXcRyBTIDKQL/hGlC/wgbUPaYDLbcpAlI7cBaSMPiYUWC8Kmuz
	 q+Q3Y0CN6ytiB2NAyB76Mmgps0gIaQk44QM3l80K9EPNVoO6sIPv894KA8GY+scamFL3K
	 qMRbkJgtBqLUjrNsPsiOgVyOmeY5dMhtUftDU+3LKCmaGa0x5lycQdufewUg9NzfLcwN2
	 2pfMrt6byTPGQ7PBEjEUi7bTVF2e+XuKPTS+q5iEAFQkFMJM5MCJ+yiXLJyRMvCEqhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PSP+q0LA;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA67606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA67606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PSP+q0LA
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7DBDB3FCF8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795172744;
	bh=i9H1Qf5VeBDEAJ+KENGPjuJrwt4TmksckkFthv/+CKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=PSP+q0LA7xvcbdT0l8Ft6JeirRDos/dni75KcJCwt7Ig5e9Ui2kSfsezLoB4+OZdN
	 nCfz1tEIna/oneoC6QlYN5NVmdBS2wPrbv+rRAyXUkV7KGFHRISY6ejDzZFnRdjd6k
	 ezlpbnlKyE3QuhTse9MRrbCZuz+WVya9mWy+cnodGzNjfbcIK8+g7mQCxti/MVW+5/
	 9n8TcYUSCIK+Wghzx7xQ2uvuATSZWTmDegQiNM0nZ7XoBFMj7s74hriK/q2ncSWnmL
	 osWjA5WA2EJWeFWspjcNMCqqEPv4BOlgs3NZnb5TCPCtbNTrkUP2l3FTMh/+jrq0gv
	 ul8IdFMyQSwOLEV/ExJiaIOYrafvETUVuc8fVlAAhSN8ZpuCAkhkrTg3g9bsEz4kyM
	 +1xRZlsCwCFphYQ8NTmaUmD2Z2+p0UwKXgYOEW8g+a//lucNIWMPzvWC1O6LS2l4yj
	 aJ387IyM+sedoolAlOLlAElDNS83ltepLbPpz1RqoSExRcG/t7xWxcxhe+VxziFgSR
	 Jk1m57HKaaIlnNxF+IEYn2kSfJat1mGqm7N0/2g075tDaAi+aLFx1ymz2/VG96dmrB
	 o/7iHLTHYEIhtDQpub8dnc5af+NqkdhQMiLDB5WooP9Hukjp63E8W5vJeukgkVwIsQ
	 gIYT2nNApWOwS6dAOfraSkoA=
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so949162eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172743; x=1795777543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9H1Qf5VeBDEAJ+KENGPjuJrwt4TmksckkFthv/+CKg=;
        b=kdX5YKdw4nc57ZJhPDhPiwK8iYaHFStSK0+PB/JvOzDqnL66hTQTEx/mQdF19s+QKF
         ixmDt4kmkx2sw9PJcVNfSXi3NXKSM9nNdK5SLaaFbCKCu6QFYaEFBI2z39/rQ6Blpo2Q
         8Lm4wIbH9SGjMahTc/2vhqjY7sBpXFmuuNE4Ixyvy98ap5rOqu2xC0Nz1IopHMxtDwlD
         66hiu46cMAHvAqTeLPm6isWzQgDfZn9i92PJrgylf5THoAAm9KJD6bYIRBUvVVmLvgG7
         /9WKOQgldd7Bk/Yk9z/rxewEgQQoq7QbwWnbyjzxPMd8ZYB8jxxZIvjqHuChrF4t8TQy
         uL4A==
X-Forwarded-Encrypted: i=1; AL+hErHR6Xp3fKzCz54w9327YL/IlH6/UNiCU5KSmOP+fWjl2MdTJ6lSYWfXZP9GG8Jy2PxojCsNhnEOFv8Xwb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZhrUrNwQYEhgTDkLJ8LzAu9FdSzEva8qN0L05UhPdWBkbL6Ef
	GUBFIJFFeao5DQP+69trb3KWijOMIqvficuC4UC/cdTT+0MGNSPC2X7ZOFbit2eq+oQaQA4V63p
	y4SwQNDSRJK5F/ohoA30VeDq24sYi9jzcO68Dq6U5UApAg+RPpZzSmqKyolUvDTGAZM8W8Ean6k
	0KeGbO3Q==
X-Gm-Gg: AZFdTZfqdEqggG3P7X2fxDl8IIDExpGme8WO0vrz3ppdKU0k6gYfp3h42oHe9IA/H99
	lx/OdVOxqy3yAE6BTMz/4TLvts3vznGoWK0lst33Ms8VCM9KAKhVh1JbmxQQSwnzEqPqtV4MBZ2
	gCiqzEwDfruln842it3VDRYzRvtQO+7Qbuxd5PkTTfCl+qDgzFhTROUCKVvLC6lCzTUlgVorhbx
	d7fnKZGXOeMQfb1MI4Ari2QM3PJGXjX8SdgEU27DwtohfALFmqSjK6KJDnr/WXavQ6LULOCrfJP
	cBSzJy958EBx1Ix3gEDKQQcdxXylFIcThX+RnUVrnEUhZdtLB+ICkY7FigKEJ0BnXI412LHDdDw
	wclDIlc7nJF9GOogoc0+kNv5u6nhMHwm/upu+O4fIl67ZVo+nvOAU5tWLifk=
X-Received: by 2002:a05:7301:5f84:b0:385:f410:fe74 with SMTP id 5a478bee46e88-385f4110110mr1840280eec.26.1795172742727;
        Fri, 20 Nov 2026 03:05:42 -0800 (PST)
X-Received: by 2002:a05:7301:5f84:b0:385:f410:fe74 with SMTP id 5a478bee46e88-385f4110110mr1840245eec.26.1795172742142;
        Fri, 20 Nov 2026 03:05:42 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm814874eec.19.2026.11.20.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:05:41 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au,
	sahil.malhotra@nxp.com
Cc: davem@davemloft.net,
	horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	gaurav.jain@nxp.com,
	jeffbarnes@linux.microsoft.com,
	stephane.debusne@cynove.com,
	iuliana.prodan@nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	lukas@wunner.de,
	sahil.malhotra@oss.nxp.com,
	changwei.zou@canonical.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] crypto: caam - Fix wrong unmap operations
Date: Fri, 20 Nov 2026 22:05:24 +1100
Message-ID: <20261120110525.1170175-2-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120110525.1170175-1-changwei.zou@canonical.com>
References: <20261120110525.1170175-1-changwei.zou@canonical.com>
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

Since priv_form only takes values FORM1/FORM2/FORM3 with no distinct
public key enumerator, rsa_pub_unmap() was not called correctly in
akcipher_do_one_req() and akcipher_enqueue_req().

Use the completion callback (rsa_pub_done vs rsa_priv_f_done) to
distinguish public from private key operations, then dispatch to the
correct unmap function based on key->priv_form. Factor the priv_form
switch into rsa_priv_unmap() and the public/private dispatch into
rsa_pdb_unmap(), so rsa_priv_f_done() and both error paths share one
implementation.

caam_rsa_set_priv_key_form() implicitly relies on zero-initialization
for priv_form. Set priv_form = FORM1 explicitly at the head of the function
for clarity and robustness.

Fixes: bf53795025a2 ("crypto: caam - add crypto_engine support for RSA algorithms")
Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
Reviewed-by: Sahil Malhotra <sahil.malhotra@nxp.com>
---
 drivers/crypto/caam/caampkc.c | 66 +++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/caam/caampkc.c b/drivers/crypto/caam/caampkc.c
index 2082adaae585..4b5397f2ca64 100644
--- a/drivers/crypto/caam/caampkc.c
+++ b/drivers/crypto/caam/caampkc.c
@@ -119,6 +119,23 @@ static void rsa_priv_f3_unmap(struct device *dev, struct rsa_edesc *edesc,
 	dma_unmap_single(dev, pdb->tmp2_dma, q_sz, DMA_BIDIRECTIONAL);
 }
 
+static inline void rsa_priv_unmap(struct device *dev, struct rsa_edesc *edesc,
+				  struct akcipher_request *req,
+				  struct caam_rsa_key *key)
+{
+	switch (key->priv_form) {
+	case FORM1:
+		rsa_priv_f1_unmap(dev, edesc, req);
+		break;
+	case FORM2:
+		rsa_priv_f2_unmap(dev, edesc, req);
+		break;
+	case FORM3:
+		rsa_priv_f3_unmap(dev, edesc, req);
+		break;
+	}
+}
+
 /* RSA Job Completion handler */
 static void rsa_pub_done(struct device *dev, u32 *desc, u32 err, void *context)
 {
@@ -168,16 +185,7 @@ static void rsa_priv_f_done(struct device *dev, u32 *desc, u32 err,
 	edesc = req_ctx->edesc;
 	has_bklog = edesc->bklog;
 
-	switch (key->priv_form) {
-	case FORM1:
-		rsa_priv_f1_unmap(dev, edesc, req);
-		break;
-	case FORM2:
-		rsa_priv_f2_unmap(dev, edesc, req);
-		break;
-	case FORM3:
-		rsa_priv_f3_unmap(dev, edesc, req);
-	}
+	rsa_priv_unmap(dev, edesc, req, key);
 
 	rsa_io_unmap(dev, edesc, req);
 	kfree(edesc);
@@ -192,6 +200,22 @@ static void rsa_priv_f_done(struct device *dev, u32 *desc, u32 err,
 		crypto_finalize_akcipher_request(jrp->engine, req, ecode);
 }
 
+static void rsa_pdb_unmap(struct device *jrdev, struct rsa_edesc *edesc,
+			  struct akcipher_request *req,
+			  void (*cbk)(struct device *jrdev, u32 *desc,
+				      u32 err, void *context))
+{
+	if (cbk == rsa_pub_done) {
+		rsa_pub_unmap(jrdev, edesc, req);
+	} else {
+		struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+		struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
+		struct caam_rsa_key *key = &ctx->key;
+
+		rsa_priv_unmap(jrdev, edesc, req, key);
+	}
+}
+
 /**
  * caam_rsa_count_leading_zeros - Count leading zeros, need it to strip,
  *                                from a given scatterlist
@@ -391,7 +415,8 @@ static int akcipher_do_one_req(struct crypto_engine *engine, void *areq)
 		return ret;
 
 	if (ret != -EINPROGRESS) {
-		rsa_pub_unmap(jrdev, req_ctx->edesc, req);
+		rsa_pdb_unmap(jrdev, req_ctx->edesc, req,
+			      req_ctx->akcipher_op_done);
 		rsa_io_unmap(jrdev, req_ctx->edesc, req);
 		kfree(req_ctx->edesc);
 	} else {
@@ -670,9 +695,6 @@ static int akcipher_enqueue_req(struct device *jrdev,
 				struct akcipher_request *req)
 {
 	struct caam_drv_private_jr *jrpriv = dev_get_drvdata(jrdev);
-	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
-	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
-	struct caam_rsa_key *key = &ctx->key;
 	struct caam_rsa_req_ctx *req_ctx = akcipher_request_ctx(req);
 	struct rsa_edesc *edesc = req_ctx->edesc;
 	u32 *desc = edesc->hw_desc;
@@ -691,19 +713,7 @@ static int akcipher_enqueue_req(struct device *jrdev,
 		ret = caam_jr_enqueue(jrdev, desc, cbk, req);
 
 	if ((ret != -EINPROGRESS) && (ret != -EBUSY)) {
-		switch (key->priv_form) {
-		case FORM1:
-			rsa_priv_f1_unmap(jrdev, edesc, req);
-			break;
-		case FORM2:
-			rsa_priv_f2_unmap(jrdev, edesc, req);
-			break;
-		case FORM3:
-			rsa_priv_f3_unmap(jrdev, edesc, req);
-			break;
-		default:
-			rsa_pub_unmap(jrdev, edesc, req);
-		}
+		rsa_pdb_unmap(jrdev, edesc, req, cbk);
 		rsa_io_unmap(jrdev, edesc, req);
 		kfree(edesc);
 	}
@@ -993,6 +1003,8 @@ static int caam_rsa_set_priv_key_form(struct caam_rsa_ctx *ctx,
 	unsigned aligned_size;
 	int ret;
 
+	rsa_key->priv_form = FORM1;
+
 	rsa_key->p = caam_read_raw_data(raw_key->p, &p_sz);
 	if (!rsa_key->p)
 		return -ENOMEM;
-- 
2.43.0

