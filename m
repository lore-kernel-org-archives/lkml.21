Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473054;
	b=Iaq4c9SKNVkPYS/kDGN9pIi5nLDsr+FCZk/TC6LNETuw9eH9YzDwdFNJqRV5m7oWHxJn
	 r5sI8vh538SbTa/X3gJxMihjGQ+CVHtNCcvvWQ4YvIifFJ70KEgnEd6FInb8O2QrTgIfd
	 wP+VCPOqaJspj9p25lUXnPT+nzIUfxrO6oFAf5ybgZ9Nrc6SvAIVkLUg/sJGIXle4NWY9
	 CINu9NHGkKSTGSqjNzRNVur4rMNVfHPQ0xAG8I4bJu5m4IUn83289+crhD5q3pkE426XD
	 moNlN5Xu+GRIPR1yLrwOpJyOff9m/wuWMywTYZWLX/9a4GG9gbhoZMoeKIUfyjQTmng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=oODydi93NQ+fgEUmV6NqimJSqpMLIfkaExo4urVZ1L8=;
	b=2rdA1MYerRwk3r7h8HigxtgyNMs1KxmkXCudAuH3v2fIiK8ATBMqunuW8gETBLf6KLZ8
	 /n5+xlZVwzI9Z6bcPTFY17lfIIJOZ+LD8C/U0OImGnybwfKyeg8DNwIfUZdLghToAOTUx
	 X7r8AVhoSpvGuPIPQ2q/htvohRBhCW4uk3EOkcNGDz2xiXA00pjwnUlSqHJgwOQfk1Xja
	 0tofnfL+nBPtPLZLyqQraWYxMrFALy+sZWl0Wr9Bmo4KP7ugF4Zofmx172vDqy//S1SrT
	 yIHX9eq+52mp+QSref7wstoMW0QlP+xlJkePc8bmxOl/0cUKrTj0SJRc89cwRFVQh9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=a7MvHckH;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F5606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=a7MvHckH
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db8985419so4847692d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795473053; x=1796077853; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oODydi93NQ+fgEUmV6NqimJSqpMLIfkaExo4urVZ1L8=;
        b=a7MvHckH7GXPRbAhOihzELw8KMPY7uwwnbx3s0SVq4zm++TWoTZOqhwByy8RJUFj2L
         xbdC8dTFtGgOkbhzfRhEe2kAacfozhwN+oB3nAPlJoi8v8eTaNofE2QizrlRsK4vtlxG
         +/whljmInWZSFiyan+Wj94WVK8as1lcGaL6fvNqzI9PZe46iR+RDiockj0TBUfNLkszI
         VRuAZhOsW1m69Ca6n5ANZNHP5n8YO4objinbJ6LS2CZbRhau44cb2hmA9BiyNzOFwvjl
         dpvYhj2rOrzGtGg9VLl4igLpyt5S4GVvs0FxAfuur9GTd1iEiBGScOboYVWYH4PNPHSk
         UzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473053; x=1796077853;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oODydi93NQ+fgEUmV6NqimJSqpMLIfkaExo4urVZ1L8=;
        b=s9krfaRr2dVk2iIm7GkIK3IlueBKv/VkciYL/ZkpobkYQIdg1dCUzFivVEsKFABmXM
         LArDeImBxa45CLKDUx+6oEXJutjBZUjIfamWDwMdwwSLhT19V+rsddCem9mKcbNzf4zY
         3vBZlJ6MSjyDt8owkx1jc5WnP9wDxp3swecdbVYa9XWPOYsC3nP4RS/YaG8IMiAno68E
         AYZY3+6XgeiBIqw4s5/u2cmJG6WZFxPjhDY1yEjiI00UQ8GrIc4Pg1uMjbh4jXmeoDR2
         MGLjKLEWlzBSvLYvhO1mKo2ov+BN28b/llnvZBT7smjbGiE7gqdymKW8Bdru3vYTQa0B
         d+5Q==
X-Forwarded-Encrypted: i=1; AL+hErG/lMaEp1PBI9tgMtye9rkZy/La1uNE8YDAsqF7KBo1BUih8JjXmy65P6gQLe0eow7DSu3SnHF+BR8EI0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MZMlkQiyCVFokg5gYPIboziCagfF3B9/7Xle2oMVQoYPkv4Th
	nrDKtiDUQIe1iw3jkyev9EgJstB0SM6dGZGUIQlbhlJX4NtDXddRt5y6nUl3LZ8PxA==
