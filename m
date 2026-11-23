Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456094;
	b=FEx6EccIomJ63tY4KU2vgC6bkXxMOBvmQqAU1v4+K8GiW2/tFzdfh66E5t2IjIiry8Jo
	 LfHorZtTfgT/QARrbt6U9ltcsENaSfEN27DX0gfpAZvRjunbT7+sDFJpKK0KxIpJw0V9L
	 QDjxlpCz2EvZtsKhPnH1+qG9JMqKq2Zcct/Ij7aLeorfpTYQgWIdvCvTRyhmlK58JcohL
	 hbZ4sdlf43bXtEHTqDC8pXfG2RGUzP+8L5OotrabVV/FynUtKgbXmRkHvJ8NleRgNHf8H
	 1AOSaX3Gigq7EEUY1egjQugwMM+HFv0/SD2zYhvnnMoZdu7OTm9HTnwSmY+9RBJq3MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456094;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
	b=fHOqVj7lRVy0Ujz/tJSpe3t0gtcCBaKjgJ/z7ShfzxHPkZUtZ/Vkhi/ruuNjgYHuUstd
	 pHr8NQUZzTkp+D4HJzz7HFyXifnyrp/sTPcXo+4CAMRz2/76eJbuayZ6DJh0ljQ4POI1T
	 yGgL3+slga9cfcPX7eKYkcwLBvqjU71w+WvfINCORnQxvpeVgXtfzEX0ZWZ2LVdfxea7P
	 91oD1ScXlsvYWpGaZzQYzgxTdxpsvTcT6XP/yRx2QLrpnE4LeXcoDQmU3XRAfiXs4zbXw
	 W987jQVgttoTndjlrcl/7KwqOGHcH2dnEufxY3Yo3JRdZ/Z0+Fb2czpcS/dbih5ZWPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DC2ruBvK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I7zYFimT;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B8606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217B8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DC2ruBvK;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I7zYFimT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795456092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
	b=DC2ruBvK68FqKAPO8c+opMoY15WQZ+7KU8zL3zFjry9Xxp+Y+nUignJ/KJk9kor/dDbeco
	Pyp5FbADaS+hgmbMXundBK7X9nhPlTY+H2jQsx9gKR7HdsVZsLYZl5/JZE2wrgU0f45BnW
	hxImU3O/Suw1ugSKMSAOMRjgoDFkXc8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-5Nhjn7R0O2iC15FAe7DBeg-1; Mon, 23 Nov 2026 17:48:05 +0000
X-MC-Unique: 5Nhjn7R0O2iC15FAe7DBeg-1
X-Mimecast-MFC-AGG-ID: 5Nhjn7R0O2iC15FAe7DBeg_1795456084
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a9be7586ccso1798292f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795456084; x=1796060884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
        b=I7zYFimTiLk4Rzqu2GcOQhrgfJCXrZm/XNcZ2tfv+D2MLltzagr/s2AK5ziRgSrbFf
         521KK/PuYN5ONOC+Kvi5yJpoS84/Ex7dtnbWIV75OSFSAKDRQyHrzyo7ewFA5UieNJuB
         fHFMjJp0i7VnmC1G3+Up7P3E9bM+uJK/KX1TIP+qP+JxtbvI/io5V2ejRC9Zm+T4SZx+
         S/QJvDnxMFT7uFygTGaZc1/qf3kDhzukUzq9fWvJ9Q8C0PPhnRkFhRh51CDBBqwkCQkY
         4c/zJS5tFpDoIsQzUT7bzxnZ2eTamuJdMLjG1LJAIHYKvlUEUk3nt6AGUbi5QXBl0eBF
         u/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456084; x=1796060884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
        b=o2L03nlHuEvqboaFvTyLV3Z8tyw86l2ruc7mfmyJii5Yuuj+C94g4OXZTVUcBYY1Vf
         uzyFS+I/3M0y3HFgdUA/y7TQF0E2+WaW+9s1O2jAo4Zqh9zqQRQstEar3mfLqi724bII
         23l7yfxssKrPnVo1iS193WQkZHFYqHtMGDnQhz+2nPTSTS9mulYog7YVRGsmxu8vCfgo
         NxXzvIXT+ylVVbQIIfBLqcUJoxi5N91kfUPhOnsiKlT+x3+SsmgsyTbYD2tqecMc3I+A
         c6lPVfDIUswi/FPvG8sphpe2iJIQXeEYKHHADo9MFGzGODzxz6A/WmjVm4JShvFZK2be
         5ITg==
