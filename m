Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114009;
	b=tG06ZFMMehG//IgRz8dHxSUjUdG2f7+nZBROoqkkJOL+bx7GGDVFh7ClU9S+Zp1nQkYo
	 0JfKcn46arf9RAZcD94bwHkERSrR3bTr93e4806dw3jnY7k0IUsNWv4fbouiZmhMVkxhj
	 /OYXxwn37L5Az23qznqBb0NwG4335UexIpkbKSuPWUWvni3hDXEpYf46wUbJRddXU2Jef
	 bZ3q7OXleUEU6VxR3HrZ4S+AT0mA2B4IokeK4vFNP7C4uvMJBWmg/m0c4s/tqhsi6+7fb
	 Bpf4yQw20l3t8PEgHj+L6ACQ7M6VS8OtPmlZT5YvsJCrvV1u55eGWZnYmG4B0YMyYew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114009;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tpiPU8++XfQSCP9ULe9LXdelFvKTKcALUKX3kHYjn+4=;
	b=i2gZ1TERFWr1tiOSq1d2K1//XAY9qnbPZBBc3zD6R/pMtlvf/dUCuH4TZU22+Db0Iq93
	 5T0eQNeQTKyh0U6h10dkOO3WLX87VbjFtyBY2I6ldygakHyNdwNlrPQxWtltyxsS3lzpb
	 yjl9mcYKKJdi4eZySm/X/AgryxSfAMZ8Gd3ZSsfJ0f03tUdoZCnTPnMJ6RIszAUhRY11c
	 pLUfCw06KNfmqzNn7oRy6jfUvIflUD/tUFxZUEaUZGe6rp+Hd8T6RlwDI45mF2jmj52Ve
	 nEaf85yezdxMZ8C0SiBCzUv386O9Rj4Ezc8xgkInLWopm3g6Axgt4bGYwd8uqIeGMGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUNG9Hmm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7A1606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUNG9Hmm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1200E1F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114009;
	bh=tpiPU8++XfQSCP9ULe9LXdelFvKTKcALUKX3kHYjn+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fUNG9Hmmpnw906AVNfBTDC24dtOuJFtFSrE4knpssFOSWboTWgU/TUr/Fzor9QkD5
	 Z1wC8SKht2FYjEBPA2qVVbDmz61NVZrfbJyHVTloXjzmVbsgycNAUugiLyzT0gz53u
	 afA9XGO7x/cjK8lYSUlAqH4E8JshyiZeklTcrQw8uVnxN2zq4WX+Wwvm5bhJe4k93D
	 3lhw/vnDiYT9uJZBUrR+saoY3Qr1RwzooKtI9/H8Vl8d5tCdbR1MNhcj9VS4NRz7Bm
	 +d9GUoxbMuBhqZTrCS0QQa77gmAPWaIHzxOzFBmaBOyWZG74QNOq7GApeAoJhITJrR
	 CFcG04gVC5LOA==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4911df1e196so89036fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:46:49 -0800 (PST)
X-Gm-Message-State: APuU4Z+wkK2Y4+xmgJohzspXHUanBziT2ypewlC9a2m91XscdLRRzktC
	iuQHkv9Zm2AzayKMLkKYdjLfg8BEFsToZ/uq9gTKU2Qa2qw/BkjsOGE+ODwFXfbJgI2PHq37Bxt
	ltQdxFjVA6w42fCAz9kuT2/ialm9ay3A=
X-Received: by 2002:a05:6870:9d98:b0:442:175:cea7 with SMTP id
 586e51a60fabf-4bc7beb0334mr556077fac.1.1795114008363; Thu, 19 Nov 2026
 10:46:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com> <20261119180143.2912138-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261119180143.2912138-2-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:46:37 +0100
X-Gmail-Original-Message-ID: <CAL4WiirdYsiR9a2BtHO4MtPtJX3st48mtfAwTvzft5JuQXT59g@mail.gmail.com>
X-Gm-Features: AclHuK-tsqmjCJGsuoHtwqpC8EpbRAKIkGBsk_sdnPDFvh8WOjjREis7vqFOKyo
Message-ID: <CAL4WiirdYsiR9a2BtHO4MtPtJX3st48mtfAwTvzft5JuQXT59g@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/4] tcp: export CE count in rate_sample
To: chia-yu.chang@nokia-bell-labs.com
Cc: linux-kernel@vger.kernel.org, kuba@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, davem@davemloft.net, kuniyu@google.com, ij@kernel.org, 
	ncardwell@google.com, koen0607@gmail.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com, 
	srichard@netapp.com, Olivier Tilmans <olivier.tilmans@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 19:01, <chia-yu.chang@nokia-bell-labs.com> a =
