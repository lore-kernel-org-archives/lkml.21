Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972608;
	b=Qob7+xL3syEhiJoQMEIZa9zJI1FdsgvxkONPX9tL8EglFBc8Db3kBbe5paXYl64ILPxW
	 tX3CPftQGoc6vW8CLooFSNdMMN8JZiII2F5OExGLBl81frw5skQ9q4eTGQ09j374jlFvj
	 GGjIOmh0Q1pIs0ZFGt5y/MkIDOMkfQkgsx32J7s30TbsEjoswf9ifg56eySdL1+/ESZDz
	 Io2MPYLJz4dCT+mtTeM7+YOs3vy1z9hf0GnYexhcmXYmLm7vmkjbyD5JZgNgVwMLXPNIu
	 fiG3jijPC+E8xQxC1wI2/t4jl2u/On1qm36tlVZOvIFFzSqFvOftjHb3LGNsdyRcnmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972608;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=WNlKUzO9dC46ENgjAOmyvbq0eHtwGfnbJtRGpMkd9ho=;
	b=c/uIPeYIX+ZKHPitJtnAaPNGkVylHkj54f0uxRZ2xDZfS1LAIr62oeRuqsF5svfg9SLd
	 LGLH8Z7nJrsWSi8HnPf6lqfJ742LcRwMkfM4W3aWuST98t29nrtURWCHx6rt1mRu7LZfj
	 6pKiH9bWkMKOrcnxBB5vSKtt7503oiMiEm5BYRTmfDhKP3ZGfl5R8U1SEvp9SyIdyusGm
	 bfmjCwW+yomiloTwJ4cLv+2pSJTqtHacXDJWTcuqIG0g1qqDw7d2WU5oVydQc8qrDsSR7
	 nUt4ec8nZw9deNWdsKIBuUTiidGckNIpRb2/P/bcNWHWjLto1jOm3QC/Vo5QGB5C/nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQTfpxAd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA99606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQTfpxAd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882E71F000C5;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972607;
	bh=WNlKUzO9dC46ENgjAOmyvbq0eHtwGfnbJtRGpMkd9ho=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AQTfpxAdzkAWaKRvAGuthxrKOG0M5PgmFZnI0VZWjxpGqzxVAWiMeNGeGfFI0sbbM
	 ixVOsPrxPtuKOcxTK2hjfmlSLVcM0gUK6M9+5qfwYOJQa1XmFvPyKK/41tP4FMMFna
	 lhtlbHFd4FI8J8tAtMz527PaN8jrg3IQJl6Sc88vHQK6AibjHjoPfZg2tGGDu6tcbY
	 vyvRyEVobVEHh/cuwZ/dQ+MRpaWW9iREES5jwu40ylBa/wR9FR5R70w8ZFl3kNST7D
	 emz2MD8Y4+oxVUMxhyGDrz5nKxDJQHgZqAyrAybhSTnWpKW8G27tsQSkAp+/ao3uiW
	 GB0cr7Byg13hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 786B6392E983;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
Subject: Re: [GIT PULL] ARC fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
References: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.4
X-PR-Tracked-Commit-Id: 603b4fd69b4e77770761ea03451e2164186f8590
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
Message-Id: <179497260635.1442024.980012530592780252.pr-tracker-bot@kernel.org>
Date: Wed, 18 Nov 2026 03:30:06 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Michiel Derhaeg <michiel@derhaeg.be>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 17 Nov 2026 18:41:12 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
