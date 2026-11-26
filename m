Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680802;
	b=rR5RriUHUaWDpPmUDR5c8d8Cdyw75QbTVTWIUpptmkCdLp+6tO34qBQ6nqdEOY0yeQ5n
	 J8CXRrkVMwYUZjLNh18Nic1okKs0qqJAAHgmAridGRMlBvyq798+H9LVge/s8HfOgA5Pe
	 IluudtnqXm/Wu+QLT4SolvSPnD6cQ5uo1kjJGY7dGJfWL20MveIQrXt+LVj4/o04XEavT
	 e1jDzYK+h1f5YxiPC61cn46SjazT2uLl7tSwoqbJBjqwzLBa+7LNw1OeNEIBg+TptPxLi
	 wembxF4L2gJTBlk6vgymvLA/uOoIOqsmImKHs8s5QCllfv8dubejVke1FU4F5Q6mjJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680802;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8ngE5yHiDIx7vBCYimPDgiAaC44Sef/mO5m2HnMkQ3g=;
	b=LWKMiLEVQ969XCDYNhpgbbdaLuFYCAV2ZTshQSS+uz70YcoadBw04NXL88UNaO4GmGlR
	 hB0AUrhusE9lhi9qVUoyDtjtSuLL+wVmGrx1BvH9LvVbdsa6e3fcXb754kKcmkgFPS77j
	 /s2TUBLuiLlV4PdZA68lrBA3sulaJQxdcmNqvoqfTfOdIkDIdr8pPYemn8esez4219O+S
	 brY+NIXEIE3KkDbfbsmxXiejRH7OI/ogmgTU4biKru/gTfI3fXjxPdZaQqWphomt2IMSu
	 EVK2QNjt8zb5Sf+Sc0wukqSmIsYOV2mx1ioWi7f1wpaAVT1vAXiS9QwhPE3IwT+EtQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HDgwxbPG;
	arc=none smtp.remote-ip=95.215.58.247
Received: from mta1.migadu.com (out-247.mta1.migadu.com [95.215.58.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083BA606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 083BA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HDgwxbPG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TWd5PYsIUK42+eVyOks+ZcrzBLgJCP2EqIb2/tZIif4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680799; v=1; x=1796285599;
 b=HDgwxbPGV+SOoxUcQzUMVT9i3l1EcBh1rMtwVT0oMISsd3H3agHFXh+81KT9vrOxXdAPBtdR
 eUmihKIKfkAsS+QeYGTBfxZ2t8UaCZl8JE2yXizle+mREwib/eH+12RpT/7uGk0OwMN2umtg3LI
 M3ix4aaPd8vorYG9hnGD+Y18=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3b2fb38026ca545c;
	Thu, 26 Nov 2026 08:13:18 +0000
X-Mizu-Trace-ID: 3b2fb38026ca545c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:13:11 +0800
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
Subject: Re: [PATCH net-next v2 4/6] ip6_tunnel: Enable BIG TCP packets
Message-ID: <20261126081311.GF33976@Liu-laptop>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-5-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-5-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:13PM -0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
> commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
> on UDP tunnels. ip6tnl can carry BIG TCP packets as well: IPv6 BIG TCP
> no longer needs a hop-by-hop jumbo header, the GSO and GRO paths already
> handle it, and FOU encapsulation sets the UDP length with udp_set_len()
> since commit 47282504ad21 ("udp: Support BIG TCP GSO packets where they
> can occur").
> 
> Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
> with ip6tnl. The default gso_max_size and gso_ipv4_max_size stay at
> 64KB, so nothing changes unless they are raised explicitly.
> 
> iperf3 TCP over ip6tnl, with IPv4 traffic between two netns connected by
> veth, without encapsulation, 3 runs of 10 seconds each, in a KVM guest
> with 8 vCPUs on an Intel Core i7-14700 host:
> 
>   gso_max_size/gso_ipv4_max_size 65536:   93.0,  90.8,  83.3 Gbit/s
>   gso_max_size/gso_ipv4_max_size 196608: 134.8, 123.4, 112.8 Gbit/s (+39%)
> 
> A later patch in this series extends big_tcp_tunnels.sh to cover ip6tnl
> with IPv4 and IPv6 traffic, without encapsulation and with FOU and GUE.
> 
> Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/ipv6/ip6_tunnel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
> index 64a184bca46..040012cdf15 100644
> --- a/net/ipv6/ip6_tunnel.c
> +++ b/net/ipv6/ip6_tunnel.c
> @@ -1919,6 +1919,7 @@ static void ip6_tnl_dev_setup(struct net_device *dev)
>  	dev->lltx = true;
>  	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
>  	netif_keep_dst(dev);
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  
>  	dev->features		|= IPXIPX_FEATURES;
>  	dev->hw_features	|= IPXIPX_FEATURES;
> -- 
> 2.43.0
> 
> 
> 
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
