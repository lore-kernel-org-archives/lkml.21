Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372145;
	b=zMa9cB/9LucrJHY7Px5Yi/EGfw6b6HV7GB21+HVJoINw9giuBSlHztu6oa0O3v4y312x
	 9uExhWE6ZaoGtXRFNsf9cooxFa7eRr0FcGW+0nnxAC76UAes/Qf3d21RMcrawfF32ZUx5
	 PB2bGd5KVqvnyYj8pOmQvXrRF5SFdd7lT0p3kYib5i+m5hvRJo1kMvF5b7V779qnUALut
	 NgfNnkHnX419cOYpptM1ubCrQlbr+u6xSapGwhKfLkm7qS5BK24Xc6svta1uSx+bqefzL
	 +E/uxyLphQES38XN+SyKDtLolMzEA2KipxGV7GbYvYgedwHD7KD2SP1Sgs7gutIHDoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372145;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=thXfVjEvsyJyKw02uUsML5CiC0IAbHNHi56ZUt8Rx9o=;
	b=skNv19vvjBg/o/3ZDJfieTbSvKf1wlnVIxkgGs60acc2ss+S7KuVhzjzMtOZN78VlH4F
	 yVGz0xCcCm44RoRlMF93pF6PgumdiRoy7xQNCD8bcMx4remNuPAAb3MaWQCL3tdM7U/WV
	 coA/5GuwVbqtfsXkinCGJVOmar7OhE4mtaRT5bFvOoVtzrvAZAyxPept1V/hJO0wsrT/H
	 tdxopDgCJxc9xIvN1YXJlDYQdhdXJPrW2XJR3mnz4iwpgoRGdjeeiQzoBdziWGo4tLbiX
	 71+M7+rJ5iqqDd+zg2hQPgsAyQAa/AihGpjBrLnczME4xhK+2tBzWo7LcXioaEksZmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjyFH5yc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E05606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjyFH5yc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078421F000C0;
	Sun, 22 Nov 2026 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795372145;
	bh=thXfVjEvsyJyKw02uUsML5CiC0IAbHNHi56ZUt8Rx9o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NjyFH5ycVf7tNH1TYXqkKGOiiZUYVQWpbcne5KVKw6SBlD/q1OSCBJ5UsFPnqdykQ
	 CWglFrwzzr6UrZTCoDNQ/wCJgURqnGivMVmWvlqEEjcyk3klIOrNcw80rJE27/o67E
	 WN85ycT/NsUA57ow2Zh4ywVXXoiMFnYHT2wnnMc23DjhBwOy/Vgw9M0xdCucx1Wksj
	 aKgXViakkfprq4mVjZz1WaRMxADNomMQNlaWTucDpuH3VwckPWvbQ+ueGRoA2N+hhM
	 ap7bYAki1bfLXS2Vtv1qmcbMFIzB36yF6YrztmWjHPsMI+RXE385Mh96TuGxph7DXS
	 p5SZYy9O5wMmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14DB392ED1D;
	Sun, 22 Nov 2026 18:29:04 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <awLNohm4diw4fYCs@gmail.com>
References: <awLNohm4diw4fYCs@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <awLNohm4diw4fYCs@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-22
X-PR-Tracked-Commit-Id: ae3398a7da224e1cb14a04ce8e9da66fc2948121
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2b12a0eed7a039da244963af32e1f3ab4f1dc5ea
Message-Id: <179537214365.1494759.7926525157054349867.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 18:29:03 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 22 Nov 2026 12:10:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2b12a0eed7a039da244963af32e1f3ab4f1dc5ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
