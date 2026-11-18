Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969004;
	b=uAZcGKwpvH/jxRQ5k6ChmoDzZv7w11gCN1A6q69i21AmljXjg/eaTdd136QyiQ4BemLT
	 zkdtEZAHImhoM6VhnGQts5NKoI8OKkAB0wp8vyToZB9eZ2eDgZ+eTzzU3XABwdhAWdmFR
	 UTnmw3U54giypqatXig0S1dml2KtenS0CF4DNY/oxAjK4O5HDRdGmu7f91OMlm/VLbzyr
	 jlV9EzmNX4vSOi/tqiec8d/6Cn4d0n8AG5/Ydw4fiSVCbmf+O94kc/2nsou2Q86R7BH6J
	 UP5MAVoGBDxHTAA/43abf8u1L5SfYbBGiEhotcSDF0I1HBdaNBbiHjBez3xjfIUt/kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969004;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=12uYNWixrNxChlP2U/vVzYNoiX0h+AZW7KfjzyKi3nk=;
	b=GTJrfT7S4dXRwinCG4bfvbHxV/u4za/p7G5f5Ofgy5KJJA8muWNdDXw5zEuVCgxPHT9M
	 IytMpKZrpLBtFuC2KqT0VQWRjX/i/QlqczFy9hKNwlItXH53FY0YOuXeXFHATSwydBaaU
	 TMWIA1XRqmtfE/XDc+oH8up1csr04QJTa84GRgJNnCi+YU3Cbf7z2eaRg5PuRi3HuX7R/
	 865zRhP1WGQFG9set9eA+JTYqQTUFWLKVa6TrjZcBq+29eyEvlLzwguNTWEDhnZJm6RC6
	 r6zmRPisWnF7R+4WTYbXgBrgDn2kttKla2KTRTSoT8iikphUVE6oZh5zYCquYZ7lFLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMch4Q+4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D59606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMch4Q+4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CF11F000C4;
	Wed, 18 Nov 2026 02:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969004;
	bh=12uYNWixrNxChlP2U/vVzYNoiX0h+AZW7KfjzyKi3nk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ZMch4Q+4in3qHAn9+Bjcqf4S35pIlJLPAz0/D2krvkydHNha0cRnPx33POjMmhH50
	 YCmaRwfT/s4BhCABUFt2Dklex4WXK8jnR3k7NXVUuPWuJCB2caFqsgtKcl7Pd0s7VM
	 722aFG65H15JienM/np58mjfpIVJmjBRnfYnk8gJen8Csk1+LaS5O2a1NihmFYI71h
	 jr7WJvfMAb5OHL7bYmlDjjJM3CS48Xm/VJSujVgjdU1L3B7aNZ336rR2q0Ny+LQvvr
	 TKHHOgorG56Tm1smKY/AwgpidOrEkLwtJSn0qcKXRdHHq/Ex3egqPlNcV359ZYo4Ab
	 y+eRaQpT2T9Yg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A397392B1FF;
	Wed, 18 Nov 2026 02:30:04 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-7.4-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <6aec7d43-7c12-413e-a73a-3275a1ac79ad@linux.ibm.com>
References: <6aec7d43-7c12-413e-a73a-3275a1ac79ad@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <6aec7d43-7c12-413e-a73a-3275a1ac79ad@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.4-2
X-PR-Tracked-Commit-Id: 9500416c8aa7c271b85be6a0d5856da62b60223a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ccb044c27720d48175577080b851f047ddcfd1c
Message-Id: <179496900297.1415040.8395913757600607238.pr-tracker-bot@kernel.org>
Date: Wed, 18 Nov 2026 02:30:02 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, amachhiw@linux.ibm.com, brads@mainlining.org, christophe.leroy@csgroup.eu, gautam@linux.ibm.com, info@xenosoft.de, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, luiz.capitulino@linux.dev, maddy@linux.ibm.com, mdshahid03@gmail.com, mpe@ellerman.id.au, mpe@kernel.org, nathan@kernel.org, naveen@kernel.org, npiggin@gmail.com, sashal@kernel.org, yaojiale02@163.com, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 18 Nov 2026 07:09:33 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ccb044c27720d48175577080b851f047ddcfd1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
