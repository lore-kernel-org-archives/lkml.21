Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795749191;
	b=k9F5RYP0+ESI8iy9SKOpJpmfLZfAtx53X7DgzFf7H4nT8ZAskyZNnwrhFawnebChPklE
	 qsqSPfA8RiRIMv5CCqMO1o2WUNMInR6dK8HLgVSubrK/RZNAPfbAMvy4Irj+zWBhMPGyf
	 6WvsjLd1ra4aSpMheTElm9wN60lMfGhoMki6JdaZ6a/qbRlnPe8kjeDM7VFV3c/+cb8eO
	 ml81J2UzXcxKX4t+b190u+MiSExkZUcIxmG9Bm8R3Hc2p62MAyyFv+rI/sW0ANlZQRTGC
	 JEbMhWDVaFXNDNIb63ghzCAYZ7IBu6/z2Hm1hBSUwiayaIoC+dw8XeeN5YQZ26QNAIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=geBVe5+FjVMWnHT2yy+iTXd1DdAvYMOm86ikvWMsAC8=;
	b=2ZxBOGsDH/tpIWjGLUXrZlKw85fPV/EhrixtHXxrUJSRGCMBkFx57GHfyTFGfUyKYu/o
	 7zS0xBcT8kUVZ2MrM0wG3HL0Qww+Y2GWWWHAIYgWAaOxwy0y3dxbiwGUldyqYZB1BVka+
	 FXbdX6TppzasS9WFZhZuOaohhavgAtM+3riJpHesNJOXyD3HHUXms05FvwLquvdAxGZSt
	 6dvkwqkqEKHS/ZjXbpQSqShtx/uNymjw8/p28ws3SsOR0t5ztlFW2Nj0pPsTMfaVWgV6b
	 Dq15Qdt7e6CMHzyx4elB6OwtSWOr4KL4xTtdGjHcrLHthCh5XtiHBVxftw8mBqySi8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgqNZrt9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A2F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgqNZrt9
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-921367ef6b3so54158316d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795749190; cv=none;
        d=google.com; s=arc-20260327;
        b=JKYV/pUMCDU/Upns0GbjPmy8HELnNPgBYP0VpsHUawCSPB1oqu6U4vGigvb36mgTl4
         TP4s7TPqEjCSOOv+0/QwHaE30qFCFYkgv0QULEwI2EvFSnv/yqCIUO+rzjFMHcPg1bPR
         HPcZk7uQFnuAqmuutHX/eGmoz+irRw/NpVcNvQnXq9fR41o+oKEEmMEB8eB1sbxr0DOB
         PuRn7hEZJh8G60gwwJl7uEqOxiX9vzI2G26dBfdGjLHGnaBAahZfXHq7b0K9IUj2VILP
         sYDjjPkSHBKoNxkTc0X6IzmvId67tOyK7LeuvZkCSUEcV4LXUU3J9YDeldaefY0gPSCN
         z0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=geBVe5+FjVMWnHT2yy+iTXd1DdAvYMOm86ikvWMsAC8=;
        fh=ki1EakAN+QvTBlriz0fVK9wIwIyLoK1zXu6kF+js5s0=;
        b=IpPDCsk2Lq1ozGHY5A8IzikkcD64KkxjiwUNzdda7pyz9V+2296dVw21BPQHRRdIV4
         yqG6Gu9cWoZ+HlC+GedzL28BAx91RVZL+Xg1fTRkNcLHOTG7xuBycmJShtn94733u2gA
         d6119s2N5iVswJInO9/ZBKsZu+D2Im8HgR1MNV0pEu4vknT77Is8TPQu7mKDfpBmlxsA
         CiXsGxJ6xMCzd7d/u8QgxgRaVs7h/DYTfJVosdFn7ecvou8Nj4PLtz255V2NihyXqmU5
         SXfoGMxBJBmVfuW7EPJqEzGGEKsFbsvi+FFqaCG2H10+pendyG4U9lZo9TTrzlCUjqQ1
         e3UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749190; x=1796353990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geBVe5+FjVMWnHT2yy+iTXd1DdAvYMOm86ikvWMsAC8=;
        b=hgqNZrt9UP2DQwF4uuE5FKyiHisS2VYwSaRio/dRcvqnP2dWgh6d9pJBosAP2grku9
         SWvIzkYcC+ev5ZsXyqj7C0WAEwoxyj+opbq2lACHeOgrFDhvoVIKdRwQRuGRZRVXp//1
         J3nG1bqRajG3JXTOSkBMOGa6Y6Q9kGf4156r1KpdS7ikjzhkrI1T/zezAs3GbV/NfTdk
         Zx1faWdJd5jLTNewog2szxoL16aZljsh94ls63sbJaJ3i7sReUfQP5I9KHVp837d25bk
         LRldru/4nkdt6Psz0Ta0yjyeczIzrPXM9UeDSi8TqXKs8oxa9LE5SqUsyzfweI1QXLT8
         5qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749190; x=1796353990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=geBVe5+FjVMWnHT2yy+iTXd1DdAvYMOm86ikvWMsAC8=;
        b=suAzKmNaMDMUD/w5BXjFV9eodXpFaMWUylCm2h75jHL9jYip8+Kzq+CV88+9ZBpZlR
         /8p843kqfMTPzyzkXjtvKjO3JGgn6s70DzRWSfj+wZr7CI2Fn/DTz8eFiLmzv3NnDUHe
         E9LLs/2K7CE6Sjf0faP1dEmT6DFKcOMYVhnEogKakQH1gFLu18zsre5f8GSBIcHCqMQa
         K7olKkegEfyO4nIo3rlhup11CYfCA5KX0UacKkDKl8l+NKRlS7RvpwwBL3Xyv+bGcq8Z
         5Ffxg+CbPgCDqAl+JlW1NVxmyV7b/1lfUisHxmxreOvAkAApLTRtAjdcijSvpYbRWVyc
         4plQ==