X-Forwarded-Encrypted: i=1; AL+hErF2hn8u/3ok5M53X7pPA5+/1a2Yzt9KOUB+N8IBls5xobVM+gEmhtKDzgl0LcQ7Exik+uqtuHaN2qvA9HU=@vger.kernel.org
X-Gm-Message-State: APuU4Z88uAEWzfae8fvfb5JAsYh9s8vEkq441pk2EFT/nzkHXRWX47LQ
	2+JW+JXI3v6m59gh5W1QClP3rXdv2j35ulkRR7SEBS2v8b460Szr3UuNWLVbc75JFBB7j1KX718
	9bVRT3zCbHzjrZ8R11q90IFjPgx/2m1jBkMPiQH2U8Hw+PUXoM7MaIH0WS/Zi8LlT4g==
X-Gm-Gg: AZFdTZfjEG4VOwWWsaHq9pCXrxROw12Co7VRIQwk8oZq6eAYU1mAWW5/pSxr4YpcE0T
	MwDalqGnvBjVzR8qxlQVz5PjIiawllROLdsalavUdstLOsc2kfkDFcYLlGdSOH3sM52lC3aIuUS
	cqr3AxaG5/S35BpQxkloWzCaj3X2VemCEnSbZeHzZg6d0AWbZg2sIGKgVYXUj9ket0xziWfck8m
	fz+fAhpyKeqErNkehAt5roZqNOioFBPM8sds4smKk04Gb5oc30NpHW7/UhepfJO+0jLYUZ9BqvF
	TKTX2kOTTlZSzCirBh8roH1tfKreSzz2rwYZiGkGeH8RjwnNvzhv6nsgR0jsNzS42QWU8SySvzH
	7JK0mVobPgzoaD0hETWEbwUGDuKe5ay031CzsWZQ+
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr30453925f8f.11.1795456084356;
        Mon, 23 Nov 2026 09:48:04 -0800 (PST)
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr30453857f8f.11.1795456083757;
        Mon, 23 Nov 2026 09:48:03 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1524:9e00:c39b:a740:e7:3fcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm23541150f8f.50.2026.11.23.09.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:48:03 -0800 (PST)
Date: Mon, 23 Nov 2026 12:47:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Asias He <asias@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vhost/vsock: annotate lockless accesses to guest_cid
Message-ID: <20261123124426-mutt-send-email-mst@kernel.org>
References: <20261117164916.2332953-1-phind.uet@gmail.com>
 <20261118012321-mutt-send-email-mst@kernel.org>
 <a7752192-b417-4e70-8f39-a3cdc983f447@gmail.com>
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
In-Reply-To: <a7752192-b417-4e70-8f39-a3cdc983f447@gmail.com>

