Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994270;
	b=MZKH75TJmBA9XFpSRUcY9piWpAwjlaCKMPrX0bn35zxmyezHIOcvQn0fOvJDXSyb6ESB
	 dlRWxjXhVKhFmVo+ew/UqmIW2wpocMLISPcIJAtPMwfPakoCktX6gCHFJ8PofmH9HDQ6K
	 YwNjf7uma4n0b6jdsw6U1W7zoaP7+COQL2XWBQPkDV9/njjE0CmlYSeJAPp4jjfYqW6KT
	 X+qkYSbm0VqZQDKewWNmIvWIXtt2ZED9qZge6lg//bDSx3f+mpYDrIBowiJsL4V0AEzZE
	 8y7lwwHtd0IP1LW5Dl7asT7m1Ngzdh7jId73YDrV/2pSyEeALtTNyRbm/YK9dr106tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994270;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0kn55mCijCWjeMsJaup/RZVejRphJIP7oArtyJYdwus=;
	b=dEW8fO2XfqLw1YbpGRPQwPfMgW0mm3oaSC5H6PX5LcDzEtJpfm6ijZztk1Hs3E7it5Mb
	 +tJGfc8QEbnj+dY42GO6U9KHmZ5wyKkPpMFLXrlqkGpt1VfukNsO5wXyjl3+ZaQLw7PFJ
	 e1e2MIzKj/OAXt2n3HN5gMiUg8nN3BAd7eFLrcp4srsil5lCBvGNfK2TE9tl3WGMvPTY1
	 FfWPUsKb2Mjy7LjcDugeDdE2XD5gZcdGjxV7XLL/4Rk5chbBkPRHB5+20+ll4WW+kOXTh
	 fSpufPNmuud1SivdFbzKWpKAJRWhZd9KGMlUMRxnGog09Ag/obAxp7Wi6/4E7TsXnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaSkeN5e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaSkeN5e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07021F000C6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994269;
	bh=0kn55mCijCWjeMsJaup/RZVejRphJIP7oArtyJYdwus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BaSkeN5exeFzGTBeQp9xWBiyjJ7dvHLMT2y5T3wuJFg7VXNEgjuKyHRNqdtd82HeX
	 OdemxYtLVjYXgBH7KTnOzq96sjvElSGxLpulqE+pqj/q71aXrKcu+xzFDUEWWL6RaW
	 VEbD6GFrMJwhby1yPzq6jzCzQgxOG1AhL8syTYs9adEEITk8rx6W673qs0DOlCOfua
	 hXexpwU4UFwoRUAq51WiZUCSswOWmppqfG3HIUM0eBwsmUjeoR7YOVaZxFDk7YC2TY
	 HwmHAT4ER+akdZ4CTJyZ2Q7xYz9trBHirX+F5zDtbbbD30iLcTEPisweBBLbH3nAQb
	 FNcyZ8akuFOpg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-70bf1671c21so491919eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:31:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGscRmqiEaCXDejnevrS0Pdq6xc3bub0b7L8FIkJbV959o5cf0SCPz1Mp/HvpBEGvt+pfSm1ut16WgqWro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QZngi66jgWMAHSuLj7WAdimQQpTAnXFEa6pPnPZpsclB0jrJ0
	MC+8GTpWOXX4glwh5x+bGF91G9UflAIEJKRRcGEj9l0DqFzHfP5WTb6CJx6XSmBSnxYdk7ZuFM1
	LKI0tJ06+UQiT0DNN/duoR/+GVE38zGE=
X-Received: by 2002:a05:6820:2ad8:b0:717:da:ba40 with SMTP id
 006d021491bc7-71b185657acmr1225893eaf.26.1794994269186; Wed, 18 Nov 2026
 01:31:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116023709.132684-1-thaisonphan@google.com> <20261116023709.132684-3-thaisonphan@google.com>
