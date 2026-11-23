Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403880;
	b=pk9WDn1teD8XHbzTQ5OES5JlkuMK0zgkRMzDWAYOpkvgHzfLcjBk8//gIVhS/8/8C5j2
	 93mEQrrRsnWUKiIgluixAlDgmSZExmuKZaemtvwhJxP7lf7LSKPq/ROI9rfQHXnEQj5zw
	 wWyia5k3MRoOG8y78fiYuJ+b+QWELTd3tditFDEYrRMvRWfvcl2cw1Ol5Ly8KQnRsTpa4
	 ET0N7NqJbxpl07p57mD+IrqI70CbvJkL2bsbHUK+hSZRBue3sqVJfzKsnZJ70dI3DDSbh
	 i3m34C5kdeEN4j2jPggxE5glPShCKAIMR5UHCUTthVK4ZXc0CfTdB5+pfQvza96uedw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403880;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lAT9Q9u4ZEAI9esLB5617mXqlXUP6teQqeagq/dxTro=;
	b=AkdQqQ2aSegfl2ABy2RGLMMi+6pZ9vHXiVo4VsgmvYHuph8deomRNlHhn+StUZAJDCx0
	 apKKeqwr7B2CXKQ0nQTdGmZBIFeYxkzDVhhF6xm6HiCafUOYb8mtxt53UzMMbd3n9t+10
	 aaeheowxg2A0H8c/gfWSqVkup6eFf8niEaGstD7Ga09jIcDpmRFHzKK4rrH6gTcg0qsMJ
	 ktlEjnt5OZ8TbmO7DoJ1bMjmDBjxvj7KSCx5/xiUDgB3MmxsDIgoDubzFRBt4C4Ei0WoD
	 iSf9hDxzmbyAdISrVT+VOOYQHCApTCJHvXtG/XgzFZBh9HF7QgQ+A4IsOBBCWKI6vlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G7JrksWa;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA111606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA111606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G7JrksWa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M7si56aP3OTtLi9BxKwkRnYNOxami/vKdawrvQc1pi8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795403877; v=1; x=1796008677;
 b=G7JrksWaznXXXO3UwS+aRhfMXn+x9azT+161MNAfg3oVVBY+wJouOKfbsKOhRae+dAWAhvwg
 1x4gXN0KAIqjG2JQKzsnu9lC5/H/QPfLUSxIqLZIkmhEFk3YZbX9TZjVveKIq1L6ewCghr5RepS
 zKvaTEskZ2QpaMssvec32Amk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 64e1140ea90b8fae;
	Mon, 23 Nov 2026 03:17:57 +0000
X-Mizu-Trace-ID: 64e1140ea90b8fae
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 11:17:50 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] bonding: reject a non-Ethernet 802.3ad slave
 even when the type matches
Message-ID: <20261123031750.GD10218@Liu-laptop>
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.7669047222441539373@gmail.com>
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
In-Reply-To: <179535729502.2645501.7669047222441539373@gmail.com>

On Sun, Nov 22, 2026 at 11:59:09PM +0900, Kyuwon Cho wrote:
> Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
> devices") rejects a non-Ethernet first slave in 802.3ad mode, but only
> when enslaving it changes the bond's type. A bond keeps the type of its
> last slave after that slave is released, so a bond that once had an
> ARPHRD_TUNNEL6 slave can be set to 802.3ad and take another TUNNEL6
> device, such as a second bond prepared the same way, without the check.
> bond_open() then adds the 8-byte lacpdu_mcast_addr to that slave with
> dev_mc_add(), which copies the slave's 16-byte addr_len:
> 
>   BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>   Read of size 16 at addr ffffffff878a2940 by task test/114
>   Call Trace:
>    <TASK>
>    __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>    dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
>    bond_open (drivers/net/bonding/bond_main.c:4405)
>    __dev_open (net/core/dev.c:1762)
>    __dev_change_flags (net/core/dev.c:10022)
>    netif_change_flags (net/core/dev.c:10087)
>    do_setlink.isra.0 (net/core/rtnetlink.c:3294)
>    rtnl_setlink (net/core/rtnetlink.c:3633)
> 
> An unprivileged user can set this up in its own user and network
> namespace.
> 
> Check that an 802.3ad slave is an Ethernet device before the type
> handling, for every slave.
> 
> Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
> Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> ---
>  drivers/net/bonding/bond_main.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 042d7c75548f..bcc12ef34d9a 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -1951,6 +1951,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>  		return -EPERM;
>  	}
>  
> +	if (slave_dev->type != ARPHRD_ETHER &&
> +	    BOND_MODE(bond) == BOND_MODE_8023AD) {
> +		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
> +			     "8023AD mode requires Ethernet devices");
> +		return -EINVAL;
> +	}
> +
>  	/* set bonding device ether type by slave - bonding netdevices are
>  	 * created with ether_setup, so when the slave type is not ARPHRD_ETHER
>  	 * there is a need to override some of the type dependent attribs/funcs.
> @@ -1960,12 +1967,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>  	 */
>  	if (!bond_has_slaves(bond)) {
>  		if (bond_dev->type != slave_dev->type) {
> -			if (slave_dev->type != ARPHRD_ETHER &&
> -			    BOND_MODE(bond) == BOND_MODE_8023AD) {
> -				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
> -					     "8023AD mode requires Ethernet devices");
> -				return -EINVAL;
> -			}
>  			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
>  				  bond_dev->type, slave_dev->type);
>  
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
