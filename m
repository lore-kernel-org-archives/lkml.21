Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082791;
	b=PtN2FytTmcedAoMtvfr7tjQUkXiU37LHUfpv3cyhp+N3+Rp6ORKC6hCOm74b3VlG5PJs
	 nawu3bqKNQHnKUjEqZP6kA+hlTSbImgKnVtxWjalTeOFMJlixdwCZhMeKU1Mya2RF8jEc
	 FdHCZaefr0TjjV2eIwy/9r9spetLdJAg/BKYmFQ8TotiWXzk5FQa63fbRi5JnLlQkITxv
	 KOH25ajFTJzb8+qKk85Nf6tSctPnZEfgovV3VJjDmr1d0IS6fsWXUQEAkNjvQCHdew9ep
	 VN31e2oH8lAOL2+feiqasHLdcBSswPrUBnobb5OleAbqoeB3/Ft0aLZ9mE0du28eAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082791;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Z5ifa88KqQ4dWuIkiv45R1+MAJlY50Mqn5CfMmpIA0=;
	b=s8rKaelY40SeQXPcWrrKLTPtGfj1qVHB88DBeBviyI48/lbfiX2GI5MK5Tx+pk87KI73
	 T0Mam5VkY/KvWXlu15gzS72oyJIVXzRVDsQINqg9pnDWo7RrLKi8yNsdYr5qhMDZaWJ3f
	 GFeIwugzdjm4ggNB3QCCpLb9kGSA5FJUwHDO8fh7POYxJxna8U7fANs1LMSumyaTRWdp2
	 mxZxkTf+9BH0LEK0qSuD/dM71Ily0zlruOBP/XpPZKNXDf6LgZ+QguaqvEiOrXzUJEM1w
	 TMdR9BC7TRHQ1XqRDuakw6n8leOPW5RXn5Qm0BnVWrujq6IyB/97v181+R6OLNJosUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFYr2OU+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B6B606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFYr2OU+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4EC1F000CD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082790;
	bh=4Z5ifa88KqQ4dWuIkiv45R1+MAJlY50Mqn5CfMmpIA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EFYr2OU+/efzFX443Fhx1RBy849p7ljCGRzVBN3L89lI4bWWZh3HbhO3tEqpM7dxk
	 6US9dI/cpAMmPyN1izGfMj94oLCv9eNsaStejYxntxirx8mnm/f/YMfpAFgskR1oWi
	 ByaTyNcaig6XKJ/pBun4zySw7KHH7YvF/p00r5l6lBAOIyjAQmLP8V+in1N3YBIuuo
	 PgnmMYcp+eImYwEA/D4z/aa7m9zKephse6WHBtm7stNpxzD1wvZDqAyPblez0FiVWd
	 GIzoCbMOHORT7y2QhpwpUb9JcciepI9XgBsRHfgDdKVpTq5TjrZo87ZZtchr8zpCeY
	 NX+XcVGTzAg8A==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71aea92f666so1308182eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:06:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjqc5rYIas5P3Og+KISp7gJIuAGevO4bNkAweZe0uq+pvxxkXIP3FEtTBmfIew5YxjCquLaaExf80Cse8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D8yNDbCG6mifxbQWRrlbLLtQYo80V/KpowY9sF4gEud1AG/z2
	AgfTQu7NoCEkoFQxPFo/90daYU+AfzNqQ4HDcx5YjJOKOVFisXarL778yluqZVQQm115PYhlJ9f
	dxl93qGrrAosePGKQlDvm4oQZambEsrM=
X-Received: by 2002:a05:6820:a511:10b0:71a:df0d:ea24 with SMTP id
 006d021491bc7-71b18549858mr2967601eaf.51.1795082789733; Thu, 19 Nov 2026
 02:06:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119090828.343748-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261119090828.343748-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 11:06:18 +0100
X-Gmail-Original-Message-ID: <CAL4Wiip2qPc5D_hRQb871m2cSHy-5++tNOOEr9sQYLhCxxknwA@mail.gmail.com>
X-Gm-Features: AclHuK8_eM9te3cu2PhJ0AV9iMfiCSLFml29TI2SzcAg20mQhXDlb493tDB-73c
Message-ID: <CAL4Wiip2qPc5D_hRQb871m2cSHy-5++tNOOEr9sQYLhCxxknwA@mail.gmail.com>
Subject: Re: [PATCH net] tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Wei Wang <weiwan@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 10:08, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> Our local syzbot reported the following warning:
>
>   WARNING: ./include/linux/ucopysize.h:57 at tcp_sendmsg_locked+0x1e13/0x=
1f20
>   Modules linked in:
>   CPU: 3 UID: 0 PID: 377 Comm: syz.2.2248 Not tainted 7.4.0-rc2+ #398 PRE=
EMPT
>   RIP: 0010:tcp_sendmsg_locked+0x1e13/0x1f20
>   Call Trace:
>    <TASK>
>    tcp_sendmsg+0x2c/0x50
>    inet_sendmsg+0x62/0xb0
>    __sys_sendto+0x2fe/0x350
>    __x64_sys_sendto+0x7f/0xb0
>    x64_sys_call+0x1375/0x27e0
>    do_syscall_64+0xe4/0x470
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>    </TASK>
>
> The problem is here:
>
>   if (!skb_zcopy_pure(skb)) {
>           copy =3D tcp_wmem_schedule(sk, copy);
>           if (!copy)
>                   goto wait_for_space;
>   }
>
> When MSG_ZEROCOPY data is appended to a skb that already holds copied
> data, only the user length is scheduled, but the pinned pages are then
> charged by their truesize:
>
>  skb_zerocopy_iter_stream
>    __zerocopy_sg_from_iter
>     zerocopy_fill_skb_from_iter  //truesize +=3D PAGE_ALIGN(copied + star=
t)
>     sk_mem_charge(sk, truesize)  //sk_forward_alloc goes negative
>
> For example, sending 8 iovecs of 1 byte each schedules 8 bytes and
> charges 32768 with 4K pages.

