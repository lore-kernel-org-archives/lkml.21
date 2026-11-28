Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885223;
	b=g66+Kc164ylF5XdzyIQQmT7scPslIMXzl3AlNe33ZlYMamQ/GfSF3OXNPwKAfvUM3Yg2
	 vpuoB8dc5rHo9Y+rgVimkp/py/ZRvLXcw4UBnpntiqhCBdanUwl1jAAYclTau5h8fJcAq
	 yiiguZeEUMp3ib2qBM8vUdPoDsKXo41a+yMnzNk3p93qagTBir0dXti6R5HUcnnEdyVJY
	 rqhkf0lkp8Me9ruA6+685Bda0wEprRx++NUQHHTNfc9t15VfXgLeRpHByh7FCzlFcbw9K
	 GtBnv3fQs7G7AstMtOJ2ELgpt74BooZoJCJpsM9U22jp8Oxv6dfr2rCimgZ8nFZBRfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885223;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=QaslShaKI7zWpWy406ywIRPhApEfbrnizhPkZQOJWqA=;
	b=A/SfZiugdtr8bnALYSeRBbCb3oWbdPFiDAwDiaqQ5KY2yTQm8OkXl/lWApcb5Qu+2Xon
	 +iqj7Ccdgen+QaolBPPBrix+qRhsQOcoRCRgIRN0d1qmASudroBk7FJXZojk2eeg2oLij
	 bmmRBRiedwIXRMJ8p2mUX3XrvHjpInjMSa/Ti9elTiLRkDcglj9j0GK6ijxtl7OcI8on9
	 6pTeKOAZKw4jfMFXQKeIkyBs6XHpT3PMC1yQ2yw9zO1xsnJuCfe5BxlSTKk0WnLRpPr7k
	 CSKU5ZXtBzIfftS9GfSQMS0BUZRftIpl0pKR0xJ1r6hVXwdvQu2h692MXIY7AOVetmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h56JgMN0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1583606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h56JgMN0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053441F0089F;
	Sat, 28 Nov 2026 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795885223;
	bh=QaslShaKI7zWpWy406ywIRPhApEfbrnizhPkZQOJWqA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h56JgMN0/H6Ajsw4salfmK2SDa4sQVpzGAxFiAINIPJjKiY8U7RkYM8MCL3VSBOct
	 y1gq88FnPkG6RSnbaBFclqj+SbZikRSUzPNiVg0ZW++w2WYlFhGzTlzL5nc96oHAOD
	 V2wGD4EnzzoZX3XAT2wpeV3N/D5UpH6zt5hscrlQAUHAEOIGIQuzj1GyLLphfI753D
	 jToHURME9lmFn8EokCwgI+lO0Pv/VOTylyKi2gGI7ABVfuIbyI3xwabOvgk9s3uQSX
	 ix6evlJXL5ajMC/HK0r1V8r+iXblRsHt5n3GXggWRY7BRPCoTlZsW6dKAtqy8HYkt5
	 c6/5tpNjLZsEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB97A392B1C5;
	Sat, 28 Nov 2026 17:00:22 +0000 (UTC)
Subject: Re: [GIT PULL]: Dmaengine fixes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <awqz49YYREhvWn0p@parshuram>
References: <awqz49YYREhvWn0p@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <awqz49YYREhvWn0p@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-fix-7.4
X-PR-Tracked-Commit-Id: d460a02aa0ac6ba9e5d87f8462f75d78be83146e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb13fcd7f4385fdf64340e5561a26bd951bc3d78
Message-Id: <179588522155.1983540.9669508376277011832.pr-tracker-bot@kernel.org>
Date: Sat, 28 Nov 2026 17:00:21 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 28 Nov 2026 16:28:43 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-fix-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb13fcd7f4385fdf64340e5561a26bd951bc3d78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
