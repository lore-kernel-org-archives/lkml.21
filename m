Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023567;
	b=HkyQJNM2xDnJanyBS6Ez5KEMvW0QQfMGhly6DDSDdfcISPyPlPL0dgkcvJHBoG7jKZjR
	 UOxS/4Zbxt6yKcW5OupiRjAxw/wtvEH31pHd7McM5ppKKvtDeWlC6tiM0wmg4h+i6UJIF
	 2kCWDsZ5gFYV3lPXjO6DVZWRzqEGtzifEkYLb8i/UUIcUugWk7l0tyOe5s9bjXgnrPNMB
	 VUp2aN1LA7RZQiZ3gqY9/2GTMz6YfgAwnPkP/scIEcmQuzkP6CVZD5edR3KZLTfaJ+Aff
	 y5TanTotlKJIXLFHSEeIy1SjRs4J4tnFPAeToO/DrFOLzS82GgUrXjgFszfN8jBV3rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023567;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
	b=V8QKaNlOgSnGxDSnPAPJ8p0HtRkJGaupbQHtVeQowhp24/2DwSgaaB1qWuPVKMIxUXn1
	 56TcdArf2tIICEWUjSXJ7KFV5q+ejs7q4yO3OLdjMT4wSq2TAgy4YW1HDKfxnKCvNvqJt
	 yIpVZyLs/PIt/Z3dQB9juEVlV+IZf0VLgmvodnRw4Qrecdmj3KeU7W5Qwe9YOPiSnJi3P
	 btMClTJIi9F/2UQGm8FiQ+u4v+4XotLESKHrep0XSi9PTYfb551+e5TQVVWgAO5Mc4vkj
	 BFNGOxNPrS7f0dE1SzQTbKSw/xIOv2m3lPck8m44GJVAYlyHhRjssBNABuPl4uOPBVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOAs3cxA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DjR7YZZ5;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F222606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F222606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOAs3cxA;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DjR7YZZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795023565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
	b=AOAs3cxAXLgE97nif2cVF0meJzMphmpth92K8JYGwId02tVhxHcJ7QR1GxuK1KG8AZcLxU
	r3lXWzgyecQpH/AipaPqZ+pQeR7QjZB0C+aoDvxdhi7C82Jns37mZ1sVWnxPZ20HoYN4uA
	SVneDjN8kNa4GYPYLT+SPYh1J1IvPQc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-GYPPlPg6OzmEdlkoPkVZ3Q-1; Wed, 18 Nov 2026 12:39:24 -0500
X-MC-Unique: GYPPlPg6OzmEdlkoPkVZ3Q-1
X-Mimecast-MFC-AGG-ID: GYPPlPg6OzmEdlkoPkVZ3Q_1795023563
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso275568f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795023563; x=1795628363; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
        b=DjR7YZZ5tOkUe5dAYVUmNPXvArcFQ4lDnD1pFg2TA3S1LnPWOV8D7LO1e58XX4HYYE
         aVD2CEj740IqTHK08J9WDoIkF5OlUAImtzWzw63FyoOch09wLNrNKLdkloYRt0KYzS0T
         giMqih88irrZwEQ9BNaA/xmSHbk6N6lgI+o2knkrpoC3hwxmaM98PaetgEdCNi4z803g
         r/KHhToFMjK4SaN/zIE46394RwFWZTmQl/YlkLxgqSsCX4pvuiD/fu6UtNn3ML/9LnbP
         U4mbs4fInJhqqqwQga2yglTAsxKJ2sqXJTvFz6Ht3GsWbnQI/bMDjZHJCXNUwiTwPUl3
         NCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023563; x=1795628363;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
        b=mN+G5DiO+GtUPa3cphBoJbwuT9mIl4EwkeWhqBYoBrl1sjqI5vFmIcCZ6lLw3SkcTJ
         l9D1up2+i4TSMddtHSqoi4gqZhXJTBICFBz4c68cUIxK5yZ3h7x1hyZQq+FJKR+LnYEA
         t3XVB4c+Gx30aJ4s/CwNOohwfpspRvQbTRA6Xr3hvYMNhrUDpGdkYxACdnIN3+kixgUD
         uj6etGEtBpq7jNtdvOx4IbOlTz3ZL0fpgIvAG4bHPHRQhWaxQ3v0DbJTmM5+molugNkx
         6BNGsB4Rh9AusVjps2toTpsA7ME9AZEV7m5QyKROI2G+MRU62ni72SHlCzbGomTUI3OK
         cM+A==
X-Forwarded-Encrypted: i=1; AL+hErFkJsabvLE3Jn/kQFUwxxF4Z2g2YFDYZI8ahwqHznPoSQfeSomTu3PDByg9UIfzbnnenTJnZ00pNgSFXN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iRIYklrEnL/9lqiS6RU0lt1GlYNDBrBp/+anGVYuRuxECXFjf
	wkyYvysCtn+RzLzr0nHoksa3mTvuIAef6cPNLuqvBOYFBhCiLzPyJrosbzURgYHiGd7gAxZJ3bw
	9XmsJaR4H8faTfD35SQMXZ52wvoLZlDksfhVlfsVi4TZg2wzAt+4sz4SiHuUSzvRK8Q/y958mjF
	Z4mgNczX1e4bAhB400M0Fj8NnR3QD15InI/i1qhwyguQrgYYbP
