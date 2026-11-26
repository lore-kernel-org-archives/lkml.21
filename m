Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718562;
	b=pKjfJ0qTo8u44eFxB9eZwHj/VS/A4Y9kIirmlZCpClNRPjk32/j9lkGRX9zoqaUhyTz2
	 ZkCW4iJrFvw90ItXvCZKX8TmY/ZMTKCJllvc01Yg2OuyZGbBVisVwSE7uMD+NwR36gm5M
	 k52LGp+XPkLYGQ5PXSSXwLVTolGTIfE4cIWccgLO1Krptz4CmpwLzwlcARE2IzQO2H+GZ
	 fOVf+Xtu5SLVdYX0QIJ7UIpCDE2KNpbkGKy1iHsCbiRre5C0dcKdXAfvRHuqi8ZSRLcRa
	 oDzVLsRfU2L5L9jQ0L4jioCL7vJEzrekfCEgjnBJF/0xseKF7WjT+StSeIh5X9fCqPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718562;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
	b=Rn/+WULhfzR0KBh1h6ZPP6d/Y5dTbTlf+uYtUz10Rs4VOX3s1hCw9581LCkHB8Hlk+wf
	 Zgr+1l9HG5VAnLMYY0YnGdLZlxhou6K0mFyGNRQgD7NeMiJTB5GMcEjeCagZv6MsXpM+Y
	 NtkWIteUV/v40ecAkskrZgoyNUvuDYwCLD7GEtUPDL6gFL/0/Ej9eMsM2OSVJVZ3bnOHq
	 bI19tMqp0hrQKWXq8IoeKtA8k3nyQRbhUapouhg6H+JxGK1pySXj+omnQutP9bhqb3kfY
	 Rp+pCopScJOQ183/EzoZcVlAqkEbhGP1cgKSrefHi8wMJUngvoVG4RsL2Ds6XbJdTWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SfXIfkCR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfZRd78T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5302A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SfXIfkCR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfZRd78T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795718560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
	b=SfXIfkCRbQzIDvKQkDcpskMHAkS7KZdmZYQKjAGSZiQiNcHl59FMBFaRoAenkPbLl9N/xB
	A4+csaOMuhqnWqvWTQ6UrD3O3hRTRw4zoX7m6aMRqb1qEzBIENGORUgzsZ1M8ef8Rl4VnL
	MlGyA5ikUQEvGhWI30vOqSvTIlg2om0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-mNWDDyBFOgqghvfHYGCSyQ-1; Thu, 26 Nov 2026 18:42:38 +0000
X-MC-Unique: mNWDDyBFOgqghvfHYGCSyQ-1
X-Mimecast-MFC-AGG-ID: mNWDDyBFOgqghvfHYGCSyQ_1795718558
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92111028a03so129992776d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:42:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795718558; cv=none;
        d=google.com; s=arc-20260327;
        b=OPEilIpRUsmmBoKCNxaK4XbqU9HZKjEu/RNrUItqOxd0VDOiCDYPTDy/8W9usAtlag
         5ERP0FJq18EkywtYzEBnpCuV9H4QEExRNbkX0ECCHCXAYh8GQX5q17V20hIX3XtcV7Ys
         X90QaQldWBflgmkm8TRrX+7OL+fpQQo4gqPkTD/hHrt9QsSBgjiY8PkJpisCM9ZI9ZFb
         ZOYdB6G2X/QaynIzBdCey0RpjmmlbqE7cXIRm1cf0aPVieW3/Q6g08prouNLUAtzbPcT
         7I6O+Rx58RfPzG97Ycwu9e5I8qAIqIyS7wAz0eclL/ZjQchQI36GITEVw3d2BcSYiZe+
         8paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        fh=uCWf3/OOQ24DhnCOyxi1xyNanwvdZvdhzTltnDeZYiQ=;
        b=g88eDERz5W/+lDlRzBwpSKjAhGkxhmKwdsFvDzabCe4c8plXvjWFrT8yxhPjQRy090
         3VVZAn48Ha3+VBGoRvgJhoKp5fwtr4+s/BEnjfdY2fcO6hibHemToZHMlH8P2dCN2aEj
         sCjZC5m+GCN7rooPCAG4y6yMlwKCXz3m1s4tmBJZrrpuRXPOPnqVvUJYODNDuV12M+/z
         gDsOZWTbbet2a97WKNwwDzGjDynjKBy3wKFw42PWwpX/p+es4yl7yqFYPBj1Ph4L3mer
         h/qpcuvdxia3uSc4vi3wHw1R2choT6WCtug3YCbYTnbMP4UMYYCCRDZziQXarvH5/PJ7
         Q5Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795718558; x=1796323358; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        b=AfZRd78Tl2My6cFNYn6J2IoXlWU7jd9dGbwrI6sPcEv8IbdB7fLO2XDTbfQrF+Io//
         ixsvT2itMWfRas0wyep77elrun0b0HGJrXml5mtbVm6K8dyKkh0KXNx0lrSGsPUkPCd+
         htlBpxymRJe/MctD8/s3oBLQrenF1llfpvNVhQu32t7LIWWg1Bh7H8nsKdn3e7FAE3vz
         mQxf/6gLyv6dziabFgdbxxM1bskyM7oKpN9JDuuuJ0aXwEDBLVIA3qoPxkSditthi7C9
         qBl0dW/paw/ir3LbJm8JTGe5BmEL00jx/ma8TFxiJ/0OxfY1hFMGLr2/eSwDP5uNRg0l
         WIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718558; x=1796323358;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        b=Bt8zbFmbV4sJOk0+51Ql7Jj/N7fO2UR843fDaPeMVKw40xbh1R7u2aSQiKFMeuFrEP
         TL42ri+orR9QBVc3/dIl0of/glgXxW4tt+E8qaJEFOt6mFz6R+cQNuWMpphLoSjkzkoW
         fGRmijij1xWTfMF9Cp0F7BRR1U+7tx0+Mce5/lEe7o3pOJB8Qm4soMFeUFkXzna1+w+F
         s85ZqQ2ob6iKtWuNqIgyqhLCDFfuH7U/z+12ZmWTKh1Al5XNeTR4yKGxAAZ9WoQ0PWHp
         VdiKLVzTA5v97ubOhX8SB8IShjJF5xQ8AMZ4YtbDSGt6xAZ5M/ggCx3kjfgPUd3E1GuW
         Z2Ew==
