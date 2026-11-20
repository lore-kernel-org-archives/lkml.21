Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795137919;
	b=c4yTN0HxYdXk1abPlyBP36H8mG4CALNmkKaGAZpX+fPszE4gmwEApPaeCfejN1GJvyc0
	 quM0KPmBtEoUbsXxySEre/UNo7Zt6VEaIukwFl33kh87I2bYnGGGtOnm5ypH2h7YiUefb
	 lZe+cbwB+oTv93WphmL4C9GZBBesOAearLavwRtjKHMhVRoo0wlvUPDklwKWmJFjq0bzr
	 dU6rnQU/PkMGI/MXoLxosd8o37yeezSKhI3C38h68Dq1x4svouGAoGvoFCZPCKJ5NKNOP
	 uF8//5wsp3jYlElDZ6MxKrksx6ZVBYvNswfWTEsL2XyiiXyHYV2bFMwtCWhkOrHxrqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137919;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=JbJuKhab/Vgh190FqNXMcJ4FqvMOMsZQYdK5z3+jxO4=;
	b=AVfAtErogDd6zxEPv5FgYqqDQAYnM1MXJOaI5quJ0IhpsxdvyfhXtQCL3W0+QxL16ouz
	 PaRW/gyjbO7zA/UV42OADEpDOy5vYcyVuZ0F+dTwcRTE46zKzc3NSIoqVoWHdyf80eHCl
	 K5nWueznI22Uvot/PWlMwTLPVVxWhp6LwopcLSlZbrPagpFFCahqJ15TznY18qSsYo/NH
	 LAq506tmjBGxaSIaGl1+QQxkhwGG45Uyf63T4VjNDgH76ITGYGQg6yqJTtroesf+iJhnc
	 hy2s+TlYN+o2AvKYaeAFf0SU5a0lM4XWEVyQ85fmEO8ro7STiGBPYQJGQUk3I2rXDgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tsBr0+wo;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4AD606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC4AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tsBr0+wo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3YcJAy1yoKXk+ufpr0EPa26/P7xaYqN6s9qsKgZQrww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795137916; v=1; x=1795742716;
 b=tsBr0+woW1ZL0k7u69sBnUmdTlEjbiODwWRiRNA7GV9G+vWGRNjteww+5q8+3Jze0++gXcQW
 CBimJTJaXuErsKmVuSlo9uy9pPcLfjjxaW1KhFrqS85/hyX4rBaErelWGPyOGRt4GZnFTpV0tFZ
 tBYqMwURB+a/zzx3Cyq5O7vA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1f686c37af51896e;
	Fri, 20 Nov 2026 01:25:16 +0000
X-Mizu-Trace-ID: 1f686c37af51896e
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Thu, 19 Nov 2026 20:25:01 -0500
Subject: [PATCH v6 1/3] nvme-multipath: keep a large delayed_removal_secs
 from wrapping around
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
Message-Id: <20261119-bug-nvme-mpath-set-live-srcu-v6-1-da85b18b274b@linux.dev>
References: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

nvme_mpath_remove_disk() delays the removal of a namespace head that
lost its last path by delayed_removal_secs, which it converts to
jiffies as delayed_removal_secs * HZ.

delayed_removal_secs is an unsigned int, so the product is computed in
32 bits and wraps around for values above UINT_MAX / HZ. With HZ=1000,
4294968 seconds turns into a delay of 704 jiffies, and the head goes
away in under a second instead of after about 50 days.

Compute the delay in 64 bits and cap it at MAX_JIFFY_OFFSET.

With delayed_removal_secs set to 4294968 at HZ=1000, removing the last
path deletes the head after (mean of two runs, min-max in parentheses;
"> 10000" means it was still there 10 s later):

  before (ms)     after (ms)
  858 (856-860)   > 10000

Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/nvme/host/multipath.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index ae8059366b57d..9958d08cd3829 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -724,6 +724,15 @@ static void nvme_requeue_work(struct work_struct *work)
 	}
 }
 
+/*
+ * Convert delayed_removal_secs to jiffies, capped at MAX_JIFFY_OFFSET so
+ * that a large value doesn't wrap around into a short delay.
+ */
+static unsigned long nvme_delayed_removal_jiffies(unsigned int secs)
+{
+	return min_t(u64, (u64)secs * HZ, MAX_JIFFY_OFFSET);
+}
+
 static void nvme_remove_head(struct nvme_ns_head *head)
 {
 	if (test_and_clear_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
@@ -1523,7 +1532,7 @@ void nvme_mpath_remove_disk(struct nvme_ns_head *head)
 	 */
 	if (head->delayed_removal_secs && try_module_get(THIS_MODULE)) {
 		mod_delayed_work(nvme_wq, &head->remove_work,
-				head->delayed_removal_secs * HZ);
+			nvme_delayed_removal_jiffies(head->delayed_removal_secs));
 	} else {
 		list_del_init(&head->entry);
 		remove = true;

-- 
2.43.0

