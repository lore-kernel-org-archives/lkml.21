Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688082;
	b=eAzMWqf3lrkavawNprFBklhEB2cbTswZgO64Koixg1FnrMO9uCh0eZbR9xvAjEGwU1L0
	 Nz5vIPZ2BQIiElEfh8QX/nWEStG+Fjg0kezsjr37bXuTpuif++NOniSJPZtQlBViEt4aY
	 di9eErVw4Vevj+gpM3KifxiYsQyjtIzSWAiNzHDpM4+qq0eF2x55M4VFrNhOZzuktjoxH
	 Cji1r13vU6k1beCAjW8ZyH+d9ga8NvJAt93pjou/AD5WsjqLB4LsYbXp3AhojkiCVb19+
	 bjPMeuY39Ih4ClWGFtXT4Et3GqL/Kc4pqQ50haqIj1dIPE5QrJms9FAWRCuYpuUcXEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688082;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
	b=Qso9WVRrf0etBcry4ICPReEBIKhYLZ7bnOT+RlHsJffHUyr6yjIzmWn1X6Unpkm7dWlX
	 ODOYg3SpSuspWGBpzJdv1rNkZJpGFPpDdrvbJ4HeJsbto2oB6rsbdUT1SXZJPC8RijXCq
	 T5G1PqLFMSPX9x3Vh3tU24RJCKTY20XL+CVhq+oSAzOZOeOUks9T8zmi4TT1wKuCWOrkj
	 nEbnhskg5cNaRQTkmg3CbHKT7R4VWEsHC47uk8TmQMa7qe9tiyNeklYgyG8jOyv3kQmKd
	 vWdVRYrDCtT+LS+q82B2vm9VRWB8yf8pSkBHNrgwLrZMXu5dCEYNKVH1Vn9X4nuro8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QfhvVOBA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Novt99Iv;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7B606A69D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB7B606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QfhvVOBA;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Novt99Iv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795688077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
	b=QfhvVOBA1Jh5+GzeK/PWLIsk/3l4Hm1FRzShQ0yTqSUFKtfC3ULVr/pzzn3JV7fLOIXdJX
	0vmc38r6FCLGhosgWNclLI2fNSmNFmnkmOqw31D5vcGb4wuSP5fK8GgNkBHagLN9WE2X0H
	29sJQy15kbXHisMGOnRLc6cZu0Vx1Eg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-CUtOQJtlOYmobjPnONOXMw-1; Thu, 26 Nov 2026 10:14:35 +0000
X-MC-Unique: CUtOQJtlOYmobjPnONOXMw-1
X-Mimecast-MFC-AGG-ID: CUtOQJtlOYmobjPnONOXMw_1795688075
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4903fc8537aso4551208f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795688074; x=1796292874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
        b=Novt99IvoJHBJ/nZbRBzAfBcTol0OkkVsYep/cKsDHWzuCmfRlBwTGAwNzvzTwvikC
         YApTr97ucTzYvzijLm1iSOdclGJ+wewkvaO6tyqb9QvQElDnBHsTbE2XRmb08nib9IS+
         fPYQr18Oxc128/QnVzb8nD/sCMldgYlWBbpamtajFaiZ+cX6HDC4z6pKrk1G2gFwXr4V
         ubbLmJp04FG1V5+nmDmvPcaUD7EghWcpfm9hYqBqgVul0l1Fosfx6FyBsztlzNCGrkFi
         AwQol+biuxYtul+APnDx7r1d5FxyBKErYWbEvZEzKof/CmmjPCnqvpZioPhH1dyPDmB4
         gsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688074; x=1796292874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BnEINIidcy7TeGrgKBkYjEF8byD48m59WTwJN6efYCU=;
        b=fnnR/g8OPOeAPcpDtSsrbyIJdFPiQdKUG/yDaf/oy15ko4CeSQKI/bLSCxjo88TxaQ
         0IbyFn6nXkr2A2fSwJm/sRsXzbTiEcAwecNcbbeRE1FqPdNidVILSl+qJQ8GKPn5NXHo
         LISFiAa0sHRvH8E3FtAfFx1VqiEougN9Dhi6KjWOoecO7/dY6V/LAkIXQ4hR6YTzRT3x
         t/MpPTAVW/okUk06TdL4rUy1MgAOo6VWLfX1GJDqOZOzdlXtfNYGXK7yoDJeNCJDKVnL
         kxZCBbO+qWFuCIrQFpz6PrRXIdTCw5Epe7cT9gF8HBufYYlo4b0T9jFP0Pem7sSM2dte
         +EfQ==
X-Forwarded-Encrypted: i=1; AL+hErGQX2CV1d/NYDJrvIiUE1nKHHWhNacyRI1oYoc1LfUUKPNha7dlsCB5kBU4f/gBxYVwtF1zOxNFd8o7U5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UAKYzn2n64TLGusgBi+/H6j+5UY6pfap6mBWsmmQYxEDbfsOl
	GBSMWDct5q6lL9JYv9GUzqTQLiTf1Cr0uquK6opBgoZYNmCYrbvqWdFO2fWaaQHwZwhXMFe4ZW2
	DLoBS+gjZ4BWOck+jtEuSsOTjeNrnOSdnoJkKziLS3hs2/OqppnYldetJnIfAwtvx0Q==
