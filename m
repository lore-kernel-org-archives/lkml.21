Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687705;
	b=FB+D7hBImHH4Nbh+Km/3WtTQfPjmp8eGYfkbYZL7WNvS/h4ikc5CLtwPqvzgCU+Pqvi7
	 5gIT0GVA8VV6fY5PKYpSrvabGwOiT70yccuN2j23b8wfDPUcTXoCxyVzSdWLTVh93ydk8
	 odwPShHsl6tdVBvuW4u9kB8CvwwHP/hXCpjsylgOYEF1JPCsVWKBBJytA9AGGgEoj70sE
	 2/TXC8TyHGe7yZ0/QiQzzEVmg/kjVOpS0PRzpWI6gpVMFuPFDU4N8cs1VtDDmIar9fJ8l
	 hqxyvH008JqYfY/v4rTpyn5mB6oi+Fo3gKxJ6hB98WfB+isJWWXvAn8ueAqpUzXN72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687705;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kza1kqE4hyx4X8fklpeFk/tscl8P/9S0B2tiXMLcW1A=;
	b=u0+IWSSQbaPr6j5QnBI2DBzgcZQ53oH5Jgc+DkCOo4rzB7b187Bgdj7UtTREnlnixm/i
	 EGa9gTbV172TVM1mf44Htq6EExn54s6ZbWAunkYgUKoNRUMpi4IJ+Ja7S/dMlDx9bpuVM
	 vIJl4G4pUEWyapxkWDRppwq8ipLYegf3VPP7oqWCCoofbu+jZaI8ZjVGakh0ystJeLaS4
	 EA3NA4Nat+WvemmR+Vmj1poKRJwn7ygCIroCy4zqhWX2kXXbJbp2ZHd1Ijskfs8+8RKfL
	 fqoqTkWqs0eQl3Z2tDONshf/oKBXQBI76UVeVmeP4hI9+zDyFSdgfIMPZcWxghaduBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwxqFMf9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SFDXog7z;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77862606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77862606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwxqFMf9;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SFDXog7z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795687703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kza1kqE4hyx4X8fklpeFk/tscl8P/9S0B2tiXMLcW1A=;
	b=MwxqFMf9XPymO9RWuwSsNq/74DYk+7B11ZMIQCiTeGcdqK/Vf3RUxuickCjkTDs2Znai6a
	XfzA9EEOiK0P48IVwbyStrvP1LyHWOwqwI96T4PLukSxpTL4GYY/GdUYuV/ysaxb/DbAau
	7uGJov7+T7fMNEuKiiBbJQuF9VXftQA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-zA8opQEgPvKPnnqGGOEz5w-1; Thu, 26 Nov 2026 10:08:21 +0000
X-MC-Unique: zA8opQEgPvKPnnqGGOEz5w-1
X-Mimecast-MFC-AGG-ID: zA8opQEgPvKPnnqGGOEz5w_1795687700
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so47410415e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795687700; x=1796292500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kza1kqE4hyx4X8fklpeFk/tscl8P/9S0B2tiXMLcW1A=;
        b=SFDXog7zT6B0Wos41WdPyH3cAMy6sDaiCXGupkdwBdpRcx5H1pOMh23iFZPyMVQB9U
         vI8O06UXrYavcYl6T8R0KHneVoNucd6d32fapYGc9FdLJv9jmFBRKbiJppPQ/MHDZ6/N
         hVPw61loaIBPziJRrWAg+Jpr2gAUhn4h3bo4KTT8/fdoocfV8Rdh0U0lall/dkq85zId
         DHd5hDzG2R0jN5iRKXr7JbNWF6oy5fpe7NQaLKQskbJwqNz9MJK5hlWW+F+3QMD1U5/G
         qdDJhcseEz2BYghLBYftWrTKZBRAu9tJgJIYchR2gMuhVvDCYHTkmxi/PV40z1lFjyCa
         wXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687700; x=1796292500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kza1kqE4hyx4X8fklpeFk/tscl8P/9S0B2tiXMLcW1A=;
        b=23vgUFzah8hAFzl8abQfQcbOhRYpbrAsCKah0Fhux2SVkFwftRLCz0X8SeGd2Z/YEe
         h8kWEAfKirStz4zRv1g36/LjgU2HlPje7tFD7S8cmVa2dnjDSFm6Nuzlw5EKEZzJUJc5
         t8JLFhmQQf/OoF5H+5O6GUrU5kwxtgzJUM2zgc0J4VG74nCLbU7PFzcr56UeFOT2QEfG
         rwfXFkpCc/2klh6T3U0Zub2ccO0zkZrpG9bvQ2+JkEGEAwIY7CFZCG6bf8ol6uhW7bpG
         srACYyBic1LdzMdUVdGA6PY3vvhPMQfUz7RZTHyE3eAJRgVwGVENAZDe7W+0UqKn6Ihu
         fBrw==
