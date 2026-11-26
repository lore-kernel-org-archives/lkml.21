Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671677;
	b=psAWZUbJlKc+gDMr4KhDI+pqU5CVCT8wRktgdraElu6fYMSErkhTwDaSh3v13VcMREMe
	 iIIsK2a9eplBi/aRCNgDblT769/VYVQ4mjvYVzNiv8phhLXVEohg+fTkHb4ZyBSbeIrJI
	 d520qO98uTETGgm9W/0D8zvLgNIYB4ejT8aRrYDnHWHSrT+9NSlWWsW/kXOfnMZrarR9m
	 z2lYKTy/oJAJcLkDGaJpixEzLcNyik8IkZb5nq8bnYOTzj5kv8Mmju/i9Jg70+K6Q/hzV
	 eXRYuRRTo1Wgq3ovmZH0RTnpiysg36t2FinxkzpZCmSVbxLlZsy1gHHlLWgndZdKkSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=p6WOCXUDLo3XBYvEGFmnbV8ReWfG0+FRoMB0FwCq/pM=;
	b=tirdNeg45FnPMav7V7CIe+OY/1WJb1veCyfo6FoNc+6GrO60dERx0MebfLDZzVgMoujQ
	 iSBe+DWz6jY446Fial4xaFFqOhEJHFL6LZtEavDWfI2SqKXcrjkB33xK5dFMayb/c2l2K
	 E8jMde61qmJs7AY3kiGD2sJxWNovnMac0eQo8tWvBvvDRflNa0//vhYcoOaDsm8B4e5Ns
	 2fy0AjVfD88WnO4z8t4+flfjV1kN7Ymw8ZeXbgUQ1MqrakzxwikVCwwONqI+8CGPslUYH
	 m22pBdXbkhrHxLaaNkvOSOp1Mj0rm4kclsVl8eJ9GkhN2oILb3g/tJ8yG61HsCJVJjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DqvtMQS1;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B45606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B45606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DqvtMQS1
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db3a48dc6so7931328d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795671676; x=1796276476; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p6WOCXUDLo3XBYvEGFmnbV8ReWfG0+FRoMB0FwCq/pM=;
        b=DqvtMQS1VJm9HtcHJWTl6VFydhYSaZ/9Fxag7OAtZOi6zmABNA8kM6LeZL8F8lQLXP
         r+AcCfhEiLAkPlQLHL/LwkhfztaY+mOaR7qbvRABrgPQS+lLHJ1L7bEKZgfNHmZsB0vq
         Hz3fAFR6TBK6HIMqsU7h7RNrXSKgImEGp8cWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671676; x=1796276476;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p6WOCXUDLo3XBYvEGFmnbV8ReWfG0+FRoMB0FwCq/pM=;
        b=krvQxZAIyK6pY7ouBTOSj2pJy9xLkfYiBV8iQ3c8o3x1q03v05rIlwSNVSCgea6wau
         AodS51JTQd8ZRWoMJZiaqg8vUAh6P3aUgHPuIE6WSxRNuSPj2Bif31ZQQDUYFbqGoFOQ
         WGGF138GqbQGHxttNUqApkR8zepdYBpWnz4fSMYgZBa/lKYUTh252+AxvUMRRpr1lZGe
         bak8ivEqmOrOqDDBHLTjFcjzFAe5E2TRxvP/FORWWC7a4cpi9yHh4pi+NHt8xjzhy2TE
         6yQDMfD39xeAY7nJ9TwpVZquRjI0r99vgu8ws0KjROoFRUQizs83FBOLRyMuP0ZCIXVy
         ulKg==
X-Forwarded-Encrypted: i=1; AL+hErFEXya3CKmrYFeGYax4Yf6/TPsyG20hMfWSUWlnZWd/a72iC1R8lVWV4QwV5rzNXOtv66aZA3UdyhSDoyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AYM1u1cpuDwWZPCrVIfT0KOymjqRhQPBUeutRhJoV62arCo/W
	Cv9cOWFb1TohE3X+zT0veWV5wo/upXSKqfC94eRWjxhxa8d9ugttJqrmQbyZEzW4mt4=
