Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649510;
	b=L8Ydd2zWvOBzR6EQegKRsWtari2f9aWtNbV68ko0AqRR0rGOqSnEUmfDHWOJJjTTg4vi
	 l3+G+t/t9rLbTbencQ3mNvM/hXWkQ8LxJRlXHbCKuy1zY+sbF1bil4lutoGtJk9BLTUiM
	 nJBGkiJ2Do552ggKCxBm0mbmZLX9ISwr1+oKuuPOAeho7nqd8KPFV0voIOMtt7S/pJC+n
	 ceWmdgq5QvZ0fcs+Xj8Z/Nkx7/N0IoAeuwo+o/waarzs+V4PGWn/L1lFIHieg3mTkc9Bl
	 cabngyZTWcPSww3UkqVXSMCTxCF+ZME+pAgRvYqvfiUuTGrZyEczZjcifJzbWENcXLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649510;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=7K0RlbZtJYEcUlqjTFWIEdq7evOeBOoV9pH2G8KDC98=;
	b=Z7METu43cu15TNhP4RQBuJUo87RKr7vkVM65HbEpep2Hln760bVs8ojokkJu9YMH8MCU
	 VeL4EvZPYxP+oh5eJcBnaeP+d92fcl7Rw8PQgc8TtUPfuHY1EaVDHQK2tfODEqi05g4FA
	 oJakYIk+eAdIQNV9mNpupvRiaZwA9oLgGkWi0Lz+gPavNtxMAneaqd8SQmZq7ymE/tDgc
	 TVrvjXd/XqlOt42zcnp9NIJytxPBbp00ecb/NVgwNAp0aUwysOsUuLWnaSEDnf8n0mqOS
	 +f5fXHLYLW4YsaN5ALx/kamsaMjcfLE7bPnGCHITwwLXHWTgGWj3n3IL2A2UW2bT3MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kv0WNISd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4962606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kv0WNISd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803351F000E6;
	Wed, 25 Nov 2026 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795649510;
	bh=7K0RlbZtJYEcUlqjTFWIEdq7evOeBOoV9pH2G8KDC98=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kv0WNISdxBHF+/N7sHlhHoqW94U9cynpnkkkBHYTH7UH8Xm6CyosuexB4phrKOBBp
	 KbGZb6s0hg4ujPUbnIkF66FGc+kkngeGysgWBnyRZGReq1G3/l1g1xp96tLSoItxvj
	 1PZMSQzI2EaOE6wtTEjpxkE6omre/K1+OjbGb0Jz1UfzxHuA/pU97oWTQJhAYWY7b3
	 KBwS/18GXOILQcCRZYMe4f/nOS1GISn6oAFIhlT882aK0Ipp6todrDz4+71Y5H4c5z
	 wHBQqNkSSBvq1y7tnxLcMd+h/h631TcHAZEr6q0v8MmF79BaMaK9d+dN0SQVhvq8Pr
	 x9ezkNewOuArQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 777833809A24;
	Wed, 25 Nov 2026 23:31:50 +0000 (UTC)
Subject: Re: [GIT PULL] bootconfig: Fixes for v7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1795560727343817219-0253da6e82c1cf34@undined.local>
References: <undine-1795560727343817219-0253da6e82c1cf34@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1795560727343817219-0253da6e82c1cf34@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.4-rc5
X-PR-Tracked-Commit-Id: 56bb11fe6aacc7666938e8e6765b44aa0cf1fcdd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d4ed0e55cf54d9d05b5d8603593125cadd2e3db
Message-Id: <179564950890.1391833.3062405117792736641.pr-tracker-bot@kernel.org>
Date: Wed, 25 Nov 2026 23:31:48 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>, Zhu Jun <zhujun2@cmss.chinamobile.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 25 Nov 2026 07:52:07 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d4ed0e55cf54d9d05b5d8603593125cadd2e3db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
