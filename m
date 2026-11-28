Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881249;
	b=Jkv25xHxuzH8QkEgs3o3IouKRBGsR4pYcRs9AGVnJ6Q4sCeMwBXUxa4tR1ACbIYJIJnl
	 Asr+PH883u0ttKie/xZBYIN3InyWfI0kOEjI/v/SVR98298kfMu/SsIbdTVgIbbL6zSeZ
	 /r0x/T1HjqumfcXosJiO/8SJ5NHB21fc6wzo2+v+pRAQ+9Skn5vSsvX5yfaRj07gGW+j8
	 +9R3V5P/wtgDfTX3hpquzMyQAS4Ati5qCX3cjyrbiaNdPjFohT9KbvEQCwRV9k3tUxFXV
	 mzZuK6yH+dpc1K/djeqlyaV8n2koe+rSlksmwasuqpbLdSxKnX9YhyrnBELco8NZBDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881249;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GEkTsONajPK1Co5cTsiFpwumQqUlmxmI4EKz6faDMnM=;
	b=XG7ox84s4rtoU7xIBayvTpljesUd8Znd+leieme2wA+xnBGC5HH0rOO6b0ze+lqFH2dj
	 foeIY46VxysRgBRHktnccpKdxuxz12JXRbNja2kshvk/6IPk6ryFUAngovQyYrL2YyrSz
	 z73PkQdlmkJ/6OH8fuCJJWogwELncmhDArK+Bsy6lnGk51ycVSlkpX8PmY1wodAL1k8Al
	 2XnOf/b/RuyNt2k35Qds9ChM+Hx4IExP9C+o8HD2SG6ehYp94dqrtga1BxtzY9Q8bsHdb
	 rn4mMTseRhGDkS2zKq0vyw+vNOC/DY+TQL39PcmytT/Bd2f6607YX9ViKQu9lr+6nUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Mbz5++10;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D9C606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D9C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Mbz5++10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795881245; x=1796140445;
	bh=GEkTsONajPK1Co5cTsiFpwumQqUlmxmI4EKz6faDMnM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Mbz5++10plNkTNAPwnSorYwRzxJCNns6mJMPhAE/A2wbh966iPwBOglAfjmQNVbNS
	 Nh2GjAYgouzTX9785xvXjhr8rjn0+rtZ+4g5edPYeuOfZtHDKmk6WIc1/yKM6hVjBQ
	 JNHjiHoLa9cWYO3zIq4vncxruUaDeMxCczbZYb1GXqqO8S2KbmWYziSeAR1HoZFAo4
	 KS/JmSrObkAOTghqlbPWZ9tMy0keVRSx5KMKg4hzJj+rN0lC/8I1+qs15NjDvmg5ZT
	 nxadbiLDqm90U5hFh7XFzi9B3ghbz7s7p/vflMMBG6ICEcNswFUa22db6dtZhWOvbH
	 kWpspl6BQrbKQ==
Date: Sat, 28 Nov 2026 15:53:56 +0000
To: netdev-bot+sashiko@kernel.org
From: Bryam Vargas <hexlabsecurity@proton.me>
Cc: Mahanta Jambigi <mjambigi@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, Dust Li <dust.li@linux.alibaba.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Sidraya Jayagond <sidraya@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, "D . Wythe" <alibuda@linux.alibaba.com>, Hans Wippel <hwippel@linux.ibm.com>, linux-kernel@vger.kernel.org, Wenjia Zhang <wenjia@linux.ibm.com>, netdev@vger.kernel.org, Hidayath Khan <hidayath@linux.ibm.com>, Ursula Braun <ubraun@linux.ibm.com>, Tony Lu <tonylu@linux.alibaba.com>, linux-rdma@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>, linux-s390@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v6 2/3] net/smc: clear the buffer pointers before registering a connection
Message-ID: <20261128155344.1427660-1-hexlabsecurity@proton.me>
In-Reply-To: <179487758425.3136.7345936021290037161@kernel.org>
References: <20261112-b4-disp-1c8d3a53-v6-2-36a38ae35021@proton.me> <179487758425.3136.7345936021290037161@kernel.org>
Feedback-ID: 199661219:user:proton
X-Pm-Message-ID: f069d12f754163e21e81426a8fb11fe95c985d89
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

On Tue, 17 Nov 2026 01:06:24 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [High] This patch still leaves rmb_desc and sndbuf_desc dangling while
>   the connection can be found by its token.

It does, and the cover says so: it's the first item under "Not fixed
here". A handler still runs on the released RMB if it found the
connection before smc_conn_free() unregistered it. That predates this
series, and it's the window Weiming Shi's patch [1] is about.

2/3 is for another case, the retry that registers the connection again
under a new token with the pointers from the failed attempt still set.
A CDC with the new token then finds them at any time, with no race
against the release. The note under 2/3 ("a pointer seen set stays
set") is only about the pointer not going back to NULL under the lock;
it says nothing about who owns the buffer.

> Could the pointers instead be cleared under the slock where the buffers
> are released, in smc_buf_unuse()/smc_conn_free()? Or could the token be
> unregistered before the buffers are released? Either would replace the
> clear in smc_conn_create() rather than add to it.

Not with a clear in smc_buf_unuse(): smc_conn_free() skips it when the
link group is already off its list, so the pointers stay set on that
path and a later retry registers them again. Unregistering the token
first clears nothing. Every registration goes through
smc_conn_create(), so the one clear there covers them all.

A clear in smc_conn_free() itself is different. Under the spinlock,
before the buffers are released and on every path through the
function, it would do what the clear in smc_conn_create() does. A
handler that takes the spinlock after that clear would also find NULL
at the check 2/3 adds, which closes the window above for that handler.
By inspection; not written or run.

2/3 keeps its clear in smc_conn_create(). That is enough for the retry,
and the window above is left to [1].

The two cases you list, is_reg_err set or not, are the ones the cover
measured: after the negative CONFIRM_RKEY, the descriptor is back in
the pool and the forged CDC runs on it; after a failed MR registration,
KASAN reports the UAF. Both with the retry; without one, i.e. the
window above, nothing was run here.

[1] https://lore.kernel.org/all/20261021171256.166870-2-bestswngs@gmail.com=
/

Thanks,
Bryam