=C3=A9crit :
>
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> Store the number of newly ACKed/SACKed CE-marked packets in rate_sample.
> This will be used by upcoming congestion control algorithms, e.g.,
> TCP Prague, that need access to AccECN-derived congestion info.
>
> For RFC3168 ECN mode, acked_sacked_ce equals delivered when FLAG_ECE
> is present. For AccECN mode, it carries the derived CE-marked packets
> from AccECN options or ACE field based on RFC9768.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Co-developed-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Signed-off-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Co-developed-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> --
> v3:
> - Improve commit message
> - Rename ece_delta to acked_sacked_ce
> - Remove redundant rate_sample initializer
> ---
>  include/net/tcp.h    |  1 +
>  net/ipv4/tcp_input.c | 40 +++++++++++++++++++---------------------
>  2 files changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 25d11fab1b03..4b1159e6c125 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -1353,6 +1353,7 @@ struct rate_sample {
>         long rtt_us;            /* RTT of last (S)ACKed packet (or -1) */
>         int  losses;            /* number of packets marked lost upon ACK=
 */
>         u32  acked_sacked;      /* number of packets newly (S)ACKed upon =
ACK */
> +       u32  acked_sacked_ce;   /* number of packets ECE-marked upon ACK =
*/

I presume you meant "CE-marked" instead of "ECE-marked"

>         u32  prior_in_flight;   /* in flight before this ACK */
>         u32  last_end_seq;      /* end_seq of most recently ACKed packet =
*/
>         bool is_app_limited;    /* is sample from packet with bubble in p=
ipe? */
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 67e4aa73bd6a..72826cafa246 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -616,9 +616,10 @@ static u32 __tcp_accecn_process(struct sock *sk, con=
st struct sk_buff *skb,
>         return safe_delta;
>  }
>
> -static u32 tcp_accecn_process(struct sock *sk, const struct sk_buff *skb=
,
> -                             u32 delivered_pkts, u32 delivered_bytes,
> -                             u64 prior_bytes_acked, int *flag)
> +static void tcp_accecn_process(struct sock *sk, struct rate_sample *rs,
> +                              const struct sk_buff *skb, u32 delivered_p=
kts,
> +                              u32 delivered_bytes, u64 prior_bytes_acked=
,
> +                              int *flag)
>  {
>         struct tcp_sock *tp =3D tcp_sk(sk);
>         u32 delta;
> @@ -628,11 +629,11 @@ static u32 tcp_accecn_process(struct sock *sk, cons=
t struct sk_buff *skb,
>         if (delta > 0) {
>                 tcp_count_delivered_ce(tp, delta);
>                 *flag |=3D FLAG_ECE;
> +               rs->acked_sacked_ce =3D delta;
>                 /* Recalculate header predictor */
>                 if (tp->pred_flags)
>                         tcp_fast_path_on(tp);
>         }
> -       return delta;
>  }
>
>  /* Buffer size and advertised window tuning.
> @@ -4248,8 +4249,8 @@ static void tcp_xmit_recovery(struct sock *sk, int =
rexmit)
>  }
>
>  /* Returns the number of packets newly acked or sacked by the current AC=
K */
> -static u32 tcp_newly_delivered(struct sock *sk, u32 prior_delivered,
> -                              u32 ecn_count, int flag)
> +static u32 tcp_newly_delivered(struct sock *sk, struct rate_sample *rs,
> +                              u32 prior_delivered, int flag)
>  {
>         const struct net *net =3D sock_net(sk);
>         struct tcp_sock *tp =3D tcp_sk(sk);
> @@ -4260,8 +4261,9 @@ static u32 tcp_newly_delivered(struct sock *sk, u32=
 prior_delivered,
>
>         if (flag & FLAG_ECE) {
>                 if (tcp_ecn_mode_rfc3168(tp))
> -                       ecn_count =3D delivered;
> -               NET_ADD_STATS(net, LINUX_MIB_TCPDELIVEREDCE, ecn_count);
> +                       rs->acked_sacked_ce =3D delivered;
> +               NET_ADD_STATS(net, LINUX_MIB_TCPDELIVEREDCE,
> +                             rs->acked_sacked_ce);

In RFC 3168 mode this is every packet delivered by an ACK carrying
ECE, not the number of CE-marked packets. This was fine for a MIB
counter, but once exposed to congestion control modules it should be
documented in the field comment, especially since rate_sample already
has delivered_ce with a different meaning.

>         }
>
>         return delivered;
> @@ -4327,7 +4329,6 @@ static int tcp_ack(struct sock *sk, const struct sk=
_buff *skb, int flag)
>         u32 delivered =3D tp->delivered;
>         u32 lost =3D tp->lost;
>         int rexmit =3D REXMIT_NONE; /* Flag to (re)transmit to recover lo=
sses */
> -       u32 ecn_count =3D 0;        /* Did we receive ECE/an AccECN ACE u=
pdate? */
>         u32 prior_fack;
>
>         sack_state.first_sackt =3D 0;
> @@ -4441,10 +4442,9 @@ static int tcp_ack(struct sock *sk, const struct s=
k_buff *skb, int flag)
>         tcp_rack_update_reo_wnd(sk, &rs);
>
>         if (tcp_ecn_mode_accecn(tp))
> -               ecn_count =3D tcp_accecn_process(sk, skb,
> -                                              tp->delivered - delivered,
> -                                              sack_state.delivered_bytes=
,
> -                                              prior_bytes_acked, &flag);
> +               tcp_accecn_process(sk, &rs, skb, tp->delivered - delivere=
d,
> +                                  sack_state.delivered_bytes,
> +                                  prior_bytes_acked, &flag);
>
>         tcp_in_ack_event(sk, flag);
>
> @@ -4470,7 +4470,7 @@ static int tcp_ack(struct sock *sk, const struct sk=
_buff *skb, int flag)
>         if ((flag & FLAG_FORWARD_PROGRESS) || !(flag & FLAG_NOT_DUP))
>                 sk_dst_confirm(sk);
>
> -       delivered =3D tcp_newly_delivered(sk, delivered, ecn_count, flag)=
;
> +       delivered =3D tcp_newly_delivered(sk, &rs, delivered, flag);
>
>         lost =3D tp->lost - lost;                 /* freshly marked lost =
*/
>         rs.is_ack_delayed =3D !!(flag & FLAG_ACK_MAYBE_DELAYED);
> @@ -4481,17 +4481,15 @@ static int tcp_ack(struct sock *sk, const struct =
sk_buff *skb, int flag)
>
>  no_queue:
>         if (tcp_ecn_mode_accecn(tp))
> -               ecn_count =3D tcp_accecn_process(sk, skb,
> -                                              tp->delivered - delivered,
> -                                              sack_state.delivered_bytes=
,
> -                                              prior_bytes_acked, &flag);
> -
> +               tcp_accecn_process(sk, &rs, skb, tp->delivered - delivere=
d,
> +                                  sack_state.delivered_bytes,
> +                                  prior_bytes_acked, &flag);
>         tcp_in_ack_event(sk, flag);
>         /* If data was DSACKed, see if we can undo a cwnd reduction. */
>         if (flag & FLAG_DSACKING_ACK) {
>                 tcp_fastretrans_alert(sk, prior_snd_una, num_dupack, &fla=
g,
>                                       &rexmit);
> -               tcp_newly_delivered(sk, delivered, ecn_count, flag);
> +               tcp_newly_delivered(sk, &rs, delivered, flag);
>         }
>         /* If this ack opens up a zero window, clear backoff.  It was
>          * being used to time the probes, and is probably far higher than
> @@ -4518,7 +4516,7 @@ static int tcp_ack(struct sock *sk, const struct sk=
_buff *skb, int flag)
>                                                 &sack_state);
>                 tcp_fastretrans_alert(sk, prior_snd_una, num_dupack, &fla=
g,
>                                       &rexmit);
> -               tcp_newly_delivered(sk, delivered, ecn_count, flag);
> +               tcp_newly_delivered(sk, &rs, delivered, flag);
>                 tcp_xmit_recovery(sk, rexmit);
>         }
>
> --
> 2.34.1
>
