Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795877789;
	b=zef+koAev+ggY0J7YuM0G5b1B7aJTj8OBpATXHP5UYk2zITKNW9N6Pdd8iBZRn/ZxroP
	 6osS+uLlVfsFQUbnmuyc9dt488R6NJUH6sUJgs1P6IHpViBz9mFAS0kdlieKuDGeqU7/p
	 GphrAsCj6DLW/CneOMm9/E4zG9/ri8MxTtDMu8xMHCamgzB45CaRv+q1Wdc4e6mxkwKtu
	 3yb8z0jdXaMgfrZOfOS+6HYiMPGP5ojpC9L0W/xcyud0Vbo5insOdg0DxrC8RrUfHDLy4
	 dljQbwD/z5h5sDGsPg0qmcqSyMvMeYA4gPY2vb/PseuXPp2OtkmHwh9/r8k/IaocYJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795877789;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IZuKv3u+So4Yz6dZtGkBuRY1y8Boh0X5Sfzui0rZHgk=;
	b=Zy0xvSkNX8RMq4jVdL7Nx2fyyPnK1gIJfuMb26MJI462vzhcHtEsKAy6b2f2G/DLNHIs
	 GqMUB8j1TFx+v38E02x9W63m2psH9fgI669VwIxu+OqA5Hqsh7swKjAfh65/niqm0KuW2
	 FufJFa3BdciAqyd6JhMLO3RKMhXlhMl443O6gOglKOzr+0C9yURP5xd0iM1bTN+gjWd0T
	 fOHt4WPudtV1NUeJi4kCDS/ZJEUffDywmSGfAding8uPEuDJhB5MA6UL0iiS5Tm0fMKvF
	 2yxXVZjiqymO4vtHnwrG2tYZVQOfJHH2VdgTU5O8yjGSTDq3+9aj8kfYqmaV+6cc/uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L+ry/bbx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD44606A31C;
	Sat, 28 Nov 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+ry/bbx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CE91F000C1;
	Sat, 28 Nov 2026 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795877788;
	bh=IZuKv3u+So4Yz6dZtGkBuRY1y8Boh0X5Sfzui0rZHgk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L+ry/bbxCl7JgzkKM1xt8Btg4QDT7vIhzohr4AV864/O5sesRX/GEwM69T5FQZvap
	 TCTq9JS1fSXsfZLaT2xWnHrIR0pn9I9Cs9xq9q4B1oUIpqn6H4jD1LqY5T5628oCF6
	 m2BVwHFI6/pK5xNF1XxkWH49ypv6vgGSuz9fj3ceQBUBdoQwUVFBhvzrH/SrLq3Jh1
	 JxxCp+f3s/4QBBC+/DldH4SCez/8XvZ0oUJiskFE58d4+HvXoZ/HkWXNGguvAYXc8r
	 NcukTxbJA0tWHoQ2vfA735lAbx8NTW0h8oP1rg92i6hmU6XXWeXxSHr66mVpgDqtpI
	 ApXwDXPK3PxIQ==
Subject: Re: [PATCH ipsec] xfrm: iptfs: report the too big error to the
 frame's own socket
From: netdev-bot+sashiko@kernel.org
To: rmustafin@cloudlinux.com
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, chopps@labn.net, netdev@vger.kernel.org,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org, sashiko-bot@kernel.org,
 stable@vger.kernel.org
Date: Sat, 28 Nov 2026 14:56:27 +0000
Message-ID: <179587778754.3135.634434342885030903@kernel.org>
In-Reply-To: <20261127142550.66326-1-rmustafin@cloudlinux.com>
References: <20261127142550.66326-1-rmustafin@cloudlinux.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Low] The commit message says the new check works "as
  xfrm4_tunnel_check_size() does".

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  iptfs_output_collect() takes spin_lock_bh(&x->lock)…

--

xfrm: iptfs: report the too big error to the frame's own socket

This patch changes iptfs_is_too_big() to pick between xfrm_local_error()
and an ICMP error using skb_to_full_sk(skb). Before, it used the sk
argument passed to dst_output(). This fixes a NULL pointer dereference in
xfrm_local_error() when vxlan forwards an oversized frame over an IP-TFS
SA with dont-frag set.

Closes: https://lore.kernel.org/all/179551712630.3135.52212996809224784@kernel.org/

> Check the frame's own full socket instead, as xfrm4_tunnel_check_size()
> does, so a forwarded frame gets the ICMP error. Drop the now unused sk
> argument.

[Severity: Low]
Is the comparison to xfrm4_tunnel_check_size() accurate? That function
checks:

net/xfrm/xfrm_output.c:xfrm4_tunnel_check_size() {
    ...
		if (skb->sk && sk_fullsock(skb->sk))
			xfrm_local_error(skb, mtu);
		else
			icmp_send(skb, ICMP_DEST_UNREACH,
				  ICMP_FRAG_NEEDED, htonl(mtu));
    ...
}

The skb_to_full_sk(skb) check used here is the one in
xfrm6_tunnel_check_size(). The two checks behave differently for request
sockets. sk_to_full_sk() maps a TCP_NEW_SYN_RECV socket to its listener,
while sk_fullsock() returns false for it.

So an oversized IPv4 SYN-ACK goes to xfrm_local_error() here, where
xfrm4_tunnel_check_size() would call icmp_send(). That is harmless,
because xfrm4_local_error() resolves skb_to_full_sk() itself. Still, the
wording could be more precise.

