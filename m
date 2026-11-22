Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386012;
	b=Ugq3tld/Lzuh/4HTlqaHCjanD/xI3caVki260PBJ4Ho7opVZweJ52PrED5dz+7VH2WW4
	 Un9Q5yS5/SYEY0Z2CquHkzSp/tLVO47HTA24PI+HKr8Dd9p3iLwbfvhQbH8Snksntztwj
	 39prSZFB+oaeFVFGq2TvUj5CqgSbo0A3XECf0tjZxfK6CrxXDzM/QoYkf+lHZGBQDG0b8
	 Lpuo7YHNcGQYiA5RCBZp18a8hjKBNvgjgzD8p8wrnFNUt4AaYHidxgwHFgcN/bbgfVbVv
	 9Mr/wgHEiHFlOIeQQ2zvFk8c0IOaD5kWiyxx6BXrZ9FTncRWDLxGO4mZ+/9v42D0s0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386012;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=58/xK+gJsTuXHUFqeudxRMchPbmP/WPyB8538K2N3XE=;
	b=o2MpJkWPlHSFFTIBbxcxgt1Xba/CV+kcUwh4jXb3qfPzEtvCywRtuREaOjsOmZ5wLbOH
	 PmNAoGSRKw1cBAY19PTBzjoGQkPLwmL9cw+PT3YbERAY029hy9ZhriG9A8m9Jn7YsKa7t
	 UNpvega+rQdsyBnY85aaYilbijERzPoCEYNR2gzC5OmJLOGMyjAyVXYK3XkzQT1bns7tI
	 Yej4dKCuXe4c2IbOV2zB/ul3DX8oLBxj/KYw4jBLhSh2sqyzvq4HIDHlNQdbw1bNl6RiE
	 JU9QR0FwkrnnH4303m/mPq3R40eZ1oZJuBuT+v7FfJ9zLucDsiE49EbpAS+7QK7TGsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JMT/d/Ci";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652E606A683
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMT/d/Ci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4648B1F000E6;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386012;
	bh=58/xK+gJsTuXHUFqeudxRMchPbmP/WPyB8538K2N3XE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JMT/d/Cicr+Dp4nXiYaVvuVYlIbRpiP+RcMOdIA5mqXhDDQTBw8c+rehvOkWKZ/Pg
	 2y46EZkCTGrhMKDHzKzKZfNbVAlUM/cYNZaAeb/RQQYk2pF8JkFxCETTgmDCo2p/28
	 AOVFYCRwV1BkSf6TraAIEGQybtnaGN2/y0ifKQDj8xYBaqQyR4eTx6K9MIY2nSqKVP
	 KG4fY6GAaam9t7CxCgG78WsSZFsvDH1lnEq0uc0jrxAtYffM0L1q4g6IughUhgdrRS
	 xEFbh0e8MTV6yV+IqK5aNcnI2oU/mmxBu9qG0bzuOf/rX9mexaynjP1lBR7tBK6Mw7
	 iOcNYe1+ic/Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A315392ED41;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <1a74c335-ead7-bf62-b35b-d2afd06599ca@kernel.org>
References: <1a74c335-ead7-bf62-b35b-d2afd06599ca@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1a74c335-ead7-bf62-b35b-d2afd06599ca@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-rc4
X-PR-Tracked-Commit-Id: fc91dacd0c2b4f9ca7e0ce30016f5aee6256cba5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2681617eb9317444247380298564f58142fc4ff8
Message-Id: <179538601156.1569645.5378016366950557720.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 22:20:11 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 22 Nov 2026 13:11:58 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2681617eb9317444247380298564f58142fc4ff8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
