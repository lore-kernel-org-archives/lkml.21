Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186818;
	b=Qhyo/+wc27ZxAgjZQGbbCHfT6DdImbOysDzLYCAmSIYIxfeWtO6HlJh9DhrEOkreEgvW
	 A6cnY5XAm+HVHTqMj1UaVvXlxZhIE7wpMKNbrjnuedz38Dm+Vyyf7Fmo195HZrBz10225
	 FUfjLHqGvIVAb7eHRb6bAzxdKnzVJW3DvyeAm+nDAWs/aJCjbykbErk7P2ccYA8R1ccNL
	 lant9zBSL2yB+XlDJ2xS8toYDaCwsxJPfP8cuzmwdS12fScZcG//ia5nLNptqo51vYWqN
	 uWT5S0RWb4V98OaGOwNx5C3cvz+LGVvXvNK7B86EQmzhLihB+6mvOhy5Lh2UsiocbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MXzkIorMiPWbDKQso2cn/JUFxw2wDbcQUfodK2nAGqk=;
	b=SwEONRumthtX52Aq/52CK1i2kcEqZCEGIa/OCRegZsotta02uBDfo7rI0fN5RQXKKLjF
	 17OeRG0fmBTbUywJMaHjOOelfx6ApFLojYpm8WoxprBv59bNyXRVTkN+pAGS1//X2eSUC
	 c7OfUW3uOBb+GUkjm8ZzqnFSEP7SeVyu+vbRWZOeVS3uSugD97lBRbnLx2S/TwzTXuPTk
	 EyQweyfknN1kj0pREigKwfOhIh3olZ3vH+T30FAazJsos/R0vR3oKdflrNc1nahr20Tps
	 b9QpsxpISQFdPChTcSeHA1xStKFCjzT5wFnuwBm4yuFbMDWaLdQwgeF0HuVe/bnPLpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvPDQYGO;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA28460A6F53
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA28460A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvPDQYGO
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso6443785ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186817; x=1795791617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXzkIorMiPWbDKQso2cn/JUFxw2wDbcQUfodK2nAGqk=;
        b=bvPDQYGO3m7LOi3EHO7lZOuAMbjv3fBu3Mq67vegX6wMPcjWbCKUkjrg+8Tj6uYcPo
         0U69a/ZNmY9xRIoeXzQrv7qTD0XN3KAVKKIOUrYcua0bt+cx0YszCzUQsAp29sfQZWWq
         KRKR6po1cVd1x/jk+/Qpy/b+AeYVZDub5szMb+KPAwT1rYhG8fACjP3Fwkz6zM5ahSAP
         SUV8U1JA8PR3YZwFLjoVxUG0PJONxOqZxdlvyEzi3s0v+i1zaTxDqz/M+AMShCkOOULY
         V5tuMGj0qcYctUnQsyc6N2iH/fBdOsrD/+LDGoFeVo3re/yMlsEWTUN3OLTgMaiwQEgX
         QfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186817; x=1795791617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXzkIorMiPWbDKQso2cn/JUFxw2wDbcQUfodK2nAGqk=;
        b=VgXuCF4xIQMir+AInP/RV9o3OxVxl5mLGE66eDJS5Xz0wYoaVkpznP2QwrCO7yC7t/
         dm+hObvrk1PNK8HtzM0+LcKKo36D3nwlubAPRe0kWqyT5Hj8ndgbI4lgmwWPKxTmwU5m
         lVcz6aK15lc2Pgn4jYK17WyR4Jj1vyjoS3cNkYRy0eMI8P8wu8iOp0U836Wv1xOHw7ux
         zKvUmfqpKpJ057lg2Uhpv8y4FePt3IjOHoU4pNbuPJXBLjcH8/X/ViFsVAmSjJpZ3YOe
         TQpmMaXldqvoISBBGcaRVz5xUp4ZlVEXK5Qgp98SJLYFmRsECMQWHj0mtUid/5puZ2iR
         80jw==