Also, the oops described only happens with an IPv6 outer header. For
IPv4, xfrm_local_error()->xfrm4_local_error() found no full socket and
returned without doing anything, so the old behaviour was a silent drop.
With this patch those frames now get icmp_send(ICMP_FRAG_NEEDED).

Could the commit message mention this change in IPv4 behaviour?

> diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
> index 76272b0a18296..8a5276c1c002e 100644
> --- a/net/xfrm/xfrm_iptfs.c
> +++ b/net/xfrm/xfrm_iptfs.c

[ ... ]

> @@ -1832,7 +1832,7 @@ static int iptfs_is_too_big(struct sock *sk, struct sk_buff *skb, u32 pmtu)
>  	if (skb->dev)
>  		XFRM_INC_STATS(dev_net(skb->dev), LINUX_MIB_XFRMOUTERROR);
>  
> -	if (sk)
> +	if (skb_to_full_sk(skb))
>  		xfrm_local_error(skb, pmtu);

[Severity: High]
This fixes the IP-TFS caller. Is the same NULL dereference still
reachable through __xfrm6_output() when the SA is a plain IPv6
tunnel-mode ESP SA rather than IP-TFS?

__xfrm6_output() still checks the sk argument from dst_output():

net/ipv6/xfrm6_output.c:__xfrm6_output() {
    ...
	} else if (!skb->ignore_df && toobig && sk) {
		xfrm_local_error(skb, mtu);
		kfree_skb(skb);
		return -EMSGSIZE;
	}
    ...
}

For IPv6, xfrm_local_error() dereferences skb->sk without a NULL check:

net/xfrm/xfrm_output.c:xfrm_local_error() {
    ...
	else if (skb->protocol == htons(ETH_P_IPV6) &&
		 skb->sk->sk_family == AF_INET6)
    ...
}

With routed vxlan over an IPv6 underlay, the path looks like this:

ip6_forward()
  vxlan_xmit_one()
    skb_tunnel_check_pmtu(..., reply=false)   /* returns 0 */
    skb_scrub_packet()                         /* ignore_df = 0 */
    udp_tunnel6_xmit_skb(ndst, sock6->sk, skb, ...)
      ip6tunnel_xmit()
        ip6_local_out(net, sk, skb)  /* sk = vxlan sock, skb->sk NULL */
          dst_output()
            xfrm6_output()
              __xfrm6_output()
                xfrm_local_error()   /* skb->sk->sk_family */

xfrm6_local_dontfrag(sk) is false, because vxlan never sets DONTFRAG.
xfrm6_noneed_fragment() returns 0, because nexthdr is UDP. So the first
forwarded frame larger than the xfrm dst MTU minus the vxlan headroom
seems to hit the same oops. The only difference is that __xfrm6_output()
crashes instead of iptfs_output_collect().

The check in __xfrm6_output() came from commit 1620c88887b1 ("xfrm: Fix
the usage of skb->sk").

Since this is tagged for stable, could __xfrm6_output() also check
skb_to_full_sk(skb)? Another option is to harden xfrm_local_error()
itself, so it uses skb_to_full_sk() or bails out when skb->sk is NULL.
xfrm4_local_error() and xfrm6_local_error() already do that internally.

[ ... ]

> @@ -1916,7 +1916,7 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
>  		/* If the user indicated no iptfs fragmenting check before
>  		 * enqueue.
>  		 */
> -		if (xtfs->cfg.dont_frag && iptfs_is_too_big(sk, skb, pmtu)) {
> +		if (xtfs->cfg.dont_frag && iptfs_is_too_big(skb, pmtu)) {

[Severity: High]
This isn't a bug introduced by this patch, but can this deadlock on
x->lock?

iptfs_output_collect() holds spin_lock_bh(&x->lock) across the whole
segment loop. iptfs_is_too_big() sends the ICMP error synchronously from
inside that loop:

iptfs_output_collect()
  spin_lock_bh(&x->lock)
  iptfs_is_too_big()
    icmp_send() / icmpv6_send()
      ip_push_pending_frames()->ip_send_skb()->ip_local_out()
        dst_output()
          iptfs_output_collect()   /* dst->output of an IP-TFS bundle */
            spin_lock_bh(&x'->lock)

xfrm_bundle_create() installs mode_cbs->output as dst->output. If the
ICMP route back to the sender resolves to an IP-TFS SA, this function is
entered again while x->lock is still held.

If x' == x, the CPU spins on its own lock with BH disabled. One example is
a forwarded flow that hairpins back through the same tunnel.

With two IP-TFS dont-frag SAs in a hub-and-spoke setup, the lock order can
invert. CPU0 forwards A->B and CPU1 forwards B->A, so they could
deadlock on x_A->lock and x_B->lock.

If the return SA is not IP-TFS, xfrm_output_one() takes a lock of the same
lockdep class, which would produce a recursive locking report.

This patch sends a few more frames to the ICMP branch: vxlan frames with
skb->sk == NULL and frames owned by a TIME_WAIT socket. Most of the risk
comes from the existing forwarded path.

Would it be safer to send the ICMP or local error after spin_unlock_bh()?
That could mean doing the too-big check before taking the lock, or
collecting the rejected skbs and handling them after unlocking.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127142550.66326-1-rmustafin%40cloudlinux.com
