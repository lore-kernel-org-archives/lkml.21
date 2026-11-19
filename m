Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086433;
	b=IbWuFBEbhj/UD71drKqFhq0Afxs9s2/RWaAJcSLOzvs/E0pEQMxsys5uPxzIw/226JZr
	 wud6AZBp6cMbaXvEAZkWFgQHAQcskhNXE7BgxTeDnow1uyTXbj+4bHjgvkQwAsobWR945
	 TDHWe+C+FY1S59W2kKfO//ocYKElH9iGPaN65h2SDvnGASYn53k2V8xdA0GjdtoFbFf57
	 WvIIbnpDZ5mASzyX2Y8TDwFEtVRKUTObCoUNhIgbq92mq3vb1VVf0xTMV7+SHowgUAO1I
	 p/J/CLWpFJ5nGvlyvSyRgAf7K6dRd00JZSevoRDnVY280m7ozrIq3fFFHBdqihvMrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086433;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=45rMVtLeIVmn3MF/hbdGg8MQeoQzp9MspU7QNk6Eeqk=;
	b=l/QLTdgwoZ5fWlZSQ7Kqw3hia+MMmoaX3s/FUeM1f5eRg1QKgqChu1LxOJClS7D11ygB
	 AfacFmHJOJ2MqaMg/qsTaqPK8T4DxTADBYAS4wNnAA0FQ/IOI68/1A0MJhIwQuUeBjGha
	 KMnRkW4LnCikV6947x2PyHdbTAZ7Fo1q0ozzBOxAu0ZmNQQCQnhReraQUGV9l4LmxYTNH
	 v8+iSww91CTKqFdOAXCNypyGQ68GBoiEEn0/Cg19FiI8Anq/g0wbsJicQQzU4HpqxF3Ta
	 nmFWdjxEeMHbq+LX8NP3dg/fLDwNMkmG+nPS9/cu7Se5hhmNxlsB4Zvh5M4dqLtiIsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wmEM21oj;
	arc=none smtp.remote-ip=95.215.58.215
Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD1606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CD1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wmEM21oj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eAX7Oh65Rvfk2NSOBriq4/R0Odj0AYuevXwubXdaX9w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795086431; v=1; x=1795691231;
 b=wmEM21oj5m0XvFaXRTAmbd9q7MXc0hPOkPyBDIfaTugv9elpdF1wk/MVipImFXTJu2SYc76O
 QJRQy17Y12xu5uznW6TSkuqXeHDlP8fWnZoaWRWjBTEI/ZKf6I7cRWZoT7kNUk03YniX7fpEobP
 j1OvZ+ZyMXgemKt4Xzgvg/Cg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15c57e5f9138d846;
	Thu, 19 Nov 2026 11:07:10 +0000
X-Mizu-Trace-ID: 15c57e5f9138d846
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Thu, 19 Nov 2026 06:07:00 -0500
Subject: [PATCH v5 1/2] nvme-multipath: apply delayed_removal_secs changes
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
Message-Id: <20261119-bug-nvme-mpath-set-live-srcu-v5-1-e1483e2e447f@linux.dev>
References: <20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev>
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev>
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
written, cancelling it first so that the module reference taken for it
carries over. Have nvme_init_ns_head() cancel the pending removal
before it drops subsys->lock rather than after, so that a write to the
attribute cannot requeue the removal once a path is back.

With delayed_removal_secs set and no path left, the attribute is
changed two seconds later and the head is removed after (mean of two
runs, min-max in parentheses):

  delay (s)  before (ms)            after (ms)             change
  30 -> 0    26655 (26537-26772)        8 (8-8)            -99.97%
  30 -> 5    28298 (28094-28501)     5514 (5510-5517)      -81%
  10 -> 30    8112 (8106-8117)      30376 (30106-30646)    +274%

A direct read queued before the 30 -> 0 write fails after:

  before (ms)            after (ms)   change
  26607 (26450-26764)    4 (4-4)      -99.98%

Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/nvme/host/core.c      | 7 +++++--
 drivers/nvme/host/multipath.c | 6 ++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f4aa02869b790..48d432c5d7aeb 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4231,12 +4231,15 @@ static int nvme_init_ns_head(struct nvme_ns *ns, struct nvme_ns_info *info)
 
 	list_add_tail_rcu(&ns->siblings, &head->list);
 	ns->head = head;
-	mutex_unlock(&ctrl->subsys->lock);
-
 #ifdef CONFIG_NVME_MULTIPATH
+	/*
+	 * Cancel a pending head removal under subsys->lock, so that
+	 * delayed_removal_secs_store() never requeues it once a path is back.
+	 */
 	if (cancel_delayed_work(&head->remove_work))
 		module_put(THIS_MODULE);
 #endif
+	mutex_unlock(&ctrl->subsys->lock);
 	return 0;
 
 out_put_ns_head:
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index ae8059366b57d..51c59cc3ea246 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -1242,6 +1242,12 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 	mutex_lock(&head->subsys->lock);
 	head->delayed_removal_secs = sec;
 	assign_bit(NVME_NSHEAD_QUEUE_IF_NO_PATH, &head->flags, sec);
+	/*
+	 * Apply the new delay to a removal that is still pending. The module
+	 * reference taken for it carries over to the requeued work.
+	 */
+	if (cancel_delayed_work(&head->remove_work))
+		queue_delayed_work(nvme_wq, &head->remove_work, sec * HZ);
 	mutex_unlock(&head->subsys->lock);
 	/*
 	 * Ensure that update to NVME_NSHEAD_QUEUE_IF_NO_PATH is seen

-- 
2.43.0

