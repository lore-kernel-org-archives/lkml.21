Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683806;
	b=I0CVPmuir5fgY7dX4WRiO59XWh0tj1kt+KPTLdeqWBT4tLqbRfNCJsF+DmS8kDcnBgkL
	 vKpbe/j4rmwNEfllLH3DMlhgUqIZLTTwhQ4AaJY+VZrpPQTWl3mOnAh0IS43bW3+1wiHd
	 92HOTyNl2N6I+DM5zKJ1atBzj1/uiK/SCTMgy085OQYHE9Y96DjHsc5QqOSt3m1/LbGnw
	 h+BarD3IN9afeUiF+l8xyCCMGS3vNDQUgxU5gomo2eEWUJCS9W99trw2IKOVkIQ4xteAf
	 RknPftDZ29gN38UxuB4Do/HdPI5kV4xCW+yyKbpbUBuuZvmrhkTRuOv2iU/deJX9g9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k0DNiUp5NyvW/4XUsg9FRZJVc/nhkiHumSk1tHXzyqo=;
	b=oGwy4GnqRH+eQsQzI3+kR04gJYg4/H89Ycg+gusC6553JbzEa41eonJysbMKIsJ9FxXQ
	 tLG0pxt1AhvTIWln17gB02+DjsBUhwsj7+4EZyZGrc/QU+ORXCJvektiEuhoXPgwg6Pqu
	 ifVBo7nTdHIvDjVQIBvCYiJUcg+z151o5Wds6aVFUhr41TtgSVX90GDduMlCipBI1aA0b
	 dyOgIpcBZ9jIMoBA1xuVotZb1UgPq2pmTKTiFZOBWbD682uGTJlMwBlWhaTeC0sfi+7Ly
	 8eA6o/zim9/r4QL7PXMThorcnIRR7mCpWlm2sELlpmruwfZocQiiZQID1f43XuboUcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YmjVwlmk;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B28606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YmjVwlmk
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1724904eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683805; x=1796288605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0DNiUp5NyvW/4XUsg9FRZJVc/nhkiHumSk1tHXzyqo=;
        b=YmjVwlmkJBvguOYJQ3CQlD0nNvWYdJ8p6VLHuvbpG+Cpdnn+XxYWkB0I9cAXk5oTW2
         O7Y/lkn+tpyJOUuYWB4SFQJumAd+SaKwVjdKrdGujdOS85419t+/3CF6/BP8jg1FAfrw
         F8+pSWh9vcpox1XrhvxJi+h+gtFkNtiG1QTjYLYn9oRgyHjGOS73metccjgNnNrfT/Kr
         VL84jeCFAqWeUpsKwKaL12LPDsCoucISPAEHVG1equIm5042uTBwrLC0QhZeVqDrF5jd
         hOg+Gzprz7yTVt4jwMxg8px84pSR0WsMP4zaq0d51dfKqKdOMMkpMyIipAqmFARcuboE
         zxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683805; x=1796288605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0DNiUp5NyvW/4XUsg9FRZJVc/nhkiHumSk1tHXzyqo=;
        b=AMseVlLjlJdjza3cQq3samGlSqk18kYMa0K9go75ouKzh4HRQqQLMMV7fSuABoJxYL
         0OR9rngzcPeP64ZdDXn6lLJ1ydnQL6dxoNjlPlW/C0RLNQsWPE6aTgR2a9mbW/m/5wq4
         SInKqBPfqBWamtHDNEufJdpWJpolWHvD652QKZCLmEWOxWfyiOJG9IcGNoV5rSviLDE6
         Zvdw+G3SKX4wJJH+9XlFpidxJETXgAIvX0+W+g4GqaC7dgxhlmE2vBfno4sTHKTXVDvZ
         AwQebs6fIyibhEgqXNeaDm2C/9rC8hnqfOSUaZLprnELADW1QHGXMjJljMr+Nm8xpmRE
         n8vg==
X-Forwarded-Encrypted: i=1; AL+hErFe3npr+lOZtI/V64NM0GBNlAZpxTwy7bcDsQy9dp92s8NHWXPNutoLBcRaPBXo2sqnTJFolEjyx8ZoB9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ivAxPzd2N34PLmnYgieTlgFRssyJMI1Rrk+Aa0XfroJKr+hKN
	lMvyZ0mJama4Gd67Me4eszOB1dvRPmzDk4Sh6bQqa1ezSvC/kSwPFljY
X-Gm-Gg: AZFdTZe6Kk6987s0SSb3BsjsqYiP6W80+4Y0TEsCvNzdBhfYIRURKTeqCtfZI/QW6Bv
	bFmoF8Ehkk8fI0Y2PN55trwgOTUJn4NL1tnBE/IrRR31DANgFGJQ6qdCrvMgZqL3/H0pOxp0aMm
	fA/wcFJk+aMCkr7izoApCUhSsUA0cfJvVaVKG8HqjLrA0zy4sRKdivVUAskE5uNs+kmrC9oZJdK
	RclmgIu4XA+wGODqvAWvNrJdsvbo3xmqqi4Iw7oaf8F1wS0ucHxlKPRl+31bcB01iqFRVG8fuk6
	hKCwD1KR6ppyQM6iRiX5z8T70dEJpRa9/yjIKr6vz9FBiW/cba8FsuxvZJ+QCUWBz4vsX9wcnqa
	f8d14Qy8BQJIJPVx0M4xGe+nLHdFVsIb83fcoIgp3Z4pct61W6nY209VhE8sDeS21bMxqVMn9Kk
	+r/Tr1/IbaSitttYi086EDJMNbRIi0+A8MbXA1GlkLKTv0A01gG8RQ7UMMmTX3EahXaBJaLcuwQ
	j/hR0UhD1yEqEAsCsGkOwliFSTVwrmzUesrpOvcer2uv9Pr3KHfSiifqA8lF2DKIaQVPx7uKO51
	OS0/ClGJ6c4wyEpWyXh4QRRGOinma67G4pm/elJzKN5x7YYFTLziId6y
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr19785351eec.28.1795683804902;
        Thu, 26 Nov 2026 01:03:24 -0800 (PST)
