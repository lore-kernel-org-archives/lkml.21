Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169102;
	b=mpA3OxSAcrUtauNIFpsQEqNa6y9wZ0dpR8kd8fvlUkcTzRcZWKm3uMA3CIsK64S3EmAc
	 Pk9lgY50ndk1eqZElVFJVdBUnivC9Yo1FiP3KNLCjFzkmRf9JwWDF5o4CM5/xuRHt+MF/
	 Lv3GtXYpRBIN0HuHggQjfmYmPz/XDDSkdHJgVg7fh/ZY/w+7RzSswEihFL0RP7so2QLFK
	 guG9aEN5F4TyV4UEmH/wf7L8Fr7n3dlylktKXRzAMkrAXE/2qfqTXQMwFhPHI9lkWljPC
	 yQR9d+rBzdJ7r9UpABog/lvLMGjcAMwZpyoUuteZidmq3hFW96rWCAK10eWPIXYCXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169102;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer;
	bh=NWXjCMhg5RQHn1ualsi+2+dlBnae42Xj8NLwnTW/lGM=;
	b=ciQFbx18PtmdHm2g6ntKqC79ip0Cxgbg1h7fuLDuJgnnoRTui9f8CtSyRsYy3p8ZHwyZ
	 sPGWTOPNzWusoEJ6yRR0Tw3eXthLg6aTU6+iuzRDCv9yLOFurXMXG9Gb/5/cqxF8Y2JNn
	 YOiFJUvYlM834IfLjHyBT3iUYjpIyuif0Fy8RCIqHK0WtT7cF4iNKk47Z6fbfLIlSMOfl
	 2P4CDR3TepSlXHeeNm2eq1Be22qGNtsRv2HKGnlInM/2FqDgMNkZPey6VHbpoKK7g12IZ
	 wceCTRMQDwDPg/cx95R2aO2KlgEnmjqKryHh5IWPcMuqTn7npqKjmHPtUfqJqzzMf7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rdavW1Tq;
	arc=none smtp.remote-ip=91.218.175.54
Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BB3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53BB3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rdavW1Tq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0FNox3ukbz4fDooWMUYv8mk/hq96WOBIwElNNqxsC+0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795169099; v=1; x=1795773899;
 b=rdavW1Tq7jVe1P+iT0kktJT9Op+ge9TuDSlv2GDs5x7K1q8TY9PTaNWAQqclyXcuHVanl+D7
 GbZLqQH/HshmlDBqA64YRIQc3DrAmgKr35rICG9Inec3cgv2XzsPesWhIuPmQD/DnYQR41ey2Qx
 7bk7zoeJ3ATjMxnmTHiCZyCs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7b6e652543881dfc;
	Fri, 20 Nov 2026 10:04:59 +0000
X-Mizu-Trace-ID: 7b6e652543881dfc
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	urezki@gmail.com,
	boqun@kernel.org
Cc: qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] refscale: Fix possible oops in the typesafe_cleanup()
Date: Fri, 20 Nov 2026 18:04:50 +0800
Message-Id: <20261120100453.5826-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

If typesafe_alloc_one() fails partway through populating rtsarray[],
the typesafe_init() returns false but leaves rtsarray_size set to the
full requested count.  The unwind path then calls typesafe_cleanup(),
which loops over rtsarray_size and passes the NULL pointer to the
kmem_cache_free(). unlike kfree(), kmem_cache_free() does not accept
a NULL pointer, this will cause oops.

This commit set rtsarray_size to the number of successfully allocated
elements before returning false, so that typesafe_cleanup() only frees
the objects that were actually allocated.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 kernel/rcu/refscale.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
index 4157774f01ca..0843bff9c3da 100644
--- a/kernel/rcu/refscale.c
+++ b/kernel/rcu/refscale.c
@@ -1143,8 +1143,10 @@ static bool typesafe_init(void)
 		return false;
 	for (idx = 0; idx < rtsarray_size; idx++) {
 		rtsarray[idx] = typesafe_alloc_one();
-		if (!rtsarray[idx])
+		if (!rtsarray[idx]) {
+			rtsarray_size = idx;
 			return false;
+		}
 	}
 	if (cur_ops == &typesafe_ref_ops) {
 		rts_acquire = typesafe_ref_acquire;
-- 
2.17.1