X-Forwarded-Encrypted: i=1; AL+hErGyqdt7Kwp+ce7jeXvSolUIF1UJjs4/pfO71uovgOlROkMHBDp7eis0AkwyNgnuUUSHqDfKbkflFiN/DG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DPjMPF8tbm+sOtykG9He8Iur+G2KsXmzpOwsQUn40N4IcWkbr
	QXNVYUEUzeUIjaUy8w5sdUDruluELdvQUuwIyDiPzpvis+qDbZDteK3SRcIhUAkdcMB6K507EXz
	Dkb+soVFTQDguYa2f0tG2ADjNIqKQfS/iMS1Lr4Bsk+5H1PA2qS7x+W+4skkNUTPxBg==
X-Gm-Gg: AZFdTZeJuc7qCl08l8T71Zw2uYinkQTAEkI1drkBHuacepffNdN3kQHejJ6SjCGmkzj
	5PlYbtgjpqI3+plQEjrToaQzjg0Y0XGct5nQhLAa3ETunNQAb2H1Y6P4w/4BtUDXwspRX/+QkAg
	+UyVULiNIvxHZoPQPZb1GCsWLDy6HdyV89uNqtRtKmyY+VyZeblRVhN6EHNtBMX/lX8x7RlKp6K
	G2KkVyD1pMVkbEEwo/QoQCcpf2o+88qeswiloUOQPz7gRpC4zXYtWks5+mfLyD3mjf2d3YzuA7/
	okE2WpcPkFviunENhSq/wVudNHX8UTKBNngwKWa25BwwgQ/DPjZYnPKYCRM9ma8KiiSx29FQIhl
	jHl9P3+5ldIO/LVGWRBqg756wGiysbaYmabCevziADCI0f20XCayREQ==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:5f07:10d7 with SMTP id 5b1f17b1804b1-4bb8882445cmr395519505e9.26.1795687699815;
        Thu, 26 Nov 2026 02:08:19 -0800 (PST)
X-Received: by 2002:a05:600c:4e0d:b0:4bb:5f07:10d7 with SMTP id 5b1f17b1804b1-4bb8882445cmr395518535e9.26.1795687699094;
        Thu, 26 Nov 2026 02:08:19 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm117617215e9.3.2026.11.26.02.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:08:18 -0800 (PST)
Date: Thu, 26 Nov 2026 11:08:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: netdev@vger.kernel.org, stefanha@redhat.com, bobbyeshleman@gmail.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/5] vsock/virtio: amortize RX socket locking
 for stream packets
Message-ID: <awgCqpU1HZ5-iTtv@sgarzare-redhat>
References: <20261103041134.33310-1-physicalmtea@gmail.com>
 <20261103041134.33310-4-physicalmtea@gmail.com>
 <auxDWISLHB8Ln1x7@sgarzare-redhat>
 <CAJwVaMJbzzK8Sj8DvLjiAyqS8TNgRQ3tjRpGcBNC+anQECg5yw@mail.gmail.com>
 <avXn6E8y5OPtdikQ@sgarzare-redhat>
 <CAJwVaM+SEhbFtORYgVYNayiQED63sCLO5ibwgkcjBRVvMd=KsA@mail.gmail.com>
 <avdAV2RholA4ana_@sgarzare-redhat>
 <CAJwVaMLtt1iKCWbhz2T4BbjqseTxjOb8S7vbvX3845LL8GHEBQ@mail.gmail.com>
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
In-Reply-To: <CAJwVaMLtt1iKCWbhz2T4BbjqseTxjOb8S7vbvX3845LL8GHEBQ@mail.gmail.com>

