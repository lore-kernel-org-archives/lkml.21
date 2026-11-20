Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795211517;
	b=KQL2ckaz3/j87PgGfgWg/vKx2Z3VDyenYLCv6ps+Pvbr7PiTa7Fic/h6UZvbQMgdUH03
	 o6FBbfFBsZlNP1SS1VJrB/uixuzjcUy23BjDDql3fWDiPLxqLz0EsKqt+wrZBJxmqt8fQ
	 2jurwQFeVXYTiI/7RYTOQXZwQ5K9RRldA5dTQREV/ktc8zKZ2SYmRFTwJmEkBxD9gk7LE
	 y87meyb2GWmYo2eUs2F+wlwft3tjT+Kfud81O8eumWeCoVhU8mUuPl/8dmqpRQ7uMpbxZ
	 cMpgM612s1URftl9ZBLkrJs464dhfvR1qSKQe/vCtwEpmTZ2OzmfX39g+fwD75TgVow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
	b=XKfBLXX88q8bz+foE9UM09+Q6tVYb3VU3WvGwuVKZQyIhKFXH57wXQ2fE0WiNTa3Gne9
	 2paEXDGVSP4VJvCVP9o5YbbubtoYk65A/A0op0rD5IYKcGaVOFxySRFYXhEwZUMgKcb8i
	 1qK/nAGCOJq0jgaGBBYsNUCc66No48oy3BC1WKjBdMOpZfTxq4pWvknQsB5LWpX1ZC/dW
	 lCBo0g+5rGLdrFMruD+ZZihTiLsVfcngVmzWeGSFlngczrh2Bc/BU2j1LmKRIk2tIDAWl
	 5crKFRTDScRQ1O/sc4ZASn+4eCsl4CHcDcqAiNo1/9CnDUJ00tVItCZplgNscmPH8QA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=AgPu5J62;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81634606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81634606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=AgPu5J62
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so674976a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795211514; cv=none;
        d=google.com; s=arc-20260327;
        b=SK4yNdmhQtMUBb/uYteE0XdgeEOW3zOmAQeZO6PuS/sLIXc1V27byFnX3anMWsBlJZ
         5jevpbvz7wS+Q+TKbj6N5hPjxdrYP3LKjxNU8CQAfm7xPOGApEPRHgHrnaQ7uh333QCl
         4FK+MslrOmQRDAAU95y3sO2yNi+d7HKAwkdYRyJAKdjfa+v/z6cFxfvJ9fEDQNfZqqaO
         f5dpOjxcY/P8Wh6yaXng/rofNrDLjsRlE+aJeYB4E9hNMLYvXne1JTncDwCDtCQVMJNi
         R2CrbBFmh2ynXLMK8GZBIC8HFOELYlW+hw5SbcnPAh/3pTpEXdOuKjWysvnIAtTHJgxH
         GE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
        fh=CxopVGBeivC3+4s3lNFpwTvLWgYCeY/YCHCpRfqFAE8=;
        b=ELuLOeuTFMZMKNDiKp1RxqnTJCDYKurJY+tConGYZxWyw6UAyvHmiM37Hj/tJGrxsC
         rMupKp1c1GkklaZUALwdlHgdYFVCKfKducjCeviKPvw8P62KQmlXTXHC1IdRi5KJejdu
         FqueKuWXQiE+6HpB72NGa5hdb91j5/pZx89BVeBNpwWdI1Q6laVX9s0DHIC9oAWDJpJj
         EzvcW0TTOdzItEwHrU+ggkHfqtHXh2OLGk1DN036PRzHm3A/HH/2DrNamVTdszoVxiHh
         9+H4gDcKZTe2eb5O8dkd36hFV4m9K3BNr0/ijFGsWawlID9TGDRiXd0qVjdsyszkZCHv
         t3ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795211514; x=1795816314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
        b=AgPu5J62QchcMUFXnKGeHGbhznBH6/4T7KsyEkUOY27M7C4mEFFSzy3D0ukukqTs+v
         UdDLQh9qODUhqfGqFsRY3RqFnN8uTMHP1xeNP3cvDMwmgCPX4Mh9/RW5fC4sFN8V0uTn
         rU7AJPDQYLS821tOzruzDeD6nTadcmIZcqcMg8/4CMjmseE7wxWIgYPV4emZX9th4PF/
         eW1doKHM0VaUDJeBjIj5UGavF+VbJvuhjne7xwCi5+CvJ9jFe4lnge6932l/u3shVWyB
         WP2/riBG8FPPVN5srrNlbcNZ/Er2N1sDRsJb8wvAsxiv4vGiQ3YH3XA0C+ow9fDDXmBH
         jbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211514; x=1795816314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
        b=BU1zpWQ3NxGOONjVNiDLHNe1RR/bTlDaet4ybeHIyVZqQP/0hf6NmXBUE7kWjWvjh8
         wpYzM8cPwVtyTjFIJ7cu+oSnjruIWa/4NfQO7NHg93A55bTqYe/bIpjpV9Sq1EDXV68V
         mUbMP7mNdhqT6UtJ7gdzQ9zbg+Yrb0214I7fJ+nmx8CrSFhZm5uSyXj3zE3+aRR/BqvR
         togfWHROdmfR1V3I4vmXQZPRVky8/u5TKqHKGulfFND1GGsbwZ7Gd7SAP4e3mdcxS7zG
         vnu6xWAwSBOH1sqDhlBefrUVWYYLolJBZ7H7quSD7q3oKHa5q17v2HEpuzKfkcMruCx9
         F57w==
