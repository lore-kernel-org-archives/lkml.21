Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679781;
	b=xSgQkoCKPCPoC3bHKsOGELWdR2PldQknBEHecTUlbB3mbuI+ZjBiv3KfRTPi3lqGs9ox
	 GC6K/x4jiSCAs43GrvXf/945CG60nbPSlyBYKtcOw+ta2J+N8/cYaZ4e39GKGRX4NC1F9
	 ZgH7JNh5ONa7NzkQ9I0AUiq9Qgy20Dn8G58aYTYVgi10M2ELdeGfWUzvBQyNxrg/QFBXU
	 I4rr1F5r9D7NQsR6aWHFA4Zn5ABR371QCdCPzwel6i6LFP7BxNXgrjb+o10fRWbFV33hH
	 /W7YFuJYvIhRJJ8zkV2MVdngAO7lPsGnZFRiy/FWiLuYbLQ4ZdMvt/CPU57JKiu4dXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679781;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Zp7KR/TTaOmH56UgO4iVbM4KLisFeV6A9K8Gnq9SP2c=;
	b=YPDMkIlRgbYkbmXY215YNgzCcIaoJ8P8c0I01wd3QLEdMHRCx2x9jrYAwAp4R3Zt3uZd
	 SxCfUuB+ojQTGzHqKJhy7z89r5oSgl1J/bTHgHzJtVKcG2N8wASNRF9v4UgtUnGqrUQNB
	 Fs6Hy+tUxkLUgSXWjyl9P8TMYfqnHqIUEUNwY48mRPgLKsxzT7Gwqz9F/7wsZAq2BjeEw
	 ytfKV1DbkPiYqLUe1TKLpMOHTnmtJWPnYuKLKItr0FyI89R/exfOCxQsM4cREAuhHWmSt
	 hJ4kMUi7f4L8+ljBbJToZmmOpU8yPahkI3TqzKZJ4+zbRINe1dumAFf/6HvsMDlTHWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wopqudTI;
	arc=none smtp.remote-ip=91.218.175.11
Received: from mta0.migadu.com (out-11.mta0.migadu.com [91.218.175.11])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEE606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6CEE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wopqudTI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hc7O1kDVjwwjdvW8dTk23z2Y41qPruXloCw6mIwLNgg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795679777; v=1; x=1796284577;
 b=wopqudTI+GYAMTvbtvkHUvwJgyGDz440Xkvxa9G/BUX9txNM7C6aTMqZti2yNeiMB1x4ADGu
 k/svzrkGTP1csJ/brMPx9c3qE6IblIU1TNGnoqKXxVYuP2YccYO60nppwztoSxSEgXpD9DK2ZcZ
 fg5uNUF8MtHUClaKEWqT/bNU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 0c367e1d0eed308f;
	Thu, 26 Nov 2026 07:56:17 +0000
X-Mizu-Trace-ID: 0c367e1d0eed308f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 15:56:10 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, sdf@fomichev.me, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next] bonding: check XDP support before enslaving
 changes state
Message-ID: <20261126075610.GA33976@Liu-laptop>
References: <20261124-bond_xdp_fix-v1-1-e67983924324@kylinos.cn>
 <179561592046.3135.4020262152427481394@kernel.org>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179561592046.3135.4020262152427481394@kernel.org>

Hi,
On Wed, Nov 25, 2026 at 02:12:00PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 (1) · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).

Thanks for the review.

> 
> - [High] bonding: bond_xdp_xmit() checks ndo_xdp_xmit instead of
>   xdp_features

Ack, I will check the xdp_feature instead, thanks!

> - [Medium] This patch fixes a kernel oops that is self-contained and goes
>   back years, but it has no Fixes: tag and it is mixed in with changes…

OK, I will split the patch and post the xdp_feature guard to net tree.
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the XDP
>   propagate failure it keeps on the late path can leave freed memory…

This issue is working by Jiapeng in
https://lore.kernel.org/netdev/20261124024319.52145-1-ljp1205831794@gmail.com/

---
pw-bot: cr
