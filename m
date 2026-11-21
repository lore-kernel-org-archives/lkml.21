Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303499;
	b=pm6kmTBs4GysDa+3Rnz4BMEDv7UkPIn/GJJCd/1F4T4MnyTc/fRKCMSd5b706lIwDP28
	 pN6sbybKGymf/K59JMJ25EVCZ410Wh79KyqY5O0RTaYt41nMpPFhD1cVzF0xI3Cu1AIfZ
	 XILAgwYDRR6YDWFkDI8+Ob6Zy3VjIdgAaFtxvUQcfIh++cOGp6qfHRuWbMSVbrQ2HG6lq
	 rCHN+4A8+FMmjL/kM9IYQn4XGzXHjjy7/+HQdgIBZBsc06bA4VlBYnp+GeWX5QqyPA8/Y
	 vGPa5LqBEmxM3gxaSP4EaofRQBspBXF2qwP6OgeMoCr8SoRsjcXjoIvWdbp7mtAj83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303499;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=LoUzMfo0k61oI4vQs7dqYReT8l0FvW5rHD7+sXlGUN4=;
	b=mRea0a+mO7199cI04sCyN14nowBpqDG0Po/nlewszgnbOGAvZEOZky4fpCc9vbs7XxdX
	 ZETGPhtaZSLBWxEMa607ur/ZnEvcRJ15kDOfgqPnQpKPoXzC6jXHJECd2EbOaEhO6XKoK
	 dbjPtORtfwFPcjC6bhVY3Pj/ze9d1U6H1rjnniAajIKr0G3SH4co+FHJoWbPeusXscTnh
	 AVf1TTtVhOtRwSK+U0sOsJQHft1eF/3Ex7MaRFUJyVBzuW2X3IatRwOJugw8FhHgimM+2
	 uMpRI3PTHVhOMViv1n8ApwSa3vsxNrPZlf2dVmaEaRchoUtAHO+RQei/ZEck9jQFI8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0cIeL3Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7F606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0cIeL3Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444BE1F000C6;
	Sat, 21 Nov 2026 23:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303499;
	bh=LoUzMfo0k61oI4vQs7dqYReT8l0FvW5rHD7+sXlGUN4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=m0cIeL3YLXg8KqO6+YcyVaqf+2qfLapfH6sNor769257zWRT0s0pjdJLbQiGBDvVH
	 6s4NsM/EY+QDMkSUBsFs8kyRupnqH4UzUR9B8XseTkH8e7zSj69mBVIcjKeyDpwNtd
	 oF8gZQrcZu1rrhA2LU5LC1K1dM7SjhoLdPaS2XD8qnrsVslpkFhsgkJ7syfjtMshQk
	 gd4XMwoP1J6bOI91uwZdhZiTM3UkofC+RRK5jH/1nmaz3Q2EjaczVADRKCXT2fgWo+
	 PJmp6W5l6TBxUlE53pWRb1EM2kFdN2cFIWid7E/RugW1dS7VBTozsam0usbfxoiAt2
	 of+E3KpQYmvsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A66C391B08F;
	Sat, 21 Nov 2026 23:24:59 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261121075739.3ad033bf@fedora>
References: <20261121075739.3ad033bf@fedora>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261121075739.3ad033bf@fedora>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.4-rc3
X-PR-Tracked-Commit-Id: 56ce4ed6316cae9536ea891d6686b92f1d930c00
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e572847ee4d074c9947e8367d150b81775a7e903
Message-Id: <179530349780.1207690.5348109516942334729.pr-tracker-bot@kernel.org>
Date: Sat, 21 Nov 2026 23:24:57 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, "Baek Kyu, Kim" <pocj8ur4in@gmail.com>, Breno Leitao <leitao@debian.org>, Brian Norris <briannorris@chromium.org>, Chaosheng Qu <chaosheng.qu.linux@gmail.com>, Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>, David Carlier <devnexen@gmail.com>, Jaewon Jung <jaewon8868@gmail.com>, Kyle Zeng <kylebot@openai.com>, Pengfei Li <ljdlns1987@gmail.com>, Vincent Donnefort <vdonnefort@google.com>, Vineet Gupta <vineet.gupta@linux.dev>, Wenwu Hou <hwenwur@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 21 Nov 2026 07:57:39 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e572847ee4d074c9947e8367d150b81775a7e903

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