X-Gm-Gg: AZFdTZdu1A3bVEuE7lDTrJoycopWo9kqbteNlO4lPXOQ+6GC66Q/toEhkcKeY7TIsbv
	8/Poe4ky0my4qcT9gcpBQRM4Q4iPSDymaSofEhF9cxVxrVy9r8jDvsH4RKCDMQvMumY/ACBMku2
	msSwbdERcfuacOWfEr04UEFD/vLKn5vEKE0KJfHWQnDpC5kq/msrsgumRFeU+KAFSUGBw7HLtXY
	A1JhfzDLj4sNLpQJBVAEcXAbsj8Bo279suxVOQX97GxMqr/NP3ogP0/WGTXs0r92QGpBwGh6iYv
	Ca/MQFnYGklqJjWj3sVbMauwVi7z4tBLEj0liqq0vS/u315mEeG66pb/eawblGG5Owx/KddYuYk
	8W35rhIG3B6Ut8SPMPhoKI5ZEL7blS9xMed1pPTjMdKbS9lFRrGzll9uyEfuksLZ0kT9UyRaJ1x
	2ftXO34BF2ivuB5rOuNGB9H7gl//K3DZ0ngrL8lRympQV1O6l8HSNE5Fk2SK18YjZjGr2XYo687
	KXVA/4p7umM1MGAPg2KoQve9WP4m88zdxYE3ScB4lWbI/Kl5XPcCzWS2xYQgBHQmBIh8LEgIrDT
	QVP8O5FAhnZ+lrUM3w3UaMml+xp7pjKRNZGWJCciVGbvRh1DuDltZaRg0Cj/uYl9mmua5Sqg1Ar
	1G9kgZoHYsnEIToL4HTGoXlf4XmX9gwh3m+37LL8FwjTVKiNdEu8=
X-Received: by 2002:a05:690e:4084:b0:67c:2674:ec88 with SMTP id 956f58d0204a3-67df44e46e0mr6456005d50.93.1795473052767;
        Mon, 23 Nov 2026 14:30:52 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a24e91sm116781976d6.43.2026.11.23.14.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:30:52 -0800 (PST)
Date: Mon, 23 Nov 2026 17:30:51 -0500
Message-ID: <cb0b141881f7e5ceb7de8b407bcc691d@paul-moore.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261123_1724/pstg-lib:20261123_1443/pstg-pwork:20261123_1724
From: Paul Moore <paul@paul-moore.com>
To: Stephen Smalley <stephen.smalley.work@gmail.com>, Eduard Orehov <e.orehov@ideco.ru>
Cc: Ondrej Mosnacek <omosnacek@gmail.com>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] selinux: initialize sport/dport in __ad_net_init()
References: <20261123113724.35381-1-e.orehov@ideco.ru>
In-Reply-To: <20261123113724.35381-1-e.orehov@ideco.ru>

On Nov 23, 2026 Stephen Smalley <stephen.smalley.work@gmail.com> wrote:
> 
> Since commit dd51fcd42fd6 ("selinux: introduce and use lsm_ad_net_init*()
> helpers") the struct lsm_network_audit used by the SELinux network hooks
> is no longer zeroed; __ad_net_init() sets only netif, sk and family.
> The addresses are always filled in by selinux_parse_skb(), but sport
> and dport are set by selinux_parse_skb_ipv4()/selinux_parse_skb_ipv6()
> only for TCP, UDP and SCTP. For any other protocol (e.g. a raw
> socket with IPPROTO_IGMP, UDP-Lite) and for non-first fragments they
> are left uninitialized.
> 
> When such a packet hits an AVC denial (e.g. with NetLabel or secmark
> peer labeling enabled), dump_common_audit_data() passes the garbage
> ports to print_ipv4_addr()/print_ipv6_addr(), which leaks up to four
> bytes of kernel stack into the audit log as "src=" / "dest=" and is
> reported by KMSAN:
> 
>   BUG: KMSAN: uninit-value in common_lsm_audit+0x2196/0x2ff0
>    print_ipv6_addr security/lsm_audit.c:178 [inline]
>    dump_common_audit_data security/lsm_audit.c:373 [inline]
>    common_lsm_audit+0x2196/0x2ff0 security/lsm_audit.c:458
>    slow_avc_audit+0x17f/0x1d0 security/selinux/avc.c:773
>    avc_has_perm+0x2d6/0x360 security/selinux/avc.c:1191
>    selinux_inet_sys_rcv_skb+0x116/0x280 security/selinux/hooks.c:5326
>    selinux_socket_sock_rcv_skb+0xaae/0x1270 security/selinux/hooks.c:5408
>    security_sock_rcv_skb+0x79/0x120 security/security.c:4853
>    sk_filter_trim_cap+0x18b/0xa60 net/core/filter.c:151
>    sock_queue_rcv_skb_reason+0x46/0x1a0 net/core/sock.c:522
>    rawv6_rcv+0x1b17/0x1c20 net/ipv6/raw.c:371
>    ...
>   Local variable net created at:
>    selinux_socket_sock_rcv_skb+0x118/0x1270 security/selinux/hooks.c
> 
> Initialize sport and dport in __ad_net_init(). Zeroing only these two
> fields keeps the cost low, which was the point of dd51fcd42fd6.
> 
> Found by Ideco on behalf of Linux Verification Center
> (linuxtesting.org) with Syzkaller.
> 
> Fixes: dd51fcd42fd6 ("selinux: introduce and use lsm_ad_net_init*() helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eduard Orehov <e.orehov@ideco.ru>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
> Tested on a 6.12.114-based kernel with KMSAN: the reproducer (NetLabel
> static default label + raw IPv4/IPv6 socket with protocol 2, and UDP-Lite
> over IPv6) triggers the report on the unpatched kernel and no longer does
> with the fix. Mainline was not booted; the affected code there is
> identical.
> 
>  security/selinux/hooks.c | 2 ++
>  1 file changed, 2 insertions(+)

Merged into selinux/stable-7.4, thanks!

--
paul-moore.com
