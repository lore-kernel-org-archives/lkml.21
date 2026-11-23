Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450639;
	b=dzgV/zelq9vbTOX+oniVsEH23C3k1Bs4IM4FYV+nBs9MoT8cX8MDiotQINtiDbtdgkE0
	 I6aINLj7T5nBJzKsF1vrq7Z+QJ7rZX0agGTpzZuetNxKhirrm3j4ErojswmTshyJlghTL
	 RBIyOiPZEtlUYudvdAnrmbX2+F+zpiBNjuudFvhGh33W2LsxjRItPDXGtdySiAl6/Y3dO
	 FiGA5eac6IfMgHtzBUTDiA4RdfocwFo+VxVoNRA3hjFbAfpvf/VNKOqBN59Ez7TXxzl2x
	 /3Cu2M56Qjuev+rQzJ+bvctSzLjT3C1uMVO+YUJ38fReesoBGlNu+Xo7oSbL8LtYl2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450639;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
	b=ncmY2s2iVrSbn3sDaax6KLw0u4fGJyQr1j1u5wDHHme8o/fUrqgDottnw1G+vDb2P54F
	 Dz87Pkr4RsBCIcz1r8/Es8a5WpNn5fBpn67W73x+Iaa4le6K56q8zLebcV7nnguI0O5Eo
	 NF4+4N5Cn2BZAKFftexPPemaWuMOTwh8P7KGPhfvoy78VV7CXZgtt9rzDnZvDfVRM32SK
	 qpmNDXXz53u56YoUBdD1fp0ybVUZyw6sfzzLYaBumj2Dyn5RzOELhsBkWiMdKCJc33mY6
	 uF0qeQaWo/r/brlQfUgaAi5Pd7G3xXN5Q5PHh5LexqesDfnmzgqIhVx8J9i3YHJh/vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IPd1nB6Z;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EFWjYSTs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56BA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IPd1nB6Z;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EFWjYSTs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795450638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
	b=IPd1nB6ZLVQPneWsEXFvVVQMx8was4lClAZCBRJ/L+sUBLyHeaHJ98E0y44GGj2IvD8Mam
	za2JsFaOFpufuJhaec8H2FOf+QS8CDWD6vLCgOC/WnmpZz0lMSflAG+Q6Annvq5f167pU8
	zvfRzKu0Apt8fzLRRPeMKIo2Gzy3Jw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-_GeDHt8YOMqIi6uOxzxpEQ-1; Mon, 23 Nov 2026 16:17:16 +0000
X-MC-Unique: _GeDHt8YOMqIi6uOxzxpEQ-1
X-Mimecast-MFC-AGG-ID: _GeDHt8YOMqIi6uOxzxpEQ_1795450635
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so2868679f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795450635; x=1796055435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
        b=EFWjYSTs6eZbKtZfTzVI20evhQuKBSbQFwBnL7ixe6pYNqb3IX5FdNJ1NXk12la/fo
         mtcq8GhB5fbnQhWtE3XAnfyxUDceh6nkUkIoCsejjiZ5xIUIo3D/lpZrrdqy6JZ1Uw13
         i8gGNOQfWASM9FbNeEqtG58xOZ0gLZR8bMdPEOX2aXVh5toHQitzAoqzO7HXU7XK/nni
         2yJbyWsuJtKRhA10Zs2K92JS5vL+KOQjUYEnkDWYjbNa0+6B+VTKq8E5pBfICJiVZpG4
         jYCFjpoDjxCISpe4VOF/NOPsukP9LGBo41m8ux/OAQcxreEp8Ej6xJTjSYH05IAQwH8/
         xjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450635; x=1796055435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
        b=pr5Id7VMtR+hYhvu763rrlQwxpQY4PU8xgsT4DVjTM7fhK2aLe8TWpZPsKHcL2kzwP
         XmlSdXY1fUBw8ORwtm27EHe6FTPrxHgG3G8jQsHHsXv3yLNCAjsJvka/a8JSSjcjJCp7
         2dxae4mkJYP7zrLObCnqw9eKLm82JfsUIPh7Z4b1syJxs6rBO3nQemVOlxkKWFNjMvkH
         OWclCZjSIiJBPlNv8EHTHNCikgDkPS+wSco9Kzc2dswV4tptBdJOZAU6W9733gBZ+JHw
         UsBrstgRctqRtKsL6ngSV/sIDwn3nko7uSzenrCQBCEfnay/X35ayxVzMX5mU7JXBAbo
         4vRQ==
X-Forwarded-Encrypted: i=1; AL+hErH2qKswT4bo2Ulx/eG6GRxq4fK8GWg+zYezRi8nGSfwjRnjIyxGCpCyB+MQBYuSEUOriFK4+bD+A4hzH4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zgOq5Mv3SYaT/RlupFWJ9udA9p/9gckIS2v+k6xbcf3t3Jb8q
	Ri1EVZtz4iCEUPy4pmj41mFpGLuHnLH/EGNLDCTbOxKLCr5NzBAkGNwYQf1Rgsxm9Honj4Tts5B
	gP0OsVMYq2VvlwmbLvWnOiFmmB8d1k/HttOJ8odgqoS8M8kjmI7ISYeoayUZG3eo3tA==