X-Forwarded-Encrypted: i=1; AL+hErEE5UyE0Ai1cjdJw+xffLZCpXHHkTwyUodYgOIZq79hNV3upuJL4pm6NU43Hs7fvSoG4t3CXtjS7R6H+fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RHJOopluqG8X2JO1y2nsLmGYc4vN2fepNfY0PlbAWXmjYDY60
	MssFifKTdzHpfvAxS3hdN5wHa3s3Fk28Nc5xe2CPHOLHYUGlZHhYfdfQnyExetxXLh23K+cRRE6
	s7OBAqW11lhnBjV89FU/tPg8unrcfqzaTkmXDrnHv
X-Gm-Gg: AZFdTZcjK4dxy3HnpOdpq3RFSwilblBRu+SX/DIe3rfuo1jn5+lLSDXYj5xCwlUEQVA
	/S6QWMG3vs+on3Op/uFvRgOtdEr+91DIitv7SfbXm+YvIsFN+gx761CnM8IxRJZhG8dBlPkhi6F
	tW1azwTT1MAijtWc+d5ebPDvYlyd7tj3aaX9Dx3cv7aZmMGL1/DXJlwDqA4irgkV6zT5Es9cm8V
	SlWRzW+7uThWMZfqapUIaMiaG4WG9zv/GzmHEPBj7oEgyswCYL6tlhD+7zXRanovp0xrrG9N1RU
	hYuMhXM1WVYFTKugreS87hkiPUwftVPSl8xpwk07cJH4P3tPYUibNjmVHJH2D2KPXIC5hxFmUKk
	Q3/WbOxTNGxYi1mjgZ7WfBCTESp0S/nd2hEpof3aIT5x4WQNYIlXjlrdu5GLaBal81GTj
X-Received: by 2002:a17:90b:4d86:b0:3ac:7c52:faeb with SMTP id
 98e67ed59e1d1-3b41c93b0dfmr4530278a91.41.1795211513818; Fri, 20 Nov 2026
 13:51:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115144508.71543-1-jiayuan.chen@linux.dev> <cbaa372f-6ec1-4ceb-a012-30eaac5ae8eb@redhat.com>
