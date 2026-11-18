Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015824;
	b=mAZrvYLEyxlhKh/gSQa3tY78U/t5B98Vu8pYa4KhIfkh7NI61aXxELersAILgoBFvl4R
	 h8ejtzGUGq0U7pl4Psggmg+rP7+4To3TIjK42Cw5n704ZSjVan0QDA4CMLU2SVWf4xw8K
	 myUmkDXXLzMjzFBzYCsTGo3mMb/mpQwysKnez+gVeV4grsuYmfA5OtfN8hJIdbQC06OXb
	 cyW7JCGMmg5G6IGwWI+dW/xEzsIRMkaRqKfR3OR00OF2WxanEuxRbQFQSr/xBwvQtX21k
	 ze9RaooCq4O9e+I9R73EKeMlFuxwTKBZlIEkrFT5Jk1e43VUS0ffHJjcOuksBWFEOaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
	b=z/nksLgXNRsOCgOfCGE+5+0SgKN/sy2fG94M8GyieT/8ne2De+vAflAYJcsq9+eQXb1r
	 MUR2fgtmWTz/BIIBI+A3SBeS37n2jnfLy5E8Zzb3qFZxK/X3NhvOEeeUdOYTE2yo/n4rR
	 nsXWnbJrHNNgxy86pNH4PZGhRLpFnkL3GK2kYR9H/1royLRHcDAFSuKOfn1Bv7xqnSEcL
	 QRqj8e8rYCololEANo9c+PKoGXRdRWZX++Apgw0uVA4+nvRmFI36tSL2X4nXCHh+zsSpK
	 qL/zbSvZU2GRyoo5jPcsMVwYROj0u2FW0DMcW2sZqIl3gpFNtbITSpcKG8emYQOQPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6uWcVQr;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3460E60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3460E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6uWcVQr
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so2701516eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015823; x=1795620623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
        b=F6uWcVQrM1ix/hWYJWn/zSpbvp5y5DuKWIloSvzXxQhnMk150O6W73HYmuVCUQMaCF
         WpakeeKGe2hWKvi0M0EIxrt0iPcr/KDtkrLnk/oQNvbMijYuSX3a+PiaFRxi8BcHygMo
         P83KCXfV8Vbq2w6QeoMaZtfGVOeVlm0flu8XJnT+asq92yOZbrhHnEpDqGiURmmSKMn4
         DgLhTCI6jsLEguwDX3vldS6a6jdpXi2BnW7kLbmcaTKqcROI4DrXxRYYgQDep2Y8H40q
         gQUsEhYWGp0wwz1IeBerE1ysO18L5UvbVQs218x9fGy2dLmD3DcWrc6LkWiTvS9OJQyW
         vyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015823; x=1795620623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
        b=gNuWT0W3DGzpNoxdMHv/ZTMoCguZaHkiha7x0WIMnfbcaIKNLmdNfnQxAVATTnPfkm
         sbH/iJD1BUDnA/rQ9Qz0UsBUpU+9MEAqVGAjrybTLkBF8TFsutfKd5ZFNpMdcQImKIQC
         mnM7VyTO9yR5pU8GDT+kmRHqBMAX4zG2FVxb8OeJficEzPlZ5sdwc6u4GXay+cAFCGzC
         T3cKot90Fcg353orIxajJ19Aa4b04lCZQJV4Tf8A5paFvPB9qCWAs4aPmiOfJtrdChi9
         N8XTHYXU3UJ9b28IyKQwjPMLO29Zy14af73It4P5piC2B4Y8yxMW+lfYbegxN2iQLGjv
         zTtQ==
X-Forwarded-Encrypted: i=1; AL+hErG/q2UgjtwYWZcCFUcLA+LZpTfdkcFJfYvmKgoF1CS6FGGh9WNxHhRoPBPuVg6mcQaIn8NdospazHUvn8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tRa5gQrNEHAFDgsURZLot2fC3zEvEqnezoBo+TF70rrf9+SNd
	QwYKcHM/VqESOtvHqanRWcHy0sMiYqq72qOCg236JEVXy+3dqC8EP2jb
X-Gm-Gg: AZFdTZfuom/xfc3OCaxuG39G+RZubuXRSMgrOlev1uEBmiW96O0IvJRo5wFm2KjiEyS
	AOX3D2GOVmSXPbqbgBFZkVsjc7Pa5vX+kC53XGgGWUuyZDcfU7nn54YLR3cWr6psnQKZYrBYwYq
	OVfO9FX1e+asoola1DP1VBDx6X13GzNKaHtCkkgy3ez8xjyI8ZZnlt/cS8SqcuCwlMNPc/i+ZqW
	5QbxFpXkebmHuD2dAYyLkFFDyunYcRpuK3KTzg4yDkv6YY8Oo5hj1CmWQxPQqdsmKz0ClFfEQ1p
	f3gfeeYpybkdVADIzKJ+YRQKN07Sp1TEOjfBWz6THlyws7SLD1zdsWyQ1I+zZF7YHrUutJje8G1
	wRCkGelFqefA0C95yGssXQwssgFFHIuxC6vIvl3VAdHtx0Gvp3ocFquCm3HdliGMfkEEUPsH6Or
	P4s3mO4rQJXqFLqVSxbwcshN/tQSOhhZFWwcibCt0q9aIKqgkUsEEsTQ5A75nFA+y+Hiy+xHoGo
	GGA7iT1NDhajsv8bD3Kfs1rZgoAs+NIf/5+bC4UkXv7BDM+rL25+c6PujVRmPP068YuRHty8CWi
	CcP+n18FF4x6mWk+Qc6Fmuv/4D2lcKnRFipNVyyGjkpCk5l7IaHspVQGHk1EasM3K8y6p9iHVeX
	+7U0CKg==
X-Received: by 2002:a05:7300:e009:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-3828161f1d8mr2879861eec.41.1795015822594;
        Wed, 18 Nov 2026 07:30:22 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:22 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 1/3] wifi: ath11k: don't walk an unallocated regulatory info store
Date: Wed, 18 Nov 2026 23:29:40 +0800
Message-ID: <20261118152942.62838-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
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

ath11k_reg_free() resets the regulatory information of every radio in
ab->reg_info_store before it frees the store, without checking that the
store exists. SERVICE_READY_EXT counts the radios before it allocates
the store, and since commit 64828f091c7d ("wifi: ath11k: fix
reg_info_store leak in ath11k_service_ready_ext_event()") its error path
can also free the store after a firmware restart, so ab->num_radios can
be set while the store is NULL. A later ath11k_reg_free() then resets
the radios through the NULL store and faults on the second radio.

Reset the radios only when the store exists.

AI assistance was used.

Fixes: 7004bdceef60 ("wifi: ath11k: store cur_regulatory_info for each radio")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
and a test-only allocation failure in the SERVICE_READY_EXT handler that
leave a two-radio synthetic device without a store, and then calls
ath11k_reg_free(): without this change the call faults in
ath11k_reg_free(); with the series applied it completes.

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/reg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1030e119fd90..13e2ac96a12c 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -1049,8 +1049,10 @@ void ath11k_reg_free(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < ab->num_radios; i++)
-		ath11k_reg_reset_info(&ab->reg_info_store[i]);
+	if (ab->reg_info_store) {
+		for (i = 0; i < ab->num_radios; i++)
+			ath11k_reg_reset_info(&ab->reg_info_store[i]);
+	}
 
 	kfree(ab->reg_info_store);
 	ab->reg_info_store = NULL;
-- 
2.56.1

