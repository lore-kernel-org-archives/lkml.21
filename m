Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108433;
	b=oEJZ7Ub5Yu1BW1bydYaW3F0rvWga5A/+yABOREGo95oGbGJBzo//SNN5/xmf2na5+uFT
	 ZZAFyzLIshQ8w8N6Om0HyDXmIpeCduwFCjjOxq4BJucobX4chrW9v+ogHgdBFjGD4FIDl
	 3/1C3YVH+6netXRCgQo/SYexJOrKLOzSxIFw7kt8mcWkx1ObC9BBu3Hb6lDozldQ1uBa3
	 9jViCG0UCvo+6v0LRZ9TjLKn9jBHQilOb3VHnL9sBIawgQOSiUj7KjrOu2bNW7WqGYl7N
	 4aTmDLq90XSKB9BL2BZiMCk6rzCgb65xh8YN1afvni5Eu77eQSnG4S2MatIkWtrfftg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108433;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer:X-Mutt-Fcc;
	bh=2lJR0AnwTJygazs23JNSPoGHwUkRi2+i1ThgrxLVwl0=;
	b=kFjDitXMAPGLHfA+NBJ1zrHoiASpuDEapaQzu+qLTRUKEEV/1few6TXrOrRJ3vrpy0uU
	 xC0lRD97+UT5eIWEb76IsSpEjEcLsO/FCAVIv2H9xTZdOL5Yfw/pOxFVvEz7/5LCvWl0Q
	 iL+oenBBvOc9vQsk7/fjsEVfejSrUQv8LdyR0GFTHn7wv5lHkKWrmbzeS3muLCqVzdOZ+
	 PHm40bZAkYbX7RLjMN6I/aDOAXx/Z/1WMUANS0WQLz7xVYqjlfg27r568A4Fa1y4cseO0
	 Dj2hPkzU+PNAYmGb0YXt9T0rDah1GOprkcWHj4fuN9mkvvsd8zf5QTaLycte9/Jpv0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ItOKK64u;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="sCJSCpP/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B82E606A608
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B82E606A608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ItOKK64u;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sCJSCpP/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795108431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=2lJR0AnwTJygazs23JNSPoGHwUkRi2+i1ThgrxLVwl0=;
	b=ItOKK64uCmOLtzmkK7jI0ULNCWKCq0jRylEwkSGppUqohmt155wnGp9VgmndqJ3JpgRrLz
	qpIfRBmqOvvHPeHFRsvP9jd8ydeIFg25zHSyvKQWhA2W/IBklEl3RqDA01v1v4w3k5pTot
	jqRxX3sS21OZvBj4/PMZ/9LZH0+3etI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-3kSoYzHMN6-E2Gj2mkOZ-Q-1; Thu, 19 Nov 2026 17:13:50 +0000
X-MC-Unique: 3kSoYzHMN6-E2Gj2mkOZ-Q-1
X-Mimecast-MFC-AGG-ID: 3kSoYzHMN6-E2Gj2mkOZ-Q_1795108429
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so1925198f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795108429; x=1795713229; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lJR0AnwTJygazs23JNSPoGHwUkRi2+i1ThgrxLVwl0=;
        b=sCJSCpP/br0K0hX0m3RUtoZ98KPapIN1PE+ne7Djp4ZzuGiIjdzszivo0WGXdiyI2u
         S4UtvkFs2u3qyzwZLsf46j0Q9VwOmLySyiIKIM5ucJlfKHyloCqqlu4QwKl5YhoQHzpA
         O6hyd1uOyOsv8EP5ZQpdLU1xIg5f1nAaYnpuhM+NZhO8AfYskkHvls4xS8abrdOKRtBO
         IJv4NWuQwUVO55PxPkmneNZBxSY0iH8ndTslaw1Q2tMpIam7fXlvJDEzQJlFQjVyFHXb
         UPgl2/8JPqTyxNXGMXDJDvPG4AnrW4qq/3ppFqdAxg3QaA15VDY1GtmOyyPX8CdIGTlq
         oVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108429; x=1795713229;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2lJR0AnwTJygazs23JNSPoGHwUkRi2+i1ThgrxLVwl0=;
        b=ImaejsRrY4pm0EamkIlGDnpZBbI6J4wqagyV0PHSYHlmdIH5VH56k40H8hTbV0Ptkn
         8vwtfldizSkI/JuPMhIw30QL0INj3kIJrCVmhzv3uYIVhjPyNyJLUHc+AtXBcvoLE8Zz
         BmkpsLRbUiOk1jIuIflqAd719yKIq5WCMA3cstbVplD6n4oz60A/3lZXAJaQkOUt8PoH
         X/8l56t4w/9SiORsDteUmWWbAnMGZaAi86ACRy/YvCFHZnwdeL6XGOWHo88MMEM2rf0a
         9YLuzvALQGmq6ficOwRNqs9olssFB/FrkDoz4qTO9Ej7nHJKOetxXrjH7Sp9xQccrD0V
         Od4Q==
