Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097305;
	b=zFddrRzHncNexSPLqHiReM+JRb4s58sTKvP+Nk2MskAsu82sG4Q4KNJ2OWtQDTKLUpVG
	 b2yZGSvgCAV7RCB/cg/qH7LPJ0nv0DjK/Z4U1UE8Ox6+LF6wEsl0/zeHycKH9+e1gNaLg
	 p3robUp+HOvPDZARzx1Z3dDH9ScP0GbXEnLfPyKJu/cR3STr3IMkGpCDSnxBM0o2rNKX/
	 QSt2NipOAQTfWjIt+rPkydo7rYQJV0hvuD+MV7jH2woiZ50cBgjtT0brS9QBcP0ZMs2jn
	 pgHeRGrjLlLJ+c0zND/GV6AZNC0ItA2bDn0uwsWTYu3oE70Xze18vkMO3TSEGnCsxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097305;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
	b=GNuDwZWCesgjW9a17voCfam5mHn2PFwnEF7mi8B6ywiAQ+FfK7uQmX8TIVFCHPaqJehx
	 PFvAIjfEcSj0WxF8bkUvoBE4z/izwXn5zqy/1wRgPCRrL9TRxAssDi5JQcVN6B+EKYfjw
	 zdvGU6kI4hMr74CkAN4OetmfgnxWe5VG7W7D12avkNzZlpvmZ+fyiH3uMMP7atR+F+2Yn
	 +i9SJ07mWGmzqu15H23IB3cX8Ucr6gAx9QW+vBVBXWh4xtc65oJZab3/rkzfxKQNWJhBz
	 3dmx5LBNBUYq7MRCLyQ1VKEDmbLFX7bEl+vy/5PSx9DojvApA2aXDjriSnhvPjwHK+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iP84R5qr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FVrmCZ+R;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5185B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5185B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iP84R5qr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FVrmCZ+R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795097304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
	b=iP84R5qrwGs00hOISlIN1aClQCt4bOGn+n6X4snfSfYkdFvAN+L4dhrpVk4q6B99RW8nz3
	m2KhVoAMyyoqQi1PytV+CrLW3d3qRfTMyxOzxc/D/3OvQsATTUzDbOek9ByOCf+0tt/mQC
	h2lWZk4EoBAbDiayuL5C274qro2fbp8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-vYJVoSO1MEiQDIGVazET8A-1; Thu, 19 Nov 2026 09:08:22 -0500
X-MC-Unique: vYJVoSO1MEiQDIGVazET8A-1
X-Mimecast-MFC-AGG-ID: vYJVoSO1MEiQDIGVazET8A_1795097301
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490d2ac331bso2198101f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795097301; x=1795702101; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
        b=FVrmCZ+R8Xyvcb6Fo+2dfgCa/cUkJC5dGQKzNLYnVgGMQE87/INMBDqGq+18jMZbH3
         XGYBdgc9+reQF9p5GMWM4leZXqVA3wzKJt3TLUYieAwgWmGhAjLDuxXuDSub02mDJQaX
         qZso4obGSOr1SfaAd2lgXCkllGFyVlY/y2bYaxb/968OK3AqsbqDY/xtrctb5ZclCKLx
         p913xoapLmjk2161ii5pS7EhVtWFUvwvoldUR5hmcRPufYl7rDeV0XUEdavPBBnSw0Hg
         4KoeRPcIHW1A7f4FxdR9htPtXC9AfcU6RiNaz2emqzaUwfT4DbVvNJag4+1nac+MPU3m
         kFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097301; x=1795702101;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
        b=MWYPcmJy4jO9wy4iaZDpp+9e1eOq41F0zLba8KMcy44qs3jNAk2/BoVAg3sbPYE1/B
         ogxF/nac4IT2W9DHEyQ6wLpe6W01Ey5d5lNItkfdWOe0Z37EEsbjfajlP0TOu1LSuMCW
         BgINTHHaJTOWlyZAbJ6/AXfR9nQHnwx1ZCcuQA5R8KmbZWhHnS7FR6HJHsK14G1JwPHm
         p/FIWQHdF+iTC9X8082YUYl1XoYlmYGugLYvs0uRmrYcKLyvQQpz4RTs+XrlFN/SJl4b
         SPGLMQI2f8CASfO5/GmB/PS8f8ji57WV4EQcyxniiNZABEeQE2/G/Yzbn4cIY1b/qANI
         VfSw==
X-Forwarded-Encrypted: i=1; AL+hErFNQXTQfxSi9Qb7aWRREWWXFYffiCOzIE+Vxmi2zhH8Z08OQAD6fPYG+bCXcWmOdaofKtieNgseoQbskwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QX8v1HiSah7+gNCwl44crYS1RFdjwvouL8Qx7wjfefG9KbJ+m
	aoSjoLixDP0cccw+S9E6UoAPPs+eOmlpgtydN/MVT74Ja1Jud2dJ6VASzelxeJph8puhhOfalNG
	YBESsByhSniSH4EgpE4LDs+qFHyxwajxE8xuigaLXjZvRjvgQ8rEGrZY4D0GiG8Y+6NkNU5fdhB
	gdFjL3mm7zHHPptUpbVhDrbaGTBgZRRegGPTXI30HE9XaTom6G