X-Forwarded-Encrypted: i=1; AL+hErEsUgdXbliGQg/jvLR4T+TomN3yVyriVBLTcUw93njEEZ/5b0AzqViPKi7Z3IRl6VL8Q/EzE9eiJpst8ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YvfrPp01hCpJ3mbam/QDwjoxIIenaD6MxQ8bODbhoEuUZQXvT
	trcfwjXj7ZcGfG8STVFkkF0pdyxT22vyWNES1xuRytt0fxhIcAKW2WVH42tCSb/aQJPj7GLGtFw
	iDlLaN2Ld/ikZ8qd0mAZ5gE+Qd7KBmQNXQhDAM1XysUSRZAQM9zPeniuSZth/aqAeEFjlW2bXrK
	qf+GXrWdvWiv7UkUrL0cyVrh1vJnn65W0kOTsCCGmM
X-Gm-Gg: AZFdTZcftSRuQBYg0SXTvnPbhJC2pPaSCmsM5u9K4uLn/Ec2p9qKIT/fUBoNggGOgsS
	+WTps/tIyfLYeVvyV0KFDJuPH6eb+yo1HLMnZRhaAbIiPUbg+IR8lNLtDfMJx2s0uKM2MrtA9X0
	9awNmVQsQMoON8OelhrFPs/cZOBAhrUVWR98GUiShTFbOzt+Sj+ay9mgU=
X-Received: by 2002:a05:6214:5701:b0:921:7c1a:5953 with SMTP id 6a1803df08f44-9217c1a5a29mr99541706d6.14.1795718558196;
        Thu, 26 Nov 2026 10:42:38 -0800 (PST)
X-Received: by 2002:a05:6214:5701:b0:921:7c1a:5953 with SMTP id
 6a1803df08f44-9217c1a5a29mr99541386d6.14.1795718557797; Thu, 26 Nov 2026
 10:42:37 -0800 (PST)
Received: from 821463759402 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:42:36 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <awhAaTuR375RpyAE@sgarzare-redhat>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com> <awhAaTuR375RpyAE@sgarzare-redhat>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 10:42:36 -0800
X-Gm-Features: Aa3M54odw2FRTdRy2uflU_aL9ZEV5X35-hMgLihiDc4DudGmLOU2wiibEdItlhY
Message-ID: <CAAiTLFXT_Dqs8sUY+dL7KhXL=-QYudikb9kVFFRvGv9Ri7y7ow@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/8] vsock: add datagram support to virtio and vhost
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, Alexei Starovoitov <ast@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Sashiko AI bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Stefano Garzarella <sgarzare@redhat.com> writes:

> On Tue, Nov 24, 2026 at 01:20:18PM +0100, Sergio Lopez wrote:
>>This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
>>the existing AF_VSOCK API. It is intended for guest and host services
>>that exchange independent requests, responses, or events and need message
>>boundaries and sender addresses without a stream connection or application
>>framing.
>
> Thanks for restarting this work, I have finally found the time to took a
> quick look, sorry for the delay.
>
> Reading the cover letter, it is not clear to me the changes we are doing
> to the core and VMCI that was already supporting DGRAM. I'd like to
> understand better how the backward compatibility is handled and how VMCI
> behavior is preserved. Also reading commits, most of them just contains
> a description of what the code is doing, but they lack the reasons
> behind the changes (i.e. the why).
>
> Overall it seems the right direction, but I have some open questions
> (some of them discussed with Bobby, Stefan, and I at KVM Forum some
> weeks ago):
> - Can the virtio flow control be affected by a flood of dgrams ?
>    See https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-5720001
>    and virtio_vsock_pkt_info.reply / virtio_vsock_skb_reply(skb)
>    handling.
> - Did you test virtio transports when VMCI transport is also loaded?
>    That one is automatically loaded (for historical reasons) first time
>    AF_VSOCK socket is created, if af_vsock.ko is not loaded. So could be
>    a common scenario.
> - Any limitation of the current implementation that we will need to
>    fix/implement in next steps?
> - Any performance number?
>
>
> About patches, I started to review, but I hit a wall with patch 6. It's
> too big and really hard to review/maintain. Please split it (e.g. the
> refactoring for vsock_assign_transport can be moved out, etc.). Also
> there are too many if() with conditions duplicated and few comments on
> those conditions, for example:
>

I agree. I focused too much on quickly addressing Sashiko's feedback and
things went out of hand. I'll rework the series with a focus on
bisectability and readability.

Thanks for the review, Stefano!
Sergio.
