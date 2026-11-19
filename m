Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114093;
	b=AFfKjPe9VD28ng+sbm/8cpYNP7gBFgThRf7o3o/+XsO1TwgTt2KKon1+p7PcuQY+5oee
	 INoUW2E5+D/bL7bxQ+kZUzj0dS8Ts9jhmIhqfSBFFdEPQAEsT5amH+zd0MqPA32P6jf4u
	 p/+ZIRsDR5spqV2bj4lwYSInXsC86ioXEiCfS7HGks/Xz62AKUatK+WboOYUo/veiWeNG
	 4FypuJw8JStS9y8nLVeGC+sgqvMYfJ4C3MHaZ4e54E/S6zD4+BFzE6KHFq0oskaEY4uuW
	 ljwjT7VdzyTaF9uXxVjI7nSunR0BIWtLvw82ccfUkMr6yvXY0Dkc7u1h4xD1XZNI3Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114093;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5zHGL+QsjNpZ6g1gAKY/0i6WN3IS52QSM0gJbOkQs1I=;
	b=nZSTCZLKWCbHK01p7hhL/MEf0r2dlpJk669AMvf5bJfL0GMSqfbiMlO89aE0q/bmvLEf
	 0FxO4tAj5MEIbvhc1Wys+DbE2RDDNkXDe7abrkQJXvDNrS7frODmqvSXyrQUAcyI2i79Q
	 TR5EilQMZiOoBRuoPUn+SK+55NrXCWcb1HOaModmwHy8lF8T390mju5yO+8YInsHA1VLU
	 /6lPHRREcRvyWR4kM0PUPJ/vFfL10GrIuqYG7AIhmYxcXE/Bv35Lj++qvy9RCpT8pT/F7
	 xTnlnQWsPIZqS0Yr6pjCjf6HEBEJC5B1v5NJafUfmeAKZDHLEqurOVA69grJrEI6Pgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlZB6iaf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8670606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlZB6iaf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5241F000CF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114092;
	bh=5zHGL+QsjNpZ6g1gAKY/0i6WN3IS52QSM0gJbOkQs1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DlZB6iafTTHqNfF0jjyLynONL0l7eKh7UMFJTFViFIcNdS2ZS9zcbCKp7OHgTiWV/
	 bKrOInSEmEQ/erWZpeCTAiSyi9ng6Az2BedkMdxG8pUU0feqR9SUt3vfrVqwF6Vz8p
	 mCK0Ag84m8gpoCdG6A6VD2BBiZLpaSFST77T86P+rlawHoXh5apcyR9dStbOSAA+no
	 KCMPm9JEUg+4DWGTO7ZMopbR4Zg5vCsNASXRhXgRuQpTmqyFvIKqm2T6GpFVIHCd3t
	 VTMBrQlUWUkLjgNLjOTz7M8rdqywdt7aC7otiKK/ChDZu+RybeiK0d4k3AB0506z/1
	 itR9LNqS/oq6w==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-7190d9bdb2cso51253eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:48:12 -0800 (PST)
X-Gm-Message-State: APuU4Z8Vm0pdHAXKla4ZQZahSJeWieF+8rdimOJ/1qu28GfeFFxxR++W
	wE89IAiWnF3uZKSz6AF0QGQ68Wxdjn8c6dcsbCbhvfYvcUt8Z2e2IDOpKuV+1tiOsN03oIUHvFg
	clNjstuom3DH+bTcytHlAzW8E/uNK0Po=
X-Received: by 2002:a05:6820:4109:b0:71a:ead6:faf3 with SMTP id
 006d021491bc7-71b392612d2mr518409eaf.10.1795114091815; Thu, 19 Nov 2026
 10:48:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com> <20261119180143.2912138-4-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261119180143.2912138-4-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:48:01 +0100
