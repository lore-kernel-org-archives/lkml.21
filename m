Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295123;
	b=FeOQdsApLByO7TX3Z1pOrQyOti5T/kdMMwk8+wDLpFWlT7+X9jDJarQfYeRQYrnp+Ru8
	 TRtBEn3jHzvrKsdUYm6alrCDV95nRcLDTRBZBzfWHCCznm+HMK95k/BT2OVo4rlQJAh5N
	 SPCBJhDTwa+CQ9u5QlOQZihflHB1G/kjnzvIFmGE2VhTcaybPA55fZ3Q6FTE45yfK4vpv
	 hFc79QkJjEZFYxlX/BzCZq2myw6mx+J6mAjUqNeRPYcmMmZV1gNnlvYHIKpUU1r5MeFQc
	 VwpUFbMNdv2Heswwo4nb85m2DxUm1Y12J9RQdqys4ThGIITiwjJNgT9LFzmuaO5NHAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295123;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=kut3RnC+sJhmtjNJCZ9oinVvtWFuAO9/28dyTHZ3+pc=;
	b=wbhKlTCd72VXi2I+AjszTvKQLs1eLcv6NH3ANto6bLN5Gs1I43dxywfz0sGMp9b6t1HP
	 MVJZMVo6vikJMG3LeXVADrbIT1Fd27KH3dVwn/HWuPdX26pD1hICZ1zQAh7Ku7ohPOLUy
	 rUsAxLgFb55o+3kEZDMj2J/np8/RGd2iaSW7REK5Zkw5J3UCyCTGltRIH9iDaiOsx0bzK
	 FVpCNbOdQDkIie7Dt1bcwu9hb3wYQJU/aBDP4zd3sfBFYJwAhRf74j8SUmCnll0//w3F1
	 JvcABNxo3CsykU7f/fDq0lqbEGF4OD/XJRAGByCwOBZ1rs3wEuua1xJAPNkgsoHb2Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9Hd9qiR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFFC606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9Hd9qiR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460AE1F000C4;
	Sat, 21 Nov 2026 21:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795295123;
	bh=kut3RnC+sJhmtjNJCZ9oinVvtWFuAO9/28dyTHZ3+pc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=B9Hd9qiRrwP84tw05mnaamPACaa0JzLoTVI9KSQpjLy9j2w3SrL4+WL6wgVPPdNac
	 /tQ23Wk+VF26MG1SWB4YO6/Iqv+vekCHa1QoTrcZIRx7ysGJcxxCqFZeATiD1FQhmG
	 A8XExvxJf2Ff/6pvuQOMFwZJiVgI4pKZbRm9Ho56css7sfumZ6+x20R2+qJsrC2IEO
	 zVknB3PVAhJ7fx9DvCpzp7V8uUT1JS9X1aRONUPdXzpl/vWTtWOjS02rEYPa4bI+b1
	 B0l32y5+GUd8qlzRP0JRlVLih07WnaU3XFBejgD8qQnt8QnF7QUhpoageLWPdosKnB
	 izqj1nLwU/0EA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4D2391B072;
	Sat, 21 Nov 2026 21:05:23 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-7.4-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <cfa609ff-9ccc-417c-a816-56b364d0bf76@linux.ibm.com>
References: <cfa609ff-9ccc-417c-a816-56b364d0bf76@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <cfa609ff-9ccc-417c-a816-56b364d0bf76@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.4-3
X-PR-Tracked-Commit-Id: bd6d2f87c2239d10bf5f37ab52b3968565528417
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b7fe306dd86b5342d3be8a3f1cbf3bb1ebf280f
Message-Id: <179529512179.1171121.18032448255591519626.pr-tracker-bot@kernel.org>
Date: Sat, 21 Nov 2026 21:05:21 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, christophe.leroy@csgroup.eu, gautam@linux.ibm.com, haoxiang_li2024@163.com, kmehltretter@gmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, nnmlinux@linux.ibm.com, npiggin@gmail.com, ritesh.list@gmail.com, sourabhjain@linux.ibm.com, sshegde@linux.ibm.com, yadavgaurav386@gmail.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 21 Nov 2026 16:01:29 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.4-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b7fe306dd86b5342d3be8a3f1cbf3bb1ebf280f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
