Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680839;
	b=31mpUlcNuWJesjpuM4EgB2msvF8KbGj0GzYuCO+eWOifKMtbC3jH9c4OrFbK0oEjnqB0
	 rBE2Yb/yh45WIOAacL1VoX5cpTXNuIBSTDMcd07zDBF2u8Z5DVpHKZxnbtKYT8MC9KSAt
	 UVFlqQtKFc71q566j0izoXe4e3FGwAiwYoTHgDRw/Y1cv8a8B8WGG2X8bEMzoWisCKQNX
	 LQf/fEZ9FSSwDatOowB8XUUuCn3PzEgGr4C9FgqIIP3ogJNQ4FHWlt0DXMiHtE7zQ3Sa8
	 YyU8c7/mh3y44nHzpUQhgLpwrk4UnR6r8zPf+gQXd+MfWUNUW8FUvgktpPHOmHbxDDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680839;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=du8ZpgKg7y+JSHPGHeVmHsAOuNQnkPoofwWOvxKg+Eo=;
	b=WEbPhVw6cG3T06qOKrbWwcxbe/tg0InYcqKi6qAXeg+HLqRbnIqAHTDoU+K7Y8nD8p+r
	 tjfyOAzIPG/trqYpJlLPHuFAFdn4rYC3TuuCoCBVuSy8588LeUvXiUmd32hnh1dbHBgdc
	 2p4mN/HyPI1jaMdNkm1gevSmco/Yc7YxgqI27zHOabwKoYGmFmCwA2UsMGM7R5FWNWCQ9
	 o6PAWOf/efWiTqgCbVTJ9RBGZSXsWEtfuK7AxNfRhPVY/o5vSoQipWYcNRAb+O1mIXMpR
	 If9fG0utB2XLkU22mvzpQ2b5tAXx6uj+T/ulQ5vZ3OJB67oogwW1KthFpq9y0cyZHcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PV7zQK7r;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFA1606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFA1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PV7zQK7r
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DI1JO81xWUoyggcDXvguJ3RNZ3fdazMgtO43ps7msp4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680836; v=1; x=1796285636;
 b=PV7zQK7rTd6Q/ha9e4zKHIZlw0r1teo6g5lXHhQs/62K79gKTdgYlAp5f2zOCIZK/kkaq9ag
 +fN2JGbKwa3jfJj5PRLUWAXkVUwR4ZRI7CB4Xe78NxY2IlBDRiPsSgB20VpGSat8OmFflJWA4O7
 1a9+RztSFOJBzqvodX8jA7oI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 56ac476ea61aeb81;
	Thu, 26 Nov 2026 08:13:56 +0000
X-Mizu-Trace-ID: 56ac476ea61aeb81
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:13:48 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/6] ip6_gre: Enable BIG TCP packets
Message-ID: <20261126081348.GG33976@Liu-laptop>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-6-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-6-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:14PM -0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
> commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
> on UDP tunnels. ip6gre and ip6gretap can carry BIG TCP packets as well:
> IPv6 BIG TCP no longer needs a hop-by-hop jumbo header, the GRE header
> has no length field, the GSO and GRO paths already handle it, and FOU
> encapsulation sets the UDP length with udp_set_len() since
> commit 47282504ad21 ("udp: Support BIG TCP GSO packets where they can
> occur").
> 
> Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
> with ip6gre and ip6gretap. ip6erspan is left alone. The default
> gso_max_size and gso_ipv4_max_size stay at 64KB, so nothing changes
> unless they are raised explicitly.
> 
> iperf3 TCP over ip6gre and ip6gretap, with IPv4 traffic between two
> netns connected by veth, without encapsulation, 3 runs of 10 seconds
> each, in a KVM guest with 8 vCPUs on an Intel Core i7-14700 host:
> 
>   ip6gre,    65536:   84.7,  84.4,  90.2 Gbit/s
>   ip6gre,    196608: 117.7, 112.5, 128.4 Gbit/s (+38%)
>   ip6gretap, 65536:  103.1,  97.9, 102.4 Gbit/s
>   ip6gretap, 196608: 123.0, 125.7, 124.8 Gbit/s (+23%)
> 
> A later patch in this series extends big_tcp_tunnels.sh to cover ip6gre
> and ip6gretap with IPv4 and IPv6 traffic, without encapsulation and with
> FOU and GUE.
> 
> Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/ipv6/ip6_gre.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> index 26c0e1c4de1..0ace21db3b4 100644
> --- a/net/ipv6/ip6_gre.c
> +++ b/net/ipv6/ip6_gre.c
> @@ -1462,6 +1462,7 @@ static void ip6gre_tunnel_setup(struct net_device *dev)
>  	dev->flags |= IFF_NOARP;
>  	dev->addr_len = sizeof(struct in6_addr);
>  	netif_keep_dst(dev);
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  	/* This perm addr will be used as interface identifier by IPv6 */
>  	dev->addr_assign_type = NET_ADDR_RANDOM;
>  	eth_random_addr(dev->perm_addr);
> @@ -1934,6 +1935,7 @@ static void ip6gre_tap_setup(struct net_device *dev)
>  	dev->priv_flags &= ~IFF_TX_SKB_SHARING;
>  	dev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
>  	netif_keep_dst(dev);
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  }
>  
>  static bool ip6gre_netlink_encap_parms(struct nlattr *data[],
> -- 
> 2.43.0
> 
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
