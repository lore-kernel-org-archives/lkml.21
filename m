Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417333;
	b=YzQfcCsaKdXVcSvHErZkfYF4Gp0TEOOu9qAF7RHtOc0Ca1JUcp69hoE4L1VJ0BZcCZbo
	 4FTKJqPgKW2EZgJcmkPH0a+HiEviKBc7YgNWoWfz8sA9H+Nd/y8sn43i58TWHe9ep+Go0
	 A2uKvgP22qwSSkdbFRMMDOzYxlWak21lQPXR7o4OAqsvSxwDkuMBZQ2i+sFgHSJXHqo82
	 mic/Jp0ryQd396taCmNgjipz/BxFe//rD4ZDH0eniUX2ojdfB8wCDMoMy/gcNvQyTp1K0
	 nxr0IMMRKKHTzk/5HYwDjGhEv2/VwY5HKKqa2ptoPy2P2YRd2Zhz72JZIirZAcXIqPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417333;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y7v+P8bJqEof0yPy+kUZoCNH441jx4UihzMQ7Aabsd8=;
	b=Z8j8GedG6jjUTa0/5Ly4KFFjBTpnAif1PFIbJTpdUR4bLpioB9Tt1e21PUMaaSKXg9qz
	 3igsrdNKujzvtlDbZc0vq44VyLfkIU2w8EaXE8BSnuvM8yk4ipucENNU8ilroHUOSce88
	 1pgFYvgcousIyqIZSgh7kmW9FGIs3bG6hDkMVbz6fe7Hv8BiEwPsEDK6geSPUSDZuMuxQ
	 4aQjsSayVHnA5t5rfpiLAsv/vNP+uF3seTgJpPPfXj/rkhI+ebm0HWhOQcUoAQxkXehjq
	 18RBIbN1me0//f/3G50r8he9D/88hSyh1Mcjq62yslfOcoYolDc447rEvFd1XZEdBdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iAOiKLio;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A56D606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A56D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iAOiKLio
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y7v+P8bJqEof0yPy+kUZoCNH441jx4UihzMQ7Aabsd8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795417330; v=1; x=1796022130;
 b=iAOiKLioPKAj1vFLeKvMRq1XnMFLpAkNrLGOmAzzPk9a4s1uv61Oezn+Cx6rPz9njZn9OuBj
 /C9QXg4Y1neQ6XoUUfB1yrUqrggSCu8Jbo9skvh5MZeZIlQBbRMjOH4JuTYK9vXVzNOV+8BE9t+
 bDYMLA1DV7mIM4IkZAyZzDgk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9deeaf9e38cf6456;
	Mon, 23 Nov 2026 07:02:10 +0000
X-Mizu-Trace-ID: 9deeaf9e38cf6456
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ralf Lici <ralf@mandelbit.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/4] net: make moving a device to another netns cheaper
Date: Mon, 23 Nov 2026 02:02:01 -0500
Message-ID: <20261123070201.4117929-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 06:21:18PM -0500, Qiliang Yuan wrote:
> Moving a device to another netns waits in rcu_barrier() with RTNL held.
[...]

Please drop this series, I'm not going to post a v6.

The barrier also waits for the RCU callbacks that release routes cached
through the device, and some users never check their route again before
sending. With v5, a UDP datagram corked on a route through the device
goes out through it after the move. Retiring the cached routes when the
device goes down doesn't close this either: a lookup that picked the
nexthop before NETDEV_DOWN can cache the route after the flush, and
that route is again only released by the callbacks. With the lookup
delayed across NETDEV_DOWN and the callbacks delayed, the corked
datagram went out through the moved device in 2/10 trials on a plain
IPv4 route and 9/10 through a nexthop object, and in none on net-next.
Closing that window would take a check after every route cache
insertion, which isn't worth it for this.

The init_net blackhole that came up in v5 3/4 is an existing bug and I
sent a fix for it to net [1].

Thanks to Ralf for the reviews.

[1] https://lore.kernel.org/r/20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev

Thanks,
Qiliang
