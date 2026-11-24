Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485394;
	b=duEWpax54S2KpYaT4MuAft+J0d30TLXrNAZDYRAZ0lAHo1PmTynNFL54EocMeNSPxhO2
	 wjLbfE0J18zZcb58JPTYf90yvY7vwBgBl8nTEYOyLmbRGi8SDNJpK89CvJCvurKp/ax7Q
	 4CM7PhhTQ5CVJEUnI9c6l6/VoK7dTAYsQmnk9mHoiCAnTQy9HkuwVpo0Y9hEmWfOoE5Al
	 FjCg/5Bfx0A9UzJG4iwXHsg4PWvARralbURISP2ct7/iw5BOVuNCh3WOxm8VBOnBqjznj
	 JuGzNyCNnbw0ITp5m8ZVsczWk1EBIqEzFytb/U7K7CEe3RN7InuxFydP8KKet3whqLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485394;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=/5iL59Q/DZFuMcBigTjLcPV/T88HOcNOl7mRcmngm4o=;
	b=tMJrsclKSJEsysGNeRkQF5+NlMSTTm4PjfVapfWVV6crPphCSyg2UDec1mjMju4+c7tk
	 sVCbfAdB5TJrGGbExRKt/Q4C6ST1lTClL+w+Symuz3EKReylJJty3FKiUOxwrmlNPz+Uy
	 fTWsrEl+gyv+yoH/9i1lvo+2ZBoAewVMZsWtXsk2+N9TAlUxWAZG5J3iPOxVDQiE7aNcA
	 Ek8UmOLuHlzxF2unCsFHN2fuQV8FlAFlIcCmim/Otw7mwd6N0fEJPo8bstirvwhdoVjat
	 WByJFwVMB1wnOxeKkkYMSidLGJo8qnoeF1bsAhz96dhenfkVNuv+hXrknVMgSfxX5fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iTXIeU/o";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE98606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTXIeU/o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818D31F000D4;
	Tue, 24 Nov 2026 01:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795485394;
	bh=/5iL59Q/DZFuMcBigTjLcPV/T88HOcNOl7mRcmngm4o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iTXIeU/oypxT1LtBc+x0q6hLUJ+/59aoZM1PtVU+cfas4lwN+njQ7FZOUGtQb70GI
	 J+R0hl9gzVthqKKXqdaWXUU1FFNZ0Cotou7DAB3zgmw5MTNBjARDoLewNHXSDRnK2I
	 AS6phWBp6a+zCptVK9A9Utaqp3D6LAPFizABKrg36Pbl03lD6Q0ZYYjI0P0RNMh+g6
	 HnPB5cpQ72Nkw/jrmC/KwKWni9yczSEGe5hjZwOBX5A4+dBFHxnx8gVMdcH4H44fjl
	 4thqWGwVrbFcOw9S8R8CpJZ5AdH9IuEjkXanN+VGaxQ4hr8xX6XFs1D+KKicVFQlA9
	 fCxcUsXB9wQFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7753639302C0;
	Tue, 24 Nov 2026 01:56:34 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <019pr649-8s0o-np46-4p81-2805n9n9q54q@xreary.bet>
References: <019pr649-8s0o-np46-4p81-2805n9n9q54q@xreary.bet>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <019pr649-8s0o-np46-4p81-2805n9n9q54q@xreary.bet>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026112301
X-PR-Tracked-Commit-Id: 10bc1d627c297097cfdc099377f8a13efdfffd86
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
Message-Id: <179548539307.3226620.17220212583954224373.pr-tracker-bot@kernel.org>
Date: Tue, 24 Nov 2026 01:56:33 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 23 Nov 2026 21:41:04 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026112301

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8d7fe9885c62fc9a95bf55d9db244d9672a8aadc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
