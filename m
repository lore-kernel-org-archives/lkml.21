Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016383;
	b=rzkaPkxes52cOvO78gZxB74qmr/+f/4aTuRzHtBoyZeiMy0kCKgFwkI2CL1WKu2+1L5p
	 JEGxo8DuMXnw9nR1I2Q0gWAschm4jTaW+IhjR/cKGk6yKBS8Me+MKaJUIcKxrw2VL/xsM
	 v3tBbAxNiLwLlTHMbXN2hilOfa9lOAKWQhZINkSiNl7WgwAtrx8fOir6MlC7yQDIh+V6P
	 BIysSoScEfgPU5MKuCk1CxRBag5KKq/GiFO7nRqf+MtT2Jwl64qy337ZIjj7IJqZwUV3z
	 Ec/tUAH3RbMprstkaabGs3QEHNVEdmKOUPT03ZjgA9jgEfNFY4Sa8ENpK4bWZAqcZBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016383;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=BeT8o9zwSlnLtq9j9DgF6ViDJeKsLDw/+4F73EMjHGA=;
	b=fnVW8PPoX7L50LJ4cdAqlW5YxY6JIUkkP7FJnIK9wyKg04yuWW8URXnZr44j38Yvp/G9
	 RUyFR1dE1ij+LI61/i3gRFSbxN7i5fYxOZQwhpmHCgPcfzBgJ88M8ag8sbc15dTe1sEf7
	 SkrqRl67ogZRz/EnQKP0Xu2F/AhvJzcdXB4Qb/KI36H30SujUrXqGiolT/yRa+z97Pb00
	 NvIZhrRv2vrd1Xm//RZIrBOs8lGzEeJ8Hsc6jjkDoXv3JcbgOj6bU6oFCMxuSDNTffUoz
	 nv5Mwmh4T0aaMAlVnsiG/+gNrs53ZpwReUF4LFeLzM8cxgaXJ1YiDyAWe8MLKB13uzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oiFcQIdk;
	arc=none smtp.remote-ip=91.218.175.100
Received: from mta0.migadu.com (out-100.mta0.migadu.com [91.218.175.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499D60A2604
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5499D60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oiFcQIdk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wMdnxRH2CVpTLTzKpSfG28VPEZAexl+z8B0TSAsADZI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795016379; v=1; x=1795621179;
 b=oiFcQIdk8MIaMrcy8hisTYwWCPpR+XYmAub/rzoMtm2BbUK4xHq1MVkrNJOV4TnuVOH6V4SC
 dcma58JceBAIByClpLjHXRxqKIt4xpnx74P1G6KKxAdXg+KL4IOcGz7Q/Wyd+IE7Af950uyLgPO
 UK893Se9BOIxYHTxeM9gFAVQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cff401f8981e3de6;
	Wed, 18 Nov 2026 15:39:39 +0000
X-Mizu-Trace-ID: cff401f8981e3de6
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 18 Nov 2026 10:39:19 -0500
Subject: [PATCH v4 2/2] nvme-multipath: don't wait for a grace period in
 nvme_mpath_set_live()
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
Message-Id: <20261118-bug-nvme-mpath-set-live-srcu-v4-2-21f368376c8c@linux.dev>
References: <20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev>
In-Reply-To: <20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>, Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.13.0

When a path goes live, nvme_mpath_set_live() waits for an SRCU grace
period of the namespace head before kicking the requeue work, so that
bios which found no usable path are on the requeue list by the time it
runs.

The ANA work calls nvme_mpath_set_live() for every namespace that
becomes optimized or non-optimized, one after another, so an ANA change
waits for one grace period per namespace.

Start the grace period with start_poll_synchronize_srcu() instead and
have nvme_requeue_work() wait for it only if it has not completed yet.
Take the cookie under head->lock, so that concurrent callers store
their cookies in order and the requeue work never sees an older one.
The grace periods of all namespaces then run in parallel, and requeue
work kicked for other reasons finds the cookie completed and does not
wait.

Flipping an ANA group from inaccessible to optimized ten times on each
of two boots over nvme-tcp loopback, nvme_read_ana_log() takes (median,
min-max in parentheses):

  namespaces  before (ms)          after (ms)        change
         256  52.0 (35.4-74.7)     8.7 (2.5-19.6)      -83%
        1024  154.3 (123.9-193.8)  43.1 (18.2-58.3)    -72%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
---
 drivers/nvme/host/multipath.c | 15 ++++++++++++++-
 drivers/nvme/host/nvme.h      |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 881d8a0145255..cf12d76796453 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -712,6 +712,11 @@ static void nvme_requeue_work(struct work_struct *work)
 		container_of(work, struct nvme_ns_head, requeue_work);
 	struct bio *bio, *next;
 
+	/* Let bios that found no usable path reach the requeue list first. */
+	if (!poll_state_synchronize_srcu(&head->srcu,
+					 READ_ONCE(head->requeue_srcu_cookie)))
+		synchronize_srcu(&head->srcu);
+
 	spin_lock_irq(&head->requeue_lock);
 	next = bio_list_get(&head->requeue_list);
 	spin_unlock_irq(&head->requeue_lock);
@@ -767,6 +772,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	mutex_init(&head->lock);
 	spin_lock_init(&head->requeue_lock);
 	INIT_WORK(&head->requeue_work, nvme_requeue_work);
+	head->requeue_srcu_cookie = get_completed_synchronize_srcu();
 	INIT_WORK(&head->partition_scan_work, nvme_partition_scan_work);
 	INIT_DELAYED_WORK(&head->remove_work, nvme_remove_head_work);
 
@@ -849,9 +855,16 @@ static void nvme_mpath_set_live(struct nvme_ns *ns)
 			__nvme_find_path(head, node);
 		srcu_read_unlock(&head->srcu, srcu_idx);
 	}
+	/*
+	 * Have nvme_requeue_work() wait for the grace period instead of
+	 * blocking here, so that namespaces going live together, e.g. on
+	 * an ANA change, do not wait for one grace period each. Start it
+	 * under head->lock so that the newest cookie is stored last.
+	 */
+	WRITE_ONCE(head->requeue_srcu_cookie,
+		   start_poll_synchronize_srcu(&head->srcu));
 	mutex_unlock(&head->lock);
 
-	synchronize_srcu(&head->srcu);
 	nvme_mpath_revalidate_zones(head);
 	kblockd_schedule_work(&head->requeue_work);
 }
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 8833a463f1c84..3fff9b394b1cd 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -587,6 +587,7 @@ struct nvme_ns_head {
 		__guarded_by(&requeue_lock);
 	spinlock_t		requeue_lock;
 	struct work_struct	requeue_work;
+	unsigned long		requeue_srcu_cookie;
 	struct work_struct	partition_scan_work;
 	struct mutex		lock;
 	unsigned long		flags;

-- 
2.43.0

