Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676897;
	b=eTnfdotSWDGdc/chnmZp7crGpLDdv36QBYJ7K+By7f9BZG8sa7cmkdk7pT8if78Bft0I
	 leD4TiteiHS/2ifFM8h02wnjoMMgGnbdijr1DMrMI/gYk1OvL+ZrVjdS1fHw1nGVP3wfp
	 LkUF8IpG1jj/ARn0qAFj5j/g6Gk9vS1tQpwWasZ6cl+V5xM+L4Q4ZqUT7h3gMEK4J0RIs
	 wyXl6Wt/VlVY/jgNBp/YE61cu6w2YmDWj/B1HGqIP9FZfjOLnpsi7pK2rhBLQAaIOiuMl
	 yy7YXXxb9fZeb2hPZnObHUTkku8/Pu1Ntjk4RbliF88JgGRe594uVvVUPExX4uLE5QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RRzFeMo2WDsI7ij7b4kIfq1QEoLvG17j0R+GJSyvN34=;
	b=hNQUSti+C2Ob4RbrcEaEIZxDcG56o+D6DhamoRPGKKTh35cEK9+jWa0Yv+kz9yAr7yMl
	 9ci1Z/QP5UxUr+8hwV2/Xdt36s3jK8CyTId+nSGYDgHej6n3yIDB2gOnA98IhZzXiiyXW
	 GC1ah4+sz1uvX0uan1kEIuqskAkZ9KZE7dDaGaHWKJlXUYlmPxYI4e0JdkfST96MP+i9H
	 GmSGYs85fBGNkTx0Rs5bX2lJRBkm6hMJi6V+3PBwefLwZQ7/3Av2uNQJCNI/PIulxrtpb
	 FzyVvkUABNGOgpzMjymbZaiU0EJJWKIharU+eeEylTEpC9j6+tKtraxG1S8b6jeR66A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzXebyYp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01365606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01365606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzXebyYp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so38227905e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676895; x=1796281695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRzFeMo2WDsI7ij7b4kIfq1QEoLvG17j0R+GJSyvN34=;
        b=YzXebyYpMCwQ5jOWryjzHneSvapya+hUYAtjl3lttnp6ffTCsXXZntKMKFDHRt/YrP
         fBJsmGCH+B4NDW0L6UD0ab7Gwge2pBjuZrYlZvvHDEmi05cw0p+vq6NMZuWx3sSremU0
         2hIyBWEz8JJec12WOjDpdhZVbz6tU41NzRsd+BZlsFBQOHstmiTst0ABM9jAd9s7yMGM
         ORjSDUAP6IAQNDV7onIosnOOEo6I6inUAupEIm4H5fxzuJXnhjO2TOstDLfMFH0s3rfn
         waLeVHwgULx3Kcdr47USksDd6q1KaE3la3ZBYY53hAMcpPvi9l27xg1CLfPUhsCC5rpt
         HjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676895; x=1796281695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRzFeMo2WDsI7ij7b4kIfq1QEoLvG17j0R+GJSyvN34=;
        b=DIVdHuKKMwG7a/eTfMEkGXY2RHYMj9bijxHGJB+ptNmrukQUKNpzEeR6f9svfJfwl1
         P1SmLWHXHXKqkY4JKW2OWA8JQE0Q/LUi2oYm/qv/uUQEfrn0Bo56vQLC02t4gOtO6XTS
         JJm97YpSncEAzHLRpnHBgxWSPBLAYargmMQs4WupIsnPLQiEarbWjnnd5/Rqdw978Mba
         dBmOl/I5/7wX6Qc9gdVhV5PIbpUpPJuV+ec7Amvlsn8sgx07Sx8Jio40rX7E29QoW46X
         koWhHLzSTddc6pAL0rBcM67fqzUJKNXxSy9M/oTjpoQGGum4W7kACdI/grU/6i0bMxRZ
         8KZQ==
