Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310372;
	b=ACRKOh0GEFF5KKTVxtesYFyKCaR1wC81kZwLxw+MUGeSZFRjSmJp3L2mxaTls3avwrCo
	 Qb+K386AVQe/Cv/9Te2KEtBgmR+HeROP36qStDDa4Php5vr1HChFItFe0oY8v05ibfyRp
	 BASMNib0RcnOmkYHW4SAxR6wdBxFKgZrlcuL6tUdqyfvKjEIA9Ft6Q1LpHRbVOfQnHlJF
	 S8Nip/54hzFjoVEBbAR/Y6Y4cDbss1OGM5yuASC2nvqtIq5tufYZIspW3HFwXkRgnwMZi
	 lX8duy60AhUjGRIOSr0hLAqoA9fh5tg68Ub8jI4IIIgdFM78KCEMci+GW0+yeQowXrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310372;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=vqC6JaIi9wPgKET/5n4UqUkNpxqYQB/CR4jVp4a3Hhs=;
	b=zQksp7SzTuy52nY67bhH6JZ8QEigLqXjocSRBA7Dv1kV31lH10xIS+Szo3SRGC8FHPzz
	 RHRi/8roWIm68bitCzQsd133acZcojJ4aYk2cI/7ziygHA1og8Mopf4DNVYGzBiDtiB4l
	 gMteNYfjqTqHive0F1MprHJGUcAhuH28hA5Gc8EJPD7LvIySheHTnNMD8vDNT+6OFXFMa
	 uoksM1/KEDIbUqsFm0PhG7HeGv2v1lAbXDv0HzX+UTOEjC0rwhuv/rFygLlVSU2ZLQcrV
	 N1JvIL2emaLsfXOFfhf7KjuJCKtvny2l2gVcV6DUODvUS6SyXIsCnhFPHI3gpPq6ofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XsEX2I3d;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D260A2609
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5D260A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XsEX2I3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795310370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqC6JaIi9wPgKET/5n4UqUkNpxqYQB/CR4jVp4a3Hhs=;
	b=XsEX2I3dTDRBNdEWYmxmlBlDfEUMaZcZT6XA0w9PNPDyK8jHHM59bcx9f353bIyHM73vvP
	cj4c8MybBbgL07ap2Y4XHX+as2JkEasWVzd8IbnxEfkT3gdvVP7iLDaPkPDzMd2PZ2iSby
	8UUclAO2r6kOwNSgPg7t+zFd6MKFiHs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-YEotI8lvOzmf2WVVKiJbYg-1; Sun,
 22 Nov 2026 01:19:26 +0000
X-MC-Unique: YEotI8lvOzmf2WVVKiJbYg-1
X-Mimecast-MFC-AGG-ID: YEotI8lvOzmf2WVVKiJbYg_1795310364
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B165180047B;
	Sun, 22 Nov 2026 01:19:24 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40F8C3003EC5;
	Sun, 22 Nov 2026 01:19:20 +0000 (UTC)
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
Subject: [RFC PATCH 2/2] nvme-tcp: remove send_mutex
Date: Sun, 22 Nov 2026 10:18:26 +0900
Message-ID: <20261122011826.1959697-3-snishika@redhat.com>
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

With the direct send path gone, io_work is the only context that sends
on a queue. A work item never runs concurrently with itself, so
send_mutex does not protect anything anymore.

Remove it, together with the mutex_trylock() in nvme_tcp_io_work() and
the got_send_mutex check, which is now always true.

Assisted-by: LLM
Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
---
 drivers/nvme/host/tcp.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 2b832ac3068a..b116268fe2f5 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -142,7 +142,6 @@ struct nvme_tcp_queue {
 	int			io_cpu;
 
 	struct mutex		queue_lock;
-	struct mutex		send_mutex;
 	struct mutex		pf_cache_lock;
 	struct llist_head	req_list;
 	struct list_head	send_list;
@@ -1482,18 +1481,13 @@ static void nvme_tcp_io_work(struct work_struct *w)
 
 	do {
 		bool pending = false;
-		bool got_send_mutex = false;
 		int result;
 
-		if (mutex_trylock(&queue->send_mutex)) {
-			got_send_mutex = true;
-			result = nvme_tcp_try_send(queue);
-			mutex_unlock(&queue->send_mutex);
-			if (result > 0)
-				pending = true;
-			else if (unlikely(result < 0))
-				break;
-		}
+		result = nvme_tcp_try_send(queue);
+		if (result > 0)
+			pending = true;
+		else if (unlikely(result < 0))
+			break;
 
 		result = nvme_tcp_try_recv(queue);
 		if (result > 0)
@@ -1501,13 +1495,8 @@ static void nvme_tcp_io_work(struct work_struct *w)
 		else if (unlikely(result < 0))
 			return;
 
-		/*
-		 * did we get some space after spending time in recv?
-		 * Only check this if we could take send_mutex. Otherwise
-		 * the task holding it sends the requests and queues io_work
-		 * again after it releases the mutex.
-		 */
-		if (got_send_mutex && nvme_tcp_queue_has_pending(queue) &&
+		/* did we get some space after spending time in recv? */
+		if (nvme_tcp_queue_has_pending(queue) &&
 		    sk_stream_is_writeable(queue->sock->sk))
 			pending = true;
 
@@ -2087,7 +2076,6 @@ static void nvme_tcp_init_queue(struct nvme_tcp_ctrl *ctrl, int qid)
 
 	queue->ctrl = ctrl;
 	mutex_init(&queue->queue_lock);
-	mutex_init(&queue->send_mutex);
 	mutex_init(&queue->pf_cache_lock);
 	INIT_WORK(&queue->io_work, nvme_tcp_io_work);
 	queue->hdr_digest = ctrl->ctrl.opts->hdr_digest;
@@ -2099,7 +2087,6 @@ static void nvme_tcp_exit_queue(struct nvme_tcp_ctrl *ctrl, int qid)
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
 
 	mutex_destroy(&queue->queue_lock);
-	mutex_destroy(&queue->send_mutex);
 	mutex_destroy(&queue->pf_cache_lock);
 }
 
-- 
2.56.1

