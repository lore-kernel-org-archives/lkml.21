Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795864598;
	b=SFHMVyREdElNodXP0tkdLRz70xUcPtzL/cb0Y3kcbYZ8fEZgmOIPoscAgdC/A9AQnXyI
	 yN9YBz0ZMbeVrEr2ElCNgZOIStbIhaZMmsDkhqe5LDfjnqeqi3FI2u/eSdHFm3DlQYh3Y
	 3onohwcA3OGSwfFgebmKy5QKnRdZZSxbgDHfXssKWSbFdh6bdeHnxeQZIcPsDHrtn5FVZ
	 mCfe43U2yX9OhH9bFUOJcsJwQmRSe/+bm+EDLGAw7TV7OMNAld6psx2ksLwmlE6QLou6o
	 Cg/UWY2q7VruiK09Kvzt8JM96KLExqhFCKbj34j3HIHn7ocPXVa2B3ocX6CdelGc8hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795864598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=T8XdOzjKahmMpUz1ofbmiwjYhp8+CGhzvAVMXv3NGSU=;
	b=CgzHYrF2Fd/vKwxMUZxVVbRqF1kLv9h1D2T/VZnW7iQacGzQgH6mT4522XPfcsgfzmPl
	 VAon3knZVq+myCi3trU2MwbALBOc70kqaGRg/VxLdaCWDm234Tcx18oMG2GCfqypCgdC/
	 SlyBv9CO6UcbOd/DXfXL9jK/xKIA8wQq1+OyvuX2B/9QFKq/Li1uumWvz+BJuumjVjAm0
	 RI4RREc2eJukeyl0JBiKA869s9MswHsEzGbQZ1Aeq9IP0OdVq3dhbkd9mRCujacggZJV5
	 k+aDEegPyuMrtQXa3MwoOR1yhfynrZF4G8+suttKHeMF9nuweTC0/eIlCri78SoKgKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=orSXd3k5;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CE606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=orSXd3k5
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso6809335a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795864597; x=1796469397; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8XdOzjKahmMpUz1ofbmiwjYhp8+CGhzvAVMXv3NGSU=;
        b=orSXd3k5fGHivfquVZ8qd0Pp4pCJ96fkmt3H0WhMevX7m+8btrRgupliyGGKYf+Uyq
         cai/tm1nrQ4C/syOvrz+h9x1AX47/fNYpeUUC9dhlwMlIPbEF7LSffJ24vgRaZRlPAMh
         Py1CVZhpyOg2s7+sl96XPvtdFJu2QFIJQL0RYsn4LuYKW4RCqP5/MhuSca2CX5V2RT+b
         3Pr06+7bs/fTi6FsF8T/o8NEf8q55PB6ZHWsfREJ6FkchTHQxTjFgj4YvEIzi8QMl4cS
         wY88XZ+H9OlZ3/ZKLHy7SWTXfGkdIVe9AWwAcUYd1BY6YLSzhLrb6GStqElBk9bs/M2Q
         nj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795864597; x=1796469397;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8XdOzjKahmMpUz1ofbmiwjYhp8+CGhzvAVMXv3NGSU=;
        b=x1MDEQVgMSZ4DLbRILb+THhDw9bcvxItOqRaOBVi1uFrOmQP2oZXqKbP+l8oWP5axi
         YX0gR8Vjyu0z8O/ln+hzpllAaasEuMz9P58ob5RjEU/56T2uY75LGg8e5ltbi6KMVBOF
         6IY3Kf/L6hZt3OGOBSGPGQv415TVpoKHg45Ipxbis6U5kUaZW7s/pREENxdn8YTK0xEL
         m95qb6uKcvPnIXJwahp7UMG8gb4FGIeZhW8ewRD/f40Z2OEIb0GYxbmA7BIwxEidbM2v
         /84fAxnm0Ei6S6NZyETgWCFB6GXaNPLnuw3+xcdSA5tSMEWef9blal+4y86XDxfJW1EM
         XNgQ==
X-Forwarded-Encrypted: i=1; AL+hErEBQIiQ6iCcZLL6wirnTJnel3MlWmv6ZPBQHavVqdUmq3fvqTCc+A+lI8ISPORnk170gfOwYu3Ou4KD6FQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4ek9MXamRxF8o5D696kizfSssKxm8prSfsSXvnT9bH5InqZ1c
	kVFc9fw9NdoVmxlSUjWSFK06deMbt3g+MIcRyKM9fZGniJBSrKdjYtW68w7N5oUveQwqfaf8Pzq
	EQWeCDg==
X-Received: from pjbgb22.prod.google.com ([2002:a17:90b:616:b0:3b3:c91b:f23f])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5
 with SMTP id 98e67ed59e1d1-3b41c988620mr24472096a91.48.1795864596862; Sat, 28
 Nov 2026 03:16:36 -0800 (PST)
Date: Sat, 28 Nov 2026 11:16:36 +0000
In-Reply-To: <20261122-reuseport-lock-filter-v1-1-a3e5324c8d55@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122-reuseport-lock-filter-v1-1-a3e5324c8d55@gmail.com>
Message-ID: <awq4A4oFnegEB9rO@google.com>
Subject: Re: [PATCH net] net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Suyuan Wang <shyckless@gmail.com>
Cc: pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, willemb@google.com, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, martin.lau@linux.dev, linux-kernel@vger.kernel.org, 
	horms@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, 22 Nov 2026 08:17:26 +0000, Suyuan Wang wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> SO_LOCK_FILTER lets a process lock the filters on a socket before
> handing it to a less privileged one. Once it is set, the existing attach
> and detach paths reject changes to the socket's BPF filters with -EPERM,
> but SO_DETACH_REUSEPORT_BPF does not check SOCK_FILTER_LOCKED. So an
> unprivileged process that receives a locked socket can still remove the
> reuseport program, which then changes how packets and connections are
> spread over the whole reuseport group.
> 
> Return -EPERM from reuseport_detach_prog() when the filter is locked,
> like sk_detach_filter() does.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 99f3a064bc2e ("bpf: net: Add SO_DETACH_REUSEPORT_BPF")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
