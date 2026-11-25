Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641315;
	b=AFrYLbWF1VtZFl0v9IqtXVnXYNTc94ZfQ1tYL2Ms/uQiHer+a96dk8e3we9Mb4fva2EB
	 mWpVKSiynoYV5Cj3q7erbwOUmcx+pxv77oXaI2V5YaY2v/BwjUAceJuAkPJHKjQXK0R/V
	 jNjzkkRxjm2XtoP2dI8Hg/RddmJY4AnKiS3rDzN0hEo/f1b9rmWwTdme3y1aCopYxIhEi
	 cvx/HCajIwO0s6nv6KriS9ZQpOn+vpiBoRhBjC+4WxN6jvOJWcGgBkcPgDcFCBaFw7nAN
	 RWVr96jpnWAcfNhYTGJk/ge2WBByCUPOtsMLWRwCm98VszAY/zLvhPybAa8JMTmxQCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
	b=jaZvbwIUOGcq94EU2dCpEG2TO7JwBsCMVJChDyhNUZBITHByw7asOGv54Yro4ghwpvnx
	 aDk8rhFSD+6GLxllDmeguXQf60jD5ObHld4djjBLW12rO6rZj/d9cm0O/eMxvNX3w/Jqp
	 KMJ+bMS8veqfUIjOZRC81u7E7FDP0txc9HOyp55W0T4YJ/u9yCVk+h01RZ4aPt0nEnKLb
	 3H0WWzdhuUCWaMfgkKu/0AvJvBwSzywEz9VYlBbSSPyAT2VL38PvEGpLcnT8aFFbfm+QF
	 mStPXwIi/BWeyZavM1kTj69FAhgY7soofnTb355HKpBU+NpseaPqBzwZb9C7LukAQyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ER+JvcqV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE00606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE00606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ER+JvcqV
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b30cbfa628so47277857b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641314; cv=none;
        d=google.com; s=arc-20260327;
        b=S5FqGyNOvzNIyIsi3zTjFklLsD71OD7VtaDpqo8h89fDSrYqGoVTuGQJO2SXtnmYST
         nkafM8r4eanFsXagKUlmlUdezvt4s9TPjd+c4V9nYNnLmVYrt3jaHWTYlf2tzZNjULn4
         Bw0a4yhBq1qZbhpVrZLxZ2dNUK7O9SSuVJQeAGOBEGK/kgZlsSbLMaxIqjd6LCxhHir9
         pqQxXrgWYbP0IpKQLzH9yfEs7wejh6APzAEBgsXHqqSY1slfrd/lHLeAkx4OmmERv30p
         RG5ED5LtAxFNz9lA8p1PCOAJluSEY37qJykaD+j5gU1yNSDq3sa0EU7BgZMyrWiHB+Gk
         iMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        fh=sfN374QDwS7A8GW21BMR4DOqUeZR8FuUQ4hJPLQnckA=;
        b=sOKZnuUxXeX1t3u3DORj/vSH54KEF2l4t3TM6wnG7ppHBSoArD9AcfLIYaFCO789/m
         ixiyuMenpGXxdN4AS3N8mixlpWFRqDIgoxrigypLxU277twuYqvPQPGuPRSU9mbhufLf
         9IwfVgR2Div65oLYim9F6RlZDv+gol/BSYLLWTuiCcoiKhoPpGtDp5lPH/Y6s83ERo+h
         WrPmYQnSeP0wXeOd1XaiScHPb93/G0gAOPR9eSBjWB4H/ki7qChp/V3qpBVXxEZqY1XZ
         PYv/VBVWdtkLmHLePt+/u95ApQSnRM/MqbOx7m7sobnWvL00wA+yFmbKaQ0TQtCXQ7W6
         SkqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641314; x=1796246114; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=ER+JvcqVEjyZlK3NmjCtntTnLHEzjAYxn+w8sk/eX3n0Kb4GdOkcO04HsCULu0u/3N
         TRTpp9G+VilVcbcYgN6AOWluhjfIuocFoCO9W9+ReXPWUpHi+Qcq9PMBYMTxG/bUGzce
         1G7fZEiPsph+72eYtFEpQQryC6P4n5RhnApH+h5+js1lRaaXGWoVfqxemaYhlk2xRg8x
         ISWjkgn0RLVu7rF5YPqXWNOi8GxvyzYLV+eaOcqW6eWOBn7gtgBmdOH/CtNa1yP70HHr
         BOMJmeiBS7fW+nKYxcPsMDA8TvlBOR+GvaDHnzFF63kulv2U5c+Yaa1E/s4fwNIFmWvY
         na/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641314; x=1796246114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=xmS90oIl3A4c7XtjmWBTrPfz0LrmFc+fQZx9y4p9bdwuR1dLzYEHYd9BLSsnIDk9xC
         eNbHQ/LXRvhX/ib9WbFy500TrtRv8E4FyApbRFAfScVgXSyOB/nIMyZl2o79O6g5RaNq
         W04qqUg8JhgJHjbvoq3yjyDFD8PaYTygJv8+D8Z2JUkNhx5D603eTNU5J66f4pilbjGK
         36ZElLGDFUOvtmmohlZNGoXV8fmz0IplTlcxRL5tUFvd65Hr21E+VlVLggZi3ncTq6/M
         KZ3s6zNv3DwMe7Pno41QbGy8gJ61sB3jWvxaxLsgKm9Ng8pO2ALu8VfaXZhFn8Ec2+mz
         EMCg==
