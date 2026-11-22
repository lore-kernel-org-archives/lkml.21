Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386007;
	b=Xl01bUVKe/6WS7U89VkHeSRSZ0qjGVfGaLF3zz+UfEWhCs21N7FeXgGUfNzYH1J1gAhY
	 r2Rc1Kegz05a2iDHv68qrUeb0fluAS6slgogJ1Nara4l2sMiRG0qp3SzeMBPJsQeABIvf
	 ppoR2wBfiKqMNq+Bi0MZU58mOl5oX9VTFpy45EI2a6+cbfn+eTd1090x5kI6hrmXm1tKi
	 C5dUvYFlMZhnmULsM24NKiOVthhST120dk1HuRehWAi6lN+EAximXogswDlfOmC67vY1H
	 nIo6Qn9VbP8X2zkPX5RINFfmbf1JoU+dwcrfSzTw1unBJKCP38ZhoaW6UJE1fSWa+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386007;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=31voirlrsAS43ODOjI1pLUmCgaQXFpHHLYo5ZOJd8Lw=;
	b=HwhpGdfiia4eyeEZXOX7FqmvyU+nS6W7KEZ6syAk0J0Q3kLby3HfnEgCiARJVRupm0Nr
	 3P0TxHJcjA8jKcjzKoMlqJBId0zrIdfyVf8WMSuh7n87USXYTgaCz7mgSda/3Sx3HlMdT
	 b2AJJN2Y0S5lQYNn34cYeZUmO6lhEGKaQVcKB72S6olITGIYW1t6W+cHpz0IzPmiCLjPJ
	 mLHpklf2mEUNe3VpBRJIYmcU2U0UR/mP/nQCQ/yNHnGXkWh/G4zTtyLrigEK1k3cNIYZt
	 nf6aKoRgbAkewyLc98QSuqrpTj2h4tQ3U0KNZesyuxl00ENWsc/7REPZz33I4vd1tPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0GZZTFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43EC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0GZZTFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08031F000C4;
	Sun, 22 Nov 2026 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386006;
	bh=31voirlrsAS43ODOjI1pLUmCgaQXFpHHLYo5ZOJd8Lw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=k0GZZTFIdDav9sOaekMBgnd/dI0rlRHH+ZaCqlxPGNam2/LKzxvlZhfFarortk0qz
	 hQRjxxKpwx5c7elJgPo1JxWrtZzmxeAT06baXqwuV7hxs/frBF3KQorhTgbIHr+432
	 aDuaxr+jhtPQ8CTC2O3oTi2dR32oEnqszv+WSOLh9DagBVrL80xc1dr4I6d8A0t9ow
	 jBc2S+U1uRlBBII9kYqxA5ScKGSNckUmT1JgkQCf5WplaxHi9LdZKM2jyyiSp4TN9g
	 Qyol5f2IwOYdsC9kJoJYznnw4Jh+eWuWBzbvXwrsngyy4C0AXc6DZrABsLB+M+yKQi
	 arSc8FPBD22Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4714392ED41;
	Sun, 22 Nov 2026 22:20:06 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261121122938.B669F346436F@traversing.sirena.org.uk>
References: <20261121122938.B669F346436F@traversing.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261121122938.B669F346436F@traversing.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc3
X-PR-Tracked-Commit-Id: b544ca82abb46f2f870d32b3d7cae6ff9d9d1311
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7adedc3fb0e8a32a8fd7028b1c5547e8a92c512c
Message-Id: <179538600537.1569645.8555340154917694163.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 22:20:05 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 21 Nov 2026 12:28:40 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7adedc3fb0e8a32a8fd7028b1c5547e8a92c512c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
