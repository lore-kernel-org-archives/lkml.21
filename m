Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310367;
	b=4C/S2iFzvbCYZC2hiHDpOBEb5Av9Tq2a3c1OSurlBoGpbiziGdD+sBFZ4B3cTQpjAQna
	 N+aWX4Y9lWA9tHDCpaAY/WrYZby/LWLnp+BGVIn96b99ENgeIoC3+3VCfqzToAqkrhYj4
	 vnDJ4QIzurWkGjvnPBkBFI61ql9/MROi6y+KRlaTWX9DU1z7e3MclkL/R9klGGbh4Kmdt
	 TUztByTemUpaXg4+0/hp8PjBXbxESsbVzFXSp/TW/OHrOH9N/UNYL315NQHqFYA4TSiYj
	 RtYE7K1+/ofmG7sAcsAYWrxbIkcMHoniJNSd6XPilZNXtM1n/FSnO8nM4Nd19eY1nng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310367;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=fWJHdnp4YwCtWnVVzUop7dWReDiuHEz0dyfLuLn6Ww4=;
	b=uBJhQssX+F8Ep1j4o6MWkPzFBMvC6xudN5i5LCg/I5L3lI+JfRH4cKjgXUtvuocu9FMm
	 XrlWorD//bCgxKpF6gYJ3VdeAkab2rA0r52Uhb/XIzut8l53a7S+BSD6eOFTp1NWWZ7+a
	 Z0uXm9KTklSCPeUAnR2ZUzKegf3k3jltLDlIQwzws3gCu3saBV23l19W4WUrBaTSlb20A
	 IR7nxo26VWNNbKN38f94EL3cRx3QfF1QLNTdF0taIvsYKeBXeS4zZNGXAgghpQ+3rmi6f
	 d87G0tJ+jNtW7755Nr/Y1D1LJxNsKEhwonmh1Bw4D8sUZG+kVt0pkrSU2dnvnsARxPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlOgVTX+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B77606A698
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B77606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlOgVTX+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795310365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fWJHdnp4YwCtWnVVzUop7dWReDiuHEz0dyfLuLn6Ww4=;
	b=RlOgVTX+7Jq2wHEkpVQ3LxOSllkBxDTJGHrhF3K7mkbrTThRqE7CFT1SJLJW2fVMyVKhIV
	D1ez64OKOopTaGOsc9gzSMYSZQMBTaysoRZp4Ov0pfoGcDoYs2wTaS4D73/eEm0SjHK72W
	b124rnnm+e7lAm0+D1Lyxh/5d1rw5BE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-e156JmlfNfOY5triLT84SA-1; Sun,
 22 Nov 2026 01:19:21 +0000
X-MC-Unique: e156JmlfNfOY5triLT84SA-1
X-Mimecast-MFC-AGG-ID: e156JmlfNfOY5triLT84SA_1795310359
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3737E1955F18;
	Sun, 22 Nov 2026 01:19:19 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 553073003EBE;
	Sun, 22 Nov 2026 01:19:15 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Hannes Reinecke <hare@suse.de>,
	Chris Leech <cleech@redhat.com>,
	Seiji Nishikawa <snishika@redhat.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] nvme-tcp: remove the direct send path
Date: Sun, 22 Nov 2026 10:18:25 +0900
Message-ID: <20261122011826.1959697-2-snishika@redhat.com>
In-Reply-To: <20261122011826.1959697-1-snishika@redhat.com>
References: <20261122011826.1959697-1-snishika@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

nvme_tcp_queue_request() sends the request directly from the submitting
context when it runs on the io_cpu of the queue, the queue is empty and
it can take send_mutex. Commit db5ad6b7f8cd ("nvme-tcp: try to send
request in queue_rq context") added this to skip the workqueue hop when
the queue is idle.

Since then this path has needed a series of fixes for races and
priority inversions between it and io_work. These are
commit 5c11f7d9f843 ("nvme-tcp: Fix possible race of io_work and direct
send"), commit a0fdd1418007 ("nvme-tcp: rerun io_work if req_list is
not empty"), commit 70f437fb4395 ("nvme-tcp: fix io_work priority
inversion"), commit 08acb54b063a ("nvme-tcp: defer TLS inline send to
io_work") and commit 5db358f3a7f9 ("nvme-tcp: fix io_work priority
inversion when send_mutex is held").

All of them come from having 2 contexts that send on the same queue and
coordinate through send_mutex, while io_work runs on a high priority
workqueue and the submitting task does not.

Remove the direct send path and always send from io_work. TLS queues
already work this way since 08acb54b063a. With a single sender, io_work
has to be queued whenever the last request of a batch is added, so the
has_pending check in nvme_tcp_queue_request() goes away too, and
nvme_tcp_send_all() has no caller left.

Suggested-by: Hannes Reinecke <hare@suse.de>
Assisted-by: LLM
Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
---
 drivers/nvme/host/tcp.c | 33 ++-------------------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 62a594b8ab9b..2b832ac3068a 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -213,7 +213,6 @@ struct nvme_tcp_ctrl {
 static struct workqueue_struct *nvme_tcp_wq;
 static const struct blk_mq_ops nvme_tcp_mq_ops;
 static const struct blk_mq_ops nvme_tcp_admin_mq_ops;
-static int nvme_tcp_try_send(struct nvme_tcp_queue *queue);
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 /* lockdep can detect a circular dependency of the form
@@ -420,16 +419,6 @@ static inline void nvme_tcp_advance_req(struct nvme_tcp_request *req,
 	}
 }
 
-static inline void nvme_tcp_send_all(struct nvme_tcp_queue *queue)
-{
-	int ret;
-
-	/* drain the send queue as much as we can... */
-	do {
-		ret = nvme_tcp_try_send(queue);
-	} while (ret > 0);
-}
-
 static inline bool nvme_tcp_queue_has_pending(struct nvme_tcp_queue *queue)
 {
 	return !list_empty(&queue->send_list) ||
@@ -446,28 +435,10 @@ static inline void nvme_tcp_queue_request(struct nvme_tcp_request *req,
 		bool last)
 {
 	struct nvme_tcp_queue *queue = req->queue;
-	bool empty;
 
-	empty = llist_add(&req->lentry, &queue->req_list) &&
-		list_empty(&queue->send_list) && !queue->request;
-
-	/*
-	 * if we're the first on the send_list and we can try to send
-	 * directly, otherwise queue io_work. Also, only do that if we
-	 * are on the same cpu, so we don't introduce contention.
-	 *
-	 * TLS kTLS send takes ctx->tx_lock while blk_mq holds set->srcu.
-	 * lockdep reports circular locking via elevator_lock.  Defer TLS
-	 * sends to the io workqueue instead of inline from this path.
-	 */
-	if (queue->io_cpu == raw_smp_processor_id() &&
-	    !nvme_tcp_queue_tls(queue) &&
-	    empty && mutex_trylock(&queue->send_mutex)) {
-		nvme_tcp_send_all(queue);
-		mutex_unlock(&queue->send_mutex);
-	}
+	llist_add(&req->lentry, &queue->req_list);
 
-	if (last && nvme_tcp_queue_has_pending(queue))
+	if (last)
 		queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
 }
 
-- 
2.56.1