On Sat, Nov 14, 2026 at 07:10:26PM +0800, Jia Jia wrote:
> >
> > On Fri, Nov 13, 2026 at 04:09:48PM +0800, Jia Jia wrote:
> > > >
> > > > On Fri, Nov 06, 2026 at 08:27:51PM +0800, Jia Jia wrote:
> > > > >>
> > > > >> On Tue, Nov 03, 2026 at 12:11:32PM +0800, Jia Jia wrote:
> >
> > [...]
> >
> > > > >> >+
> > > > >> >+/* The caller holds sk's socket lock. */
> > > > >> >+static bool
> > > > >> >+virtio_transport_rx_batch_can_continue(struct virtio_transport *t,
> > > > >> >+                                     struct sock *sk, u32 len)
> > > > >> >+{
> > > > >> >+      struct virtio_vsock_sock *vvs;
> > > > >> >+      struct vsock_sock *vsk;
> > > > >> >+
> > > > >> >+      vsk = vsock_sk(sk);
> > > > >> >+      vvs = vsk->trans;
> > > > >> >+
> > > > >> >+      /*
> > > > >> >+       * Keep a connected lookup reference only for the native, established
> > > > >> >+       * STREAM path. Sockets outside ESTABLISHED can change table membership;
> > > > >> >+       * a completed or reassigned socket must resume the per-packet path.
> > > > >> >+       */
> > > > >> >+      if (sk->sk_state != TCP_ESTABLISHED ||
> > > > >> >+          sk->sk_type != SOCK_STREAM ||
> > > > >> >+          sock_flag(sk, SOCK_DONE) ||
> > > > >> >+          vsk->transport != &t->transport || !vvs)
> > > > >> >+              return false;
> > > > >> >+
> > > > >> >+      /*
> > > > >> >+       * Do not admit a packet that would hit an existing RX limit while the
> > > > >> >+       * worker owns the socket lock. The caller holds that lock, so no reader can
> > > > >> >+       * dequeue until the batch is released.
> > > > >> >+       */
> > > > >> >+      return (u64)vvs->buf_used + len <= vvs->buf_alloc &&
> > > > >> >+             !virtio_transport_rx_buf_full(vvs);
> > > > >>
> > > > >
> > > > >Hi Stefano,
> > > > >
> > > > >> I don't understand this. We recently introduce the collapse, so when we
> > > > >> will call virtio_transport_recv_enqueue(), all the queue will be
> > > > >> collapsed, including packets in the batch.
> > > > >>
> > > > >> Or am I missing something?
> > > > >>
> > > > >
> > > > >Yes, collapse operates on the same receive queue, which also contains
> > > > >skbs queued earlier in the current batch.
> > > > >
> > > > >The rx_buf_full() check is not intended to bypass collapse. It prevents
> > > > >the batch from retaining the socket lock while processing a packet when
> > > > >there is no metadata room for another skb. Collapse is best effort:
> > > > >some skbs cannot be merged, and allocation of a replacement skb can
> > > >
> > > > IIUC batches are enabled only for SOCK_STREAM, so, which skbs can't be
> > > > merged?
> > >
> > > My wording in the previous reply may not have been precise. What I meant
> > > is that collapse is not guaranteed to free the skb slot needed for the
> > > incoming packet for every valid receive-buffer configuration.
> > >
> > > With the default 256K receive buffer, a queue of small STREAM skbs will
> > > normally contain multiple collapse candidates by the time it reaches
> > > the metadata limit, so collapse will normally make room.
> > >
> > > However, SO_VM_SOCKETS_BUFFER_SIZE is configurable through setsockopt().
> > > A sufficiently small but valid receive buffer can make queue_max equal
> > > to one. After the first small packet has been queued, that skb is
> > > eligible for collapse, but there is no adjacent skb to merge it with.
> > > virtio_transport_collapse_size() therefore returns only that skb's own
> > > length, and the skb is kept unchanged.
> > >
> > > The incoming second skb is not in rx_queue yet. Provided that the two
> > > packets combined payload still fits within buf_alloc, the payload check
> > > passes, but virtio_transport_inc_rx_pkt() rejects the second packet on
> > > the metadata check. This happens before the later tail-copy optimization
> > > is reached.
> >
> > I'm lost to be honest, why the secondo skb is not collapsed?
> >
> 
> The second skb triggers the collapse, but it is not itself an input to
> that collapse.
> 
> The concrete case is a valid receive-buffer configuration where setting
> SO_VM_SOCKETS_BUFFER_SIZE makes:
> 
>       queue_max = vvs->buf_alloc / SKB_TRUESIZE(0);
> 
> equal to one. Assume that rx_queue is initially empty and that two small

But this looks like a corner case of the metadata check we added with
commit 059b7dbd20a6 ("vsock/virtio: fix potential unbounded skb queue"),
not something related to batching.

Also, with a buffer smaller than SKB_TRUESIZE(0) (allowed, the default
min is 128), queue_max is 0 and every RW packet resets the connection,
with or without batching. So small buffers are already broken.

> STREAM/RW packets for the same flow are available in the same RX
> virtqueue drain. Their combined payload still fits within buf_alloc.
> 
> The first packet passes the metadata check:
> 
>       u64 skb_overhead =
>               (skb_queue_len(&vvs->rx_queue) + 1) * SKB_TRUESIZE(0);
> 
> It is then queued, so rx_queue contains one skb.
> 
> When the second packet enters virtio_transport_recv_enqueue(), the
> relevant order is:
> 
>       queue_len = skb_queue_len(&vvs->rx_queue);
>       if (queue_len >= queue_max)
>               virtio_transport_collapse_rx_queue(vvs, ...);
> 
>       can_enqueue = virtio_transport_inc_rx_pkt(vvs, len);
>       if (!can_enqueue)
>               goto out;
> 
>       /* tail-copy is attempted here */
> 
> At the point where virtio_transport_collapse_rx_queue() runs, the second
> skb is still only the skb argument passed to
> virtio_transport_recv_enqueue(). It has not been linked into
> vvs->rx_queue, so the collapse sees only the first skb.
> 
> For that skb, virtio_transport_collapse_size() cannot find a next queue
> element:
> 
>       while ((skb = skb_peek_next(skb, queue)) &&
>              virtio_transport_can_collapse(skb))
>               ...
> 
> It therefore returns only the length of the first skb, and the collapse
> code keeps it unchanged:
> 
>       if (alloc_size <= src_len) {
>               keep = true;
>               goto next;
>       }
> 
> The queue length remains one. virtio_transport_inc_rx_pkt() then
> accounts for the existing skb plus the incoming one:
> 
>       (skb_queue_len(&vvs->rx_queue) + 1) * SKB_TRUESIZE(0)
> 
> With queue_max == 1, this exceeds the metadata budget and returns false.
> This check happens before the tail-copy code, so the second skb cannot
> be copied into the first skb even if the first skb has sufficient
> tailroom.
> 
> virtio_transport_recv_enqueue() then returns false, and the existing
> error path resets the connection and sets ENOBUFS:
> 
>       if (!virtio_transport_recv_enqueue(vsk, skb)) {
>               virtio_transport_reset(vsk, skb);
>               virtio_transport_do_close(vsk, true);
>               sk->sk_err = ENOBUFS;
>               ...
>       }
> 
> > >
> > > Therefore, this case does not require an ineligible STREAM skb or an
> > > allocation failure. Collapse simply cannot reduce a one-element queue.
> > >
> > > If my understanding is wrong, please correct me. Thanks.
> > >
> > > >
> > > > If allocation fails, I guess we have other issues, no?
> > > >
> > >
> > > Yes. I thought about that again, and allocation failure is not the
> > > reason for this check. Thanks
> > >
> > > > >fail. If the packet remained in the batch and collapse did not make
> > > > >enough room, virtio_transport_inc_rx_pkt() would fail and
> > > > >virtio_transport_recv_connected() would reset the socket with ENOBUFS
> > > > >while a waiting reader was still unable to drain the queue.
> > > > >
> > > > >When the check makes can_continue() return false before the current
> > > > >packet has been handled, the caller releases the socket lock and passes
> > > > >the packet to virtio_transport_recv_pkt(). This gives a waiting reader a
> > > > >chance to make progress. If the queue is still at the metadata limit,
> > > > >the normal enqueue path attempts collapse. If that still cannot make
> > > > >enough room, the existing ENOBUFS reset occurs.
> > > >
> > > > I really don't see the difference without batching :-(
> > > >
> > > > I may be missing something.
> > > >
> > >
> > > The difference is the release_sock() boundary between packets.
> > >
> > > In the regular per-packet path, the socket lock is released after the
> > > first packet. A reader woken by that packet can compete for the lock and
> > > fully dequeue the only skb before RX locks the socket for the second
> > > packet. If it succeeds, the second packet can be accepted. If it does
> > > not acquire the lock in time, or only partially consumes the skb, the
> > > queue length remains one and the regular path can still reach the
> > > existing ENOBUFS reset.
> > >
> > > Without the rx_buf_full() check, two same-flow packets processed in the
> > > same active batch remain under one uninterrupted socket-lock ownership
> > > interval. Once the first packet leaves the only skb in the queue, the
> > > reader cannot dequeue it before the second packet is processed.
> >
> > Why?
> >
> 
> Because an active RX batch retains the socket lock across the two
> packets:
> 
>       lock_sock(sk);
>       ...
>       batch->sk = sk;
>       virtio_transport_rx_batch_process(...);
> 
> The lock is released only when the batch is finished:
> 
>       void virtio_transport_rx_batch_finish(...)
>       {
>               ...
>               release_sock(sk);
>               sock_put(sk);
>       }
> 
> The receive side needs the same socket lock before it can call
> stream_dequeue():
> 
>       lock_sock(sk);
>       ...
>       read = transport->stream_dequeue(...);
>       ...
>       release_sock(sk);
> 
> Waking the reader after the first packet does not allow it to dequeue
> while the RX batch still owns that lock. Without the rx_buf_full()
> boundary, and assuming the other batch-continuation conditions remain
> true, RX processes the second packet under the same uninterrupted lock
> ownership.
> 
> > > Collapse cannot reduce that one-element queue, so the second packet
> > > fails the metadata check and resets the connection.
> >
> > What is unclear to me is why this is not happening without batching.
> >
> 
> It can also happen without batching. The difference is that it is not
> unavoidable there.
> 
> The regular per-packet path executes this sequence for every packet:
> 
>       lock_sock(sk);
>       virtio_transport_recv_pkt_locked(...);
>       release_sock(sk);
> 
> Therefore, even when both packets come from the same virtqueue drain,
> the first packet is followed by release_sock(). A waiting reader can
> compete for the lock and fully dequeue the first skb before RX locks the
> socket for the second packet.
> 
> If the reader wins, the second packet sees an empty queue and can be
> accepted. If RX wins the race, or the reader consumes only part of the
> skb, the regular path can still reach the same ENOBUFS reset.
> 
> Without the rx_buf_full() check, the post-processing check after the
> first packet only sees that the payload limit has not been exceeded:
> 
>       return (u64)vvs->buf_used + len <= vvs->buf_alloc;
> 
> At this point len is zero, so the batch continues to hold the socket
> lock and processes the second packet immediately. Under the conditions
> described above, the reader cannot intervene and the metadata failure
> is deterministic.
> 
> With the current check:
> 
>       return (u64)vvs->buf_used + len <= vvs->buf_alloc &&
>              !virtio_transport_rx_buf_full(vvs);
> 
> the metadata slot is already exhausted after the first packet. The
> post-processing check returns false,
> virtio_transport_rx_batch_finish() releases the socket lock, and the
> next packet returns to the regular per-packet path.
> 
> This restores the lock-acquisition opportunity. It does not guarantee
> that the reader wins it.
> 
> > And, why we can't collapse the batch it self...
> >
> 
> I am not sure whether I understood your suggestion. Do you mean
> changing the enqueue order so that the incoming skb can participate in
> tail-copy or collapse before the metadata check?

I was thinking about something like that, but honestly I don't think
it's worth it. With a buffer that small (less than 2 * SKB_TRUESIZE(0))
the user should expect issues, and without batching it already fails
most of the time, as your test shows.

So I don't think we should add complexity in the batching path for
this case. Let's start simple.

> 
> The current implementation does not attempt that change. Its purpose
> here is only to preserve the behavior of the existing per-packet path
> in this boundary case.
> 
> The earlier targeted A/B test also illustrates why I added the
> rx_buf_full() check. On a 2-vCPU guest with queue_max == 1, I ran 100
> trials in which two STREAM/RW packets for the same flow were available
> in the same RX virtqueue drain. With the rx_buf_full() boundary, the
> connection continued in 22 trials and reached ENOBUFS in the other 78.
> Without the boundary, all 100 trials reached ENOBUFS.

So without batching it works only if the reader wins the race, and it
fails 78% of the time. IMO we should not add complexity in the batching
path just to preserve that race.

> 
> The check does not guarantee that the reader wins the lock race. It
> preserves the opportunity that exists in the per-packet path. Without
> it, batching removes that opportunity and turns a case that could
> previously continue into a deterministic reset when both packets are
> processed in the same uninterrupted batch. I consider that a functional
> regression from the existing behavior.

Sorry to be honest, but your answers are incredibly long and lengthy. 
It's fine to use AI for translation, etc., but please let's not go to 
extremes, otherwise, it becomes impossible for me to follow your line of 
reasoning... 

Stefano

