Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216445;
	b=YXyAkseNt/G8kZCSxAovVSvaeEntdVtS+yjLaWCJqSjQzz/w/U2uS1XaIo2xh+hbkLXu
	 pZ0wnPZs1TLT/Wcv3bPuIPYDpaFEuKxpUz1djVII9c4pfHla4fzilcR3PXz7NJm1c60OW
	 JULW0A4WyO/v93/C62RiTjsrFu42pYsj1vVGVxluM/FBnt/X19RSQ1tW4FBUU4U0hjYhC
	 g6RGWbcRB8nXUVOGPmtW5HaUHeWqk9EtjvU/V1oENaFY0eqSzKYHQlOGBa0SG8mxRHTpd
	 r6Pt7FL3GNQxE4Ck0H+FtMYY8RyoJ0u2d/J7EJD6PYxgKaNhRdu9lwR4FgQyNbkUfsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216445;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pbzULJXRQ2wCr9lbRVnvc7ssE8ui2PghOhpvECt+S+Q=;
	b=XgvrqhyigyyGTtTp08R17Cby/MdInZsz6C8I9njoXRtes6Gewm9BsxDz6W4lwc//w9V2
	 6/us0mpbDYW3EoSBp4NK+lxZf3XFg952Owi8W1ZpP++3sofo9pJnyuBEdoU2e9Tal0Il2
	 QsmHkPHCW+K6faeSvX9OTgOFAJ7zWFgp87CBab80kMLvaA/aTK3W8n6JwH/SINrqkGFlM
	 MVIf7JG+oN47mLIlF7DRtGFdlJfFPu3CeWTgCuR5xl/EQLLdivraSKG5J7P7HAuWJWQoy
	 GlYiv3aLYziWhbBzix33jHdpyrtPBtLSiK/afpQBpeeex8C+cclEosQQ2Oc2qMaLGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d3DcsOsC;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1D7606A695
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1D7606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d3DcsOsC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pbzULJXRQ2wCr9lbRVnvc7ssE8ui2PghOhpvECt+S+Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795216442; v=1; x=1795821242;
 b=d3DcsOsCTUNgEzkQJDeozoJsEypOyZErLY2SAyZkW//ipSFsc/+IKBqwjoQ57NZLaxCBRzoK
 2qeeM0XIx90k628u8yiLjsT8DwXfzxwR0WkIgExg78sP0MXAgN1pC8hMOzVscNrlnj3x8BEWEQw
 6H6eHumAVMKS1ZQUaHn8fWvA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 625310cc214a2384;
	Fri, 20 Nov 2026 23:14:02 +0000
X-Mizu-Trace-ID: 625310cc214a2384
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Ralf Lici <ralf@mandelbit.com>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	idosch@nvidia.com,
	kuba@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	razor@blackwall.org
Subject: Re: [PATCH net-next v4 2/4] ipv6: take fib6_sernum from a sequence shared by all netns
Date: Fri, 20 Nov 2026 18:13:53 -0500
Message-ID: <20261120231353.4189980-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120175241.289834-1-ralf@mandelbit.com>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev> <20261117-bug-net-netns-move-rcu-barrier-v4-2-43e1ca0aac7f@linux.dev> <20261120175241.289834-1-ralf@mandelbit.com>
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

Hi Ralf,

On Fri, Nov 20, 2026 at 06:52:41PM +0100, Ralf Lici wrote:
> What the atomic_set
> changes is the ordering. It comes after the full barrier of the cmpxchg,
> so nothing orders it before the node stamp in fib6_update_sernum: a
> reader can sample the new fn_sernum while still reading the old
> generation (this one is allowed on arm64).
[...]
> The late store also loses the guarantee that a reader seeing a value
> sees the routing changes published before it.
[...]
> Drawing from the shared sequence but publishing with a cmpxchg on the
> per-netns counter keeps both, at the cost of a wasted draw on
> contention:

Thanks for the careful review. I wrote both cases as litmus tests and
herd7 agrees: the stale generation and the late store of a smaller
value are both reachable with atomic_set() and forbidden once the
value is published with atomic_try_cmpxchg() on the per-netns counter.

> 1/4 has the same pattern for rt_genid, and IPv4 bumps can run
> concurrently too, since xfrm policy insertion does not hold RTNL.

Right. I'll publish with a cmpxchg in both 1/4 and 2/4 in v5, as you
suggested, and Cc you on it.

Thanks,
Qiliang
