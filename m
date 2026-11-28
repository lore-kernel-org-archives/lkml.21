Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795877338;
	b=cRxiIn4lbxk1XqqmFCoQunZy+xdI+JRs5XLjsTqRmVghcRlL7ScvBzyKT+bFtbr2J3Tg
	 nIN/89FFe9n3LeEEB2DxThvZa4lpcrHnkKBQ6s87M0J1fi3m9PVoK86EXw5Wv1nzoSCoO
	 FwOJ4gog7QIifKiUwuyNkrmRWZqzQuRBzRMuLW8On4stYJrXt+1dpym9Lr/m1ibutRU4T
	 8eCqnfqDiT2Gs+s3WzAWgya9GLt3g64okZyDmdhJhwbuuDwBVIZUSTxpM1bSTO5+vzjdT
	 vLqjFPZmEMdg66HbPfXBZtxFQMXumMsZohoeADlMCbvyOHG8fuBKypKTGa4gsr45zpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795877338;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rTHeRwO8yVcE9iIw7hXmHM/QOylhrGQrDsqOfoX4uuI=;
	b=OwpfRbct8xr+Sxt6psob2sT4bZ16uF5xX2xQY8br4SlR8IktTYpeB+e1dkqPC4Fck+iQ
	 2JES5GeBDtYn9HyRwJ7KMhB4Orz2uVkPgFANACb9UBleOhf3SIxXFQjdCkyBi2XJhSUji
	 xmrhEhtbshigVZ7MLL0Fz/k0SIQ+rWRnJnFga8qbbje44OG21Kq9WxWoL+UyJjcpPsfip
	 npPZpiPo2bFnTXSJT1gZGvoY/x1qwbDMbpMWmMTQJiEgHojNnk/ayP9BDZnRw3TPdmQel
	 ffxKBCOIG5YVa9dT3USzxODE++zgnv5NqBPiQ4wAxkTNgH/nJUBys/KnKLrn0iOM2WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=uCeVIxNu;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2473606A31C;
	Sat, 28 Nov 2026 14:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2473606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=uCeVIxNu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795877334; x=1796136534;
	bh=rTHeRwO8yVcE9iIw7hXmHM/QOylhrGQrDsqOfoX4uuI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=uCeVIxNuKDn8dOYWfNzEdjCl9krO/UuiM6Clt5vu8XU8AbygObWHtLDZW5AI4/jC2
	 WzJoziWj3HY6fAhhm8cLMqBOImiNdnNQpuqh9rkLJhBIoKJ3vVjQGBX+aPpQ7XkRgc
	 cLJWgr/EC63sOSvVq1l7jAPxuvW6yDGoFbjw+pB0Qx2zwYAXDstl6uIr6nd4aaUXzF
	 2FIRxS0bzcpSOH/nVbqRefduT2FCMgEUhbFNdhCh06lSzLitxz8T+y2FPGmFfalovE
	 ibm4Ex8GwAgjGpnDbLNPlkhWvUBJUGOhButNKx0tOLv9oCjmxSfMjCjS/v7b3fatXZ
	 mm2wdIm4Qzxbg==
Date: Sat, 28 Nov 2026 14:48:50 +0000
To: netdev-bot+sashiko@kernel.org
From: Bryam Vargas <hexlabsecurity@proton.me>
Cc: Mahanta Jambigi <mjambigi@linux.ibm.com>, Dust Li <dust.li@linux.alibaba.com>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "D . Wythe" <alibuda@linux.alibaba.com>, Sidraya Jayagond <sidraya@linux.ibm.com>, Ursula Braun <ubraun@linux.ibm.com>, Wenjia Zhang <wenjia@linux.ibm.com>, Stefan Raspl <raspl@linux.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>, Tony Lu <tonylu@linux.alibaba.com>, Simon Horman <horms@kernel.org>, Guangguan Wang <guangguan.wang@linux.alibaba.com>, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, Hidayath Khan <hidayath@linux.ibm.com>
Subject: Re: [PATCH net v9 2/6] net/smc: bound the receive length to the RMB
Message-ID: <20261128144844.1385070-1-hexlabsecurity@proton.me>
In-Reply-To: <179483403531.3136.8089060655556532664@kernel.org>
References: <20261112-b4-disp-0287c16e-v9-2-e5e8fa688177@proton.me> <179483403531.3136.8089060655556532664@kernel.org>
Feedback-ID: 199661219:user:proton
X-Pm-Message-ID: 1bb2895e801c5085280a8fd1eb88e916f2868a9b
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 13:00:35 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [High] The patch relies on spliced bytes being counted exactly once: in
>   bytes_to_rcv until they are handed to the pipe, then in splice_pending.=
..

Both cases hold by inspection and neither is new: the review of v8 [1]
described both. They are the error exit of the chunk loop in
smc_rx_recvmsg() and the debit after the loop; 2/6 changes only the
comment on that debit. The failed second chunk dates from 9014db202cb7;
the short count needs a vmalloc'ed RMB, so b8d199451c99.

The bound doesn't rely on the single count: min(bytes_to_rcv, rmb_len -
splice_pending) keeps the read that follows either case inside the RMB,
double count included (by inspection). The commit message says the
splice_pending change is only for a reader that runs between the cursor
update and the drop in smc_rx_pipe_buf_release(), and the changelog in
the cover says the failed second chunk is a different bug, not fixed
here.

What goes wrong after that is the same as on unpatched. After case 1
the read returns stale bytes from past the producer cursor and cons
ends past it; I haven't worked out what the peer's writes do then.
After case 2 splice() has reported bytes the pipe never got, and the rx
window the peer sees stays short by that many.

Hidayath Khan's "net/smc: do not credit bytes that splice() did not
take" [2] covers this accounting: the patch handles the short count,
your case 2, and its review raised the failed second chunk, case 1,
which Hidayath agreed to fix in v2. The same review raised the
splice_pending drop that 2/6 moves; his reply announced a separate
patch for it.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but spliced pipe
>   buffers keep pointing into an RMB that has already been handed back...

By inspection, yes: nothing holds the RMB slot while a pipe buffer
points into it, and smc_conn_free() doesn't look at splice_pending.
The conn->freed test isn't from this series, and 2/6 only moves the
splice_pending drop that follows it.

[1] https://lore.kernel.org/all/179364387064.3131.5492897013975868107@kerne=
l.org/
[2] https://lore.kernel.org/all/20260820085543.967490-1-hidayath@linux.ibm.=
com/

Thanks,
Bryam

