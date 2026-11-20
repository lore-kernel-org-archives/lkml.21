Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143377;
	b=kIgU2BoLEmXgjGFMNps/VPKTbX1ygTkxnDIKf9QDia9vc90Q6x0iW9ykQXJCeZzrlOmb
	 W3vhFu/suY6Sg26v0jB0tbiWi/A3CB2FNfsxEj3WdlR4Jr4cudRK9zT4YFqJ3e2BgJu3I
	 q4JjLhUlCR3OCbA1lzMO+YGK8bIe5BJKErOwDN7Gx+ogh7moJ4vFpHwM0vYKKvdIpRkPv
	 97gkI1R5G0peV8A14dSP/89oqzsgXwXhEduozxYmMgefcm4xZXSVPtHGS14+ekcRnkz+b
	 MdPrJQWgAv9J1XLp6CAvYdBe0YiebCavE+wOQmEsj/h28LTUOwyPmdpR6543fXRuRUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ggrWRBIjN1YpUxZsuLBqhrBRUvzhtYh6cQ2yjgY8+GM=;
	b=wuDwO0ikMQQuKPNZ7yz7YUnzi4dLh09wkZFbABOqM6s2fC4FT3ecLCBsE15JDDQdDCvC
	 YX239qJ2Aj7+X6CApmlWkdvYAsBSa8RX2ffkF7uv89Kn7PEXDjCUw3F9K9NRfsGq8W9X1
	 WqXqax94rkPVsV5FYn+PVkkUXiU8RzFRVh0d7Cmf9DbOkrLAKeQVB6yCOhcwx6TK6a+dD
	 gyRE/qyEx1FPOW5/V4LG8S6kyUkwZFK9KYY5q5Dsr69BSfF0eRkkZCuAc92DpHDnltfe9
	 g7ZVa61IQVdMIq/HHPdl0WB0VNd11Q2nEfhOFrCv8NCAJuX687b5sVdbps69E+N8FDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eJvIGSPR;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82D606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E82D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eJvIGSPR
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b413997581so399088a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143376; x=1795748176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggrWRBIjN1YpUxZsuLBqhrBRUvzhtYh6cQ2yjgY8+GM=;
        b=eJvIGSPR/SdCZYtVYv0MrT8rgH7TfGHp2xiJ0zCbr7hBjfC+YjuE2M0LRWoinqGfbG
         bhAw3Fspkn3VKjsIMf+63wLKm9vdeYkjZ00XMpaZacRBgQuLF70HYuvB+zfQGC6VnqRA
         BDeDJQioDe/5dBCPPLnDl14/cZPQmDUZ1zjcrDx8AbJ1sQjjOUz2OyEpedWN33qLOheo
         iUiXLFbYkM6mvvVi74/BwxEPRpp6TELJzQd/Xp8LuWdbN9DjOVvM/5Gp8Z2YZzPQ4MNE
         1GztF7xqlsq1vykNDoMxTLvEBLSHUiWcCGhQAd8Q6EyE0oB7569RQDzjktDi5Lc1lksR
         PwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143376; x=1795748176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggrWRBIjN1YpUxZsuLBqhrBRUvzhtYh6cQ2yjgY8+GM=;
        b=FKozNEe46Kwxzaw3PeQ1tcLXSHxKIgSx5qghZZefYEyeHBnkgyflKvuzX1D2LYif5/
         UfX3ONy3ovPD5mQxD/tK/c7MKFiqz/UrXs4lBUKHs52hOssPmd0CTBCeTuNLYaq77QRX
         pcZA2IOG5eRd10aHt3j9noXzphsyydXcLnS+uzjccapjp8lqWIAvcdD3sH+Pj9kN0BKr
         gM9hKkIfhxLuaZIpSL28D8p3550HerWPupfRKTLuErLeNvjA8HhjWew4BnnpXsUvbE4E
         mlM/LOd8KMajqeMT1oNlTnXA8W88jOQbdReDc5TgTdFWs0bG6In76Gd0EQtrjjvWx3w7
         glbQ==
