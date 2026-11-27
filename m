Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748407;
	b=S3lfJ578YExY0gKuw2egSplIcWVDzFuTWEpepFzEQKXifoyJmTjjfDyIoVi9vRmGdA1N
	 y2hym5C5hrc5uAdOUYerkLy4gFPdOoTVqmhyVN/LwEUd5zNRER/Lk2QbBPV5+PxUslWja
	 rA9Ip1I0k0RbEhmQG++3wJv9YiDXy1hUDgFTQZVFPo3Aq42FNZATpeAeEHFoi8VaIKzGk
	 Y4+HdZq5VD89R20hg7eDPUt3AnggdAvXF9gj7HYQ9MwXfR8huIJHDvodUYKhHXNWm8HFT
	 KH0kcvXSPg3q/qF3Kd37UTlvlLu+B32mGZNsLp5X2UJsr08H4yzWHI9yTGePGv+qC2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748407;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=cXL13ZdaJrq8Pxpnq5CNNNCF9aHaOxDVvF8l/dqqouA=;
	b=EUl8pWhPuXm8JeuvDxIXxmnwmQj2gIFNUgm9x0PL0gx4pSPGN4b0DA4azXwVdWiexm58
	 +qd8eBnkVSkeGF5p7+q5mKHdBel/IzjbfFH/4gFaRLeSKG6kadN4W065c9vCFYUd0KiaX
	 JwF4LRz0tivpZzc6FFVoad4Gsd/9cuOVylIUAU587aIPR5m9e9Vz7EFz4Y0IqZB33k8D1
	 BFr/1fVi7N/tMSc3VWIMtW2j45bAZ0Gi/EGU51oZDfWjh09t9kFJ6/o2fXuBUh/WH+OO/
	 0bZL43yiJJSBV7nu3/ylPZy4q4o/0cn60LftSSJEKT1EzDCorUudZCcOCDNBd4GEAjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fr637zHa;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B9606A331
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989B9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fr637zHa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795748405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXL13ZdaJrq8Pxpnq5CNNNCF9aHaOxDVvF8l/dqqouA=;
	b=Fr637zHaFJl1/Hb8Fu5IKgdgdljI57wYmAhpEfX2r96UAjJvm8oijVGP7vFmFEeZp2DvL4
	AsNsiU6dCyXROw+FXOsOjOcTtIvQiW3bYNLdDgX2JPud5LFdHiSCcjGNJa7yGnaVgzvr+s
	3pR39Li5fmqwrl8bxTKkVV98rAouC3s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-hP5MrW1yPRqequ3ZQpQFRA-1; Fri,
 27 Nov 2026 03:00:00 +0000
X-MC-Unique: hP5MrW1yPRqequ3ZQpQFRA-1
X-Mimecast-MFC-AGG-ID: hP5MrW1yPRqequ3ZQpQFRA_1795748399
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5AA7193FAA5;
	Fri, 27 Nov 2026 02:59:58 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 343595B1;
	Fri, 27 Nov 2026 02:59:57 +0000 (UTC)
From: Bruno Meneguele <bmeneg@redhat.com>
To: linux-integrity@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dhowells@redhat.com,
	bauerman@linux.ibm.com,
	Bruno Meneguele <bmeneg@redhat.com>
Subject: [RFC PATCH 8/8] ima: check the digest of every modsig signer against the blacklist
Date: Thu, 26 Nov 2026 23:59:11 -0300
Message-ID: <20261127025912.1383750-9-bmeneg@redhat.com>
In-Reply-To: <20261127025912.1383750-1-bmeneg@redhat.com>
References: <20261127025912.1383750-1-bmeneg@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When checking the binary blacklist, traverse every signer content digest
appended to the file. If one digest fails (-EPERM), the content is deemed
blocked.

Signed-off-by: Bruno Meneguele <bmeneg@redhat.com>
---
 security/integrity/ima/ima_appraise.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 8aeec2778984..a62dc1aa93b4 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -432,18 +432,23 @@ int ima_check_blacklist(struct ima_iint_cache *iint,
 	const char *sig_algo;
 	const u8 *digest = NULL;
 	u32 digestsize = 0;
+	unsigned int i, count;
 	int rc = 0;
 
 	if (!(iint->flags & IMA_CHECK_BLACKLIST))
 		return 0;
 
 	if (iint->flags & IMA_MODSIG_ALLOWED && modsig) {
-		if (ima_get_modsig_signer_count(modsig) == 1 &&
-		    !ima_get_modsig_digest(modsig, 0, &hash_algo, &digest,
-					   &digestsize, &sig_algo))
-			rc = is_binary_blacklisted(digest, digestsize);
-	} else if (iint->flags & IMA_DIGSIG_REQUIRED && iint->ima_hash)
+		count = ima_get_modsig_signer_count(modsig);
+		for (i = 0; i < count && rc != -EPERM; i++) {
+			if (!ima_get_modsig_digest(modsig, i, &hash_algo,
+						   &digest, &digestsize,
+						   &sig_algo) && digestsize)
+				rc = is_binary_blacklisted(digest, digestsize);
+		}
+	} else if (iint->flags & IMA_DIGSIG_REQUIRED && iint->ima_hash) {
 		rc = is_binary_blacklisted(iint->ima_hash->digest, iint->ima_hash->length);
+	}
 
 	if ((rc == -EPERM) && (iint->flags & IMA_MEASURE))
 		process_buffer_measurement(&nop_mnt_idmap, NULL, digest, digestsize,
-- 
2.55.0