X-Gm-Gg: AYBFou1ql6Bdakc5ZlP0OYMGQ5zZG5YOy+uz8mgKmSNObWFGsiSNNon4h1dvpr49A5G
	jrf/s7uOXvFbX8ihacYz3+u/8fKg22JV8ZsLubnscrrhOMxhl1j42kvJM9qJSuUNFAM/39dkcuo
	mu2CYaFEOOpaKsB+zIMlRpDYU1qCyFKegEpolXjI7OLwtYq0YZDnH/BkNxfLqL0ZnxBmb8DK53T
	1qPZgezuU4JZiY7oKZkmEeRtrCUYDsu85xLFJckkbGF0yI7CPFAufsGwut6GDTDE0Wb+AtGlwKO
	+MKwQjDMp7y3kUXLjHCO9w03eYuYM+Bf41ntBIRRfSJYS5KgvfGqk4cgL5Se6/YIzekgTbDq1C4
	Q3d31IgH3pAw8OiSVmXYsz8wgU6JV6tZJ/zppY5D7JNCZbk9T9wj0Pov8HQe4yWda6NhcvrWGuZ
	TYndg=
X-Received: by 2002:a05:600c:4ec7:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb7da3b3e8mr67030115e9.27.1795023562742;
        Wed, 18 Nov 2026 09:39:22 -0800 (PST)
X-Received: by 2002:a05:600c:4ec7:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb7da3b3e8mr67029645e9.27.1795023562258;
        Wed, 18 Nov 2026 09:39:22 -0800 (PST)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.39.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb83264660sm3892105e9.12.2026.11.18.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:39:21 -0800 (PST)
From: Aaron Conole <aconole@redhat.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Eelco Chaudron <echaudro@redhat.com>,  Ilya Maximets
 <i.maximets@ovn.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  netdev@vger.kernel.org,  dev@openvswitch.org,
  linux-kernel@vger.kernel.org
Subject: Re: [BUG] net: openvswitch: WARN_ONCE in ovs_fragment() reachable
 with a user-supplied MRU on a non-IP packet
In-Reply-To: <179492834266.3639154.14679778183890331729@gmail.com> (Kyuwon
	Cho's message of "Tue, 17 Nov 2026 07:12:32 -0800 (PST)")
References: <179492834266.3639154.14679778183890331729@gmail.com>
Date: Wed, 18 Nov 2026 12:39:19 -0500
Message-ID: <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
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

Hi,

Kyuwon Cho <kyuwoncho18@gmail.com> writes:

> Hi Aaron, Eelco, Ilya,
>
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that OVS_PACKET_CMD_EXECUTE
> can trigger the WARN_ONCE() at the end of ovs_fragment(). An unprivileged
> user can do this from its own user and network namespace:
>
>   Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
>   WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
>   CPU: 1 UID: 65534 PID: 106 Comm: test Not tainted 7.4.0-rc3 #1 PREEMPT(lazy) 
>   RIP: 0010:ovs_fragment+0x24e/0x840
>   Call Trace:
>    <TASK>
>    do_execute_actions+0x580e/0x7380
>    ovs_execute_actions+0xd3/0x3e0
>    ovs_packet_cmd_execute+0xc21/0x13c0
>    genl_family_rcv_msg_doit+0x1e0/0x2c0
>    genl_rcv_msg+0x42d/0x6f0
>    netlink_rcv_skb+0x11f/0x350
>    genl_rcv+0x23/0x30
>    netlink_unicast+0x518/0x870
>    netlink_sendmsg+0x849/0xe20
>    __sys_sendto+0x36a/0x3c0
>
> OVS_PACKET_ATTR_MRU is taken from the request as is. In do_output(), a
> packet longer than mru + hard_header_len goes to ovs_fragment() when mru
> is not larger than the port's MTU. ovs_fragment() only handles IPv4 and
> IPv6, and treats any other ethertype as a case that should not happen:
>
> 	} else {
> 		WARN_ONCE(1, "Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.",
> 			  ovs_vport_name(vport), ntohs(key->eth.type), mru,
> 			  vport->dev->mtu);
> 		reason = OVS_DROP_FRAG_INVALID_PROTO;
> 		goto err;
> 	}
>
> With an MRU in the request, any ethertype reaches it; we used MPLS
> (0x8847). The packet is dropped either way, so the effect is the
> warning, which panics a machine with panic_on_warn.
>
> Dropping the packet with a rate-limited message instead of the WARN, as
> fd954cc1919e ("openvswitch: switch from WARN to pr_warn") did for
> ovs_dp_reset_user_features(), or checking the ethertype in do_output()
> before calling ovs_fragment(), should avoid it. We have not tested either
> change.
>
> The reproducer runs as an unprivileged user (uid 65534) that creates a
> user and network namespace, creates a datapath with an internal port,
> and executes one 1434-byte Ethernet frame with ethertype 0x8847,
> OVS_PACKET_ATTR_MRU 500 and an output action to that port. On an x86_64
> QEMU guest with 2 vCPUs and KASAN (gcc 13.3, config attached), it warns
> in every run (7 of 7).
>
> Checked against v7.4-rc3 (aebb72744764); actions.c is the same in
> net-next (6ff4c5942a30). We found no earlier report on syzbot or in a
> web search.
>
> The reproducer (repro.c) and the kernel config are attached.

We can change it, and I think it makes sense.  A ratelimited warn seems
appropriate.

Did the LLM already generate a patch for the issue?  That would helpful.

> Thanks,
> Kyuwon Cho