On Tue, Nov 24, 2026 at 12:48:34AM +0800, Nguyen Dinh Phi wrote:
> On 11/18/2026 2:33 PM, Michael S. Tsirkin wrote:
> > On Wed, Nov 18, 2026 at 12:48:43AM +0800, Nguyen Dinh Phi wrote:
> >> vhost_vsock.guest_cid is written by vhost_vsock_set_cid() under
> >> vhost_vsock_mutex, but It is also read without that mutex in
> >> vhost_vsock_handle_tx_kick(), and vhost_vsock_get().
> >>
> >> KCSAN will report data-race if we issue VHOST_VSOCK_SET_GUEST_CID
> >> ioctl while the device has TX traffic. For example:
> >>
> >>  write to 0xffff88810f1596ac of 4 bytes by task 7914 on cpu 1:
> >>    vhost_vsock_dev_ioctl+0x25f/0x720
> >>    __x64_sys_ioctl+0xc2/0x110
> >>    x64_sys_call+0x299/0x20a0
> >>    do_syscall_64+0xc9/0x510
> >>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >>
> >>   read to 0xffff88810f1596ac of 4 bytes by task 7910 on cpu 3:
> >>    vhost_vsock_handle_tx_kick+0x41b/0x740
> >>    vhost_run_work_list+0x97/0xc0
> >>    vhost_task_fn+0x98/0x1f0
> >>    ret_from_fork+0x2e2/0x3c0
> >>    ret_from_fork_asm+0x1a/0x30
> >>
> >>   value changed: 0x0000004d -> 0x00000032
> >>
> >> Both readers load the CID once and works correctly with either the
> >> old or the new value.
> >>
> >> Mark the store with WRITE_ONCE() and the two lockless loads with
> >> READ_ONCE(), so KCSAN knows the race is intentional.
> > 
> > You make it sounds like it is just KCSAN false positive.
> > Is it?
> > if yes, this should be data_race. If no, document why.
> >
> 
> This is an actual data race, not a false positive. The value of guest_cid
> can change while the TX worker or lookup path reads it with plain accesses.
> Because each check loads the CID once and either value is valid, the result
> is equivalent to the read running just before or just after the ioctl.

So, no bug. Pls clarify in commit log.

> Even so, plain concurrent accesses are a data race under the Linux kernel
> memory model, and using READ_ONCE()/WRITE_ONCE() also prevents
> compiler re-fetching or tearing rather than just silencing KCSAN.

It never happens of course, but avoiding this
in case code is refactored could be ok.
Pls document that as the reason to prefer READ_ONCE.


> >>
> >> Fixes: 433fc58e6bf2 ("VSOCK: Introduce vhost_vsock.ko")
> >> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> >> ---
> >>  drivers/vhost/vsock.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> >> index 88a310390eb0..f26c59013075 100644
> >> --- a/drivers/vhost/vsock.c
> >> +++ b/drivers/vhost/vsock.c
> >> @@ -78,7 +78,7 @@ static struct vhost_vsock *vhost_vsock_get(u32 guest_cid, struct net *net)
> >>  
> >>  	hash_for_each_possible_rcu(vhost_vsock_hash, vsock, hash, guest_cid,
> >>  				   lockdep_is_held(&vhost_vsock_mutex)) {
> >> -		u32 other_cid = vsock->guest_cid;
> >> +		u32 other_cid = READ_ONCE(vsock->guest_cid);
> >>  
> >>  		/* Skip instances that have no CID yet */
> >>  		if (other_cid == 0)
> >> @@ -572,7 +572,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> >>  		hdr = virtio_vsock_hdr(skb);
> >>  
> >>  		/* Only accept correctly addressed packets */
> >> -		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
> >> +		if (le64_to_cpu(hdr->src_cid) == READ_ONCE(vsock->guest_cid) &&
> >>  		    le64_to_cpu(hdr->dst_cid) ==
> >>  		    vhost_transport_get_local_cid())
> >>  			virtio_transport_recv_pkt(&vhost_transport, skb,
> > 
> > Will prevent compiler from hoisting the reads out of the loops.
> > Does it matter?
> > 
> 
> Not much in practice: because the loop body calls non-inline functions, the
> field needs to be reloaded across calls anyway (and in `vhost_vsock_get()`,
> the `vsock` pointer changes on every iteration). I checked with gcc 16.2 and
> clang 21, and the compiler does not hoist the load out of the loop even
> without the patch.
> 