In-Reply-To: <20261116023709.132684-3-thaisonphan@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 10:30:58 +0100
X-Gmail-Original-Message-ID: <CAL4Wiir50_Z+m00GyU9BpRdAqgXs8V-L0S8kmmES=JiYyt==gg@mail.gmail.com>
X-Gm-Features: AclHuK9ptD7cBCsGNuyfU56eSbPiR5wyO28Z8shsRDEFiiGlM5HRM9FXIjfx3vE
Message-ID: <CAL4Wiir50_Z+m00GyU9BpRdAqgXs8V-L0S8kmmES=JiYyt==gg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
To: Thaison Phan <thaisonphan@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 16 nov. 2026 =C3=A0 03:37, Thaison Phan <thaisonphan@google.com> a =
=C3=A9crit :
>
> cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
> request_sock without __GFP_ZERO, leaving saw_accecn_opt,
> accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
> accecn_ok is negotiated in cookie_{v4,v6}_check(),
> tcp_ecn_openreq_child() reads all four fields to initialize the child
> socket's AccECN state.
>
> In addition, because the temporary request_sock used to send a cookie
> SYN-ACK is immediately freed, treq->syn_ect_snt is lost. If the listener
> marks ECT (e.g. DCTCP), failing to record syn_ect_snt causes
> tcp_accecn_third_ack() to flag TCP_ACCECN_ACE_FAIL_RECV when the peer
> reflects ECT, disabling ECT for the rest of the connection.
>
> Initialize saw_accecn_opt, accecn_fail_mode, and syn_ect_rcv in
> cookie_tcp_reqsk_init() to match tcp_openreq_init(), and set syn_ect_snt
> from the listener's TOS/tclass in cookie_{v4,v6}_check() to match
> tcp_{v4,v6}_send_synack().
>
> Found by AI-assisted code inspection comparing tcp_openreq_init() and
> cookie_tcp_reqsk_init() while investigating the cookie_v6_check()
> LOOPBACK4_IPV6 bug. Reproduced in a QEMU VM with tcp_syncookies=3D2,
> tcp_ecn=3D3, SLUB_RCU_DEBUG=3Dy, and slub_debug=3DP, observing bogus
> tcpi_accecn_fail_mode and tcpi_accecn_opt_seen values in TCP_INFO on the
> accepted child socket (and tcpi_accecn_fail_mode=3D0x2 on ECT(0)
> listeners), and tested with packetdrill AccECN and syncookie selftests.
>
> Fixes: 3cae34274c79 ("tcp: accecn: AccECN negotiation")
> Fixes: b40671b5ee58 ("tcp: accecn: AccECN option failure handling")
> Signed-off-by: Thaison Phan <thaisonphan@google.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> ---
> v2:
>   - drop redundant treq->syn_ect_snt =3D 0 in cookie_tcp_reqsk_init()
>     (Eric Dumazet)
>   - clarify how the bug was discovered and observed via TCP_INFO
>     (Eric Dumazet)
>   - add Reviewed-by tag from Eric Dumazet
> v1: https://lore.kernel.org/netdev/20261114161248.3428695-3-thaisonphan@g=
oogle.com/
>
>  net/ipv4/syncookies.c | 4 ++++
>  net/ipv6/syncookies.c | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> index 4e0ff3b82062..1a837ed6efa0 100644
> --- a/net/ipv4/syncookies.c
> +++ b/net/ipv4/syncookies.c
> @@ -290,6 +290,9 @@ static int cookie_tcp_reqsk_init(struct sock *sk, str=
uct sk_buff *skb,
>          */
>         treq->txhash =3D treq->snt_isn;
>         treq->syn_tos =3D TCP_SKB_CB(skb)->ip_dsfield;
> +       treq->saw_accecn_opt =3D TCP_ACCECN_OPT_NOT_SEEN;
> +       treq->accecn_fail_mode =3D 0;
> +       treq->syn_ect_rcv =3D 0;
>
>  #if IS_ENABLED(CONFIG_MPTCP)
>         treq->is_mptcp =3D sk_is_mptcp(sk);
> @@ -502,6 +505,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct =
sk_buff *skb)
>                 ireq->rcv_wscale =3D rcv_wscale;
>         ireq->ecn_ok &=3D cookie_ecn_ok(net, &rt->dst);
>         treq->accecn_ok =3D ireq->ecn_ok && cookie_accecn_ok(th);
> +       treq->syn_ect_snt =3D READ_ONCE(inet_sk(sk)->tos) & INET_ECN_MASK=
;

Sashiko has a point about the BPF custom syncookie case.

Requests coming from cookie_bpf_check() also reach this line, but the
kernel did not send that SYN-ACK, a TC/XDP program did. The listener's
tos/tclass says nothing about the ECN codepoint the program used, and
struct bpf_tcp_req_attrs has no way to report it.

test_tcp_custom_syncookie.c sends its SYN-ACK as Not-ECT (tos =3D 0,
flow info 0x60000000) and only clears CWR, so an AccECN SYN gets
AE=3D1,ECE=3D1 back and the client should stay in AccECN mode. It then
reflects Not-ECT in the third ACK. With a listener that has ECT in
inet->tos (DCTCP for instance), we would get:

  tcp_ecn_openreq_child()
    tcp_accecn_third_ack(sk, skb, treq->syn_ect_snt)   // ECT(0)
      tcp_accecn_validate_syn_feedback()
        tcp_ect_transition_valid(ECT(0), Not-ECT) -> false
        tcp_accecn_fail_mode_set(tp, TCP_ACCECN_ACE_FAIL_RECV);

This is the failure your patch fixes for kernel generated cookies.

I asked you to drop the syn_ect_snt =3D 0 in v1 because it looked
redundant, sorry about that, it is needed for the BPF path.

Could you send a v3 doing something like this (untested)?

In cookie_tcp_reqsk_init():

        treq->saw_accecn_opt =3D TCP_ACCECN_OPT_NOT_SEEN;
        treq->accecn_fail_mode =3D 0;
        treq->syn_ect_rcv =3D 0;
        treq->syn_ect_snt =3D 0;

In cookie_v4_check():

        /* SYN-ACK was not sent by the kernel if req->syncookie is set. */
        if (!req->syncookie)
                treq->syn_ect_snt =3D READ_ONCE(inet_sk(sk)->tos) & INET_EC=
N_MASK;

And the same in cookie_v6_check() with np->tclass.

Letting the BPF program report the codepoint it used (a new field in
struct bpf_tcp_req_attrs) would be net-next material.

The other Sashiko remark (AccECN option carried by the third ACK is not
processed in the syncookie path, unlike tcp_check_req()) looks correct,
but this is not something added by this patch. It can be handled
separately, no need to grow this series.

Please mention the BPF case in the changelog. You can keep the
Reviewed-by tags on both patches.

Thanks.

pw-bot: cr
