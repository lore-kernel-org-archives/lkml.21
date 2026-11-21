Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261326;
	b=MpkCx1BqVDbEJwapufUXHHoWJnrryUpgPqdwPqrwPNTBLHSfXXwBQBD4aMUAHaGtujYN
	 +p7UR5K/mzWz8omcdhifLtffQafzQpV7NbzRsTze9vJGKjmjUUwa5eIkjbufRLqT9TzWb
	 /RinIGxAWveIMdnpttihwHe87gyjFJNE5oI/AfZ/4hpjta5rrThY4B4r1921ybRAoCLFk
	 N8LexZcF2OhYrHq/74mlQWrR+4mood3cxaJDsqmE0pMec55DkSkzAE+muaxpV8VrCwtH9
	 2kuBU050+TeBL79nwp5ZJuwRkKgsi1np+PokjBQ1S0RK057hQq3aMXCvPCe53e3psOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GrCPnjv5Z6Dci31A0hwhpm1/xWI8LJ1YVMLpligaZfE=;
	b=Wrc9fS/kLD5PRDG4TW6OMrVIYoKV7mbG/jcPHs4gLUQOM6H4fdK7qODGv1M0FlM/eFEM
	 vFsRUw0AT04JL7fTEA9nmIRl63a2NPm0WJV6+j+ez5bXrH09DMXDzfme7BssOKrPa8rvA
	 z94pdB6jmBkH0tnXmgImd6997yXJgsm80o1uNZHqBit5hrdGhMmjaMtJFCwh5JmrGKepG
	 bFQEjDKFxzEYq7KkeL3ipYp/aehkHa3xt8lz5t514q8wlpmNlZPCB6gnGqAUEoVEVAC/k
	 FIcL3SK8KdlRqSckk4MAfiNjX4zLGGllTxRpalD56eZhk4QYklGV0Fe33UhXLThA2dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efJ20zfi;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C998606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C998606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efJ20zfi
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so844644a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795261325; x=1795866125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrCPnjv5Z6Dci31A0hwhpm1/xWI8LJ1YVMLpligaZfE=;
        b=efJ20zfipgq6k0kSqXeU+p/Cc4qQGvJKUbY//GzAWBS2YcI6aL1HdvJceSvK5+S+A/
         JAd/Nh5ddEaFqjxsg5cnBA3EIGGNlZ0Qj5RaiNow3mz6M7FqRj/IJhQxEd9xxAet+AIz
         ojP04+eL57UvEW7rTZHD043dAzqIRk5I6BTbBOz+EIIjCHmSHDmcF280zPkUfQBksoJ8
         /HnPKaeBZMMS8NOpLnPNcbACqPZa1cBIsqhgfAk1ir6W8EV8Ka9AeuST0WNYEPcPg1y2
         pGD/Iow4Yom1Y3mS3ADzv7+Itjt1aVHUKpU9W4mPS+hcYqvvFik2aNfPb3AqNXJIOSwr
         d5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261325; x=1795866125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrCPnjv5Z6Dci31A0hwhpm1/xWI8LJ1YVMLpligaZfE=;
        b=IlYFp/OHENF3TFQvLiFGnEpgwBh+FlpJZpdLaoCm3sASHlfwo1/Qhwsq57hOjA9Ba9
         Z6jcHIjXgfbREVh63LEJP4KAHd6VQg4TkgZ1rH6+gYD+6BzUiAtlfX42f3bzM5pwsu+O
         LsCN+DxtadE6DUMdMtErwO+3ueb+n7N/4B6u+Sgo8Klp9lQGenvt9ujdXtF8GNjKIKmu
         PpTmrNqCjwLTOjU3YM3P3jGD7ckH8G4ZYuWrHE+MZ9vvZMyJ1GGT6k0Au5kqWVH10zyA
         Dr2VdT855agGmgvhtWecxyj1uimiiGeA3TPKK55ub4WhLYEHWQ7pcpn7/NGg7QacW3va
         qlXA==
X-Forwarded-Encrypted: i=1; AL+hErHTGUmTlS1E/mbl3LV5tMgY/FRWYNohBRbwNFiLk5eERpty14daiGvDb8vk7qZRlwDP//GKf0GmQgEkWFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k07PKM3HOLB4waXG5tEcfdfy5/KOqYPD26cPbwRRxDApIAtA2
	XnSmg1hyjHZr+H733+0Hv97HSU+hc9ih8NlNK+hMRyr696Ed2MY7XFWjwP2jslYs
X-Gm-Gg: AZFdTZfkwq4LiFoC3/TEHFQIm5KyYTc2RljZ/HSOQJkPICzP9E9Sj7aGlU+xRs0Y0Ec
	a8hchfGADacZhqjFHybZXfKbHFQQxyfOE92GH1vmJfW2IMbFvnZATiwxZaaIvCV8GzKfV5UcgB3
	HUJw2FkKeCb6TyrNJHnJjA12upt8OdKzhE2u4BKQ1yRqAzNp7xWeuaQ2Bmuzb/BCGtWIBRgvjmL
	0Zhdd88pv7GiEJw4kaafZmI6D4kCvcxqznvA5Z2Si1o2AXAlSiS4fphPFTBjfsSRKPv/Ukb2UKM
	SHU5bkC6pj1acYSh4fQ4gIyIh7YfxQhu8sVPlW04pCKWcbH7aRcTI3LBcvEMwViWUXpDiEK0fH3
	1VZPIUefdGpTZnNM28aSlzi1JIADufSUp/UpK23SEQby+W0ZMjhCg4c4tzisS4h5W1o+t+kAhOu
	tSNQ7CBYx6HvTaRE9g6FdBgVBXD9emYSE+ZZ3hW0OyShuV8/NUvhrG+xppo9CndONxk4CzKLGdB
	DlXW/ydx1OxtKJ/guomluyMGYcAbLxslVPHQPa1c9uUYWvb7ALXrU94XgWrFkGL9iKx48c+qXri
	Aqb3ZHyCuJYTGeoq4+eyGmNoMXBPo4Iw1UgaxKK+Ma3A8NUXeiCWaBQOmgGbChut3OBe7azOlfb
	ZRUZX3vmjKFe7J20L/iTBHUx5IpaMpI9UY8QgwdBh0bsQRxjb0HFx9A+UfrlJrIW7U6JFqiPk9l
	U32Vs=
