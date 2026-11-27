Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803104;
	b=Lgy9lktU9Q36lmVgDEMJuM0dEwI6sBX6nTrKa/1FOoHmDtS20vjjvS/NMHsB1D38SZGQ
	 OrOqgBj/mcQJdQaye/AifIR/m1wvfGU897wcRgQIvlckOJBHb1PMWBAO1jCNjRYYn7A3R
	 2RBIHGhhzVc4RFfF6QXAOupscRfekLUnmlrzPVggJIh1gqB3sNUQtWnNmi5OpdEBYhvJP
	 djsRy+f0Phk93VzR7HD989VL7+lKVJkCfsxDtnmLeG5yVKVVJ9/3uYvmu1PsLUASTH/uT
	 MJvnIG1SFs0uLSnCPYWlMNuNrHxOFyoZ65kaHmVww46MG49P9x0KAGimS4Fv5PpqzcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803104;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=mZI1nHXiLS3LtIS2kyFLrq5IYhVkSmZXb6W3s3piEKI=;
	b=Xsicdpt7QaHpIxaeKir9NjFAesuDpVdpDemhFth6e65xdkDvmIhlY7MUrRInP9CyU9QT
	 eKkFcHLdbbDS1QiPoqZmzB04OTDraIp0n/zz9QV2Be7y9EbDwJy4oD1sU4Z9ylikPgiPW
	 6z48YJeE6hG6pGsJ+qHJg2TlusBuLRpd3fsmEEr6Cg9F/7bR6Pn5Qg5NOmhyADGjNYCGG
	 qXvy4kdoW28nmS7xABqmpMz+9Gqs3sSj/VqVnzA3fgQ5jCwyK4W0v8w43++6e+gYIgxWu
	 xKgQUmtXu7OHw0RY7NpnA/tdyw7fk+7jYbRo2slGfIV8tmGd6DF0WyJD9/xdBYjKGGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORZkQSMV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FBD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORZkQSMV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0193D1F00897;
	Fri, 27 Nov 2026 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803104;
	bh=mZI1nHXiLS3LtIS2kyFLrq5IYhVkSmZXb6W3s3piEKI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ORZkQSMV07E9+XIB+J+IkZNGUQiMEFejVzwEmAGfyylLHhChzRf+AWGlSmMiP/2id
	 xKdLJRDJuLMQizCDEx5jUR5XNVK9y53TBLmxoTH9dOzUdi/7kAWxYn3TyHDEfcK5Ex
	 Ek984WEiJtwnuAdSESs8SS+2fLOhsTM7XsfPozhkwq8QoAqVT8swmEJUpowkGbyehs
	 hbC8zNxahnpIMjVXEsQx+raUP1imkSLHigmjB3vqUOFp5eEQufwITBt/8vM5MgaBe6
	 cM0k4dIzwNO8KblS4mS/5WUVs18YoHd4WdJpVrUNXvLUukYUN1VgqmI36pS6QGy37i
	 NqlbmcJtC3Rjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB8C2392704E;
	Fri, 27 Nov 2026 18:11:43 +0000 (UTC)
Subject: Re: [GIT PULL] Core MM fixes for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261127085928.3630-1-david@kernel.org>
References: <20261127085928.3630-1-david@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <20261127085928.3630-1-david@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc5
X-PR-Tracked-Commit-Id: 450bf6e1e7ece7ea8c0253886a01c663ea7bcc1b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f1b6ca3145a1179d88b0033a871e4e187da0d4e
Message-Id: <179580310260.1619291.6788259909947175750.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2026 18:11:42 +0000
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 27 Nov 2026 09:59:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f1b6ca3145a1179d88b0033a871e4e187da0d4e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
