Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114498;
	b=g/DIiAZJy6wbI/ib5I2u3oPMBKSQfnhhSAo/yYGUtDZgg5MDrI11zKlfgAZQwPeTuEOA
	 91A2qxNFEU1t3CX6f0HmRJzemaY29Y/Rq3yYIcyBfWVQAjtTAl9+/sglQ7HwbU0RE9uYN
	 LKrmDlJXR4ROmWvh9Qhf214I1HCOEHvFZZsfErctGTJ9JfysjL4M1sbDulvDn9UNqF617
	 j85J1Ir/hINvrrvW/xK+BWWhbDW+44RVpxct2FiMODkJJN7gc15WMTBfjVAkjbfQfN3vo
	 Jlnig1DlBccT10l93ZhWQ/w/+tr47T1dA5gZlTlqKR3ddJnnhPPU+Tm5yjZ0YPZ8oGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114498;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FKkA4WIdbvamijmH9K6tT5kIkBtZr148ceac6/RmTAc=;
	b=xuT38p6oDqmuo0h9Fwwxbmwn3fpUQ7hcBHx6L7qH70+q4NB7fimbNf93+xXiEMQeTME8
	 qjHIVXzZQNaJuTORAavXRxtTF9CbF81WuhIyEo2TJOtq1oB2aEZvgXbdemlVVQkj1Z3c2
	 FbQQdWlkU+C5a5sayYSt4rKpR0T+20wE1AMfrJ8hE6PzTeOolijob7QtxrqRQ/K9VXQG1
	 fmdPbIs4RuTlS5MfU5/IGZn6y/Ouvwtj2AXQPlzvDLq0Li+k1fqG/gZy9ewZZ3pVXAgrV
	 MfvIUV+ybTvfp8Vqm0RG4W20AdX4nYMrOb+BK2duPqj9pRfAgw4oN8IDLOzhHikhQTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxXaH+0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0753606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxXaH+0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1471F000C7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114497;
	bh=FKkA4WIdbvamijmH9K6tT5kIkBtZr148ceac6/RmTAc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SxXaH+0xTPNWa4ihFcnNgt/vUs8epX/oVFXe8MFkuiYnCTPGUrRNWIhAhH3YX1xrx
	 b3kRPm9z9+1ZBLg8jcn/RR54Yjd1LBdIXFVYU2d5nNm6NLzfC2N/XhKyFyzh8UotkL
	 KNDR9d7mkdGwycBJTvUXuvp3Ex8ar+lV2AcI2r7HJxiO7mc5YNv0GKYLDSwjQA6NSv
	 c2fCJxyYh1gCw8FS0UtEWPgNio62TDTI2muDC+NB421FrlMLkSyeI4kxT/yNUbgNTc
	 qfrbTapyd8nBUo/keBiX2IcvRCcDeaDVehqi1jduKs3VuBpvfqMZUCcChCTCeKEKO5
	 NBd9WlRgGIxDA==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8451a619da7so75103a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:54:57 -0800 (PST)
X-Gm-Message-State: APuU4Z9fNCKuo81VXM3MUCuGk4ARXbs/JQVgkaJy0eZ4MG7fUWsbIM4e
	g4dDzAjZpcUKoE5JK6s19iDPZOiwUmPc8exFiL7xkNuUIsR2to1mLWpToTRR/6DTji5hBxU05vy
	1WPY19aP36Jol8QW1kUc/cuGbC+m8UAU=
X-Received: by 2002:a05:6808:87d1:b0:4e6:b6a1:5af2 with SMTP id
 5614622812f47-57a0c1a1661mr1084637b6e.51.1795114496957; Thu, 19 Nov 2026
 10:54:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com> <20261119180143.2912138-5-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261119180143.2912138-5-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:54:46 +0100
X-Gmail-Original-Message-ID: <CAL4Wiip6JFsVH_WAn4HmrXCiuKEJCoZR9nUv9X7RZU73_YJyzw@mail.gmail.com>
X-Gm-Features: Aa3M54ogwId3pK8KKQU5ypl0de7HBtSQWY0kq1qlZMko4upwJhgEBA_5PdSRpvY
Message-ID: <CAL4Wiip6JFsVH_WAn4HmrXCiuKEJCoZR9nUv9X7RZU73_YJyzw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] tcp: add MSS ceiling callback for
 congestion control
To: chia-yu.chang@nokia-bell-labs.com
Cc: linux-kernel@vger.kernel.org, kuba@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, davem@davemloft.net, kuniyu@google.com, ij@kernel.org, 
	ncardwell@google.com, koen0607@gmail.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com, 
	srichard@netapp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 19:01, <chia-yu.chang@nokia-bell-labs.com> a =
=C3=A9crit :
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Allow congestion control modules to provide an optional MSS ceiling
> through the new mss_ceiling() callback. The TCP stack derives MSS
> from PMTU discovery and existing MSS constraints, while the congestion
> control may further reduce the effective MSS when needed. The ceiling
> is applied during MSS calculation and remains subject to existing PMTU
> updates.
>

I dunno. What references can you provide?

I am guessing this has been adopted by IETF?

This is very suspect to me, this will bring many bugs for a benefit
that has to be demonstrated.