X-Gm-Gg: AZFdTZdPGZaHu3khjIsNuOUE0EqMktVyd0vHQqa0/HLFpNZOAgf3qKPj6Y4j0grTmMl
	h4fARV0ONe0/gTbqG1FNV4LqIHFF4xYyw/Oqv4jQ19w0wpjfAVGcp8/9knlsIl3CUyn3IOl7F91
	n8g+njUw9Wbyub91LczwIxZCBqL3dW7c2lCf9s/CvnmtOC/r1gvCmtLPWWTFqao67LmNSWisaY7
	bQtntpuDzHEIDbbPZb2FAcOjiiRgn18u5YLd0j952brqGIvovS6SiJhC5mfnjmi+gVbmFzCpLRc
	+NBWhb9qne1QRDdIe2X+Z7dBhhaPO8yJwbFd2cPWDNqnJ7c69A8FavM+p6V75zApsuPm5rVotxG
	tNtW2q1itujqlHesoI5sY11yJP5gMIe15pSC94y/HO65rsyjzMHDEAw==
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr429734065e9.18.1795688074524;
        Thu, 26 Nov 2026 02:14:34 -0800 (PST)
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr429733645e9.18.1795688074082;
        Thu, 26 Nov 2026 02:14:34 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm45686158f8f.14.2026.11.26.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:14:32 -0800 (PST)
Date: Thu, 26 Nov 2026 11:14:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: netdev@vger.kernel.org, stefanha@redhat.com, bobbyeshleman@gmail.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 4/5] vsock/virtio: coalesce native RX
 write-space notifications
Message-ID: <awgGJECGxVi-40Tq@sgarzare-redhat>
References: <20261103041134.33310-1-physicalmtea@gmail.com>
 <20261103041134.33310-5-physicalmtea@gmail.com>
 <auxHe77Kv3tS4hjJ@sgarzare-redhat>
 <CAJwVaMK6UpxOmCbuzGK15h+DhN5H6cj6cy-=gCHtSxoVbLfzwA@mail.gmail.com>
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
In-Reply-To: <CAJwVaMK6UpxOmCbuzGK15h+DhN5H6cj6cy-=gCHtSxoVbLfzwA@mail.gmail.com>

On Fri, Nov 06, 2026 at 08:49:17PM +0800, Jia Jia wrote:
> >
> > On Tue, Nov 03, 2026 at 12:11:33PM +0800, Jia Jia wrote:
> > >Each received packet can update peer credit and call sk_write_space(). A
> > >writer cannot consume that credit while the virtio RX worker retains the
> > >socket lock, so repeated native write-space notifications in one RX batch
> > >are unnecessary.
> > >
> > >This patch coalesces write-space notifications on the native AF_VSOCK path;
> > >data-ready remains per-packet here.
> > >
> > >The batching patch establishes batch ownership before its first packet.
> > >This lets this patch record a pending notification for that packet and
> > >flush it even if the packet immediately ends the batch. Deliver it while
> > >holding the socket lock to preserve the callback context of the existing
> > >receive path. A following patch changes that timing together with
> > >data-ready handling.
> >
> > Can you report performance data related to this patch also here?
> >
> > IIUC this is not giving a lot of advantage, so my question is if this
> > more complexity really add a value for us.
> >
> 
> Sure. The performance tests currently cover patches 4 and 5 together,
> so I will include those results here.
> 
> They do not add another broad throughput improvement. I kept the
> combined notification change because of the cycles/byte results.
> 
> With P1-P3 only, against baseline:
> 
>   Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
>   64B        66.728    61.220  -8.25% [-18.99%, +3.91%]
>   256B       14.363    14.515  +1.06% [ -4.22%, +6.64%]
>   512B        7.792     7.578  -2.74% [ -6.55%, +1.23%]
>   1K          3.988     4.032  +1.09% [ -1.64%, +3.88%]
>   4K          2.063     1.973  -4.38% [ -8.23%, -0.37%]
>   8K          1.702     1.667  -2.06% [ -7.99%, +4.25%]
>   16K         1.473     1.475  +0.17% [ -5.06%, +5.68%]
>   64K         1.385     1.358  -1.96% [-10.61%, +7.53%]
> 
> Only the 4K interval excluded zero. With the full series, against
> baseline:
> 
>   Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
>   64B        65.282    57.843  -11.40% [-13.77%, -8.95%]
>   256B       14.710    13.813   -6.10% [ -7.89%, -4.28%]
>   512B        7.709     7.188   -6.75% [ -8.79%, -4.66%]
>   1K          4.075     3.862   -5.23% [ -6.80%, -3.63%]
>   4K          2.034     1.887   -7.21% [ -8.67%, -5.72%]
>   8K          1.664     1.568   -5.78% [ -7.83%, -3.69%]
>   16K         1.450     1.385   -4.48% [ -6.08%, -2.86%]
>   64K         1.338     1.317   -1.51% [ -3.21%, +0.22%]
> 
> From 64B through 16K those intervals stay below zero. 64B through 1K
> did not show that in the P1-P3 run.
> 
> This is also why I spent the time making this work with sockmap.
> 
> The value I see is lower RX CPU cost, not another large throughput
> gain. I am still unsure the extra code is worth it, and I would like
> your opinion.

Thanks for the numbers!

Both tables are against baseline, but the two baselines are a bit
different (e.g. 66.728 vs 65.282 for 64B), so it's not easy to see the
real contribution of P4/P5. Can you compare the full series directly
against P1-P3?

Anyway, IMO the big win of this series is P1-P3 (throughput), while
P4/P5 add a lot of complexity (saved native callbacks, new af_vsock
helpers, sk_callback_lock, sockmap corner cases) for a ~5% of CPU
cost, without throughput improvement.

So my suggestion is to split the series: send P1-P3 first, so we can
focus the review on them and merge them, and then send P4/P5 (squashed)
as a separate series. That way we can also evaluate the direction
suggested by Bobby (batching in read_skb() + coalesced sk_data_ready(),
like TCP), that may allow us to avoid saving the native callbacks at
all.

WDYT?

Thanks,
Stefano

