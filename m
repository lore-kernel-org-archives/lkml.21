Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286355;
	b=VsI7PDiV4HNYYNlux00cGI2YwfP93gUUL/u3cD8F8hQPCxkRTLvDz4vKm6adHVaqYk0+
	 JcLGLletX6Xi3fARjUZkaU5au83KpLqG1EgCyWhEiFtw8nvBpUsNtPMPHYgb2FcxhVC73
	 Pk0LHP8ljSlYZww1yO35vAJLVmjcFqpB7Z8VpvIycLoKRaHPoKVUj03lrBQvNi8g1rSnx
	 9dht89wx0Q4aYlKVgIKiW3pAl83ZohUHeB44PXPSG4ssrA1n2wbApKYUzQoao6+iDkLbv
	 nLxXrE/csflKJ36+YsgxxwQJm3H3g0fkMp7uUztR36iyf/h3r52XbBq/Ws9P1y4LunA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=B+C2/33K4kduexdkENaQSrBZ5xc/12xNlj0pd3fSUlo=;
	b=FjYJKbXMqj+PDldKnEuHSWK7HXoWv7VIk9aEFgkF5OLjGhqGd5R2EWHpBbklUVWZ//td
	 Kqj3Oz4Ga2bVOZ/93ZHC4Oa4SFxmZqIKaCPAZuOdvO4VVloJhOONP5n7RzkQ3vk9fpnDi
	 uPqRwufBXy+ZGQiPx3/qn4n91NqksLqzsKDf+ezPklmSTEhrMI2jFggYMTfeEW+P4tvFd
	 4GRQyhYQrQgglZMaszv30yBxj30jw5IyXE85idC/PK9vI7gMLMumUX1ABkxanT9Hjm6Lp
	 jL2GfiOq+xcPqm9ueqWReNFIjp9adTHA4Sjeltpl3Wc83wxM9K5Ux8zJGhdlII8UZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N4LRxPnN;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE7606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FDE7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N4LRxPnN
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0592d4539so2513875b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286353; x=1795891153; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+C2/33K4kduexdkENaQSrBZ5xc/12xNlj0pd3fSUlo=;
        b=N4LRxPnNO1YjitxvDLP5/5kIqInUyAb2PxwB47pUzyklLYXgDRLm+hBGOagI9wIIHu
         zqGxOyfeJMlgyeICmsIL5liJN+MwmXywg7S1NQL94dcQresjALSGWYMSxAB+agNmQic+
         CIG5lRe9aZBEsF6MZKhIi22V+Bd78oiJBpcwsVJLmRbfv1ulzKuLuen4EPSlL9XpZz8E
         aw9FldXk7Su1f172F9G+Lz6zw4K7JFXDMOpv6euElqN69npigs8dtlapsNhkItca4PtU
         Yot9+fi3GxfeKm6XTWv4sK6rrRHpHhcvMEEa8na6M8UbGqns0ypFEnf30gskc6/yTBxG
         IqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286353; x=1795891153;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+C2/33K4kduexdkENaQSrBZ5xc/12xNlj0pd3fSUlo=;
        b=yJhHpyyYhOwdM5tICn3ifuzik8MKZ/wj5mzCTpXMKt2DhHHsaiIk9xvjro+sofqM7J
         Oj7BO6tndn/tA70mErUZds+rhp3vHDIVWY/DDNCN89UNpJ6FzaEyZwT48w8AIlOc8RdH
         9OkMkDO41BqNESFDSIks23aKA31eNbLoyL4kzU11d7+IBWdu2KjxJokKiJ8a//Fyl7gE
         88KG86N8dUOLaRXuw3dEbQ5gkpLw2N0KtTS7QC2O+Us8fmo0Qh2AVSDaLSIl43NC2UDC
         8bdOepYAiuKIkt1Wwstgqk6mOIW5yCzznGGZ8UQVpyvH+NHGu2FFi5W9K3OABQpTtJJc
         Et8A==
X-Forwarded-Encrypted: i=1; AL+hErHE1UVNXTGqHprX0DGUIjnCmcF16zHg6dGVrCLEaFUsHLXJZccDbsKcLg+wq2bvuuoRKavciMW/x22m+L0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9URvF11eDPGo8tVwItMs5Y7ynsYLKYjgXouRrK/2YH7NpiLPPW
	xoDk98MK4pFNEonVQuzCYGg5mII0gZO94Bpw8rHfGSigyqFS7O87sSl/P1ICkOI6p2LUFFHkk+Q
	mAp+Ipw==
X-Received: from pfdb13.prod.google.com ([2002:a05:6a00:94ed:b0:89f:41ff:99c0])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c3:b0:89e:779b:d0f
 with SMTP id d2e1a72fcca58-8c87ce3165emr7009702b3a.37.1795286353159; Sat, 21
 Nov 2026 10:39:13 -0800 (PST)
Date: Sat, 21 Nov 2026 18:39:12 +0000
In-Reply-To: <20261118101752.1989502-1-bsdhenrymartin@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118101752.1989502-1-bsdhenrymartin@gmail.com>
Message-ID: <awHkoGTQ71NbCeU0@google.com>
Subject: Re: [PATCH net] net: initialize sk_peer_lock in cloned sockets
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 18:17:52 +0800, Henry Martin wrote:
> sock_copy() clones a struct sock with two memcpys that both include
> sk_peer_lock.  sk_clone() re-initializes sk_lock, but nothing resets
> sk_peer_lock, so a clone created while the parent's sk_peer_lock is held
> inherits the lock in the locked state.
> 
> The first getsockopt(SO_PEERCRED) on such a child spins forever in
> queued_spin_lock_slowpath().  spin_lock() disables preemption, so the
> task never schedules and its CPU stops reporting quiescent states; RCU
> grace periods then stop and callers of synchronize_rcu(), such as
> expand_files() from accept(), hang.
> 
> Initialize sk_peer_lock explicitly for the clone.
> 
> This issue was discovered by Tencent CodeBuddy Security.
> 
> Fixes: 35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred accesses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

As Eric mentioned in v1, restricting SO_PEERCRED etc to AF_UNIX
and AF_BLUETOOTH makes more sense.
