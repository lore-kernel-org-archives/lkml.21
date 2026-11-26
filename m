Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795666662;
	b=EEsMomMZiPDlfbhGpCxdzsB9pm5mpgZFaXAqUVVo9Oti7VUHw+IfotBPQc7OgesRH6JP
	 cIJ9XavRoR36uihuNLzm50yXSe39lWHZMvgq3Cebtd6+PR+GKK9S8Go3vbmFWr/TWV4Rt
	 w9pBkWqvkaKl8Ax3WAFJ3QCufrZHDBaTEzKIWa9xzzfjHxhmnBUtduzmjwbfkjS0Zednp
	 eGxFTApaJBpwKbMXfqBG/+yhgbQ3Trj9QXjsq87jJVu0PkBHLOX38POKrQ7iRW2yzIWtZ
	 DCuxD49XaPAgIeeKcnGU+Q/bh+B+yzR3h+EHSTMnuXpIK3gA6NQLsUT4LZWBZ/pA1EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795666662;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Jukm7e1bDRdL9Kd+C281L1TzxHeieZuCgvIukgq1AN4=;
	b=jPhXLMUOJAea74wAOaQvse7jvRunAHrjmQZjyeonCUz8JShsfmhsRjhdUxYHwlFulDM3
	 PVpCFP5yS16ymiyjBmUNinf9dBBvnuOS4crvpNf5dfZNhPIU6CQWxZC+EhagsSPgBOG9S
	 oi4f46mhlTdZv76ADbJGA11YJLCD0SiYlfPJWDaQ/nJp48UZo9SX7A4xGCt5T5l7epiri
	 MrigW2F+u7Wns3pCoWzGMgjjevoUspbQZqYXVj91fsMaW2DAeVMX/Wooqi1Xu0McpApKF
	 4DCJwVJ1hoMcvwZS1sB9HDS+VNhhPRnDbDl6j4ljs4QPMMuIpUa7J7pq85Iqs5nDRnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZW6loZp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0896606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZW6loZp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6A01F000C4;
	Thu, 26 Nov 2026 04:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795666662;
	bh=Jukm7e1bDRdL9Kd+C281L1TzxHeieZuCgvIukgq1AN4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dZW6loZpIbzaUEmJ5C5KehlpGqdNHR9vSlE3rq7GT0Eg0IP7Z/oUmFeiWoy20ZSCH
	 TcwMuWZ74WOVSbB+IwU05EYSjouhvCvJcmg/gfxo43dkdJ7BCljJJ5NrW2gqrSmWYi
	 MrK1pzUEpKuNCB/KdtmgLi2ukLZdrNpBmOQJIdIMud6GZ2NteG6YdCQRkJA858jQGu
	 GPVox7L3rCRdhn5T+ARxzmifK7hnxL3qLxfyQkrHwv5iIp6V5jWOVcueMU1DltCP66
	 zyYEQ471HlNQkZkqgCurKJGGjKXA3ze5pEQAsSBBRo0I9zRGPth4hzlZ6jnDlcoUXh
	 MAdrUiHTTQxjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7738B3809A34;
	Thu, 26 Nov 2026 04:17:42 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1795651917544796669-555e1f2d7f002f30@undined.local>
References: <undine-1795651917544796669-555e1f2d7f002f30@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1795651917544796669-555e1f2d7f002f30@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.4-rc5
X-PR-Tracked-Commit-Id: 23c8af89aac3feb3867c5eb47aca5b3a2dccb70e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2bad4ba5bd4ed7075c7e874cd30c52e07a74c8cc
Message-Id: <179566666092.1492115.15703028320079296920.pr-tracker-bot@kernel.org>
Date: Thu, 26 Nov 2026 04:17:40 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Yifan Feng <evanfengff@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 26 Nov 2026 09:11:57 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2bad4ba5bd4ed7075c7e874cd30c52e07a74c8cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
