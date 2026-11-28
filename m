Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834595;
	b=glR5jd1VQiWzLhNib3Lbc/EDG1zJM2kf1vunk+aYrE39BgvZapke50szW7LE0+emS+CP
	 UzcfBFLFX4Ep4Ysl1+96xRyJ1e9CElEUsQKcD7bRxU1f/9k/BKUqXhsBDBDn97WaLAvF2
	 XmrtU7dY12GVEghRRIyUrNHsDF8QCsyOgOEgAkU7CD/XCBn1yBC3yl+QWGFWyakQk2KLJ
	 lloGK60J0bwc7DGKwbvlmkYF6ylsos5anDO+EeuERMQ40nRA+icVvmvha+ifVeY8El88t
	 OVJI1AJwhdtjiEsBmpYh6AmGMe0NbS/sMM7kcMtm3D7CNJcgurtFFQQum043rCtJ4Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834595;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ELNJWFrp6A2ceYEBWbEQ7UunFlfCLSDDrYpDdL891Xs=;
	b=HBQw4+f7AAv8sW4p7PyPgy9yqTPweYLwRJXJmD8LtpcWoGj2LawWkhrxFM19Mh8FeQfh
	 GP6pqv57yegOyo7LqbiQcF6OANE6IROAF/hhVMacL7Fuk6XYK/U0bMcCozoE7wCQN+peP
	 s7CneEb5qt685PMLQ6g8Pj/iyuGwoIOhhpEZJEZQ4GsSYruVQ9eEesl0BLMQXx300swgj
	 7qvwPFK68hnwb3G6n2ViIJV8PoG3yfbx4A1uTXuhXSFSEtspiV9TiYxkCKAy2ToQdHomB
	 3oL0BievnZlAb9MTw4VvQSRAjzxljcQmsZzsFm3us1/S7LVodLeoYDxhTH/Xq+8cMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbwTPt+3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26936606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbwTPt+3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0244E1F00893;
	Sat, 28 Nov 2026 02:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795834595;
	bh=ELNJWFrp6A2ceYEBWbEQ7UunFlfCLSDDrYpDdL891Xs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UbwTPt+3Q8dmpLPqzt6hFWFIReTZempSpDftH6UvUGlbpoPC1eyhr37C0qqSQA+rr
	 W1gFoDO7keuEXUr8ceAtpnErnAU6P6eYUCpLIhxctPggcBeSSiIrCZCWIyQ9m658cv
	 cTACXAn+1fX4kNeGh3hxNgXAJw5z8wdqzbKSrjXEg1ae//0mh9qqfwEQankWBv2WL9
	 i4hJe9Q59XJoNKlXw1nuLIf7/aT0UXVjWOUxQmv9XhAehUfKinOnseYRnZwXhXf4hs
	 EMWBl7jxqgNluo/jRk133LYPp4Dpi/eHm9G8SPJ03507yju1EY6M844atb34mjxOH7
	 uCKk3cM+Roz0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB9B0392707B;
	Sat, 28 Nov 2026 02:56:34 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw3Esbfcq+zcZyg80J9_1FaFLKD1S-83DstzL=WfrRbpA@mail.gmail.com>
References: <CAPM=9tw3Esbfcq+zcZyg80J9_1FaFLKD1S-83DstzL=WfrRbpA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw3Esbfcq+zcZyg80J9_1FaFLKD1S-83DstzL=WfrRbpA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-28
X-PR-Tracked-Commit-Id: e1dc9c441d4a92a54833c85b44c1ee474afaf57b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c639ac6b9cf100b860408a3cf8d7eab268866cd7
Message-Id: <179583459350.1775590.14559442489230836761.pr-tracker-bot@kernel.org>
Date: Sat, 28 Nov 2026 02:56:33 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 28 Nov 2026 09:04:35 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c639ac6b9cf100b860408a3cf8d7eab268866cd7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