X-Forwarded-Encrypted: i=1; AL+hErFrV+bBP49l6PrWpcVGRUy7zvRN2gVygWg2klrKcHFDqZJhZfBafznKMInH6S8sj49daknDO/yxn76/AHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eBsjGfJDlwgRgPZ/X/CQ4HqptNi+DXt8sxCg5shoPDvBCKeMD
	PKI5Ov7aKz4+iVlA3VKPY864CLaYbaFeJBSc4c2DEChrYNkBvEGyVS0k
X-Gm-Gg: AZFdTZfSth4at7LryNjFs+jhXqmbL3P7yPNw6nnER6rjZ1+OXRl4KK8bcw/OissNWbe
	8Za7KsxFhZSNtJdsFx6tLlcHYbVm19AB4NBZSg1s3t3CWhKtDEU17ZW4VmHzIfOPr1VZjyG5NKt
	CeWhwo3vvANkNB2rohMWnyOe67xuWT0bU9Lr8xIw79YDZzI9bNrnG730YiC4fNIYQ5xD9DHkLpt
	Y1lf70kKWTFvK2d7FJHbI6o/gSYCKRhh6lnqDzA+OO2pBWdTT4SfkrMvzuMP/5zEPnoiNnNZ+Fb
	Jg+mA+PxQoZxC7+FvG9OcKS3CnUPBs6h4fKCFBruN9zdQHVOE8+PuXFvLHONjHF+avA+OJENwhX
	s5qf9J3DslbYPeQ42s74zB8Vmy9Qm2+P14QgHM9/rETMsxHIyTG/emLHkwPpsUEtrKljL6qFswm
	Gf3MYo1wo83kmqaRhpjxYmwKKitTl8DID37/AeFgZ4AWb1MhGEJ0eHoHx8Nt7u5EOh+O1JtqMhV
	BbLALa30HBsnLs+R8zdrGGPddoyiWsKirjgux1lXPWPCSTvwh5h/rPeFMakE/iH3ixQTzt3QUtl
	W76ahwsW8di2TjAQzbDATo9BUKac/J4KQRDqms2kjs8jxPpMmQ==
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr383180515e9.12.1795676895315;
        Wed, 25 Nov 2026 23:08:15 -0800 (PST)
Received: from DESKTOP-V28CTA4.dbs.corp ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1071077895e9.4.2026.11.25.23.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:08:14 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	yebin10@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] ext4: stub the nonatomic buffer lookup in inode KUnit tests
Date: Thu, 26 Nov 2026 12:07:45 +0500
Message-ID: <20261126070748.272109-3-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126070748.272109-2-arbabhaider649@gmail.com>
References: <20261126070748.272109-2-arbabhaider649@gmail.com>
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

ext4_get_inode_loc_noio() uses ext4_sb_find_get_block_nonatomic(),
but the inode test fixture only stubs the atomic buffer lookup.
The real lookup cannot find the fixture's synthetic inode table
buffers, so it returns -EAGAIN even for the cached test buffer.
ext4_sync_inode_metadata() then treats the same cache miss as success
and never observes the synthetic buffer's write error.

Register the existing fake-cache lookup stub for the nonatomic
helper as well.

Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 fs/ext4/inode-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index ab1ca5982..529cab24d 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -1149,6 +1149,8 @@ static struct inode_test_ctx *inode_test_setup(struct kunit *test)
 				   inode_test_sb_getblk_stub);
 	kunit_activate_static_stub(test, ext4_sb_find_get_block,
 				   inode_test_sb_find_get_block_stub);
+	kunit_activate_static_stub(test, ext4_sb_find_get_block_nonatomic,
+				   inode_test_sb_find_get_block_stub);
 	kunit_activate_static_stub(test, ext4_sb_getblk_unmovable,
 				   inode_test_sb_getblk_unmovable_stub);
 	kunit_activate_static_stub(test, ext4_ext_getblk,
-- 
2.53.0