X-Gmail-Original-Message-ID: <CAL4WiirxeYg37=0U0T+9jWttebQbrsTbK9GRNed0tUCw5w11sA@mail.gmail.com>
X-Gm-Features: AclHuK_PK17MlM2BR4u8Zz7NWIc0XbygF6Uc-yorGsvP9IEIFlia9wqte8JQigQ
Message-ID: <CAL4WiirxeYg37=0U0T+9jWttebQbrsTbK9GRNed0tUCw5w11sA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/4] tcp: add TCP_ECN_SEND_ECT_1 flag for
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
> This patch introduces the new TCP_ECN_SEND_ECT_1 bit, which enables
> a congestion control module to control whether the connection
> transmits using ECT(1) (if the bit is set) or ECT(0) (otherwise),
> when congestion control is initialized after ECN negotiation.
>
> A congestion control module, such as the upcoming TCP Prague
> using L4S ECN, can set this new TCP_ECN_SEND_ECT_1 bit if it
> wants to send the ECT(1) code point in outgoing IP headers.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> --
> v3:
> - Update commit message
> - Update flag name and helper function name to eliminate confusion
> ---
>  include/net/tcp.h     | 1 +
>  include/net/tcp_ecn.h | 6 ++++++
>  net/ipv4/tcp_cong.c   | 4 +++-
>  net/ipv4/tcp_output.c | 2 +-
>  4 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 4b1159e6c125..0242fd6bbb07 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -428,6 +428,7 @@ static inline void tcp_dec_quickack_mode(struct sock =
*sk)
>  #define        TCP_ECN_DEMAND_CWR      BIT(2)
>  #define        TCP_ECN_SEEN            BIT(3)
>  #define        TCP_ECN_MODE_ACCECN     BIT(4)
> +#define        TCP_ECN_SEND_ECT_1      BIT(5)

Who clears this bit ?

The only place where tp->ecn_flags is reset is tcp_ecn_send_syn().

If a module sets the bit, and the user later switches to another
congestion control with setsockopt(TCP_CONGESTION) on an AccECN
flow, tcp_ecn_send() will keep sending ECT(1) on every packet,
with a classic congestion response.

I do not think we should rely on each module ->release() to
clear it. tcp_reinit_congestion_control() should do it.

>
>  #define        TCP_ECN_DISABLED        0
>  #define        TCP_ECN_MODE_PENDING    (TCP_ECN_MODE_RFC3168 | TCP_ECN_M=
ODE_ACCECN)
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index 9ca016d98972..ff402cdb988d 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -38,6 +38,12 @@ static inline void INET_ECN_xmit_negotiation_ect(struc=
t sock *sk)
>         __INET_ECN_xmit(sk, tcp_ca_ect_1_negotiation(sk));
>  }
>
> +/* Apply either ECT(0) or ECT(1) based on TCP_ECN_SEND_ECT_1 flag */
> +static inline void INET_ECN_xmit_established_ect(struct sock *sk)
> +{
> +       __INET_ECN_xmit(sk, tcp_sk(sk)->ecn_flags & TCP_ECN_SEND_ECT_1);
> +}
> +
>  static inline void tcp_ecn_queue_cwr(struct tcp_sock *tp)
>  {
>         /* Do not set CWR if in AccECN mode! */
> diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
> index 3331679c81d7..43b0634f7673 100644
> --- a/net/ipv4/tcp_cong.c
> +++ b/net/ipv4/tcp_cong.c
> @@ -240,7 +240,9 @@ void tcp_init_congestion_control(struct sock *sk)
>         tcp_sk(sk)->prior_ssthresh =3D 0;
>         if (icsk->icsk_ca_ops->init)
>                 icsk->icsk_ca_ops->init(sk);
> -       if (tcp_ca_needs_ecn(sk))
> +       if (tcp_ca_needs_accecn(sk))
> +               INET_ECN_xmit_established_ect(sk);
> +       else if (tcp_ca_needs_ecn(sk))
>                 INET_ECN_xmit(sk);

This only looks at the module flag, not at what was negotiated.

If AccECN negotiation failed (RFC 3168 fallback, or no ECN at all),
we still set ECT(0)/ECT(1) here. Is the module expected to handle
all the fallbacks from its ->init(), like DCTCP does ? If so,
please add a comment, and say it in the changelog.

>         else
>                 INET_ECN_dontxmit(sk);
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 08d0d4a639fe..7b694479095e 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -350,7 +350,7 @@ static void tcp_ecn_send(struct sock *sk, struct sk_b=
uff *skb,
>         if (tcp_ecn_mode_accecn(tp)) {
>                 if (!tcp_accecn_ace_fail_recv(tp) &&
>                     !tcp_accecn_ace_fail_send(tp))
> -                       INET_ECN_xmit(sk);
> +                       INET_ECN_xmit_established_ect(sk);
>                 else
>                         INET_ECN_dontxmit(sk);
>                 tcp_accecn_set_ace(tp, skb, th);
> --
> 2.34.1
>
