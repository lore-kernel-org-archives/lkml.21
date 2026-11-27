Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803133;
	b=Kcx5hYgLMQQm7IcvoUKPwHvUzMcSQyXPiUg8HeJtT0BQM1UNcfkbTAyf3NDErXqaAQxZ
	 kJbQ0U2t2THpxLkqsWP31H6Q6ljv/C+oilFql5NNcJMad066vSRtOMWFpNXL3duQrjcnz
	 QeDtskLwzwx8mlY7+WZTAJdN7MlIo+x40aDdKo2pJwBb5c5vcw66R3rXU3tgd1zBz8a1d
	 cC56h32VdHTvIgso25nnKez5g82RFl4dXyOhjftRJGDHE6jYUqBb+o5ehgCrk1KTQcgMO
	 ZUCk75SlSY4OIyy/wRtj0vnV5qHQz2WAMOurxAze2bnJri8QNgd5hRN6KV9l0DlKu9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803133;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Gy/r35+5JEtOtSHxIpzplhZdK/32CUJxIe81/3GxOy8=;
	b=KxZJcSkAA5QLGcGY/D056Uzq+3e4FxWSIwA6vs68WcnonKz3AF1oLe3YpYWcVRzmQ4Rg
	 uGZD/D6P9yUC1dnBV7COppsc6bQerKKiJgzkRcAIfxEewKDC9GrVe5kyiMYTtIahUfx1Q
	 pVawW5CwRShf8t3jFoBRStuAnETbfJSaMuKs3Pa/7u084vJ1r+7gSjK8GpWfskcp5Oi7n
	 Ps4o8iockbnp9ZSbFd9CW4w6d7FMsjbbIzO/JUZvjCqRMSi+7GDo1LnU5W70YhUgD1Rn7
	 6Ht1rQ/mle5txLxS5zKCvnW2FIOu9uQdmGtkLJJGemNNojjcv/wrlbjYbauMugxioSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzoxtWJA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzoxtWJA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B785B1F000C1;
	Fri, 27 Nov 2026 18:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803132;
	bh=Gy/r35+5JEtOtSHxIpzplhZdK/32CUJxIe81/3GxOy8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QzoxtWJAQqU6sp1dcNoVnq4QhKj78g3moCbvKrAZJNoCRzyhlNkDmwvGO7v2GIfwf
	 g3lizhljOESyUI0rW9EAMxcqoDbcX286GwjN9gaKjxcOTvRXc0K4ngWi5F3ZX/t9lp
	 +UHne3go9xcVjrIsyxAvwewtisuqeuQ5u9ScskLOrcTsE3wIyky2ejIzxsGlpqknBI
	 DQf9M4nfFElaFlV3AB0Lhmq/dYbQKIw/0q1wFk6OogO0v5PXjBnl2oKTalHa+LalcE
	 pGX6Gi8Ewrr+3tRSwqm4oOedkSde9ITn18+vtpHs6XFxtoESz+Nl/E1SUODN06nTal
	 cHBPsihlmE+lg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE906392704F;
	Fri, 27 Nov 2026 18:12:12 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <awm_2b5a-TzetyOj@arm.com>
References: <awm_2b5a-TzetyOj@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <awm_2b5a-TzetyOj@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 18817028301de963a3a25f6d7d652d1d3b79f570
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 822ba3a89c7896b26e4beb70e2ebffb881924dfe
Message-Id: <179580313150.1619291.17779977413302110781.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2026 18:12:11 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 27 Nov 2026 17:37:29 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/822ba3a89c7896b26e4beb70e2ebffb881924dfe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
