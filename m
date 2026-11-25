Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597088;
	b=LiVEK3gzCJhvZ5HU8VbXg10aItCPCSgjY68UpHDufUbtOiW5bjne+O1eL+kQxfOfcxFO
	 1rGDoo/G/V9Livab4ZyWO9xwMJBRfyIiW+E1zTQQ63GqgrnQNSHah3K9bP3y46TqKxmSN
	 iLo/1HVE7eSELMZli5mF2MpqqDimGYA0L+GMuJmCuUJwegVsL66e1JRVlxvdQZP26Eae5
	 FK6efffg+tXdw17LGAou8vqJKKiV1HfRXibeXI05KbFNpyi5VkLbEb3BaLfuBggmB5iIv
	 e9lMoe/p2ak7/V+Xf5GsxW90J9SNCJtbBXfg9nTo1aEWTcmY8pVHbyk8YqvqPCluF0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597088;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mVMrsFYyFATOUmkvDDEKuZs5AfG2ET/j4dYuZDcY0kQ=;
	b=mvCzOYThPZjcPNsHxOJqMWdSD+qyAaumdSwHp3Rg9JIvPl98naFGKeeCKThUqypDZtq9
	 i3Ktcpovf1fMcmZbd3rcn1bXjycYe02cCq78PpXgjMBuYpWFrtM+8x/wUYt4DHkKLZJlQ
	 ZFpK3bkKU8tShQyHoRY3FC/AdV4U6QPaoNcJvg934ZUZEjF3cx47pbXVLdTuRcbchsX/I
	 2oEQHi/b0c0CWR9l7yUo7Cyuy/6y/AY+A6qq75ZDGVg1qAK5TV3BgnP7BMBQaL2w14WIF
	 v9kfn7xyHVWDKqRjZawZCAk32QlddOWJIoaayR7HPfjQCws/kgZK45FKuVHBcMBdkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D485C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D485C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99e81f5ec91so2063306241.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597087; x=1796201887;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mVMrsFYyFATOUmkvDDEKuZs5AfG2ET/j4dYuZDcY0kQ=;
        b=LuMzkcCtTNhtPi31BV9cGYbIMxoHusH8b1F/M5Slyo/IHCwQLAW8yOFAdb8LYllmpA
         2/D8tRy9dLhKcUiV8ZZvfZELFtNel8mIjd6SeaUlViwlsHAwX+VRNZdLc4Gcv8rHh1nL
         MB5zm5x7mQmtQhY6Kxx/SJDDaTByq44cbKStOmkEuGCIDHd7f2yp+tkuykqjx3lfEs1p
         YJpviI6XsREyeVKCmzyvwG9tM2puVCy421bGxx0gLIvXikOnf812wqD9f+C1ehyZD8j7
         40xoy+1DKPx1DCi2H7DVWwmoO+r1OQ5WdU1krJCLohE4bPQWWNsdSWTUDsnL7AvcGv3T
         Qkvw==
X-Forwarded-Encrypted: i=1; AL+hErE31VX7ShoNqB787ntL2MqNBLT4Q+3Fp/Q/FSijhtpNf831npYRiEWrIbM335UTKAU38kxovqdYHmnWCb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dJKU5QhqgDnUL0toca1t8PD4SqTzbng4a2zpuUhVVnvucZ5Lu
	UXo1Shm9vxSVCcI3GQTcFm03rvJDXjG3rMA+ftg/qdzkVpMmMiQx1dkLhfXEd/jD
