Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509731;
	b=hvGWWDisMJC5ZaF98oTJHqr+C4zBwz5qna5/ixZMnjAd44s5BItovLQCuSmWe7VbooTH
	 VpYT5aN4X4EIoCQP4izo8Mo1HQ+7+CkbXbgYvHe3DHvRBoX7bISsc0vPGGFJ0DTqsXISb
	 AUqyE03U7Rr1L3qoBB7I26POXguyOIKq+MoyOaYv77kJEfNbJQjb+gp9l7HfcHrkWBtjb
	 0ccGjTcAB9XPsgsoFn27phb7GkXaJ0KKxvOS3Ko2l3cLzxnEQAoGml/wRPxrrIkre8jiY
	 Ucun0RYKj1ONNHOMEbZDQJi/arsmgNyGz6DqCWXD1phpMYDz+179sHSr4dPYnUk+CYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L2EgBNT48xGjvZX2/RhS0gWPDCHaepO1c5iBj7UXWkU=;
	b=cXqdpiE6AQE9BS6XL3Z+R/AAi4gGn1RXeAihTHW24Umf+3NUZD7cIGkVvzvhkZio63OD
	 bPpiZBAlZEdg12skXv3Cbg2r3jE7iwAMlc/tN+nGmkQYZO6FmMtN+XpQl3wAHfuJTYBiZ
	 /WqYJarl6WUpsT1SHcY5FUPhZ13oHB4kEWdJ4iKvEJUczUDvJiwQW9aUGgs9y6kA+qSWI
	 GT4wf8DzlIuUzqW95x3MVh+pA+0yonoplDzJk5jsD7VFxrKczy7MK5bXH95lcZ73MACja
	 PIOF/7iK9tyTNmB49i4hNaCoFfdAjzqIG6Xie37kTXmnGcX8RkI95OaEjgnfXWtIq5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Kpz9b0CG;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E54606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Kpz9b0CG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3696006f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795509730; x=1796114530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2EgBNT48xGjvZX2/RhS0gWPDCHaepO1c5iBj7UXWkU=;
        b=Kpz9b0CGaR/tKGI+QLsZwJui5ZH0UGsl55OBqHSIyVbfwnp76QqFKUykB+3jXq97na
         fQfO4W/4Rqmbl6hCM66BWO+Gt2XKy+CK1wNhKIvvI37LkVE//ZPYb9R8nvW+4pS6vApu
         2XPS13L0+hiCIe/eNHxfklkS9k/Znqq8H4CNxxciFHl3YDNKvodHZXIjWl8jQjRpgcn4
         iqxmDkN4LWYyhpBzUr3SKqLjcjUu9vRiQtpJn3uETKS9eRE/i1kPTyj7Vdj9/+lDaOKF
         AVVudaiYgF+IYTHxEXU3dVZ44raI7pjRrEXJtgmx8QkIvF33E7x6OuWywSJrzFHxfDF4
         iDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509730; x=1796114530;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2EgBNT48xGjvZX2/RhS0gWPDCHaepO1c5iBj7UXWkU=;
        b=nDLdiNsb2mMMghC+aX1VMW39J9qWoRLCmlV4PYUmB3aYZrT/HmyKGU/eJ14YvQZTwU
         28SuoK5qRvmn8KjTlYvMocYwYBBpJw7JZAypbN1KcCiy2RATBkLQH8aOeNIkFO2Ix4QD
         vYgzN2IZ8yOOcHyXX1W2W1a7rbnub7XfyXbXPsJPExS/0ryJ9VJqrRP7KXW+GXQlwsn8
         c0kZhUE5/fZZNRS/kd1m7nMMMVwkZb0siLJASACbGmkU4ZeEgxGRWB3zcHltr/vxrSXr
         tY6z+cNpnj7Eqg98SkLcMDV/REObxhgwXkb/PRssOWySCUYy8a6jJzmBF0A713tOnRi9
         QVNg==
