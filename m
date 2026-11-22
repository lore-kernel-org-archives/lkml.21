Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372143;
	b=oIGof5JBKv2OJjFHoXhaq6Sdx54isO3Is5jWoxDVnDOVsuNW4VOIgcOOqOsevNq4tPvs
	 x4sx7oZgLJkQN9GkIsoyKq28d1W5Sg23uX/jRq6mYYIi/aTrk8jh6LG4Ig8ap7X9TohVg
	 YJQCkMHEWwOq3m/Lj3mZGBR5Jar2PJAUV7F4XPYRnpzZndXVbZBxyHkXsPOd0EiQ1YpbM
	 xPxCLP+qSJHcMQiu0D3pozNGZJUnDWkmsZj0i1AxyvBaMMEagn+6jp5LJDLH3sAuSgHrm
	 ooZPY5f7Tr3MFgCfn9+ujBnNk2Wcpf2wa8qz849NVEjiLGMnOndn2W/ptXv5X46Ugsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372143;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=1mpOKB5adOiR1Aep/BULV/tBQmlPw92wYkbbi19r5Qw=;
	b=tfTG8ubAkYk7beF7xloYe4WsdtUCyVjDAUs448SEcuhRl8KMbo49VVqNCdrCkowBBvTU
	 HmF0b8ZHM7T5LapfPmCmH3T8ZJs52NRnXT8Xz/zzUqAZgx3w5EkRcOZwwjwJkxUnNvSuI
	 Wf0xfZVmLI31xwgMDQgq7WBifY8StyYkAgyvcEzhS/MbmbK4skGfEth/g0cwHfVpGeOrw
	 fUQ3QH1ny682UAzsKnZSga8FAP9BWMfHytIGu+qsODKoNs8OZbKJJrAXHJ1VHDXHaGSCy
	 SWhIb2cSfNtz9mKfhwGp8nRiBQvIx4ROz3HlOyiQmv7OAqR+KL0ST1zDUefraSRbCcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqcsLxEt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63673606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqcsLxEt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D9C1F000E0;
	Sun, 22 Nov 2026 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795372143;
	bh=1mpOKB5adOiR1Aep/BULV/tBQmlPw92wYkbbi19r5Qw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MqcsLxEtmA7AOqAapGUzR1R5EogxwFZVJTmsA6R/QUJteu7hlJxcQomaQlQXXWmDd
	 RDhd6uAvHKL6wLAN3pITnMkVxiWJqoRJFJe5t1k1XhoL98HdiKLXieB2Z7quV9i46X
	 As289ogSe7UFDDs25lLyEySGXAWblv5kgmKqU7m2YcqfP1wa75JTRy7dcGQQeL1DkM
	 U/Ju3AWhVDB/gFvEtlA3+BE73kZulYe0op/EMnlnRrK3DtpCm+YNN6Icq1whkwpSW2
	 uqlZKGphfGBG0zhyTA+ZsLvfUao774+l8oOStK83zWVj++pGwyZrDQHBclEyghbpwD
	 hsz46l+lBCUdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1585392ED1D;
	Sun, 22 Nov 2026 18:29:02 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <awLLjKQ1IUKuQ3eb@gmail.com>
References: <awLLjKQ1IUKuQ3eb@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <awLLjKQ1IUKuQ3eb@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-22
X-PR-Tracked-Commit-Id: 342fe98c34311969950fa58a840fd0b95a16c9dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7aafce4af6537d2202301a0319a4150e8d97eade
Message-Id: <179537214167.1494759.8219757241038056433.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 18:29:01 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 22 Nov 2026 12:01:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7aafce4af6537d2202301a0319a4150e8d97eade

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