X-Forwarded-Encrypted: i=1; AL+hErF3FA1YLgGV5p8D2vXB6e1HysUbinPSB76PvHcyMxNnat32KgXO+NG7hV8ReMoLHJxNDend5eTLHT4/Jyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z81Zkot9Nk2hDe5ND7+7En0i/tQ47Tn3Y3c0b31V52bkCaEl7II
	AdAG5xZcc10tf/xo3TV6worDvhZv7BtSPWyqzvNUNT9QWRmCcR3yt1ZJuK05Ej8E18ZFr+4xKi+
	EHx36Cox9m4p+0MLKRU18rIOHdLfU/nAKSGb2PFtTXHy8AW6vIEXTCIZHi3o=
X-Gm-Gg: AZFdTZfXeVLRdEL+qdkiWCTmUugZJLXGKG9yMLZOwKgpbJgLOHCiDF5KNpU3ZkYe2+w
	dSWRGT6+ugRhjQiyyTHo1Mm3bOJiKfeZuAoJ2JXls/Nigb4O8qpmr+PGpJ6itUgGL1tgOO5F/QL
	FxPtOxuAUAhzwuLa1b//w3qoNZnFlR9CaFeH8S3vTsZMjgqCDhsY0RBictLCBXvlQGmFLL7AnGO
	PR/BnC+A04h9r2mLXdzRdnnDJS3OonwDIyXu5BVOkdsX9glqHFvTv+2jXNvfSkz3RZyGa75bGcA
	i9mICiy6kr4ysSQqehGMJEft8choN96pJy6lTjhMOFqPWtOOruSgG5VbsIsdapc34yGIMGshvYN
	BLsBWkQREM05O0qa1pVQmKoR1dS8KTv6N0jMXMjfo6YLWs94eICAXnYBnwTu6Dmt+OLZhfGlBQ+
	j1Dsxu77f/Fsa/sX7VLXibVFM8oeh0F4xPNItYY5LX87oK3iwQ+/N5nIvFSKanTV8Ohbo3XJAJE
	f6QEcJTFaXSc1614yyyD5walwsOIQjfPJOU8jcLL6jhfKTVfQI1ib5g2on18Dyy0MtB/Bu28my6
	JhB5hyJf/vjQnEvjMNkJWT4kVL3ph4x7JZT2aLh64KJFYRov23Vt/Qm9WM8=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:ba43:54c3 with SMTP id 98e67ed59e1d1-3b41c942998mr1197821a91.33.1795143376352;
        Thu, 19 Nov 2026 18:56:16 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5546461a91.8.2026.11.19.18.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:56:15 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [PATCH v2 2/5] block: link request queue debugfs directories to tag sets
Date: Fri, 20 Nov 2026 10:56:01 +0800
Message-ID: <45aaf07093aa28ee50653e83fe74e9593bf7b164.1795143228.git.lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795143228.git.lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com> <cover.1795143228.git.lei.chen@smartx.com>
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

Tag set debugfs directories use numeric IDs that do not identify their
attached disks. Starting from a disk's debugfs directory therefore gives
no direct way to find its tag set configuration and CPU mappings.

Add a tagset symlink in each blk-mq request queue's debugfs directory,
pointing to ../../tagset/<id>. Queues sharing a tag set link to the same
directory. Create the link only when both debugfs directories exist.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 block/blk-mq-debugfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index fd9eb17e97b9..72634277e088 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -644,11 +644,19 @@ static void debugfs_create_files(struct request_queue *q, struct dentry *parent,
 
 void blk_mq_debugfs_register(struct request_queue *q)
 {
+	struct blk_mq_tag_set *set = q->tag_set;
 	struct blk_mq_hw_ctx *hctx;
 	unsigned long i;
+	char target[32];
 
 	debugfs_create_files(q, q->debugfs_dir, q, blk_mq_debugfs_queue_attrs);
 
+	if (!IS_ERR_OR_NULL(q->debugfs_dir) &&
+	    !IS_ERR_OR_NULL(set->debugfs_dir) && set->debugfs_id >= 0) {
+		snprintf(target, sizeof(target), "../../tagset/%d", set->debugfs_id);
+		debugfs_create_symlink("tagset", q->debugfs_dir, target);
+	}
+
 	queue_for_each_hw_ctx(q, hctx, i) {
 		if (!hctx->debugfs_dir)
 			blk_mq_debugfs_register_hctx(q, hctx);
-- 
2.43.0

