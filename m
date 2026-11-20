Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193433;
	b=gulKSR3PBOiLfGl0IQyUxIg02fyYX86zyFsKulNSQt1rqCoOFKRCzgZn23LlE6d4AO+0
	 btsKiYvQcZGPX2TUCgbwrSr2MaM38Ph5jdpTVSzW7DkPDs+Kgj+fW83r8xaQLTBlyPQ1i
	 DqZ/CpZ+8ZD0eG132qp8R1mk761O7/VlDO/yQNGmdEBXKUQ46jiyen3He8LiWrai/MsV8
	 YuEAxiW43vRtM1T8Cg2kv9fxdWU5P0rgqd8xJrEKXj9+qhMoOdBXwJOVS9I0mZGVKN30/
	 XeMoOmHe/gYmwVUGr1s1/lwQ6+CjWU+IjEM+JbF2DzoVROpwzzpWYYy/ws6k3sOBW4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193433;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=O3z/YjNRpS5G8mbWaqpg0u1Kze4tP3LKxONUNxMarIE=;
	b=jeZt6HFBUTX7eqMFRuVS0x6mR0HNB6dLdcvL/5Cfnf7OIjV1GoLEGdYHXNLoHgeai7ci
	 +JqzR5w+rcFNg1aHwc857gHZBWg7ikiiWgbCOts6YHLQaufVA/uzJ8xXxYNKwsbqbVrFY
	 ooGmMMFJJBvYZ+CKWWMTaZF+ti2ctQaoc7rYZZPt/k4W3gm0uv63Hb/s0HWBMgPy5/oqw
	 1ZzOzK/hIuIVGHk3Goyz5eov8w8pprBD0o/RQBjWXMosYXAe5N60WGmP52IqPy1Eh831g
	 OCb5v/wq4SRfIYUD0/VPq+z3bmdKPFMQfcggxxrgnsFXWSB3hzGg9VMjJEq4H1e1P0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrYGeKSS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537D606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrYGeKSS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D121F000D0;
	Fri, 20 Nov 2026 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193433;
	bh=O3z/YjNRpS5G8mbWaqpg0u1Kze4tP3LKxONUNxMarIE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KrYGeKSSQantiK69vhzz1FHjutGUcYszeC1SCkSTXxvDJs0FNp3pninW7zhb27SZI
	 rbHHOTn+CIiSP4anzXQYLRrIXHNM7PrxlcgQ5Amxihdnhub6dIInRmU9Ta5U8oiUFI
	 Fs2C6mmHjZfKyroa4kEwYByG4fqc+z5chhLA5YvOEtDsTOmSHJlOhhPlxYxhRhehnf
	 mdcr6ZUbHrgzhWlBDSbizXxnZn6pnYB0QBSf0tsVspjUAswZvdB75RGidn32XOliAE
	 mhSi4pK27uHt1iHBW9hCisfcxp7qQc/b70wAUWUMWo4ozrZP7My7gRcqjZEYKrpJ+J
	 8lZniAVc8xFZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F420B3809A88;
	Fri, 20 Nov 2026 16:50:32 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <awAkCf3K4x8CtoKf@arm.com>
References: <awAkCf3K4x8CtoKf@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <awAkCf3K4x8CtoKf@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: a041bdbe1f3a8efa8a527a89c84d3771232b4942
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0f871bfb831705d9f55479f5b2b40f636ea7b16
Message-Id: <179519343151.239574.13635395153686926411.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2026 16:50:31 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 20 Nov 2026 10:42:17 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0f871bfb831705d9f55479f5b2b40f636ea7b16

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
