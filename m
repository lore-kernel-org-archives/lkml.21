Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885218;
	b=WzSjx3j0OSPbx2nOsMXAHOYzm3IgHymVQspAkkzBKmY2rZL9C770WSzJXXV0X0YyHZDc
	 MIWx38D34NZknI40kgx07a8oFQJ2xIgPXHFE4CUneTmT59G3UPInMSHAfyS32gUQm5xEo
	 1v94EK/m2p5JNtl/6XKkDx4r5g3ITYPaVKd9OWMa1ZCvgvWHr+y945fKNtXhB6/SL5JN8
	 HKca0hivDRAl7sst20V268QQujuFDrRqSMej2yYyhgKnRrNjhzW7h/U4sRcqNcHmPeQXY
	 VuQ2iC15/VbrrX3QYQTfqfvMgOQBrMtviUKjsl1kYKaj4quQ7AUV8cb2rYBsyf1f2Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885218;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Y3PfFUIgJMoAWfd5I/RiTeT5f928Fa8/wrvzRBsDZKk=;
	b=NpKif1i0+BFhNDDP7KWbofKGI4qcfQ6JIAvloMTcNY2vaLRLqhWXp6tfeTFkwu77vAxq
	 MM/n3HQAjsVep/FabdL1q5VWzV+wQI4jg4+Go9CHl8L1Xv6toxk4+OKZHIYg0d8Ua5pwb
	 8imNWPWbCj4BvdnY8IikMjcUnq34UUs63phjx/a5wxiWgFuasrmK0b3lRuzg3lNFUw+f5
	 nHCvTR5LaKlIS88oJ81QuXfbYltbcYbD51x4i083rLgcOaDZo2s4mhtRMCPSGRpyl/Qzq
	 o4BlJCu1QAO6UVkN/kOD/riO21Id5aqUOxuvXSiT0D9iZMJKdEShAjApSSj5LgLz9Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYvdmIps;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98553606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYvdmIps
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1731F00893;
	Sat, 28 Nov 2026 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795885218;
	bh=Y3PfFUIgJMoAWfd5I/RiTeT5f928Fa8/wrvzRBsDZKk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eYvdmIps7XN6s7cEdeqWGnbe8NumDhls4bwW8drz0fEo4bt5iAHEnhmUa1xsFxDPQ
	 KApLt/laJRFkyMa88s0EwL19liVM7NHP7q8XHhOwZzw900y9RB1HVHN0NzlpKBMb4z
	 vLqQbSS96/JbUC7Jw2pcY0Bc03+sptYgXMcRKwAn59xjPgmz2+Mhu5VsnCPd7IjCtV
	 +6024pmPWPI+ZqmtaKa+6QeljI3uPycWLXCxIl7SHR4bKOi3AiNXPUrY4m9pU4xQkJ
	 8HiTY6I9ksudkN2biMLclOYywqhS4ZUPzY1fUJCLDYmeDwCk/wuJxsgv227xQ7QBsK
	 EKfY6B2f96Elw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 719F2392B1C5;
	Sat, 28 Nov 2026 17:00:18 +0000 (UTC)
Subject: Re: [GIT PULL]: Soundwire fixes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <awqymSy1eNN5UMNH@parshuram>
References: <awqymSy1eNN5UMNH@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <awqymSy1eNN5UMNH@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-7.4-fixes
X-PR-Tracked-Commit-Id: 6c067677192f054bbfa815caf04f536bb8dcdee2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 81403a0a7d70893ca5073aad48ae0c8508ac6c1a
Message-Id: <179588521708.1983540.4285425584623141538.pr-tracker-bot@kernel.org>
Date: Sat, 28 Nov 2026 17:00:17 +0000
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

The pull request you sent on Sat, 28 Nov 2026 16:23:13 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-7.4-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/81403a0a7d70893ca5073aad48ae0c8508ac6c1a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
