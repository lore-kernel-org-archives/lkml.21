Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457072;
	b=UfbQfUABfdfGlLstW0syHp/3bILkEAtbnmC89CIZEm0yVyaV332C/JoZCXmhGAvTtiJM
	 bRD8TBxi/i0UsFby6D/av0hAKkAwuqOU24y2acvaN3hxHf2JPkVl5s5j7qeO4/29MhROS
	 xccubqV8OHzOVVHHCavzHL10wkr3CgVJ9cqHqD2KIRb8WBK30RNaC9UIW+GSP2ZnNquHp
	 aHO21smiiLqn+0CnKIaph/J3X+veWK12ZbeS8BdaP6AU3FUwJK1qCWQYMIuo8VvjhmDSw
	 NOjaTUaVWwJ/AwyRwLGFHKzSYxH2trZoKV3r9WnOHgzDxxCqfP+FO4SsfXP+RYv9XRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457072;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L11swEeJ1ew2lZyx0Wb6tGFYANDYS1G/jL/Lf64CdLo=;
	b=Q65RpH34nCxQmYj3sb+ZybosqyFX9vJ1E8A+Ws8Ew2jEgt9rjyrCZWBrkApp5u0ucAIC
	 loAruJ1+x4QuV17TDww7BecrLlvKyQEOj4W3EifwZ8OD2vSu1EuM0MfcPQh1sXmh7fdUN
	 u2PIhCS52JERRxJ6/Ue/kuh6UyUNRciQoMFNl5M1Pioz2bVjFQpghKajwe//b2IFIiW4/
	 2TbIGoeSZSf1q6WWyFTVUcjK+3sSDiHsvmd4r2AqbdeHD2H6UeTnbob9diecZhXc7G0b3
	 cl9SK2UmhqthlAqfZhiBgDRieCDiz9HHejFB3lYzC/pRzh9kIUjp5o09I5fpbRTwuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhOzJrXN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE39606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhOzJrXN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B42B1F00A00
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795457072;
	bh=L11swEeJ1ew2lZyx0Wb6tGFYANDYS1G/jL/Lf64CdLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GhOzJrXNGsU8hDynlqn3CUBYZv6ZoubPJCZhHoORLW4DVgH0wfkA59gLLfclxOjII
	 vBQdW7xfClRHGR0Kt0R6c4NY/jCDXT7OtyfaWD8eMJAag41ke3hIBUAGJ5wh3zJ5FW
	 7UtvbDXkU9fO8+ock2XRyVy9tYVUG3TGnnSUoYRxLU6EMsWVU8JurkHbdZYGTMDnms
	 6ccd/EIUZ6ZljD0GIgQBLaC/nCLmgUICmNozIRugDdcVEVHMgid6Sycu1695Dua5Vx
	 SgPE/FXGGEjlSgxkM3ctXmTKnGT3kkU+xLPPnCxLye0k3mLsLNUuIMyJr/4zM93iEg
	 dYHU9qRsb8pkA==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71af0656bedso2264871eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:04:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFgiEnoXpRb84K3efiD5hv1nHlZV34yT/bN6XREpHzMVRMCWfwDSSQrdnHPQ3O+73krG0oFrp3dlln1MA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TeDGwRqCxhfefN4X5h3CygbPEL/C16UBlLVp5ynBB4YgDsjaU
	zaUNDoIZxJl4K/ARNS3mFzgeIEX2XycSQKpbZahtBzw4Es6M6HvlsviwviP0C0PcGjWrDQ8QYne
	thJcRv3U40sR/X8WL7MO/exf/PqSr/1c=
X-Received: by 2002:a05:6820:55da:10b0:71a:f794:49c2 with SMTP id
 006d021491bc7-71b39501d54mr6792362eaf.55.1795457071843; Mon, 23 Nov 2026
 10:04:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123122432.297135-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261123122432.297135-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 19:04:20 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqMpfQr_m8O+=nSM=0f=UwktPVZaizs9Q0mCm_7ceZfeA@mail.gmail.com>
X-Gm-Features: Aa3M54pBQ5tMrvyFxMT1C74KMmB0wbelc_7xhsKqHOGLaFEDly8f9a5KtMvXsdw
Message-ID: <CAL4WiiqMpfQr_m8O+=nSM=0f=UwktPVZaizs9Q0mCm_7ceZfeA@mail.gmail.com>
Subject: Re: [PATCH net v3] tcp: fix negative sk_forward_alloc after
 MSG_ZEROCOPY append
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Wei Wang <weiwan@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Soheil Hassas Yeganeh <soheil@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 13:24, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> Our local syzbot reported the following warning:
>
>
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
>
> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pr=
essure")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
