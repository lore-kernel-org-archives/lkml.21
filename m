Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426011;
	b=s2da+sao6RwupMsL5076mtXA4BygeaW+UAhLVMGHoP9hBX6Ycf3exBVHsiM9zls7CRVE
	 fC8uZL6OuNZTcSxCNk9w1/Zc/pz6PRoyuCi+iVxStryqFAF3L+st42PLc+GAcSbBlB0K1
	 HEhjykzFlSbPPcOJnHBatKO8yulxWMRzedkPqHQsUaH2QJjbRUePNbxZdMZmjMgSJviER
	 eBEcLcw0Az8idbpb87Ku1C995aUIZO9NAu06vfUDAU4RxQxx+LT6EN+1RqjMjW24ENGwH
	 tnBKjL9B55nXrRmeZyw3aL33NHiqW5uT1zkG/6yfMcet9gmDn5NBjlkhMEkECT14Ekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426011;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=czfx09lVEJ+5qbSUxtIYbjWuSXbhH8LThXJ7vZTPIOM=;
	b=Z3zSMYrWBwL3PwQ0ihrkU5q+RDPoCei31E85kW6rb+5aZBrHI/Q5BX6z3/tor9sG4w6U
	 6Ytqp0Cy2OpYyfJsLpVXw9La+8g8k9ovu4IjerFuaXyAaMz1nUQS4xgxEygt74C2LofpV
	 5NZ8YNjguYip5bhoJioiAT5pSzh9CSxDE3etCokVKc/Ff8qzfuOyE/66iYbpqt625m4ZE
	 XG3aGL0wuFxYrXyi7cSl+h6t6W31nh2Mcuv2J9uJ0fCn3x7tANPIqXg4KQq6Cs7P2fvCw
	 pijdVsHj336RZfwo9LYoZ3o/Opo5NYTLM6n5W+bnOzLbLVERPPU7aGdJ1mDWQp9+fmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gi2Bgny2;
	arc=none smtp.remote-ip=91.218.175.86
Received: from mta0.migadu.com (out-86.mta0.migadu.com [91.218.175.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED60606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gi2Bgny2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g5DXUn2a5VY10LYZ28Rn2x9UC5KFh89OzpiCFa3tU90=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795426007; v=1; x=1796030807;
 b=Gi2Bgny21XFAYLT6spZSkExUZiIhaTtUnNbcG2bGb8s1m95uI3X7HKojpZEH2S3oo3VDsDGJ
 kN0pQIeMbCBMM0GzD/WkSfOrj2wKHCr9p+KbDuHH/MENJqGeLLpLfRSkPQ0imFpuIJrnms562+e
 16lM9tN4SAQA0jnczKDMzFeY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 918bf4bc19c1858d;
	Mon, 23 Nov 2026 09:26:47 +0000
X-Mizu-Trace-ID: 918bf4bc19c1858d
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 23 Nov 2026 04:26:42 -0500
Subject: [PATCH for-rc] RDMA/rxe: Allocate the MR page array with
 kvzalloc()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-bug-rdma-rxe-large-mr-v1-1-8d0748ac4a3f@linux.dev>
X-B4-Tracking: v=1; b=H4sIANEGBGsC/x2MwQqDMBAFf0X27IJJ1Lb+iniIZmMXqpYXWgTx3
 w0eB2bmoCRQSdQVB0H+mnRbM5iyoOnt11lYQ2aylW2NsY7H38wIi2fswh+PbCzg+Gisr1/h6dq
 GcvuFRN3vb09xA2Oi4Twvub+JWm8AAAA=
To: Zhu Yanjun <zyjzyj2000@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Leon Romanovsky <leon@kernel.org>, Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Zhu Yanjun <yanjun.zhu@linux.dev>, stable@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A user MR keeps a struct rxe_mr_page, 16 bytes on 64-bit, for every
PAGE_SIZE page it covers, in one array allocated with kzalloc() when the
MR is registered. Before the array, the pages were kept in an xarray.

With 4 KiB pages, the array of an MR larger than 1 GiB exceeds
KMALLOC_MAX_SIZE, so registering it fails with -ENOMEM, and the first
attempt warns:

  WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0xe9/0x130
  Call Trace:
   __kmalloc_large_node_noprof
   __kmalloc_noprof
   __alloc_mr_page_info
   rxe_mr_init_user
   rxe_reg_user_mr

Allocate the array with kvzalloc_objs() and free it with kvfree(), so
that MRs of any size can be registered again.

Registering an MR over THP-backed memory, median of 3:

  size     before (ms)   after (ms)   change
  1 GiB            5.3          5.2      -2%
  2 GiB        -ENOMEM         10.8      n/a
  4 GiB        -ENOMEM         21.1      n/a
  16 GiB       -ENOMEM         85.9      n/a

Fixes: 12985e5915a0b ("RDMA/rxe: Fix iova-to-va conversion for MR page sizes != PAGE_SIZE")
Cc: stable@vger.kernel.org
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/infiniband/sw/rxe/rxe_mr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
index 13cb28d3916f6..fbf4d89947383 100644
--- a/drivers/infiniband/sw/rxe/rxe_mr.c
+++ b/drivers/infiniband/sw/rxe/rxe_mr.c
@@ -157,7 +157,7 @@ static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table *sgt)
 
 static int __alloc_mr_page_info(struct rxe_mr *mr, int num_pages)
 {
-	mr->page_info = kzalloc_objs(struct rxe_mr_page, num_pages);
+	mr->page_info = kvzalloc_objs(struct rxe_mr_page, num_pages);
 	if (!mr->page_info)
 		return -ENOMEM;
 
@@ -186,7 +186,7 @@ static void free_mr_page_info(struct rxe_mr *mr)
 	if (!mr->page_info)
 		return;
 
-	kfree(mr->page_info);
+	kvfree(mr->page_info);
 	mr->page_info = NULL;
 }
 

---
base-commit: e7732ec135b501e87ab060d992b3b5f2ec4396c9
change-id: 20261123-bug-rdma-rxe-large-mr-f752a49d8365

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

