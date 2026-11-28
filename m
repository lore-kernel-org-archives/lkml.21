Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881257;
	b=2bddGOWW6gYHmk263RYlxKpXN4s9Si2n9RrDbPOJWyYn02boUihKtno5IZjkq8kH4S8z
	 2NxPm6fZlFHrNwkCn9/q+wX+prIkdy2sAsAWaL5jOoml3DMbOuNZhkxsW1jvnQaQI/HyL
	 /NkQwNUPzA6dDLDtZPyvcHgONSmeHxb0WohLjt5CbRavj0cuakwWWBr3aGVyNRQbb5SX+
	 8pR2M2mdWMBu9ElLufD2lhP0CJ47D+qRQUAvtLsGU7ieYkyt50QE5wpNl4sCzcKtsAGuH
	 KV9d2cwozmicg2OvKEju+Rh8wUtoUe+dQWHEnK8ybmYyyu+3NVdJX/VFSKW3LbloiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881257;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=orAW4VA6gXoOYwjgpOWFb0op6zmUyN/G4uA/CQXph88=;
	b=4xIo4b/q/uQSEbIxpR1mshv/UhvPKAkIh3BuwhTfO4RG8OMytu1zQN4N0r/r+mOWgYkA
	 CHSZRDkUwJqN90ibvusjLxVvwnqrJpepoh53qxitlxyeHBL2sf0zFbfkAGlg9PWhVdJdC
	 AzbmSUs7Xducg+tL+rNFUIv4A2MM8kFNo49gmegiv0D0pT+AgIW38O73dRnbPihapfqkL
	 Dtc0C71Xpcm/vA/8GqI/cdhkfCzuOUMJ2IVeo4sLxBEsqUwBibA2F+YwfSzMSM1/sCF0d
	 mk47H838efdWJbBVp5ze/No7VFWx87dkpeoMR3DFAeAjQdCeSmpEiW40YW80B1ijOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=KG9nNg7e;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0F8606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=KG9nNg7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795881254; x=1796140454;
	bh=orAW4VA6gXoOYwjgpOWFb0op6zmUyN/G4uA/CQXph88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KG9nNg7eIsyEB56GwR/MwAGEFPbmn2vqbmAvep2ujySievDjG1yx+/z4zhhawEXEn
	 GREUAvLop5ndNRxXibPy5apzP87h62OFOju/Tcg/ZYS48q4OT5OKmMdUxNCLbMGXiP
	 cG6iUZZ7ER4YkaILn67Gj5IudkWIKT4FstLGpYUqKZdtX7ooYjQnmWtDjbsqlc8QHY
	 yST8TMZQcN4mXCc6pCH261blCOu5lWKMfhW1wDmqi7fxAwVMFbVcLHmZVa0iQ8YfF+
	 VFH8Eo3B8T/84fLsPhJU4tCWpaK9R9/b0eP657M6YIc3pihJQN+ovm2uGH58t+jBHq
	 O6/vgCndB+GkA==
Date: Sat, 28 Nov 2026 15:54:10 +0000
To: netdev-bot+sashiko@kernel.org
From: Bryam Vargas <hexlabsecurity@proton.me>
Cc: Mahanta Jambigi <mjambigi@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, Dust Li <dust.li@linux.alibaba.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Sidraya Jayagond <sidraya@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, "D . Wythe" <alibuda@linux.alibaba.com>, Hans Wippel <hwippel@linux.ibm.com>, linux-kernel@vger.kernel.org, Wenjia Zhang <wenjia@linux.ibm.com>, netdev@vger.kernel.org, Hidayath Khan <hidayath@linux.ibm.com>, Ursula Braun <ubraun@linux.ibm.com>, Tony Lu <tonylu@linux.alibaba.com>, linux-rdma@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>, linux-s390@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v6 3/3] net/smc: skip the DMB nocopy accounting until the send buffer is set
Message-ID: <20261128155407.1427708-1-hexlabsecurity@proton.me>
In-Reply-To: <179487758596.3136.12928828467382443502@kernel.org>
References: <20261112-b4-disp-1c8d3a53-v6-3-36a38ae35021@proton.me> <179487758596.3136.12928828467382443502@kernel.org>
Feedback-ID: 199661219:user:proton
X-Pm-Message-ID: cd7fbe08df8e0d49868652c7f51bf9d63e36efaf
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

On Tue, 17 Nov 2026 01:06:25 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [High] The new NULL check only covers the time before
>   smcd_buf_attach().

Yes. 3/3 removes the NULL deref and nothing else. The cover has the
rest as the second item under "Not fixed here": the old peer's CDCs are
still applied to the new connection, and once the sndbuf is attached
they add to its sndbuf_space. They can also close it during its
handshake, as the cover says. The MSG_OOB wait you describe follows
from the consumer cursor they leave in the connection; by inspection,
not run. 3/6 of the cursor series [1] keeps the send() copy inside the
send buffer; it doesn't correct sndbuf_space.

> - [Medium] The patch stops the NULL dereference, but it keeps processing
>   a CDC that, by the patch's own new comment, can come from the old peer.=
..
[...]
> Is that comparison accurate? A CDC that leaves the consumer cursor alone
> does not create a cons/tx_curs_fin mismatch.

Right, it isn't the same. A consumer cursor that moved stays in
local_rx_ctrl.cons, and the new peer's updates are then measured
against it. The comparison holds only for the flags and the producer
cursor; the code does not depend on it.

> A CDC that moves the consumer cursor before smcd_buf_attach() cannot come
> from the real peer. That is the reasoning behind "Nothing of ours can hav=
e
> been consumed before the attach".
>
> Would it be better to drop such a CDC, or to stop reusing a DMB that a
> previous peer can still signal, instead of applying part of it?

Stop reusing it. That is a series of its own [2]: it stops pooling
DMBs on nocopy devices, so the next connection gets a new DMB and
token. Measured on the loopback device, 8 reuse rounds: on net, the
old peer's CDCs reach the new connection every time; with v3 of [2],
none does. With it on top of this series, no test reached 3/3's skip.

Dropping covers less. Before the attach, a CDC that moves the consumer
cursor is known not to be the new peer's, and could be dropped whole
(by inspection, not tried). The rest looks like the new peer's: the old
peer's CDCs that leave that cursor alone, with its flags and its
producer cursor, and all it sends after the attach. An SMC-D CDC has no
token and no sequence number, and smcd_handle_irq() finds the
connection by the DMB alone.

[1] https://lore.kernel.org/all/20261112-b4-disp-0287c16e-v9-0-e5e8fa688177=
@proton.me/
[2] https://lore.kernel.org/all/20261128-b4-disp-2c190c90-v3-0-c566f64196c8=
@proton.me/

Thanks,
Bryam

