Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794946557;
	b=S2HDEmMYFdQ4gNxxkijAFOMmdoMW2I+20ligCcIbUetUADdA4pYCBcXgOwX414oK1LYP
	 fJ8gVPJoJk5xMl6YwJu8G6GC/aClxsZSxXTfCbogzNmsj1QBNQkADI9XpofhPo6qfSKVa
	 /D2SlsLqbF+fnmkp4jFs1Ypgwr2eXx70jcSDmmtLekf63SvoIEBEEo+I9D2xhH7JgIgU7
	 ZDnfuSLqj5ARMBuDvc+Z8DIKUx6k5jLa+AaWhxIwGFCHI9hdG3uReccdJLb/YI/iDUPSL
	 QbfxH+PoK/FgWHWj8bayz2zMKvSVU1fGq+ld2pHBgCo5c+QA1yhZOwyk3THlequ1t9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946557;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=C7QdEoEBNMtBpSoWEAOo7tchBWIERIkQfVXSNEETZBk=;
	b=Re77BLiuJcG00Y1u0i+4ZrbUP5FAVK+AxIO0KThiZx8IjAKuN4m1NGpR8G4UGwGxq42j
	 q5ZAEDyf4QJg4J5SmxGFQk1OumuF/vrXLOPkfU2CC293WCJv5mWUY7uEa1TxubruzWtTT
	 ntm+CsTgA4dOfBxp3SXB9yuc4rfXAV9JVJrlAflLk+I6YLatyWkDd6hk9OgwJjlcR4oHE
	 Zj34Iq1rvaDILKbWEzNjreuIeu+t4z8pisoIIFu6yauwSQrzfHwVobOvKq0A5+TIBbMtd
	 +SYlXhUZ1Ys6VJzsLstVpPd4QNHlWNS58jqDGFpB7wZnui/gJl0XoAN61vnKscNQprA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QilmzIUH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QilmzIUH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856C31F000C4;
	Tue, 17 Nov 2026 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794946557;
	bh=C7QdEoEBNMtBpSoWEAOo7tchBWIERIkQfVXSNEETZBk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QilmzIUHcNhn/w/U062PD8TMyx1B45UdLAW6bP45VcaIfP/dN82mKmsQHyddMt8mm
	 g3XcrdqKNJAcLgHeek1tbfCtOhy9BinHu/+B3arF+4Z1TShi49S3ptEDs9x3xaM/jS
	 kluafQ+gIAZVIhrEsu4DiIw5AFRq49pSCvOiYj9vrWbZjrL1rmbp73OOoJ8Vo2ZkI+
	 HPLqYbsi3wBx4hyKW1CUlim3Musq0rDNFwT8koxouWWPr+PQVeXMJgkyx3R5HAyPs9
	 cr6Ul4xbRE52V84oiW3EMuRw3iSE0ufg8kWNoYVqMX2CEYwBQU8h9rO3ebdcDeboeo
	 d78/1lUCVJ6tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7761A392B1CE;
	Tue, 17 Nov 2026 20:15:57 +0000 (UTC)
Subject: Re: [GIT PULL] Core MM fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261117123716.7567-1-david@kernel.org>
References: <20261117123716.7567-1-david@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <20261117123716.7567-1-david@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc4
X-PR-Tracked-Commit-Id: 25f5c92e1ac06496679ea229e5c825aa88968efd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 63fdb511c27afcebce797e3db580b3534ddfa639
Message-Id: <179494655601.800029.480627961511135182.pr-tracker-bot@kernel.org>
Date: Tue, 17 Nov 2026 20:15:56 +0000
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

The pull request you sent on Tue, 17 Nov 2026 13:37:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/63fdb511c27afcebce797e3db580b3534ddfa639

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