X-Gm-Gg: AZFdTZfS2TrZJjYyOoT0v/h1vu11dMMpDmojKfXmFCSdp7VUZK6DowK54unucZ3ByZ/
	e/Vn8SBxBzaGHXpNapZVswp9taZS/dt6HhNjx0lSCTxnA1CXihucYoK5JJK8+tyNmGCwmc+Zt6d
	w1jkmDDJdxWty3jns17F+Aqqg2gK8T1oJNUqSeTikA8itSF84qAptaJOAxMZjoppi/ofPrrbAlT
	S4EuiNy0ZaaFNgCsFxL7c8QSh7nqx0m2BcPWzCl8EOHTiB7WxnH01vPLwhChQfd6FWDcv4pyPSx
	Jc/Ge46YUE52pnjcoKTwl4Rfs6+1g7dS7161Z8OWd1DdCSkge1d+43nOpKtnlAIXwsbnaz89H0Z
	b+VwF5dn1bQfZ9AihKwoi580poN50Q78lURou5D+V3+I1WcReLWCPJzkXiL+u1+z790BIQNOEsi
	7ud7E=
X-Received: by 2002:a5d:5f45:0:b0:4a7:a8f:527a with SMTP id ffacd0b85a97d-4a70a8f55cfmr11702286f8f.7.1795097301501;
        Thu, 19 Nov 2026 06:08:21 -0800 (PST)
X-Received: by 2002:a5d:5f45:0:b0:4a7:a8f:527a with SMTP id ffacd0b85a97d-4a70a8f55cfmr11702222f8f.7.1795097301033;
        Thu, 19 Nov 2026 06:08:21 -0800 (PST)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([144.121.52.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5490e32asm31634f8f.22.2026.11.19.06.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:08:20 -0800 (PST)
From: Aaron Conole <aconole@redhat.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Eelco Chaudron <echaudro@redhat.com>,  Ilya Maximets
 <i.maximets@ovn.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  netdev@vger.kernel.org,  dev@openvswitch.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: openvswitch: don't WARN on a non-IP packet
 that needs fragmenting
In-Reply-To: <179502509517.2983267.1652158471891914135@gmail.com> (Kyuwon
	Cho's message of "Wed, 18 Nov 2026 10:06:09 -0800 (PST)")
References: <179492834266.3639154.14679778183890331729@gmail.com>
	<f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
	<179502509517.2983267.1652158471891914135@gmail.com>
Date: Thu, 19 Nov 2026 09:08:17 -0500
Message-ID: <f7twlq8hq26.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Kyuwon Cho <kyuwoncho18@gmail.com> writes:

> ovs_fragment() only handles IPv4 and IPv6 and drops any other packet
> with a WARN_ONCE(). Since OVS_PACKET_CMD_EXECUTE takes the MRU from
> userspace, any ethertype can get there, e.g. an MPLS packet executed by
> an unprivileged user in its own user and network namespace:
>
>   Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
>   WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
>   Call Trace:
>    do_execute_actions+0x580e/0x7380
>    ovs_execute_actions+0xd3/0x3e0
>    ovs_packet_cmd_execute+0xc21/0x13c0
>
> The packet is dropped either way, so use a rate-limited warning instead.
>
> Fixes: 7f8a436eaa2c ("openvswitch: Add conntrack action")
> Closes: https://lore.kernel.org/netdev/179492834266.3639154.14679778183890331729@gmail.com/
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
> Aaron, here is the patch, with the rate-limited warning you suggested.
> It was written with LLM assistance; we reviewed and tested it. With it
> applied on net, the reproducer from the report prints the message
> instead of warning.

Thanks - it makes sense to me.  We could consider pr_warn_once instead
if preserving the 'only log once' semantic is important.  I guess the
intent here was to let developers know that there was a really
misbehaving ovs-vswitchd process going on.  Given it can be triggered by
an arbitrary user on many distributions, it would hide that - so I think
net_warn_ratelimited makes sense to call instead.

As a follow on, it's worth consideration to change the mru check to only
submit packets that can be handled.  That's a bigger lift since we might
want to change that action to preserve the drop reason
(OVS_DROP_FRAG_INVALID_PROTO) when we get the 'asked to fragment a
packet that does not make sense'.  Alternatively, we could drop it
entirely and just take the PKT_TOO_BIG drop path.  After all, we know we
can't fragment it, and that the link won't forward it.  For now,

Reviewed-by: Aaron Conole <aconole@redhat.com>

>  net/openvswitch/actions.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
> index 12e339cbf791..bf3f2b328b53 100644
> --- a/net/openvswitch/actions.c
> +++ b/net/openvswitch/actions.c
> @@ -828,9 +828,9 @@ static void ovs_fragment(struct net *net, struct vport *vport,
>  		ip6_fragment(net, skb->sk, skb, ovs_vport_output);
>  		refdst_drop(orig_dst);
>  	} else {
> -		WARN_ONCE(1, "Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.",
> -			  ovs_vport_name(vport), ntohs(key->eth.type), mru,
> -			  vport->dev->mtu);
> +		net_warn_ratelimited("Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.\n",
> +				     ovs_vport_name(vport), ntohs(key->eth.type),
> +				     mru, vport->dev->mtu);
>  		reason = OVS_DROP_FRAG_INVALID_PROTO;
>  		goto err;
>  	}