X-Gm-Message-State: APuU4Z9EA/p0GeQTnkxQld8YVjQv8T//b4CCzMYsuzklkMzhmqh7Vzf3
	WSr9fHzySCBnS10PG9uo32QI+B32ONwNSErsqeQdIidlMTzHccYbLuo1Ii4ElUdIjHWrhCRcGT0
	og6g8/uDLP55z+mNZ9yeAmU+moBLI7oEew74JBb1IrdbMGhZn4bX605skg8gPqiDnBso1VPY3my
	qYbsY5uvKc1e4aPrJsrBRJ8CxHdv/ceiZTCnoddYwrYAk=
X-Gm-Gg: AZFdTZfZBMkJI0JRqstIIWDLUBw11jmRPe07KfD1OTrCBJKtS7+4TzOXK3aeOVUDu7v
	NgBGBa704jZMzVZ4X1Qk5PLYRogVLxX6GuIlkAKXppYhO0mREqF/nSgJ75RNchz/3eL2vn9jdBl
	CzeqWtTgphcO/14XrHXAWxE6QtGZLIthuDMu6zZImEwsotPOXfYvFy2T0yfkX4ZGLysfneUSCpX
	UJmkAQ+f9GTKvQzM2apzeb2jaOqhRTOSKq4zJZ0DG06heVT9s+2Tnc0Y/iBXmGVbFdisMJOi/Xb
	u45fMhgZrbMRbOMKIdnNqknkTLMpN6xZ6+h7qY/KxIZpwGjgCUGo5JwBIWVoANQCdU8RBnVcYho
	rJYp+9EwKdKtsmBuEXqpOV91XBitrTKMIPeO84uuZcg==
X-Received: by 2002:a05:6000:26ca:b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4abad5ac748mr34950f8f.8.1795108428456;
        Thu, 19 Nov 2026 09:13:48 -0800 (PST)
X-Received: by 2002:a05:6000:26ca:b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4abad5ac748mr34864f8f.8.1795108427852;
        Thu, 19 Nov 2026 09:13:47 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm723019f8f.58.2026.11.19.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:13:47 -0800 (PST)
Date: Thu, 19 Nov 2026 12:13:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Congjie Zhou <zcjie0802@qq.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH net] virtio_net: mask callbacks before handing off NAPI
 ownership
Message-ID: <ad74886a8429a862c00d1e42f1dc746f2924b75f.1795108341.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Virtio is special in that enabling or disabling callbacks (interrupts)
accesses shared virtqueue state and must be serialized with polling. It
therefore enables callbacks before completing NAPI, and disables them
again if completion returns false.

With napi_complete_done(), that false return can come after ownership has
passed to another poll. The first poll can then disable callbacks after
its successor has enabled them, leaving RX stalled. Virtio therefore
needs to disable callbacks before handing off NAPI ownership.

Add a prepare/finish NAPI completion API so virtio-net can mask interrupts
before handing ownership off.

Reported-by: Congjie Zhou <zcjie0802@qq.com>
Closes: https://lore.kernel.org/netdev/tencent_D0650F8CA2AAE4C258BFE5BCE805CDB4CA0A@qq.com/
Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
Message-ID: <20261119064843-mutt-send-email-mst@kernel.org>
Assisted-by: LLM
Tested-by: Congjie Zhou <zcjie0802@qq.com>

---

This preserves interrupt suppression without a callback or an additional
data-path barrier. Ordinary napi_complete_done() compiles identically in
the tested configuration.