X-Forwarded-Encrypted: i=1; AL+hErHRd4aDqjTQ73uhBhafF6rsFxYQxBgPPsJM4qxtYgiQLDqrKuci13VRcGfSUHqoAuGV2Ootp/5soQiNsqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pyQIVoJb9EvUURTLPhrWlJZXqGmzJ1m0I4dAsBnN+yYG6BlET
	swT/NcQf0dgybD8W7ysOUHokhAvrKkyKV01bV0LhE30ykLyeEIR3BIkps4oluKqrNPDyNB6d2BV
	MRYxWiXU4GAPTHlcgtiUAozKGjNEuHvw=
X-Gm-Gg: AZFdTZcfQoKOV49kdnHoccE5N8qlT6Fm7AiKzXLlXJndcIRHQ/S63HOu6gUfqta/DtJ
	IK3KtIgeDDWCzyXrLxwru17KdhsHG8pkyDhqe7veVOgRN+XJZj23WYJS4SVBJHK5UklpEAsVDJ4
	1efUedshmEIg6IWS0/ip8Ej9fXRbDJbDAW7Jx8S4xuAvYP6TY8pC0bjKzgmY7Fbe26JPgcdfeDE
	Nau/SKxHrwOEnV919W5vRxgN5NMgh9P6LiGOZkAuu2H3xS60kn38lyReVolSlgMfyt0RHYoQylT
	I1CywPffgapEynwCAEBU+txabJl0/jqh+Zf5STl6jcRoXtg5riB/Xs8J+7tOwkiSoFadPcG3uH3
	n3RVi6mEg6dGSD48NlFp9DwQePISC/2HaMvSUkGRXVQ4ubYCKhpCC9rA8L64CURNuHx4j7Q==