X-Gm-Gg: AZFdTZfVDGKXKw8XSNO6TZB8O+Z6vR0kp66T3LWyyLR1107l5eB+Jh6F+2bd0IOxA66
	sGGdukwN663zi+rtqZLnAsuFvD1+4L38DlmHTdsniU1PczqM6DLQior4D3Fmt3Kzn4COzyDNQ+M
	VZf7kCbdmgrSpjzTHmjqbi8dRClVB/b0LzULqMBUCn5PaZcsh8cn+Yc7hCjrA6UBczsYX/xbg85
	p60iHfmkF0u7y+aK8IKUNNnSuSiN+WLElE1UP8XCkCY4I8JDXSApJDviY9wTFoyqYK/vA3/qpsq
	qXx6tKjVOOY0uRATmVOvwxdTjhClDQmUtA6dJsHXMBlAGMl2f4A0airB9wAeFo7XiuJXBECAK31
	IW+dutv51embULHvseRjmtO01StjvunEd94aCDSbr3Ruj24VFUJtTmZR5L2KJiVw9qGoUUcZg0D
	G8UMUSs7Y0DBnXIVIvqnY04wy+aftPDny23U43db4lWB9hCdGap8vu5pC3AxyG/omiqVtRDE5Vo
	AVEmBo4NH/ykypf9N1duqL3NTdK/SgctvLWgr78Me3uiUKLspleJKxwyeZktdnjDEAZ9XN9WxbO
	9zXE2T2IoYyvZn+UngI3raLmHMM9gr0dKbHLXWRQuqa2N7eds+m2bkwtBX2rLHgbQ9013mSOIpL
	+Q7yELCOSeTbri9ik4d2D2ky1HV4Jzas/RRGoe3RJ3pVlm03xokzQ2ABd74M2S9DJ5BC8Qf5Oxh
	Y72jVIrlgvZER4t5VXA/nk0Fn1BJQUoqtCdBI4eFvfLXD7JqWuwlPWhpXvovjZeXUO4houvMQjD
	Qo0FwAyNjCpy2NhwefIThQ=
X-Received: by 2002:a05:690e:1c1e:b0:67c:642:8f7b with SMTP id 956f58d0204a3-67df43f3278mr6352760d50.37.1795671675787;
        Wed, 25 Nov 2026 21:41:15 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3378f59sm9198592d50.14.2026.11.25.21.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:41:14 -0800 (PST)
Date: Wed, 25 Nov 2026 21:41:12 -0800
Message-ID: <cover.1795671629.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 0/2] cgroup: Fix cgroup_mutex deadlock through
	cgroup_parse_float() oops
To: tj@kernel.org,
    hannes@cmpxchg.org,
    mkoutny@suse.com,
    shakeel.butt@linux.dev
Cc: cgroups@vger.kernel.org,
    linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

With CONFIG_UCLAMP_TASK_GROUP=y on x86_64 it is possible to get
cgroup_parse_float() to oops by writing 0.00... to cpu.uclamp.min.

This alone is not great, but it's even worse because the dead writer
leaves the kernfs active reference held, so cgroup_mutex gets stuck
completely. It's also triggerable by unprivileged users on delegated
subtrees.

v3:

- First public version
- Rebase onto current cgroup/for-7.4-fixes, no code changes

v2:

- Only parse the digits after the dot (Tejun)
- Drop the selftest cases for whitespace and signs
- Rebase onto cgroup/for-7.4-fixes

v1 and v2 were sent off-list, so they are not on lore.

Chris Down (2):
  cgroup: Fix divide error on long fractions in cgroup_parse_float()
  selftests/cgroup: Test parsing of long fractions in cpu.uclamp.min

 kernel/cgroup/cgroup.c                    | 29 ++++++---
 tools/testing/selftests/cgroup/config     |  4 ++
 tools/testing/selftests/cgroup/test_cpu.c | 71 +++++++++++++++++++++++
 3 files changed, 95 insertions(+), 9 deletions(-)


base-commit: c99f50e4acf86bfbbe313d79f281d83be1763260
-- 
2.56.1