Tested on x86-64 KVM with lock debugging, including IRQ deferral, concurrent
scheduling, busy polling, netpoll, and threaded NAPI. Split and packed
virtqueue TCP RX tests with IRQ deferral and busy polling also passed.

 drivers/net/virtio_net.c  |  4 ++-
 include/linux/netdevice.h |  9 +++++
 net/core/dev.c            | 69 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..de370a39bc8fa 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -730,16 +730,18 @@ static void virtqueue_napi_schedule(struct napi_struct *napi,
 static bool virtqueue_napi_complete(struct napi_struct *napi,
 				    struct virtqueue *vq, int processed)
 {
+	struct napi_completion completion;
 	int opaque;
 
 	opaque = virtqueue_enable_cb_prepare(vq);
-	if (napi_complete_done(napi, processed)) {
+	if (napi_complete_done_prepare(napi, processed, &completion)) {
 		if (unlikely(virtqueue_poll(vq, opaque)))
 			virtqueue_napi_schedule(napi, vq);
 		else
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		napi_complete_done_finish(napi, &completion);
 	}
 
 	return false;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344b..a182882624d6a 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -599,6 +599,15 @@ static inline void napi_schedule_irqoff(struct napi_struct *n)
  */
 bool napi_complete_done(struct napi_struct *n, int work_done);
 
+struct napi_completion {
+	unsigned long timeout;
+};
+
+bool napi_complete_done_prepare(struct napi_struct *n, int work_done,
+				struct napi_completion *completion);
+void napi_complete_done_finish(struct napi_struct *n,
+			       struct napi_completion *completion);
+
 static inline bool napi_complete(struct napi_struct *n)
 {
 	return napi_complete_done(n, 0);
diff --git a/net/core/dev.c b/net/core/dev.c
index 3ac700d37e596..fa9baa70e9d72 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6999,9 +6999,17 @@ void __napi_schedule_irqoff(struct napi_struct *n)
 }
 EXPORT_SYMBOL(__napi_schedule_irqoff);
 
-bool napi_complete_done(struct napi_struct *n, int work_done)
+static __always_inline bool
+__napi_complete_done_finish(struct napi_struct *n, unsigned long timeout,
+			    bool ret, bool allow_pending,
+			    struct napi_completion *completion);
+
+static __always_inline bool
+__napi_complete_done_prepare(struct napi_struct *n, int work_done,
+			     bool allow_pending,
+			     struct napi_completion *completion)
 {
-	unsigned long flags, val, new, timeout = 0;
+	unsigned long flags, timeout = 0;
 	bool ret = true;
 
 	/*
@@ -7041,10 +7049,25 @@ bool napi_complete_done(struct napi_struct *n, int work_done)
 	}
 	WRITE_ONCE(n->list_owner, -1);
 
-	val = READ_ONCE(n->state);
+	return __napi_complete_done_finish(n, timeout, ret, allow_pending,
+					   completion);
+}
+
+static __always_inline bool
+__napi_complete_done_finish(struct napi_struct *n, unsigned long timeout,
+			    bool ret, bool allow_pending,
+			    struct napi_completion *completion)
+{
+	unsigned long val = READ_ONCE(n->state), new;
+
 	do {
 		WARN_ON_ONCE(!(val & NAPIF_STATE_SCHED));
 
+		if (allow_pending && (!ret || (val & NAPIF_STATE_MISSED))) {
+			completion->timeout = timeout;
+			return false;
+		}
+
 		new = val & ~(NAPIF_STATE_MISSED | NAPIF_STATE_SCHED |
 			      NAPIF_STATE_SCHED_THREADED |
 			      NAPIF_STATE_PREFER_BUSY_POLL);
@@ -7067,8 +7090,48 @@ bool napi_complete_done(struct napi_struct *n, int work_done)
 			      HRTIMER_MODE_REL_PINNED);
 	return ret;
 }
+
+bool napi_complete_done(struct napi_struct *n, int work_done)
+{
+	return __napi_complete_done_prepare(n, work_done, false, NULL);
+}
 EXPORT_SYMBOL(napi_complete_done);
 
+/**
+ * napi_complete_done_prepare - prepare NAPI completion
+ * @n: NAPI context
+ * @work_done: number of packets processed
+ * @completion: opaque completion token
+ *
+ * Return: true if NAPI is complete and interrupts may remain enabled;
+ * false if ownership is retained. On false, mask interrupts and call
+ * napi_complete_done_finish().
+ */
+bool napi_complete_done_prepare(struct napi_struct *n, int work_done,
+				struct napi_completion *completion)
+{
+	return __napi_complete_done_prepare(n, work_done, true, completion);
+}
+EXPORT_SYMBOL_GPL(napi_complete_done_prepare);
+
+/**
+ * napi_complete_done_finish - finish NAPI completion after masking interrupts
+ * @n: NAPI context
+ * @completion: token passed to napi_complete_done_prepare()
+ *
+ * The caller must provide any device-specific interrupt ordering.
+ */
+void napi_complete_done_finish(struct napi_struct *n,
+			       struct napi_completion *completion)
+{
+	if (unlikely(n->state & (NAPIF_STATE_NPSVC |
+				 NAPIF_STATE_IN_BUSY_POLL)))
+		return;
+
+	__napi_complete_done_finish(n, completion->timeout, false, false, NULL);
+}
+EXPORT_SYMBOL_GPL(napi_complete_done_finish);
+
 static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 {
 	struct llist_node *free_list;
-- 
MST