X-Gm-Gg: AZFdTZe7v1CXTT+MgCzcGcp0WSzUtQboA12IKvHrytyz8jwB1KstPqKlIvDaXptEezp
	Ze5gxm+fpO/RSj/2bAdz21eb781R3iRcZqcEU+qgVaZl3J8m5IpJmj2P08Wc8gqNNIuZHX/zHeo
	vHgc5rsk+CFMSK9jx7aguYwlfvK1SaH22RoWLHpYqSYnZtajbKO8s1fv6/P/pfaOARZu134tk2h
	srtFYCfLcXOIZHZC+cc+ZOz6dOK5jeAzbgk0qljgzKvTuNQC6efch2Ewle2h2ojzVU00SXf3qEp
	9Bb2vftmW9Pnlw/AY+7wEWU21GnMjw5jBCKM5uvHUq8ubsbLH20OkBVFy5lcQOralpoXIepjZOn
	qgLql885JRjUWFGrVoxGbPd3muZH/WowvmNYVSQvDLeM9+kWn4tZD36Dq4TT5c7Wp1vtZuYxMEm
	QdWWh4rjLcWHwmsjAWXub3osKbOyPoDjGsvCq8+CoBy4cRl/dqQlYtU4qm3Y5oN8lqAgAZpqBw5
	NMHpG3tgQ+1WM/x8w4RPOd4quCepUCqB8vpsZXh08x5O7Air157QNA3841263w8kPByyNjV+Yg5
	SfQHSNeJzIYMpGOHAp3ZVfEJX81byzDCphKMzdFMnPDgyZp5yp8pcTzupXJcj28wOBCQFL1Ply4
	zVyVaTq+dRfyr
X-Received: by 2002:a05:6102:f0a:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d7395725f1mr8834668137.27.1795597086596;
        Wed, 25 Nov 2026 00:58:06 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec57ddsm17263854241.1.2026.11.25.00.58.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:58:06 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2da1667b2so3406183137.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFovhb8IfWDBOWQf0S35MOSO/jJmucYoh5Md5UkyxjW4G6bWmB9oOmUu4PgDC4wx95F1uWY/zA/l7WdMRA=@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:7cc:2bb7:1335 with SMTP id
 ada2fe7eead31-7d7395e01b0mr9404227137.33.1795597085866; Wed, 25 Nov 2026
 00:58:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179558805924.3383392.1456615917266025706.ref@yahoo.com> <179558805924.3383392.1456615917266025706@yahoo.com>
In-Reply-To: <179558805924.3383392.1456615917266025706@yahoo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 09:57:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNqQCKFnpxzHVaFM0deF0VdyJSvLzmy6JT46sRA9kJow@mail.gmail.com>
X-Gm-Features: Aa3M54psEuOxhCRq9HluWMLPt6_pP0Ynh7Bge75tt4s9aGAJoNbnstuvmOdPM-E
Message-ID: <CAMuHMdXNqQCKFnpxzHVaFM0deF0VdyJSvLzmy6JT46sRA9kJow@mail.gmail.com>
Subject: Re: [PATCH] agents: add a skill to determine the target tree of a change
To: Daniel Ramos <capitain_jack@yahoo.com>
Cc: Sasha Levin <sashal@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Wed, 25 Nov 2026 at 07:34, Daniel Ramos <capitain_jack@yahoo.com> wrote:
> From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
>
> Whether a change goes into the current release during its -rc weeks or
> waits for the next merge window is decided by hand, and being a fix is
> often taken as enough. Linus asked that new development and test cases
> be kept on a separate branch so that they can be merged during the merge
> window, and noted that fixes for subtle bugs that went unnoticed for a
> long time can themselves be buggy.
>
> Add a skill that sends the agent to the parts of 2.Process.rst,
> howto.rst and handling-regressions.rst that describe the cycle, and to
> the maintainer profiles of the changed files, and adds the checks agents
> tend to get wrong: reading where the cycle stands, using the kernel's
> meaning of a regression, keeping fixes for old bugs, new tests, cleanups
> and new development for the next merge window, splitting mixed changes,
> and counting every added line when judging a change sent during the -rc
> weeks. The skill proposes a target; the maintainer decides.
>
> Most of the skill points at existing documents. Keeping new tests on a
> separate branch for the merge window, and counting lines that are not
> built by default, come from Linus's mail and are not in Documentation/
> yet.
>
> Point the bug-fix procedure in coding-assistants.rst at the skill.
>
> Link: https://lore.kernel.org/r/CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com
> Link: https://lore.kernel.org/r/CAHk-=whOCnAwXz-FMRdQEDJQ+9b2YXh9M=GHgRay0o4cxSmPVg@mail.gmail.com
> Signed-off-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>

Thanks for your patch!

> --- /dev/null
> +++ b/agents/skills/target-tree/SKILL.md

[...]

All of this seems to apply to humans, too.
Either this duplicates existing general documentation, or fills in
gaps in general documentation.
So IMHO it does not belong under agents.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