X-Gm-Gg: AZFdTZeg5/k9BxKTLCUJAkfvjCVUhZ7HNZhVIs6deDpTigoGboKcpKO/Xh22FgCvGnr
	HDKzZm7Sr7bk0t97qtOyIU6ZV9R6zIzWTX/4qBi0vKDxcnoJUk+25XxX7qy5qLs5tuoIcWQA7Qk
	oBGmPK1Sw2ViEd3GGol5H54XEXRZGdW4+CpXD+J+pjKP5dC/s7NsONhIUqwRBMeoayBl+BteE9M
	gtwSHupJapniwqhQT4XziZZcJwUS4IMIHIUBk6VTzViQiRlgtRYQVOtva+E4JUIjXI0n4OyWOQB
	YMpdq9hNOfmH5SPz6ggbNbYRt2KOKavD34Az6emapbFryFUj1ERdr81qJ95wmS/+2twroulH2iW
	0x7nJ8hWVuquKTprR1jkPHXfCrNSgOrs/LcWboYOcdMLrsV6lf+7+Yg==
X-Received: by 2002:a05:600c:674d:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb88808263mr270420275e9.14.1795450634791;
        Mon, 23 Nov 2026 08:17:14 -0800 (PST)
X-Received: by 2002:a05:600c:674d:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb88808263mr270419595e9.14.1795450634202;
        Mon, 23 Nov 2026 08:17:14 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm209571105e9.4.2026.11.23.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:17:13 -0800 (PST)
Date: Mon, 23 Nov 2026 17:17:07 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: jrmmhm.kernel@eldare.de
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v6 1/2] vsock/bpf: fix zero-length, MSG_OOB and
 MSG_ERRQUEUE reads
Message-ID: <awRlwL1epH1j61Z7@sgarzare-redhat>
References: <20261114-kbh3-1-022-fix-v2-v6-0-96b6029bbffa@eldare.de>
 <20261114-kbh3-1-022-fix-v2-v6-1-96b6029bbffa@eldare.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261114-kbh3-1-022-fix-v2-v6-1-96b6029bbffa@eldare.de>

On Sat, Nov 14, 2026 at 12:59:14PM +0100, Jerome Mohm via B4 Relay wrote:
>From: Jerome Mohm <jrmmhm.kernel@eldare.de>
>
>On a vsock socket in a sockmap, vsock_bpf_recvmsg() sends zero-length,
>MSG_OOB and MSG_ERRQUEUE reads down the sockmap path whenever the psock
>queue has data or nothing is queued at all. That path copies from the
>psock queue and waits for data, and it handles none of these reads:
>
> - a zero-length read with data in the psock queue spins with the
>   socket lock held, and the delivery worker blocks on that lock;
> - MSG_ERRQUEUE consumes stream bytes from the psock queue, and the
>   zero-length MSG_ERRQUEUE read that MSG_ZEROCOPY users make to collect
>   completions gets -EAGAIN or blocks instead of reading the error
>   queue;
> - MSG_OOB consumes ordinary stream bytes or waits for data, where a
>   connected native socket returns -EOPNOTSUPP.
>
>Hand these reads to __vsock_recvmsg(), the path of a socket outside a
>sockmap, which does not wait for any of them. They now take one path,
>so the order of the checks no longer matters.
>
>The MSG_ERRQUEUE case was found with the help of Anthropic's Claude,
>its stream-byte and MSG_ZEROCOPY parts by Stefano, and the zero-length
>and MSG_OOB cases by the netdev Sashiko reviews. Each was reproduced in
>a VM with a vsock-loopback socket in a sockmap, without kernel changes
>or error injection. With this patch alone they behave as on a native
>socket. The vsock vmtest.sh single-VM tests and the BPF sockmap
>selftests pass with the series; I did not run them on this patch alone.

nit: IMO talking about series/patch is confusing while reading when the 
patches will be applied.

>
>Fixes: 634f1a7110b4 ("vsock: support sockmap")
>Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
>Cc: stable@vger.kernel.org
>Signed-off-by: Jerome Mohm <jrmmhm.kernel@eldare.de>
>---
> net/vmw_vsock/vsock_bpf.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/net/vmw_vsock/vsock_bpf.c b/net/vmw_vsock/vsock_bpf.c
>index 9049d2648646..c9b399f37720 100644
>--- a/net/vmw_vsock/vsock_bpf.c
>+++ b/net/vmw_vsock/vsock_bpf.c
>@@ -80,6 +80,9 @@ static int vsock_bpf_recvmsg(struct sock *sk, struct msghdr *msg,
> 	struct vsock_sock *vsk;
> 	int copied;
>

nit: a brief comment here with the reason would be nice

>+	if (unlikely(!len || (flags & (MSG_OOB | MSG_ERRQUEUE))))
>+		return __vsock_recvmsg(sk, msg, len, flags);
>+
> 	psock = sk_psock_get(sk);
> 	if (unlikely(!psock))
> 		return __vsock_recvmsg(sk, msg, len, flags);
>
>-- 
>2.56.0
>
>

Code LGTM, if you have to respin, maybe you can improve a bit more.

Acked-by: Stefano Garzarella <sgarzare@redhat.com>


