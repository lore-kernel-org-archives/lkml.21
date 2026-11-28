Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885220;
	b=fo+kD0Fz1NAn/Mu1RUOOA4dwnMlQ6W6zX7tPL2h8Aiib9v1zNrJLFl8i+znbDS3s0FiN
	 BuOLwLLTWRZCweljt6I2fwtO1AhUJqVeDEf33WEzVGSH9lZypvra1i5maG9YcVeV0kep+
	 ykmeh0UWMvrUvgNa5c2eeifRhbUPA/AV6eDK7uUz5Z/H1kyE6jBYx+ac0zYg21uQXfuYl
	 fR3gCPEKhsWAnuF9PWWDjQ25F3E10euDO5veSQBATJkz4O3D3NnuVYzLBo6oOW2RVVKWQ
	 qEapLfH+2GnCyqBqMdFnCvnj6PLYgYaC8+iiLfEwpc+0q0RbsM5csI2MvJTPR1fhnew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885220;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=deNbXjw7csFfT4ENXkqyPZFCORZqMWwh3nn7D4f6lxI=;
	b=m8RYUX0KkSVpEGF/+jh4ZfAg/6yFC5OFxHhXpfqkpU8DVHk+uoQEDGc+20ikPQ774dpL
	 gn71lt6e2WW+FywNcxP/amPv7uiJwJjLTv7SWy5zLSR92769Q1NZzFMTCOix281SE5peS
	 bFtSQEzGhWNiZm2SLqGMF2EqtOHsG+zTZmTbdhAh3eakBjyUpagMdntyYeDRlw+N4g6ti
	 fPYvp2rKi2mcqC3EI7V2cKy8D+SjAxWax7moRwWDrNNNS6ftKYFoIiluq9O5f3T2ckyv+
	 Jy/v8NJ1RIGyvDRvokiP9i3yaSmGPsxgNLIct3B9zI9e9a9jpoNIJTZxDSrWb2O30EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lZeS6AuS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99FB606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lZeS6AuS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F361F008A0;
	Sat, 28 Nov 2026 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795885220;
	bh=deNbXjw7csFfT4ENXkqyPZFCORZqMWwh3nn7D4f6lxI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lZeS6AuSt+x24c4objejJYSpdjt1t9eARufc0gzVCH2NC6fMF6/9Iq0UjtJs25vqm
	 UMb4MLjzU5gN8skG4XXF1ZrUGXT5XN4fc1kQ0vyziua5Mfk5KPvziJV851dBeoMp3R
	 fhlQTY5XcImeQPo8Gj2SZE/x7hv+v1GvlV3kbpcQ3G1Ebc+JFRWzZmV09Pv9qygj/h
	 idD3G+RsoBzSURU8czNRG2j9h5NOEyL6Ah9KBjtCAJWnoAS3/tGidU/mUMUOQM4cdt
	 7SxQX5PjbpPatyH4dZ0yU2U/x+jWh03BXkQNg8HTHYgAnHnUwVNK7mtRFb+h2H+e0X
	 H1TkzMcqFNyJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE7C5392B1C5;
	Sat, 28 Nov 2026 17:00:20 +0000 (UTC)
Subject: Re: [GIT PULL]: Generic phy fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <awqzCpEEkssITBRQ@parshuram>
References: <awqzCpEEkssITBRQ@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <awqzCpEEkssITBRQ@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-fixes-7.4
X-PR-Tracked-Commit-Id: e7d2f93a4426ea6b33dbca1ce585a9876e3a7344
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa65df6bc62e6380fd76031fe15677c9c70c1484
Message-Id: <179588521925.1983540.13891095080970972579.pr-tracker-bot@kernel.org>
Date: Sat, 28 Nov 2026 17:00:19 +0000
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

The pull request you sent on Sat, 28 Nov 2026 16:25:06 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-fixes-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa65df6bc62e6380fd76031fe15677c9c70c1484

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
