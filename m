Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795137933;
	b=OBx37VAuohC7F5deWyS4uFcx+lS8g8jmWQ83T2XjjfrLF3Cxnu59W88o4i9/6BZ+bUGd
	 k/lLTVCcJF66X8FwOMV0Dy3Kn3xt5x6KFSL8szvl6KMfC0aZGiZEkCKVtV+pjJ32yzE+l
	 nOJqNX/yixFv+5+MD23uwa7b2tWB17vBM/p3arhjdNKbOC2ON24Wj9mqjO9/yU18/AU3r
	 E2fMEebKEvoW4h5qMAiMaJgN3KWWKTAeaIB/QYn0AwiIYOKNFFyo1oXWSVgckU/5J2b9i
	 jNX2fcD92rieFt8fLGncnnifTeHYOUhUdlFCglftXjqvA1f8Kh1NAP/RZszEWmqZrVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137933;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=2gSV0needxPj0T4ZOpzhkN7DJbnt1l+TnjQVhyw0V2o=;
	b=OS0AzKv+JjGlvW4JiV6dOVitkdEhl8LDkjpTunBT8Wrm4AEbXjcZLlhK2u/3+3yZ8M2r
	 6uKiqz7FQFx8O9I3IjkBW2DymfObM2oNOK3lLYlH0TcBYL/4ondyQwNjEglYIWTDYzF3m
	 RjJTfC66KM712iwrDOyrh3z/xzKHS6AB2Her683JOggPDyQX1ZMy59lWum+FkGTroKQ4z
	 orXEi60eF87UdQAj3ppmc8+58EIBGP6XcYRZL+zWU3CG7UI4TmBIM7hJkBKeHghVqr0Wz
	 +6kPmPYh5LSEc9a59XhYpBuKBk6yZ3j+bmi+BKJULkBJnMnbJUJfAvO6SAzWBaZCgvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n3gJemzn;
	arc=none smtp.remote-ip=95.215.58.6
Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n3gJemzn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GjCy52YedJyFjyXxDoBsnPsbz64C4vxsF8XxpUrpVoU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795137931; v=1; x=1795742731;
 b=n3gJemznAzKVtwRj9FZK3+el0ULIy4pegns48KOU8cCRu9we6OHUH+BCa9hGFM9qyh+Ap+DI
 1YBLMKGKDpNTfWKQ73ylRa6MfoCHHGCXiE50qMOd4qK7IzynRYrWshWu0Jt5Qx1k4BtzoiXk+BR
 tuhoKHW7//qyiUVXZcebzO9o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1bd11eee1c74e2dd;
	Fri, 20 Nov 2026 01:25:24 +0000
X-Mizu-Trace-ID: 1bd11eee1c74e2dd
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Thu, 19 Nov 2026 20:25:02 -0500
Subject: [PATCH v6 2/3] nvme-multipath: apply delayed_removal_secs changes
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
Message-Id: <20261119-bug-nvme-mpath-set-live-srcu-v6-2-da85b18b274b@linux.dev>
References: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
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
move the pending removal either. When paths remain but none of them is
usable, for example because they are ANA inaccessible, nothing
resubmits the queued bios after the attribute is cleared at all.

Requeue a pending remove_work with the new delay when the attribute is
written, cancelling it first so that the module reference taken for it
carries over. Have nvme_init_ns_head() cancel the pending removal
before it drops subsys->lock rather than after, so that a write to the
attribute cannot requeue the removal once a path is back. When the
attribute is cleared, kick requeue_work, so that the queued bios fail
right away if there is still no usable path.

With delayed_removal_secs set and no path left, the attribute is
changed two seconds later and the head is removed after (mean of two
runs, min-max in parentheses):

  delay (s)  before (ms)            after (ms)             change
  30 -> 0    26311 (26103-26518)      8.5 (8-9)            -99.97%
  30 -> 5    28281 (28037-28525)     5293 (5198-5388)      -81%
  10 -> 30    8110 (8097-8122)      30094 (30057-30130)    +271%

A direct read queued before the 30 -> 0 write fails this long after
the write, with no path left and with the only path ANA inaccessible
("> 15000" means it was still queued 15 s later):

  paths         before (ms)            after (ms)   change
  none          26261 (26071-26451)    4.5 (4-5)    -99.98%
  inaccessible  > 15000                4.5 (4-5)    < -99.97%

Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
---
 drivers/nvme/host/core.c      |  7 +++++--
 drivers/nvme/host/multipath.c | 11 +++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

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
index 9958d08cd3829..df96933f49459 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -1251,6 +1251,13 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 	mutex_lock(&head->subsys->lock);
 	head->delayed_removal_secs = sec;
 	assign_bit(NVME_NSHEAD_QUEUE_IF_NO_PATH, &head->flags, sec);
+	/*
+	 * Apply the new delay to a removal that is still pending. The module
+	 * reference taken for it carries over to the requeued work.
+	 */
+	if (cancel_delayed_work(&head->remove_work))
+		queue_delayed_work(nvme_wq, &head->remove_work,
+				   nvme_delayed_removal_jiffies(sec));
 	mutex_unlock(&head->subsys->lock);
 	/*
 	 * Ensure that update to NVME_NSHEAD_QUEUE_IF_NO_PATH is seen
@@ -1258,6 +1265,10 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 	 */
 	synchronize_srcu(&head->srcu);
 
+	/* Resubmit queued bios, so that they fail without a usable path */
+	if (!sec)
+		kblockd_schedule_work(&head->requeue_work);
+
 	return count;
 }
 

-- 
2.43.0

