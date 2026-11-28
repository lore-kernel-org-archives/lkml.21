Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875362;
	b=SHfQoW3KMbqSyJIguqFWsk+GaHYXSgY49IqCpFLyz2RA+cMYGAyqQjHb126U435kB9vW
	 CyzpugWQnJmyGT8daihlcWHyLWsmm6cokDCetFlxdlzyfTGZLztOhRdrN5GCq7oKX2aN8
	 aM9C7owDfbLFF+W1OVkLTgjzZHvHkBXHj/GcpxPvnCnLG47lz7ONoBgCO0w91YcIZ3HwW
	 CtYMYa48tknVynKA15yJhhekLn1QNxx1S++8O4GRo3Qn1ctL8gCYdK+/SQB8ixjVID8GR
	 2WSPtXGRKhG3moJvNPWzYvxgHY9PXZM5Z6OVW+0GMtko0Ucn5riGtFPwvCRViGcJL7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875362;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vSv3enixPy0AIUfzIXPL5JzF2Q4UKi/kDSZtNO9+xEE=;
	b=2w3TrYm5U3/5n0T2tpjTWLyQutC20GEIjuvvub0Paj1yK01dkKIpZLN+UhW3ya9wCior
	 uFoyI0zV0lKpSET4FyL288WIBbSYEEECpD801qcUmW8xk6JiKXDAb7qb7Ha4ZUwTN3dII
	 Li3rjpaKE25oHUntvVOk457hX6f29/GaV148QzjnzGTXYvQBJ9NJupuf1W6irkfwBjoC8
	 YQ6vWfmPHrLEKsB5tIDxlCoP17KuW34QpqbC/DHUhpAbU2HAuJ5RbzfVloCIi9H+/gBdH
	 SZXrEjn9cJscOg6SQOxgt7GAwtYeMJAbV8qP25QY/UkvD+1s3IxzkxhzqeB8nB1jkyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtqJZ9+H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14985606A31C;
	Sat, 28 Nov 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtqJZ9+H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21A11F000C1;
	Sat, 28 Nov 2026 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795875361;
	bh=vSv3enixPy0AIUfzIXPL5JzF2Q4UKi/kDSZtNO9+xEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OtqJZ9+HHNxq2eYDXC+rslajrfsAgyvbR4fyxKdl2Zs26qqAVTJSMeQ5BYmK8HnFu
	 6UuUwDok3npDP/rf/gaLPKpt20f3aSnop2RhRmvVWclMmKnQ/NVwoQFxywCFsi2DQP
	 scGnxcVmuwWKER6n+ylMbTZUrsAoE8D7RwVvMwAPYrUXSe9Q0s+LYTzQeRwZRuuOH8
	 F0T0enuvqj4xSzU4zrFJOvWku/LKJuqtQnI9NUD8Z0wc8DXXI7T9yWKbbAwAWYUKHY
	 qWWs4ch1Bd0efxTTXHpMadnE8xoC3M2leck7Kei8QKqgQ3J1Dtm5v0/A6VQJUMcJPs
	 EGCRBwIBi74zQ==
Date: Sat, 28 Nov 2026 14:15:57 +0000
From: Simon Horman <horms@kernel.org>
To: Andrey Misiurov <amisiurov@cloudlinux.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] pfcp: drop packets until the device is initialised
Message-ID: <20261128141557.GF31322@horms.kernel.org>
References: <20261119122946.1720693-1-amisiurov@cloudlinux.com>
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
In-Reply-To: <20261119122946.1720693-1-amisiurov@cloudlinux.com>

On Thu, Nov 19, 2026 at 01:29:46PM +0100, Andrey Misiurov wrote:
> pfcp_newlink() creates the PFCP UDP socket (port 8805) and publishes it
> (sk_user_data = pfcp, encap_rcv = pfcp_encap_recv) before
> register_netdevice() runs ndo_init, which is where pfcp->dev is set. A
> datagram that arrives in that window passes the "pfcp != NULL" check in
> pfcp_encap_recv() and then dereferences a NULL pfcp->dev:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000108
>   #PF: supervisor read access in kernel mode
>   Oops: 0000 [#1] SMP PTI
>   CPU: 0 PID: 26516 Comm: pfcp_race
>   RIP: 0010:pfcp_encap_recv+0xeb/0x1d0 [pfcp]
>   Call Trace:
>    <IRQ>
>    udp_queue_rcv_one_skb+0x24a/0x560
>    udp_queue_rcv_skb+0x4f/0x80
>    udp_unicast_rcv_skb+0x78/0xa0
>    __udp4_lib_rcv+0x519/0x5f0
>    udp_rcv+0x25/0x40
>    ip_protocol_deliver_rcu+0xd4/0x210
>    ip_local_deliver_finish+0x86/0x110
>    ip_local_deliver+0x65/0x110
>    ip_rcv+0x17d/0x190
>    __netif_receive_skb_one_core+0x8d/0xa0
> 
> The window is wide when register_netdevice() fails before ndo_init (e.g. an
> invalid name): the socket stays live until pfcp_del_sock() on the error
> path. A narrower window also exists on the normal success path.
> 
> Drop the packet while pfcp->dev is not yet set or the device is not
> running.
> 
> Fixes: 76c8764ef36a ("pfcp: add PFCP module")
> Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
> ---
> Found during a backport review.
> 
> Reproduced on ubuntu-resolute 7.0.0-42: flood UDP :8805 while creating a
> pfcp link with an invalid name (register_netdevice() fails before ndo_init)
> -> the NULL-deref above (kdump vmcore). With the fix the same run stays clean.

Reviewed-by: Simon Horman <horms@kernel.org>