Received: from jiayi-vm-sprl-server17.local ([155.69.195.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm56816065eec.13.2026.11.26.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:03:24 -0800 (PST)
From: Jiayi Zhang <zhangjiayi1014@gmail.com>
To: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mst@redhat.com,
	847807867@qq.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Jiayi Zhang <zhangjiayi1014@gmail.com>
Subject: [PATCH net] tap: do not take consumer_lock in tap_sock_destruct()
Date: Thu, 26 Nov 2026 09:03:06 +0000
Message-ID: <20261126090306.3416278-1-zhangjiayi1014@gmail.com>
X-Mailer: git-send-email 2.53.0
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

syzbot reported an inconsistent lock state for the consumer_lock of the
ptr_ring of a tap queue:

  WARNING: inconsistent lock state
  inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
  (&r->consumer_lock#4){+.?.}-{3:3}, at: tap_sock_destruct+0x13b/0x330
  {IN-SOFTIRQ-W} state was registered at:
    ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
    ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
    tap_sock_destruct+0x13b/0x330 drivers/net/tap.c:444
    __sk_destruct+0x85/0xb70 net/core/sock.c:2386
    sock_wfree+0x254/0x7f0 net/core/sock.c:2754
    [...]
    llc_rcv+0x4d5/0xa70 net/llc/llc_input.c:112
  Call Trace:
    tap_sock_destruct+0x13b/0x330 drivers/net/tap.c:444
    __sk_destruct+0x85/0xb70 net/core/sock.c:2386
    tap_put_queue drivers/net/tap.c:179 [inline]
    tap_release+0x2fc/0x450 drivers/net/tap.c:517

tap_sock_destruct() drains the ring with ptr_ring_cleanup(), which takes
consumer_lock with spin_lock(). The destructor runs in process context
when tap_release() drops the last reference. It also runs in softirq
context: skbs sent through the tap file are charged to the socket by
sock_alloc_send_pskb(), so if some of them are still in flight when the
file is closed, the socket is destroyed from sock_wfree() when the last
one is freed, here by llc_rcv().

All other users of the lock run in process context: tap_do_read(),
tap_poll(), tap_peek_len() and vhost-net's vhost_net_buf_produce() take
it with spin_lock(), tap_queue_resize() with spin_lock_bh().

This cannot deadlock: a ring that is being destroyed has no other user,
and lockdep complains because all tap rings share one lock class. When
the destructor runs, the file and the device have dropped their
references and the queue was unlinked from the device under RTNL.
tap_handle_frame() can no longer reach it either: tap_put_queue() waits
for an RCU grace period, and the dellink paths unregister the rx handler
before tap_del_queues().

So the destructor does not need the lock. Drain the ring with
__ptr_ring_consume() and let ptr_ring_cleanup() only free the array.
Making every user of the lock BH-safe instead would add work to the read
path of tap and of vhost-net for a ring that nobody else can access.

Tested with lockdep and KASAN, using the syzbot config. The syzbot
reproducer no longer triggers the report. I also wrote a test that
closes a macvtap queue while frames are still unread in its ring and
while frames it sent are held back by netem, so that the destructor
runs in softirq. It triggers the same report on an unpatched kernel and
runs clean with this patch. The tap selftest passes, and so does
tools/virtio/vhost_net_test changed to use a macvtap queue as backend.

Fixes: 362899b8725b ("macvtap: switch to use skb array")
Reported-by: syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d
Signed-off-by: Jiayi Zhang <zhangjiayi1014@gmail.com>
---
AI tools assisted with the analysis, the code and the changelog.

A patch for the same report was posted earlier today:
https://lore.kernel.org/r/tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com
It takes the lock with spin_lock_irqsave() in the destructor only. With
it applied, the close test above still triggers the report: the lock is
taken in softirq by tap_sock_destruct() and with softirqs enabled by
tap_poll().

 drivers/net/tap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..81dd616909d5 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -440,8 +440,12 @@ static void tap_sock_write_space(struct sock *sk)
 static void tap_sock_destruct(struct sock *sk)
 {
 	struct tap_queue *q = container_of(sk, struct tap_queue, sk);
+	struct sk_buff *skb;
 
-	ptr_ring_cleanup(&q->ring, __skb_array_destroy_skb);
+	/* The ring has no other user left: no need for consumer_lock. */
+	while ((skb = __ptr_ring_consume(&q->ring)))
+		kfree_skb(skb);
+	ptr_ring_cleanup(&q->ring, NULL);
 }
 
 static int tap_open(struct inode *inode, struct file *file)
-- 
2.53.0