X-Forwarded-Encrypted: i=1; AL+hErGpK9Mye6uYNsQ5ZFUU/eZet0VdKcQ6fwGxcGsyZcckrqAxbzHY+G9hox2ObjSID9g74cGILIs2Vlyanlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z99zcyYRxBlFWf+93zIuppUEAax2gu77paKxb5g7rVnREOClh5v
	PdYeZxdnmuxdt1tVrwMUv9WJls5oWdHVm9cS/OhQz5EVY0PS0mKUxoGa
X-Gm-Gg: AZFdTZfsaw6kDo7nFAdSchBrQbM2ax7mXbDBhZIC6a0q1BPL1fQts01RGJujgjmTSpS
	/ppgtrVa9LApYUIZ3bAU+EdUJy4q7CoPI8GHRqKdvtL/aKoIrW4nswZLyPKLzaNrMPIBeJy5ORo
	Sh2RrsMc47txm1FOaGQS0y3ynevD7qFaOEwz5Ljtt5cfLbRADE97YhLnjT1pvCLQFbnKq2R5AxT
	0WS+IX8S7OGvNWX1fjvnSkf/6duXltOgzLAacyUFi5js1aO2qp9lMDvvyGJjw2p8bkXtXkAHoZB
	3TSPM04NYIBhFnrezzSLQuMmXtX/px4maEryK+85o8Lx07556XLg90fj5g9Ojob00q81UxFdJVJ
	BJGu1d/51kdZEofpojaJrusnYiMIO1heSsQi8lw33VpRWUQBx//iCJYJG8I6nS0PCtJdwQhLrq/
	ENJwXIz3BgBr+IyD295ptPPltixRq10v+mAP51XIqODGuMIdNvvD2NcAjsR4Lr6u2fz+f4XblT7
	9JAuNKwA/ufI7ujmkmK4BXUNL2WY1JDPwPhEz57SjvjbFni4SjS9OykB83spIL8QgyLe9syWJHn
	bhsi+7AaUMn/pP7otyySiG9Mc0YXvc+qSPM/qWimLBJcSvxDXB46
X-Received: by 2002:a17:902:f544:b0:2e9:4f49:111c with SMTP id d9443c01a7336-2f031fbdaddmr40856255ad.27.1795186817118;
        Fri, 20 Nov 2026 07:00:17 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm15213005ad.59.2026.11.20.07.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:16 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] fuse: do not schedule dentry_tree_work after fuse_dentry_tree_cleanup()
Date: Sat, 21 Nov 2026 00:00:06 +0900
Message-ID: <20261120150008.1144420-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120150008.1144420-1-ekffu200098@gmail.com>
References: <20261120150008.1144420-1-ekffu200098@gmail.com>
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

fuse_dentry_tree_cleanup() cancels dentry_tree_work at module unload.

But a sysfs write can call inval_wq_set() after that and schedule the
work again, leading to use-after-free.

So do not schedule the work in inval_wq_set() after
fuse_dentry_tree_cleanup() cancels it. Also hold kernel_param_lock()
in fuse_dentry_tree_cleanup(), because a sysfs write can call
inval_wq_set() at the same time.

Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 fs/fuse/dir.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 0d5d04df477b..04ca6c9be2bf 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -63,7 +63,10 @@ static int inval_wq_set(const char *val, const struct kernel_param *kp)
 
 	*((unsigned int *)kp->arg) = num;
 
-	/* Defer the work until fuse_dentry_tree_init() sets it up. */
+	/*
+	 * Do not touch the work before fuse_dentry_tree_init() or after
+	 * fuse_dentry_tree_cleanup().
+	 */
 	if (!inval_wq_ready)
 		return 0;
 
@@ -243,8 +246,11 @@ void fuse_dentry_tree_cleanup(void)
 {
 	int i;
 
+	kernel_param_lock(THIS_MODULE);
+	inval_wq_ready = false;
 	inval_wq = 0;
 	cancel_delayed_work_sync(&dentry_tree_work);
+	kernel_param_unlock(THIS_MODULE);
 
 	for (i = 0; i < FUSE_HASH_SIZE; i++)
 		WARN_ON_ONCE(!RB_EMPTY_ROOT(&dentry_hash[i].tree));
-- 
2.53.0