X-Received: by 2002:a05:620a:480b:b0:949:3017:1f91 with SMTP id
 af79cd13be357-949bab23b74mr4065205085a.48.1795749189809; Thu, 26 Nov 2026
 19:13:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103041134.33310-1-physicalmtea@gmail.com>
 <20261103041134.33310-4-physicalmtea@gmail.com> <auxDWISLHB8Ln1x7@sgarzare-redhat>
 <CAJwVaMJbzzK8Sj8DvLjiAyqS8TNgRQ3tjRpGcBNC+anQECg5yw@mail.gmail.com>
 <avXn6E8y5OPtdikQ@sgarzare-redhat> <CAJwVaM+SEhbFtORYgVYNayiQED63sCLO5ibwgkcjBRVvMd=KsA@mail.gmail.com>
 <avdAV2RholA4ana_@sgarzare-redhat> <CAJwVaMLtt1iKCWbhz2T4BbjqseTxjOb8S7vbvX3845LL8GHEBQ@mail.gmail.com>
 <awgCqpU1HZ5-iTtv@sgarzare-redhat>
In-Reply-To: <awgCqpU1HZ5-iTtv@sgarzare-redhat>
From: Jia Jia <physicalmtea@gmail.com>
Date: Fri, 27 Nov 2026 11:12:33 +0800
X-Gm-Features: Aa3M54oWTEMZnM9QZUboNJqJ_Kpki7q04yyZCMgKo7NldSW0iRvzSC16YJfSaFY
Message-ID: <CAJwVaMJi_Ei1uOXBRjctbGWv4yz_=R1LYf8DbX0gQSK3YVDO=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/5] vsock/virtio: amortize RX socket locking
 for stream packets
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: netdev@vger.kernel.org, stefanha@redhat.com, bobbyeshleman@gmail.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Sat, Nov 14, 2026 at 07:10:26PM +0800, Jia Jia wrote:
> > >
> > > On Fri, Nov 13, 2026 at 04:09:48PM +0800, Jia Jia wrote:
> > > > >
> > > > > On Fri, Nov 06, 2026 at 08:27:51PM +0800, Jia Jia wrote:
> > > > > >>
> > > > > >> On Tue, Nov 03, 2026 at 12:11:32PM +0800, Jia Jia wrote:
> > >
> > > [...]
> > >
> > > > > >> >+
> > > > > >> >+/* The caller holds sk's socket lock. */
> > > > > >> >+static bool
> > > > > >> >+virtio_transport_rx_batch_can_continue(struct virtio_transport *t,
> > > > > >> >+                                     struct sock *sk, u32 len)
> > > > > >> >+{
> > > > > >> >+      struct virtio_vsock_sock *vvs;
> > > > > >> >+      struct vsock_sock *vsk;
> > > > > >> >+
> > > > > >> >+      vsk = vsock_sk(sk);
> > > > > >> >+      vvs = vsk->trans;
> > > > > >> >+
> > > > > >> >+      /*
> > > > > >> >+       * Keep a connected lookup reference only for the native, established
> > > > > >> >+       * STREAM path. Sockets outside ESTABLISHED can change table membership;
> > > > > >> >+       * a completed or reassigned socket must resume the per-packet path.
> > > > > >> >+       */
> > > > > >> >+      if (sk->sk_state != TCP_ESTABLISHED ||
> > > > > >> >+          sk->sk_type != SOCK_STREAM ||
> > > > > >> >+          sock_flag(sk, SOCK_DONE) ||
> > > > > >> >+          vsk->transport != &t->transport || !vvs)
> > > > > >> >+              return false;
> > > > > >> >+
> > > > > >> >+      /*
> > > > > >> >+       * Do not admit a packet that would hit an existing RX limit while the
> > > > > >> >+       * worker owns the socket lock. The caller holds that lock, so no reader can
> > > > > >> >+       * dequeue until the batch is released.
> > > > > >> >+       */
> > > > > >> >+      return (u64)vvs->buf_used + len <= vvs->buf_alloc &&
> > > > > >> >+             !virtio_transport_rx_buf_full(vvs);
> > > > > >>
> > > > > >
> > > > > >Hi Stefano,
> > > > > >
> > > > > >> I don't understand this. We recently introduce the collapse, so when we
> > > > > >> will call virtio_transport_recv_enqueue(), all the queue will be
> > > > > >> collapsed, including packets in the batch.
> > > > > >>
> > > > > >> Or am I missing something?
> > > > > >>
> > > > > >
> > > > > >Yes, collapse operates on the same receive queue, which also contains
> > > > > >skbs queued earlier in the current batch.
> > > > > >
> > > > > >The rx_buf_full() check is not intended to bypass collapse. It prevents
> > > > > >the batch from retaining the socket lock while processing a packet when
> > > > > >there is no metadata room for another skb. Collapse is best effort:
> > > > > >some skbs cannot be merged, and allocation of a replacement skb can
> > > > >
> > > > > IIUC batches are enabled only for SOCK_STREAM, so, which skbs can't be
> > > > > merged?
> > > >
> > > > My wording in the previous reply may not have been precise. What I meant
> > > > is that collapse is not guaranteed to free the skb slot needed for the
> > > > incoming packet for every valid receive-buffer configuration.
> > > >
> > > > With the default 256K receive buffer, a queue of small STREAM skbs will
> > > > normally contain multiple collapse candidates by the time it reaches
> > > > the metadata limit, so collapse will normally make room.
> > > >
> > > > However, SO_VM_SOCKETS_BUFFER_SIZE is configurable through setsockopt().
> > > > A sufficiently small but valid receive buffer can make queue_max equal
> > > > to one. After the first small packet has been queued, that skb is
> > > > eligible for collapse, but there is no adjacent skb to merge it with.
> > > > virtio_transport_collapse_size() therefore returns only that skb's own
> > > > length, and the skb is kept unchanged.
> > > >
> > > > The incoming second skb is not in rx_queue yet. Provided that the two
> > > > packets combined payload still fits within buf_alloc, the payload check
> > > > passes, but virtio_transport_inc_rx_pkt() rejects the second packet on
> > > > the metadata check. This happens before the later tail-copy optimization
> > > > is reached.
> > >
> > > I'm lost to be honest, why the secondo skb is not collapsed?
> > >
> >
> > The second skb triggers the collapse, but it is not itself an input to
> > that collapse.
> >
> > The concrete case is a valid receive-buffer configuration where setting
> > SO_VM_SOCKETS_BUFFER_SIZE makes:
> >
> >       queue_max = vvs->buf_alloc / SKB_TRUESIZE(0);
> >
> > equal to one. Assume that rx_queue is initially empty and that two small
>
> But this looks like a corner case of the metadata check we added with
> commit 059b7dbd20a6 ("vsock/virtio: fix potential unbounded skb queue"),
> not something related to batching.
>
> Also, with a buffer smaller than SKB_TRUESIZE(0) (allowed, the default
> min is 128), queue_max is 0 and every RW packet resets the connection,
> with or without batching. So small buffers are already broken.
>

Got it, thanks for pointing me to that discussion.

> > STREAM/RW packets for the same flow are available in the same RX
> > virtqueue drain. Their combined payload still fits within buf_alloc.
> >
> > The first packet passes the metadata check:
> >
> >       u64 skb_overhead =
> >               (skb_queue_len(&vvs->rx_queue) + 1) * SKB_TRUESIZE(0);
> >
> > It is then queued, so rx_queue contains one skb.
> >
> > When the second packet enters virtio_transport_recv_enqueue(), the
> > relevant order is:
> >
> >       queue_len = skb_queue_len(&vvs->rx_queue);
> >       if (queue_len >= queue_max)
> >               virtio_transport_collapse_rx_queue(vvs, ...);
> >
> >       can_enqueue = virtio_transport_inc_rx_pkt(vvs, len);
> >       if (!can_enqueue)
> >               goto out;
> >
> >       /* tail-copy is attempted here */
> >
> > At the point where virtio_transport_collapse_rx_queue() runs, the second
> > skb is still only the skb argument passed to
> > virtio_transport_recv_enqueue(). It has not been linked into
> > vvs->rx_queue, so the collapse sees only the first skb.
> >
> > For that skb, virtio_transport_collapse_size() cannot find a next queue
> > element:
> >
> >       while ((skb = skb_peek_next(skb, queue)) &&
> >              virtio_transport_can_collapse(skb))
> >               ...
> >
> > It therefore returns only the length of the first skb, and the collapse
> > code keeps it unchanged:
> >
> >       if (alloc_size <= src_len) {
> >               keep = true;
> >               goto next;
> >       }
> >
> > The queue length remains one. virtio_transport_inc_rx_pkt() then
> > accounts for the existing skb plus the incoming one:
> >
> >       (skb_queue_len(&vvs->rx_queue) + 1) * SKB_TRUESIZE(0)
> >
> > With queue_max == 1, this exceeds the metadata budget and returns false.
> > This check happens before the tail-copy code, so the second skb cannot
> > be copied into the first skb even if the first skb has sufficient
> > tailroom.
> >
> > virtio_transport_recv_enqueue() then returns false, and the existing
> > error path resets the connection and sets ENOBUFS:
> >
> >       if (!virtio_transport_recv_enqueue(vsk, skb)) {
> >               virtio_transport_reset(vsk, skb);
> >               virtio_transport_do_close(vsk, true);
> >               sk->sk_err = ENOBUFS;
> >               ...
> >       }
> >
> > > >
> > > > Therefore, this case does not require an ineligible STREAM skb or an
> > > > allocation failure. Collapse simply cannot reduce a one-element queue.
> > > >
> > > > If my understanding is wrong, please correct me. Thanks.
> > > >
> > > > >
> > > > > If allocation fails, I guess we have other issues, no?
> > > > >
> > > >
> > > > Yes. I thought about that again, and allocation failure is not the
> > > > reason for this check. Thanks
> > > >
> > > > > >fail. If the packet remained in the batch and collapse did not make
> > > > > >enough room, virtio_transport_inc_rx_pkt() would fail and
> > > > > >virtio_transport_recv_connected() would reset the socket with ENOBUFS
> > > > > >while a waiting reader was still unable to drain the queue.
> > > > > >
> > > > > >When the check makes can_continue() return false before the current
> > > > > >packet has been handled, the caller releases the socket lock and passes
> > > > > >the packet to virtio_transport_recv_pkt(). This gives a waiting reader a
> > > > > >chance to make progress. If the queue is still at the metadata limit,
> > > > > >the normal enqueue path attempts collapse. If that still cannot make
> > > > > >enough room, the existing ENOBUFS reset occurs.
> > > > >
> > > > > I really don't see the difference without batching :-(
> > > > >
> > > > > I may be missing something.
> > > > >
> > > >
> > > > The difference is the release_sock() boundary between packets.
> > > >
> > > > In the regular per-packet path, the socket lock is released after the
> > > > first packet. A reader woken by that packet can compete for the lock and
> > > > fully dequeue the only skb before RX locks the socket for the second
> > > > packet. If it succeeds, the second packet can be accepted. If it does
> > > > not acquire the lock in time, or only partially consumes the skb, the
> > > > queue length remains one and the regular path can still reach the
> > > > existing ENOBUFS reset.
> > > >
> > > > Without the rx_buf_full() check, two same-flow packets processed in the
> > > > same active batch remain under one uninterrupted socket-lock ownership
> > > > interval. Once the first packet leaves the only skb in the queue, the
> > > > reader cannot dequeue it before the second packet is processed.
> > >
> > > Why?
> > >
> >
> > Because an active RX batch retains the socket lock across the two
> > packets:
> >
> >       lock_sock(sk);
> >       ...
> >       batch->sk = sk;
> >       virtio_transport_rx_batch_process(...);
> >
> > The lock is released only when the batch is finished:
> >
> >       void virtio_transport_rx_batch_finish(...)
> >       {
> >               ...
> >               release_sock(sk);
> >               sock_put(sk);
> >       }
> >
> > The receive side needs the same socket lock before it can call
> > stream_dequeue():
> >
> >       lock_sock(sk);
> >       ...
> >       read = transport->stream_dequeue(...);
> >       ...
> >       release_sock(sk);
> >
> > Waking the reader after the first packet does not allow it to dequeue
> > while the RX batch still owns that lock. Without the rx_buf_full()
> > boundary, and assuming the other batch-continuation conditions remain
> > true, RX processes the second packet under the same uninterrupted lock
> > ownership.
> >
> > > > Collapse cannot reduce that one-element queue, so the second packet
> > > > fails the metadata check and resets the connection.
> > >
> > > What is unclear to me is why this is not happening without batching.
> > >
> >
> > It can also happen without batching. The difference is that it is not
> > unavoidable there.
> >
> > The regular per-packet path executes this sequence for every packet:
> >
> >       lock_sock(sk);
> >       virtio_transport_recv_pkt_locked(...);
> >       release_sock(sk);
> >
> > Therefore, even when both packets come from the same virtqueue drain,
> > the first packet is followed by release_sock(). A waiting reader can
> > compete for the lock and fully dequeue the first skb before RX locks the
> > socket for the second packet.
> >
> > If the reader wins, the second packet sees an empty queue and can be
> > accepted. If RX wins the race, or the reader consumes only part of the
> > skb, the regular path can still reach the same ENOBUFS reset.
> >
> > Without the rx_buf_full() check, the post-processing check after the
> > first packet only sees that the payload limit has not been exceeded:
> >
> >       return (u64)vvs->buf_used + len <= vvs->buf_alloc;
> >
> > At this point len is zero, so the batch continues to hold the socket
> > lock and processes the second packet immediately. Under the conditions
> > described above, the reader cannot intervene and the metadata failure
> > is deterministic.
> >
> > With the current check:
> >
> >       return (u64)vvs->buf_used + len <= vvs->buf_alloc &&
> >              !virtio_transport_rx_buf_full(vvs);
> >
> > the metadata slot is already exhausted after the first packet. The
> > post-processing check returns false,
> > virtio_transport_rx_batch_finish() releases the socket lock, and the
> > next packet returns to the regular per-packet path.
> >
> > This restores the lock-acquisition opportunity. It does not guarantee
> > that the reader wins it.
> >
> > > And, why we can't collapse the batch it self...
> > >
> >
> > I am not sure whether I understood your suggestion. Do you mean
> > changing the enqueue order so that the incoming skb can participate in
> > tail-copy or collapse before the metadata check?
>
> I was thinking about something like that, but honestly I don't think
> it's worth it. With a buffer that small (less than 2 * SKB_TRUESIZE(0))
> the user should expect issues, and without batching it already fails
> most of the time, as your test shows.
>
> So I don't think we should add complexity in the batching path for
> this case. Let's start simple.
>

Understood

> >
> > The current implementation does not attempt that change. Its purpose
> > here is only to preserve the behavior of the existing per-packet path
> > in this boundary case.
> >
> > The earlier targeted A/B test also illustrates why I added the
> > rx_buf_full() check. On a 2-vCPU guest with queue_max == 1, I ran 100
> > trials in which two STREAM/RW packets for the same flow were available
> > in the same RX virtqueue drain. With the rx_buf_full() boundary, the
> > connection continued in 22 trials and reached ENOBUFS in the other 78.
> > Without the boundary, all 100 trials reached ENOBUFS.
>
> So without batching it works only if the reader wins the race, and it
> fails 78% of the time. IMO we should not add complexity in the batching
> path just to preserve that race.
>

Agreed. I'll drop the rx_buf_full() check in v6. Without it, patch 2
isn't needed anymore either, so I'll drop that too.

> >
> > The check does not guarantee that the reader wins the lock race. It
> > preserves the opportunity that exists in the per-packet path. Without
> > it, batching removes that opportunity and turns a case that could
> > previously continue into a deterministic reset when both packets are
> > processed in the same uninterrupted batch. I consider that a functional
> > regression from the existing behavior.
>
> Sorry to be honest, but your answers are incredibly long and lengthy.
> It's fine to use AI for translation, etc., but please let's not go to
> extremes, otherwise, it becomes impossible for me to follow your line of
> reasoning...
>

Sorry about that. I'll try to keep a better balance, cut the
unnecessary details, and just point straight to the code path.

> Stefano
