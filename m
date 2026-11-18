Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016377;
	b=uc6geI/9BAQBO17ch7ADkTN/9J1As5Hl2l0UewdDuW5Tyb9xVoe46D7BdPSjCGQ1V3Yx
	 IkigFP2s69mtCxWQ6VtKQQt3TqZ7caY98KanU0xqXNHs2m1VSAh0YSEOUUs9PLHo7vEix
	 65sVYDzePfNi/TwgjnUqLKZXGYQ3OvBR86IPpzUn8RM9NlOcP7bNpd5qhoEbKoS1TUyH5
	 pCisW+qQn8T33oiFnmJBA60+4bC0MRlhXuIG4Gs3uGA1BTToCo+JDxAlPPjJE0kC+yfjj
	 H27AOtcNr1JUsvhut+42yj7wE3P1NuPe0OBVOaExLS+Mq/ZTJW/uGE3BrpS8tNYSnsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016377;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=EIG6neVhWP0oO2swpa/actjlZusAnOHzDTVPgCw3rRk=;
	b=LssKk54pL/CV3v/aAiBTSBDIZ4M0JlatuhiipbklOjTLAbJUZ+1/J1/CZ0itj9aLzbeV
	 kSyNAriP5h+4zYZ60+5vnxNi2Sa+aKqjDmN6imxpVeFca9PS/fcpBCAslUrncHYRCkR3t
	 VpxdJEY0/pxI5jnD5mHHOeCs6lFTcTF2Vn/mTr1d8jcW5pcLk5PtGpbP8wdQ1imE1krej
	 bKRlArzhOac/0BOsD6EebQCey2NPQ6sF9JNzpDlxxi7gqP9pOXUh+LqIqWzxLGOO0X+1W
	 p4875QeaEP395EI4UN/WQlPnL728Lx2Ixfa6qnmIXNBh+kIozYSAaSUeeSmmwLOqItA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xPp4lP5M;
	arc=none smtp.remote-ip=95.215.58.123
Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922660A2603
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7922660A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xPp4lP5M
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=F2v4qu60TZjIPQx+nKg8sL3H6yfL4FsC13pDDbITfl8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795016374; v=1; x=1795621174;
 b=xPp4lP5MgHMJO7DyuSQ0GUIQkZg/gL/Z9MpkYGV2N+zRgRNKgobd4IZBvd/Dnvqb1Y/TA/0I
 ez9dEU2rYmEVcYFNBZNnCf3J2C4nwbJD2/+ZvNClOkPAXwK0ffS8YvQgCM9xcfPE0vDWnvGxQvd
 CsH4Cs7NVSbu22jvTuZc3HtM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a0a6b54ba0a1855;
	Wed, 18 Nov 2026 15:39:34 +0000
X-Mizu-Trace-ID: 9a0a6b54ba0a1855
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 18 Nov 2026 10:39:18 -0500
Subject: [PATCH v4 1/2] nvme-multipath: apply delayed_removal_secs changes
 to a pending removal
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
Message-Id: <20261118-bug-nvme-mpath-set-live-srcu-v4-1-21f368376c8c@linux.dev>
References: <20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev>
In-Reply-To: <20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

With delayed_removal_secs set, removing the last path of a namespace
head doesn't delete the head right away. nvme_mpath_remove_disk()
queues remove_work with the configured delay, and bios submitted in the
meantime wait on head->requeue_list in case a path comes back.

A write to delayed_removal_secs only takes effect for removals that
start later. A removal that is already pending keeps the old delay, so
clearing the attribute leaves the queued bios waiting until that delay
expires instead of failing them, and lowering or raising it doesn't
move the pending removal either.

Requeue a pending remove_work with the new delay when the attribute is
written. Cancel it first so that the module reference taken for it
carries over, as nvme_init_ns_head() does when a path comes back. If a
path is already back and nvme_init_ns_head() hasn't cancelled the work
yet, drop that reference instead of requeueing the work.

With delayed_removal_secs set and no path left, the attribute is
changed two seconds later and the head is removed after (mean of two
runs, min-max in parentheses):

  delay (s)  before (ms)            after (ms)             change
  30 -> 0    26877 (26327-27426)        9 (8-10)           -99.97%
  30 -> 5    27987 (27464-28509)     5248 (5193-5302)      -81%
  10 -> 30    8152 (8095-8209)      30106 (30080-30132)    +269%

A direct read queued before the 30 -> 0 write fails after:

  before (ms)            after (ms)   change
  26801 (26243-27358)    6 (4-8)      -99.98%

Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/nvme/host/multipath.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index ae8059366b57d..881d8a0145255 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -1242,6 +1242,17 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 	mutex_lock(&head->subsys->lock);
 	head->delayed_removal_secs = sec;
 	assign_bit(NVME_NSHEAD_QUEUE_IF_NO_PATH, &head->flags, sec);
+	/*
+	 * Apply the new delay to a removal that is still pending. If a path
+	 * came back and nvme_init_ns_head() hasn't cancelled the removal yet,
+	 * cancel it here and drop the module reference it held.
+	 */
+	if (cancel_delayed_work(&head->remove_work)) {
+		if (list_empty(&head->list))
+			queue_delayed_work(nvme_wq, &head->remove_work, sec * HZ);
+		else
+			module_put(THIS_MODULE);
+	}
 	mutex_unlock(&head->subsys->lock);
 	/*
 	 * Ensure that update to NVME_NSHEAD_QUEUE_IF_NO_PATH is seen

-- 
2.43.0