> Also, tcp_update_mss() is added to allow congestion control modules to
> request immediate MSS recomputation after changing their MSS ceiling.
> This will be used by upcoming congestion controls, e.g., TCP Prague, that
> perform fine-grained rate control at very low rates, e.g., below 1Mbps,
> and benefit from reducing the effective MSS while still preserving normal
> PMTU handling.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> --
> v3:
> - Replace mss_cache_set_by_cca with mss_ceiling() callback
> - Add tcp_update_mss() helper for immediate MSS recomputation
> ---
>  include/net/tcp.h     |  4 ++++
>  net/ipv4/tcp_output.c | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 0242fd6bbb07..9d398ae09015 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -858,6 +858,7 @@ static inline void tcp_clear_xmit_timers(struct sock =
*sk)
>
>  unsigned int tcp_sync_mss(struct sock *sk, u32 pmtu);
>  unsigned int tcp_current_mss(struct sock *sk);
> +unsigned int tcp_update_mss(struct sock *sk);
>  u32 tcp_clamp_probe0_to_user_timeout(const struct sock *sk, u32 when);
>
>  u32 tcp_tso_autosize(const struct sock *sk, unsigned int mss_now,
> @@ -1417,6 +1418,9 @@ struct tcp_congestion_ops {
>         /* returns the multiplier used in tcp_sndbuf_expand (optional) */
>         u32 (*sndbuf_expand)(struct sock *sk);
>
> +       /* returns the MSS upper bound (optional) */
> +       u32 (*mss_ceiling)(struct sock *sk);
> +
>  /* control/slow paths put last */
>         /* get info for inet_diag (optional) */
>         size_t (*get_info)(struct sock *sk, u32 ext, int *attr,
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 7b694479095e..f70dddd7283b 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -2062,6 +2062,10 @@ static inline int __tcp_mtu_to_mss(struct sock *sk=
, int pmtu)
>
>         mss_now -=3D psp_sk_overhead(sk);
>
> +       /* Apply MSS ceiling from congestion control module, if any */
> +       if (icsk->icsk_ca_ops->mss_ceiling)
> +               mss_now =3D min_t(u32, mss_now, icsk->icsk_ca_ops->mss_ce=
iling(sk));
> +

I do not think this is the right place.

__tcp_mtu_to_mss() is a conversion helper, used by many callers
which have nothing to do with mss_cache :

- tcp_v6_mtu_reduced() ignores a Packet Too Big if
  tcp_mtu_to_mss(sk, mtu) >=3D tp->mss_cache. With a ceiling in place,
  valid PMTU reductions above the ceiling are dropped, and the flow
  is left with a stale PMTU when the module raises the ceiling later.

- tcp_mtu_probing() recomputes icsk_mtup.search_low from
  tcp_mtu_to_mss(sk, search_low), so search_low collapses to the
  ceiling and never recovers.

- tcp_mtu_probe() gets a probe_size equal to the current mss.

- tcp_send_syn_data() uses it to size the Fast Open payload.

If a ceiling is needed, it should be applied in tcp_sync_mss(),
next to the icsk_mtup.search_low clamp.

Also the callback is invoked before ->init() :
tcp_connect_init() and tcp_v4_syn_recv_sock() call tcp_sync_mss()
before tcp_init_congestion_control(). icsk_ca_priv is zeroed at
this point, or copied from the listener when icsk_ca_setsockopt
is set. This should be gated on icsk->icsk_ca_initialized.

What does the returned value mean exactly ? It is applied before
icsk_ext_hdr_len and the TCP options are subtracted, so mss_cache
ends up smaller than what the module asked for.

>         /* Clamp it (mss_clamp does not include tcp options) */
>         if (mss_now > tp->rx_opt.mss_clamp)
>                 mss_now =3D tp->rx_opt.mss_clamp;
> @@ -2082,6 +2086,7 @@ int tcp_mtu_to_mss(struct sock *sk, int pmtu)
>         return __tcp_mtu_to_mss(sk, pmtu) -
>                (tcp_sk(sk)->tcp_header_len - sizeof(struct tcphdr));
>  }
> +EXPORT_SYMBOL(tcp_mtu_to_mss);
>
>  /* Inverse of above */
>  int tcp_mss_to_mtu(struct sock *sk, int mss)
> @@ -2190,6 +2195,17 @@ unsigned int tcp_current_mss(struct sock *sk)
>         return mss_now;
>  }
>
> +unsigned int tcp_update_mss(struct sock *sk)
> +{
> +       struct dst_entry *dst =3D __sk_dst_get(sk);
> +       struct tcp_sock *tp =3D tcp_sk(sk);
> +
> +       if (!dst)
> +               return tp->mss_cache;
> +       return tcp_sync_mss(sk, dst_mtu(dst));
> +}
> +EXPORT_SYMBOL_GPL(tcp_update_mss);


No need for the dst lookup, existing code uses :

        tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);

Finally, tcp_congestion_ops is a BPF struct_ops. Without a stub in
__bpf_ops_tcp_congestion_ops (net/ipv4/bpf_tcp_ca.c), BPF programs
can not implement mss_ceiling(). Please add one, or explain why
this is not wanted.


> +
>  /* RFC2861, slow part. Adjust cwnd, after it was not full during one rto=
.
>   * As additional protections, we do not touch cwnd in retransmission pha=
ses,
>   * and if application hit its sndbuf limit recently.
> --
> 2.34.1
>
