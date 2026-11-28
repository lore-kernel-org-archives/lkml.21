Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875162;
	b=4ajxsm8y5ILZJQaapbFayPkw/5C4N+UF4PiQ82FotgdHpuy1n5dxCFbgIS54pyzQY4fu
	 s48SYfCyrN23XJWjl3xcKuJghU9AN5RdMEhLBAltdxb7rnhhPJlnAtbalN0fmH3CCErmX
	 YHhnKTG0lgnv8LRi0OXtFjbdYEFD37NlOgzbO1m+qMipe9aETma1174IXGiQBJogHuYK7
	 ol1yqz77dkrYyj96gI4SJ8/uvZv0CJqRF9BTw5LHpML5izTPMm58mcazS78LhUzfMdbM0
	 hzwdnv+ZS7xxRn8rYhdY52iXSp6715JOjCLx5EUiihClAZX+8HReaVMDLHx13/P7ovg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875162;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=HiQ1PAjr7Ecei7OKHzCMGcnLI6UU8msjNtPn7rTcZ/E=;
	b=j0ZU4dqMgVJkeisVyijBI2zbRPpXGjibrtCOhLgyNrtV+lwI/Aqexq1YOYuzwvzl63hD
	 sfIOn/lwUmJoowFWEyg0q2yhPYOznpKMP8Xkk/S4otOzvtAZlRvHSkEQgdWjyexMWgU9z
	 GVYZP1nCM44iiM4QTtePlIpv70Z/F9NKO5rjMKC//UYKpBQsEEqRG4iXBb2hOeFNeyWWb
	 FwyuHsOyCMCFl5X38ZUl0cgrmAWWsuPkXWVY1XZU9G2FYMpvZGAIkUU1YjJwLHbjBR/f6
	 7YfUGaSYwNYS/MwNCnIBlia0G1hLVkgMua8zuQb60nTrSjx3iPTX1qZ4aTUEKBOZX0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bi75oQBW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90FC606A31C;
	Sat, 28 Nov 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bi75oQBW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC32C1F000C1;
	Sat, 28 Nov 2026 14:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795875162;
	bh=HiQ1PAjr7Ecei7OKHzCMGcnLI6UU8msjNtPn7rTcZ/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bi75oQBWMpwrIsJfwXK0TAcDynFVWfVxcGeExvfwlRXQZOYMKJKRkeW4VOnO+IjGc
	 BrzJKD2p6tM6EF9p3ZUkSBv6ZBPdw5hsENtJg2tl0wjABcFuF9tzhTW+Wbknopt4Ph
	 kWZXAyeGH9Dl81BEAhJd/30H/GzQ4B6re0ltbkBB/6OuG38LH7ZOFYMTE6hXmt2hNH
	 2iym+TO9LexCJwYMEAknLFHVZ1LCJepHqEsi2fTQMNX2qOAiCkY9U8OaCLXsQIZk1C
	 iL5vqko8eR0TTyphn6ekaQp13/JwVOiQWL6HRyzgja/U8mrEegXwWjucsIGtY3IE+1
	 yW8Boo9181fSQ==
Date: Sat, 28 Nov 2026 14:12:38 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: amisiurov@cloudlinux.com, courmisch@gmail.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	zhangdandan@uniontech.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] phonet: do not autobind a socket to port 0
Message-ID: <20261128141238.GE31322@horms.kernel.org>
References: <20261119122127.1708071-1-amisiurov@cloudlinux.com>
 <179543740229.3135.7763014717205061989@kernel.org>
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
In-Reply-To: <179543740229.3135.7763014717205061989@kernel.org>

On Mon, Nov 23, 2026 at 12:36:42PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The Fixes: tag points to the wrong commit.
> - [Medium] The commit message says the crash is "deterministic and
>   triggerable by an unprivileged socket".

Hi Andrey,

The two issues above do seem to warrant clarification.
I'd be grateful if you could look into them and respond.

...