X-Received: by 2002:a17:90b:50:b0:3b4:1926:9eb5 with SMTP id 98e67ed59e1d1-3b41c98a1dcmr5092333a91.10.1795261325368;
        Sat, 21 Nov 2026 03:42:05 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c29sm2439972a12.1.2026.11.21.03.42.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 03:42:04 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH v2] usb: gadget: f_ecm: serialize notification state with a spinlock
Date: Sat, 21 Nov 2026 21:41:54 +1000
Message-ID: <20261121114154.30274-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

ecm_do_notify() guards re-entry only with an atomic_read() of
notify_count, then fills ecm->notify_req, does atomic_inc() and
usb_ep_queue().  This check-fill-inc-queue sequence is not atomic and
runs from three contexts that share no lock: ecm_notify_complete(),
ecm_open()/ecm_close() (netdev up/down via u_ether) and ecm_set_alt().

When the completion handler decrements notify_count to 0 and re-enters
ecm_do_notify(), a concurrent ecm_close()/ecm_set_alt() can observe
notify_count == 0 in the window between the atomic_dec() and the next
atomic_inc(), and queue the same ecm->notify_req a second time.  The
request is then added to the endpoint queue twice (list_add corruption),
and notify_state is updated concurrently.

struct f_ecm has carried a FIXME about this missing locking.  The sibling
f_ncm already serializes the identical state machine with a per-instance
spinlock.  Do the same in f_ecm: take ecm->lock across the is_open update
and ecm_notify() in open/close/set_alt and across the state update in
ecm_notify_complete(), dropping it only around usb_ep_queue().

Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
v2:
 - Take ecm->lock with guard()/scoped_guard() in ecm_open(), ecm_close(),
   ecm_set_alt() and ecm_notify_complete() instead of explicit
   spin_lock()/spin_unlock() pairs (Greg Kroah-Hartman).  The lock is
   still dropped around usb_ep_queue() in ecm_do_notify(), as f_ncm does,
   because the completion can run before usb_ep_queue() returns.  No
   change to what is protected.
 - Sent as a new thread.
v1: https://lore.kernel.org/all/20261026060031.60582-1-yuz08559@gmail.com/

 drivers/usb/gadget/function/f_ecm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -59,9 +59,8 @@ struct f_ecm {
 	atomic_t			notify_count;
 	bool				is_open;
 
-	/* FIXME is_open needs some irq-ish locking
-	 * ... possibly the same as port.ioport
-	 */
+	/* protects the notification state machine */
+	spinlock_t			lock;
 };
 
 static inline struct f_ecm *func_to_ecm(struct usb_function *f)
@@ -414,7 +413,11 @@ static void ecm_do_notify(struct f_ecm *
 	event->wIndex = cpu_to_le16(ecm->ctrl_id);
 
 	atomic_inc(&ecm->notify_count);
+
+	/* ecm_notify_complete() can run before usb_ep_queue() returns */
+	spin_unlock(&ecm->lock);
 	status = usb_ep_queue(ecm->notify, req, GFP_ATOMIC);
+	spin_lock(&ecm->lock);
 	if (status < 0) {
 		atomic_dec(&ecm->notify_count);
 		DBG(cdev, "notify --> %d\n", status);
@@ -438,6 +441,8 @@ static void ecm_notify_complete(struct u
 	struct usb_composite_dev	*cdev = ecm->port.func.config->cdev;
 	struct usb_cdc_notification	*event = req->buf;
 
+	guard(spinlock)(&ecm->lock);
+
 	switch (req->status) {
 	case 0:
 		/* no fault */
@@ -588,7 +593,8 @@ static int ecm_set_alt(struct usb_functi
 		 * follow another (if the first is in flight), and instead
 		 * just guarantee that a speed notification is always sent.
 		 */
-		ecm_notify(ecm);
+		scoped_guard(spinlock, &ecm->lock)
+			ecm_notify(ecm);
 	} else
 		goto fail;
 
@@ -653,6 +659,8 @@ static void ecm_open(struct gether *geth
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	guard(spinlock)(&ecm->lock);
+
 	ecm->is_open = true;
 	ecm_notify(ecm);
 }
@@ -663,6 +671,8 @@ static void ecm_close(struct gether *get
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	guard(spinlock)(&ecm->lock);
+
 	ecm->is_open = false;
 	ecm_notify(ecm);
 }
@@ -942,6 +952,8 @@ static struct usb_function *ecm_alloc(st
 	if (!ecm)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock_init(&ecm->lock);
+
 	opts = container_of(fi, struct f_ecm_opts, func_inst);
 	mutex_lock(&opts->lock);
 	opts->refcnt++;
