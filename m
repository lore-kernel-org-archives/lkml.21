Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834633;
	b=XFZP2dkAqKkQupr4H0HwRPZfevSqu1DSKGfBR6cxqIUBBybe8L+AEcR3k2trSUe+q5Kf
	 IrrCpoJaZ9HIXni2HgKkKpXhyJN9oKoshtj/wKsNC96YPfWYpECRMjgXtqo/aqcL6agxf
	 etzZqxuiUygmx+YnvtCWH0D9fUX1hoaH5b4JDaUwrEEQT2Hmhw+Ivy8QApuI8Itlh3D4c
	 xojvIRlszPPUcJMy488gaX5aTvH8l42/gJqqeW+COtWIq4Z1rwy+79XTO4bcoebjoVlFB
	 rrip16uu6tCugYxJfEVWaPuJAS83kmtVNqWZnZCtOf01ShMY0PYHlWkBXpvcS9lyJIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834633;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=TEVRiiwR27pO3qj4uIut0otLLl5Ia7Ba2IoOxSLJZTQ=;
	b=ZGq2zcEzd4XDWQJ3NdvWtwimGKb1ZXHrcMBY3mifDh9odUej7waJ5d6kop2RsSRgNzLR
	 x09zq69ghPjwiIpzAOj8FTyYCCAXQZaG2nkkENC0jseLmnaWjAMq3MVuFWO/Pl61CDAgk
	 +ITvAPCHzySAXApC7aUuUTt5xl9YsAYfIwJixSfR4DgWXUliVPwE7s23w2buUi9EST1/7
	 4joGOW1E2j7JKPjSHBpq2SPrpxJYuqir/8WoW+Jjhz52dDEQsWGn5eKPYF+2pUElD9gzm
	 UaciApyXnyFsdyX2Q32tldsNZJrk55RI7GX5GuUaxEgeMZiuzoxkNzZl+bzSGLlhHwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGw68F6F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428AB606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGw68F6F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34371F00893;
	Sat, 28 Nov 2026 02:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795834633;
	bh=TEVRiiwR27pO3qj4uIut0otLLl5Ia7Ba2IoOxSLJZTQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XGw68F6FtkpZtoscfmzVpeD9AXW7jZ9N2IACG3rPiX9JsA7DImgrbwQUGVi6MtTbG
	 1M+f3iB9EYaCPPrw3mfHP7SFaclhYA27dydvagper95laYFRdDNCtfvbu4FxIyf8rP
	 04/9ukGLNmNvu11ACxfYKwxeXI+xXwdLfFIV5hPKNqdlR4t5DZ5nmtMuibnvqvZgNF
	 ZqOrU0XHa31zif7wx7Dy/cDBeBg14GwfumvGlvVMGHOPzDGTz5vHsrbAVa0NHeLxDY
	 eNcldCh+e3I0++krdz6Ij3PjYQTZHwTv2erK+7vMtwYxXLwo0fbMWuYeCthEenv1Ya
	 SeK/7kqlSMI7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB9F7392707B;
	Sat, 28 Nov 2026 02:57:12 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261127172900.433b05bf@gandalf.local.home>
References: <20261127172900.433b05bf@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261127172900.433b05bf@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.4-rc4
X-PR-Tracked-Commit-Id: 76a0a6d58318fff8b14530ed9b99c7065995db29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 673af170ceca345ce010aeeb1818172844f6b8c9
Message-Id: <179583463166.1775590.13386320384705853474.pr-tracker-bot@kernel.org>
Date: Sat, 28 Nov 2026 02:57:11 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Andrea Parri <parri.andrea@gmail.com>, Jeff Barnes <jeffbarnes@linux.microsoft.com>, Vincent Donnefort <vdonnefort@google.com>, Yifan Feng <evanfengff@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 27 Nov 2026 17:29:00 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/673af170ceca345ce010aeeb1818172844f6b8c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