In-Reply-To: <cbaa372f-6ec1-4ceb-a012-30eaac5ae8eb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Nov 2026 16:51:42 -0500
X-Gm-Features: AclHuK_GGiWFUVKZSpr8dYR-2FHgC-uowX04GimNX21-i66RpifdzgYCCqwHyG8
Message-ID: <CAHC9VhTBf7wHMsneqUTT0p3pABkbD0GHuTJXFehKhA10NvWgxQ@mail.gmail.com>
Subject: Re: [PATCH net] ipv6, calipso: fix data-race in calipso_cache_add()
 bucketsize check
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Huw Davies <huw@codeweavers.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:26=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
> On 11/15/26 15:45, Jiayuan Chen wrote:
> > Issue found by sashiko when reviewing my data-races patch [1]. This is
> > not a plain READ_ONCE() annotation like the rest of that series but a
> > real fix, so it is sent separately.
> >
> > calipso_cache_add() reads calipso_cache_bucketsize twice: the "<=3D 0"
> > guard on entry, then the "size < bucketsize" test after taking the
> > bucket lock. A writer can flip it to 0 in between:
> >
> >    CPU0                                    CPU1
> >    calipso_cache_add()
> >      calipso_cache_bucketsize =3D=3D 10 (> 0)
> >                                            proc_dointvec()
> >                                              calipso_cache_bucketsize =
=3D 0
> >      spin_lock_bh(&bucket.lock)
> >      size(0) < calipso_cache_bucketsize(0) -> false
> >      -> else branch, but the bucket is empty
> >
> > On an empty bucket the else branch takes list.prev (the list head
> > itself), list_del()s it and then list_add()s through the now poisoned
> > head:
> >
> >   Oops: general protection fault, probably for non-canonical address
> >   0xdead000000000108
> >   RIP: 0010:calipso_cache_add+0x2f0/0x380
> >   Call Trace:
> >    <IRQ>
> >    calipso_cache_add+0x4c/0x70
> >    netlbl_cache_add+0x4a/0xa0
> >    selinux_netlbl_skbuff_getsid+0x1ac/0x280
> >    selinux_skb_peerlbl_sid+0x7d/0x100
> >    selinux_socket_sock_rcv_skb+0x2d3/0x460
> >    security_sock_rcv_skb+0x86/0x150
> >    sk_filter_trim_cap+0x56/0x730
> >    sock_queue_rcv_skb_reason+0x1e/0x80
> >    rawv6_rcv+0x679/0xb20
> >    raw6_local_deliver+0x1f0/0x5b0
> >    ip6_protocol_deliver_rcu+0x215/0x9a0
> >    ip6_input_finish+0xb0/0x1b0
> >    ip6_input+0xa8/0x250
> >    ipv6_rcv+0x14b/0x1c0
> >    __netif_receive_skb_one_core+0x8f/0xe0
> >    __netif_receive_skb+0x23/0xb0
> >    process_backlog+0x27a/0x950
> >    __napi_poll.constprop.0+0x61/0x2c0
> >    net_rx_action+0x372/0x800
> >    handle_softirqs+0x109/0x570
> >    __do_softirq+0x10/0x18
> >    do_softirq.part.0+0x47/0xd0
> >    </IRQ>
> >    <TASK>
> >    __local_bh_enable_ip+0xf0/0x120
> >    __dev_queue_xmit+0x578/0x23f0
> >    neigh_resolve_output+0x278/0x3c0
> >    ip6_finish_output2+0x4b1/0xcb0
> >    ip6_finish_output+0x2b6/0x6b0
> >    ip6_output+0x122/0x400
> >    ip6_local_out+0x61/0xb0
> >    ip6_send_skb+0xa0/0x260
> >    ip6_push_pending_frames+0x2b/0x40
> >    rawv6_sendmsg+0x1b7a/0x2750
> >    inet_sendmsg+0xa1/0xb0
> >    __sys_sendto+0x2fe/0x350
> >    __x64_sys_sendto+0x7f/0xb0
> >    do_syscall_64+0xe1/0x450
> >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > Snapshot the sysctl into a local once and use it for both tests, like
> > cipso_v4_cache_add() has since commit dd44f04b9214 ("cipso: Fix
> > data-races around sysctl.").
> >
> > [1] https://lore.kernel.org/netdev/179428999963.994134.1690454450089005=
3668@kernel.org/
> >
> > Fixes: 4fee5242bf41 ("calipso: Add a label cache.")
> > Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> LGTM, but let's wait for Paul's explicit ack.
>
> @Paul: please LMK if you prefer we apply this kind of
> simple, clean fixes directly.

Looks good to me too, thanks Jiayuan for working on this!

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