This part is a separate bug: these 8 bytes sit in a single page.

zerocopy_fill_skb_from_iter() adds PAGE_ALIGN(copied + start) to
skb->truesize for each iov_iter_get_pages2() call, even when the
chunk is merged into the previous frag and the page reference is
released.

With a corked socket, one copied byte, then one MSG_ZEROCOPY sendmsg()
of 1024 bytes from a single page:

  1 iovec             sk_wmem_queued +=3D 4096
  1024 iovecs         sk_wmem_queued +=3D 4194304   (sk_sndbuf is 2626560)

With your patch, this over-estimation would become a forced charge,
above tcp_mem and memcg limits, with an amount controlled by the user.

I have a fix [1] for this accounting (only charge the pages a frag did not
already cover), I will send it shortly. With it, both cases above
charge 4096 bytes, and sk_forward_alloc is still negative after the
append, so your patch is still needed.

Thanks.

>
> On a later sendmsg() without MSG_ZEROCOPY, if sk_wmem_schedule() fails
> (e.g. tcp_mem hard limit is reached), tcp_wmem_schedule() returns
> min(copy, sk->sk_forward_alloc), which is negative. The negative copy
> is passed to skb_copy_to_page_nocache() and triggers the warning, and
> sendmsg() fails with -EFAULT.
>
> A few options were considered:
>
> 1) Schedule the truesize up front. It is not known before the pages
>    are pinned, it depends on the iovec layout.
> 2) Do not append zerocopy data to a non pure skb. This splits a small
>    header and its zerocopy payload into two skbs.
> 3) Schedule the missing part right after the pages are charged. They
>    are already in the skb at this point, so this can not fail.
>
> Go with 3).

Analysis looks correct, and 3) is consistent with what we did
for tcp_collapse() recently.

>
> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pr=
essure")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  net/ipv4/tcp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index d510e982dcea..8bd377542a89 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1359,6 +1359,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msgh=
dr *msg, size_t size)
>                         if (err < 0)
>                                 goto do_error;
>                         copy =3D err;
> +                       /* Pages were charged by truesize, not by copy. *=
/
> +                       sk_forced_mem_schedule(sk, 0);

Pure zerocopy skbs are not charged, so there is nothing to fix for
them. Please avoid the extra work in this case:

                        if (!skb_zcopy_pure(skb))
                                sk_forced_mem_schedule(sk, 0);

>                 } else if (zc =3D=3D MSG_SPLICE_PAGES) {
>                         /* Splice in data if we can; copy if we can't. */
>                         if (tcp_downgrade_zcopy_pure(sk, skb))
> --
> 2.43.0
>

[1]
diff --git a/net/core/datagram.c b/net/core/datagram.c
index 489d92fe6dae8952da08bc5cb2a58f9863938fe0..8c418c3adf1c97b41ee7999146d=
09aacd8cf29d4
100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -659,7 +659,6 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,

                skb->data_len +=3D copied;
                skb->len +=3D copied;
-               skb->truesize +=3D PAGE_ALIGN(copied + start);

                head =3D compound_head(pages[n]);
                order =3D compound_order(head);
@@ -680,6 +679,11 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,

                                if (head =3D=3D skb_frag_page(last) &&
                                    start =3D=3D skb_frag_off(last) +
skb_frag_size(last)) {
+                                       /* Only account the pages this frag
+                                        * did not already cover.
+                                        */
+                                       skb->truesize +=3D
PAGE_ALIGN(start + size) -
+                                                        PAGE_ALIGN(start);
                                        skb_frag_size_add(last, size);
                                        /* We combined this page, we
need to release
                                         * a reference. Since compound
pages refcount
@@ -695,6 +699,7 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
                                page_ref_sub(last_head, refs);
                                refs =3D 0;
                        }
+                       skb->truesize +=3D PAGE_SIZE;
                        skb_fill_page_desc_noacc(skb, frag++, head,
start, size);
                }
                if (refs)
