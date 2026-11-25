Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649513;
	b=lFmrsnDoLBMGzggjD+N2FP1YgKUMxPu8tO2OA2fMwXpsI5a80s89d9AUoaeS915T08lj
	 5iewtCwFAN+JdEmRQ+gKYfhjoDPMT3AvqviNKiuGDEKaPi8xg3dDqFyG1Q6L6nwx1MUcK
	 1zemiyYEjK0pkD+GzpOC1b6terD0UOqE55JbSahRE5OLLlDVbQQzEkqp0SKhscaAL4CAV
	 MPg3jLDY9T5MvzgjMlEOrtZ8HfGaJYsCMAygvcTa+wnUsnn/EzpPe7wMMhT5oivbj278R
	 P6wIKqGc5UjPZJ/TA+cubFZpoiKTQQnZLTDLFa7UAlxzd2brEEs9TY3B+B9Bu+W/QBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649513;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=fzyjyF3v6kQJz4Pl9FKFrJjyZooKiHppEaDzAQL6fEE=;
	b=vrSHV1HyLvEAnlnpqZM6l5OpJNSVb06dA70F9n5RAwHpb+P8rFeZH28BP4GeHd166275
	 GEUFj/zLySFhC0P96AmzbG+lBEZDyyhj3JxVa2eQa7srV525O6Vj/CxWVUCcS2vkobGY8
	 pYAl0reuQ6x1ub/0kjEXPQ+zKMjNUdna+AnhSj88G2SmdPpP8cRDpDyc64d8qhcRCBM1u
	 SBSuDiIYBJB7eLtqoYWZPEaK5P/h6rkRZY5mJrzdSWiCuJadqJeCWKdpDeXdLWE3gPLlR
	 nqRs3/LtYh/GlFEoz9KcT/1dqYMfpHaxf6wCpScwoyFAzTfqvNuTwqC46V8IB9Th2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l2E/00HX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5BB606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2E/00HX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DAF1F0093E;
	Wed, 25 Nov 2026 23:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795649512;
	bh=fzyjyF3v6kQJz4Pl9FKFrJjyZooKiHppEaDzAQL6fEE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=l2E/00HX/HuFI5xdwrnccweBfAWsPk14Wxp5f+QkhyBhhUz+kclvKo5MdNSrKDyAa
	 5nUF9scTL6dUkKQtanF38ev9h1mKlv+FSawMl5Twb1FE+UYoKHUhhFsBmw59g+bKUB
	 k3BuEtB0G/mVQIYEL/x/GV+MYiZM3VqNDULkXCFriVeQEnkNeTCNZzYq8HW2uosiWR
	 f+3umzKy2ob9Y2t9WlTPAETD5rzKBz90DYtysAMZB1uDqX7TEWPPHfqtR7tmdfeubG
	 1MTlNtRKT8Q8YkC5A+tUOxWKusIbxacFPFQNInuQHxKBk+Y6v42Nh+7c90+DqYd077
	 WdUOw1NCsmy8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9ED5E3809A24;
	Wed, 25 Nov 2026 23:31:52 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: Fixes for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <a2e42572c7ad9f7b1fb7c0aec0e60152@kernel.org>
References: <a2e42572c7ad9f7b1fb7c0aec0e60152@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a2e42572c7ad9f7b1fb7c0aec0e60152@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.4-rc4-fixes
X-PR-Tracked-Commit-Id: edf1066ba69c89c42c3007e4230c7b9cb13405a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e1faf0ed38d4f9b4ca75149428c78cf954586450
Message-Id: <179564951136.1391833.6621310490363874421.pr-tracker-bot@kernel.org>
Date: Wed, 25 Nov 2026 23:31:51 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 24 Nov 2026 23:25:44 -1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.4-rc4-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e1faf0ed38d4f9b4ca75149428c78cf954586450

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