X-Forwarded-Encrypted: i=1; AL+hErHbmUs5m2NWdMrj9Z00WPfv8fhMqw4I1rfADgIj9ICd5uUl9vQqWO2hkF2DwtfHHB66tVLmUChoU02uWTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xqLR82qhR6iKQEHgvsuBNhqdr5tgs5a1Q9FoAUrhJhmj159xj
	K3xu6lcX1hCget+1TyeOmstSyOmWCvLUEwDkF2cORsMCWrxXuYNd7XWgkuInDn+LVl8=
X-Gm-Gg: AZFdTZdJmZ2wROSFJwV9FUamOTetyt35qy9UHI2+K9sAXFesbuNP0tt0Dh0N3NqPAsG
	4IFR4WNdFhMIDn/7skIOsZfCQ38ZDtADdVz9nc/zilNCHZZU/L7evUt5kdnNFeuWnVtBqDbH+j2
	6D199g93pCYvQ77+ueu/2ISM/KJ0ezXsq12SXpL1U1bMFzb2nkVy4Nq/gvixHNJzeg1Td6RnSWw
	69h03fxZc3xT44qdKwg1k51acAyCLgWlp79oNahS3QeE/tW6wFR/w0r/+ddEOw6zLGZ16JFFq7k
	xcGV8Bu4kvzZ+QjopaHhxE2mUZclF5qi5J9e5WFRhOHFV6YeOf4zUzbo2X0NATPhu369uT2sTuO
	a22dgVXB/NeG11tUOutK7hHjuIWvNlsDguDOxduLSyf5bxzTHJtiGOPP371uhTV9ohXpTdvYcm0
	RRiF0FCWFCRLcGV4YB5j0kZ0AfIozxuK0uru8syeo1lPPdernzZjezE/UtoJz0SkkOgaveqJaX5
	36YUXn1MOajN2oON1glr8Z3Dh1RqSc5Aob8QlB4FKf89t6jMpkt8EMPPmUn1y7woPrD5lAKuspN
	luGCPqpUmGwBqPJ0ut1yEp9PCIsTsTJuytrosuv3d3gFeq2PowMqdMF0pNHU
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr17039494f8f.5.1795509729871;
        Tue, 24 Nov 2026 00:42:09 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm27622547f8f.31.2026.11.24.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:42:09 -0800 (PST)
Message-ID: <90e0bb95-6751-4ebb-8ee1-f5e97e811621@blackwall.org>
Date: Tue, 24 Nov 2026 10:42:08 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/1] bonding: keep non-Ethernet slaves out of
 802.3ad bonds
Content-Language: en-US, bg
To: Kyuwon Cho <kyuwoncho18@gmail.com>, netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Hangbin Liu <hangbin.liu@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <179549697473.218888.8044828119056769556@gmail.com>
 <179549697473.218888.6814133305133689781@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <179549697473.218888.6814133305133689781@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 07:13, Kyuwon Cho wrote:
> bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
> 802.3ad bond with dev_mc_add(), which copies the slave's addr_len bytes.
> A slave with a 16-byte address, such as an ip6tnl device, makes it read
> past the array:
> 
>    BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>    Read of size 16 at addr ffffffff878a2940 by task test/114
>    Call Trace:
>     <TASK>
>     __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>     dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
>     bond_open (drivers/net/bonding/bond_main.c:4405)
>     __dev_open (net/core/dev.c:1762)
>     __dev_change_flags (net/core/dev.c:10022)
>     netif_change_flags (net/core/dev.c:10087)
>     do_setlink.isra.0 (net/core/rtnetlink.c:3294)
>     rtnl_setlink (net/core/rtnetlink.c:3633)
> 
> Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
> devices") rejects such a slave only when enslaving it changes the
> bond's type. A bond keeps the type of its last slave after that slave
> is released, so a bond that once had an ARPHRD_TUNNEL6 slave can be set
> to 802.3ad and take another TUNNEL6 device. A slave that is itself a
> bond can also change its type after it was enslaved, when a
> non-Ethernet device is enslaved to it.
> 
> Check that an 802.3ad slave is an Ethernet device before the type
> handling, for every slave, and refuse NETDEV_PRE_TYPE_CHANGE for a
> slave of an 802.3ad bond, as team does for its ports. Other modes still
> allow the type change, as bond-eth-type-change.sh expects.
> 
> Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
> Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---

LGTM,
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