X-Forwarded-Encrypted: i=1; AL+hErHtI4MfieiwvZEqyNnYxMr2fAuJsDKDCmoVAGwJ43PpLLhsZWRIunZfiZeFf3cBeAisUb2YLuLiWZooiRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ckq7nFu9/NQ7ARpZFcpBeZ2GFJbZvPJcqhW1T6v6XqFyOM3zC
	U5fBV+0pu4b2sZnZcujrYpazhVk8PlQbibjN5n3LuWBsmthQiSYkb8kN4GheZJajIdyvWNhWcUt
	hRCBfCkxMUcf05K67ZjnZBzd5XQHmoz/9iUW1VDep4w==
X-Gm-Gg: AZFdTZcTh0ByKEJhe0Aj0Ri5jPDtiJ6IUMtfNJzJsp4BcHJ3oOLyjMPz1j5NGBPk4ju
	7gW5Jg3TXa1f3hHKcx8SVs3UVDNrbb63MeO+6mFYyBa/RSssrI0lOWgaJjs2gqISy4Eb7ZB6zSv
	M8fSvlQBCUWS6VZaljE/jEvvzaK2q/n/i/91fVoolOUiyegfvvK7Vo7AsMZT3Xc711MqAhIk4R+
	Vou9qqTiQ90tLGIMOvk9ZMO80lpRLp7KHUjh5nqY8q4FR5+Hk3mMks7/ZPQHfsljQmEq2NCD0Ts
	77Jj0brTwjxc2SeYe/L2CeYEZsJ3E8+EhVqJxCE8I9S/d1Ni/UyWh9DubxqZ6b/d+3DXNBlOjEJ
	VsCcdYrW8WnHZp5FdOanHvW/4A1i9LnlxNbtn0B1A69vrZbspK2M/JG1CAiy+FIdzU7gZ
X-Received: by 2002:a05:690c:4d41:b0:8b3:527b:d18f with SMTP id
 00721157ae682-8b520456090mr78329377b3.11.1795641313439; Wed, 25 Nov 2026
 13:15:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-1-ccc2a3a6cd09@nexthop.ai> <179556272605.3135.9300919500524716345@kernel.org>
In-Reply-To: <179556272605.3135.9300919500524716345@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:15:02 -0700
X-Gm-Features: Aa3M54pDddf1z2GThzIkP6Ya0YrZfZnwcPcCDFy0GPN_7KFQAEfTKsiiMCChi8o
Message-ID: <CAAv61uTjxQD6WUU-ZH1YG6Q_rOzPD5MKtAJvRQnmpm-nqFAs1g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. v2 addresses these as follows.

> [Medium] fix the lookup instead of adding a sysctl

I kept the sysctl. With both listeners present, today's result is
stable but depends on creation order and address family. Making the
VRF-bound listener always win would change that for every
tcp_l3mdev_accept user and may break some existing clients,
so v2 keeps the default and makes the new behavior user configurable
per port.

That said, I can change the default lookup instead if maintainers prefer that.

The per-port scope is intended: on a listed port, a VRF with no
listener of its own refuses the connection instead of falling back to
the unbound listener.

The sk_incoming_cpu tie does not apply to listed ports: the unbound
socket returns -1 before any score is added.

> [Medium] the docs say more than the code does

Fixed. The docs now say that only listener lookup changes, and that
established lookup and bind() conflict checks still follow
tcp_l3mdev_accept.

> [Low] a listener bound to the receiving device also matches

Fixed in the docs.

> [Low] CONFIG_NET_L3_MASTER_DEV

Fixed. The sysctl, field and bitmap now exist only with
CONFIG_NET_L3_MASTER_DEV, next to tcp_l3mdev_accept.

> [Low] net_cachelines documentation

Fixed.

> [Low] bitmap updates are not atomic

This is the same handler and behavior as ip_local_reserved_ports, and
it only matters for a single write longer than a page. I left it as
is.
