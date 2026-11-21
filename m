Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795273406;
	b=KeuXD4CNd6VbgvO3ZLhjL1uxGZIgaHIQ/eYjkL9nDVbhcvn2MHw+1DbWttGBhyOoCfXh
	 JVbC+7ubmoruq9T4/SxY7WQO6mQBeQdpfaN892qOoPgYqDXDFTeqg4edEcnhAjQoEt+R8
	 CbypjQ/8Mrc7vv4NiqpQwyVWheH0n8Uo/ju7qeg0Qgcw2aJX5FXPnEEJh+oIvuLnxKqI+
	 nSSeEQyRTC3i7bDzQFsLJoB4aQ/TxV4PKh2tcQW3Wmn1cBxgbI33+kCV3SAtTxoiu+7c/
	 0Db/I7HlfweMWk1K0Y+sFpJ4M4HBmNB721in3fXLClqRY66x7kJLn7Wjm8OppYBaBPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=vbgwELF6CWUmH82cJRM4qpAueUKNM+gZeKyQBoi7/Ao=;
	b=qE0XM5TMz/0+lPTm/amx2QJUVZo5ur00WRYCcPcZ7+aOxIzrkVTLRtQfpFalJocQZs+1
	 sFeCSgooATKgAVPSkUODILpkkyW9J/udO3/fU+p6F00XsTcq4WTWGUorvS7LKFW8nRKBJ
	 3YkHKbbOBrbtGMhROXc8jhMScvTuZuUGE4EtID4UU/Fo6e1DMa9bILT6h2HvKOoyTDIo9
	 AW9k18J9piZoooC2r7ZhSIJ35Z1ZnXJHFO+W73x8b/Xnt6L7xZQI6N18vTalMwQ3MQJqu
	 qDtQUg7A7KXvQcoVUfZhgD7IJyh3mO2vpCsPHlDqhQhtRQwjxxz5dSyk9Jq+vnKyz0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LBAsM7jS;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58795606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58795606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LBAsM7jS
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3869f03af6aso544476eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795273405; x=1795878205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbgwELF6CWUmH82cJRM4qpAueUKNM+gZeKyQBoi7/Ao=;
        b=LBAsM7jSYWfSfmrtLHBJv15IzqQYPWUWMHug0FNaBpPZqN0pAl/cv2Xa1iZQKzc3vZ
         qOJGiuL1Go+1gKj6qMyp/idKPUsdAh1xnznL9i/cv6ofDIHkMyJm5cSD5Gr16UjmWB1y
         nv2vjhHAE8NnzeheikRTAKilYTbm7pyoandVysh4QuUejYxHVYcFj0qAZfEXSpVutg5o
         ZsB0SNWdA5smO/zY4yMgSELziKuTYXOzGu2/rGhC3YMHkTEBJ6t+dXe6xF1ir8MNX3pr
         m4Azm0Xgk1gJpfNjulvGPOcI+4Ac7mO0Li2l4CxRIFA9/f8MpWysV2EixgBeGIyUD6uA
         ze8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795273405; x=1795878205;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbgwELF6CWUmH82cJRM4qpAueUKNM+gZeKyQBoi7/Ao=;
        b=RWQmgsQe+84GQr4mb+KuuRFJ/2qIPaasAkPaL6KOvGrEK1MZftmMREY0BIHozx360G
         gOHAX6OHV28+XIqmzrPU7Qx2GY7jkGIBoEcrjMyZoYsDQWzO2eX68QpEEeRRPZjVjwvL
         Eu9Fex50HjMdiK2mlHqXYMYdzV5HWpIIOP+j1zyNXn24EuoeCPsq4GVr9YFwPcJc06it
         jIH8+DripiOEh9Tn0LF81b8ODVGYNmR8BNrvAXwxvtlZ4UxVeuuHwMYtMgFyl3zQr1fK
         iKOURbKmm6GBvdJbZAccZyztgm5V9ipCgAqiaoZDpWw/UYwHFBndoMs0qK2il1ZqBzum
         8tTQ==
X-Forwarded-Encrypted: i=1; AL+hErGVUph4VC27NcuEJMRoeWlRNa9+U2u38SRt2rbfcV60Uhurdfh8BDxLHUJ/pkZpwzj8Pe/6tVaaP/QyMBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z97GW3O4Y85JnqPIJ7sqMor/zSSMT3PERzbugtSN5vEwO1jBqG4
	4auXuOse+7YB3bGqVY4RIYv/wrCXCuO5iKE2gsfubUCca7uCmpY0V8ST
X-Gm-Gg: AZFdTZd52oKrY4vuNZlMMozUgqjAV4/eleLpvduNtuwShV0y7dHw+hQMLRc6RXKEv4n
	o7mGJ3UnsbvOWoS2Hi9xsEt5AHpEHaAtCfK6VdELBzD1dmclDoLa7dq1j3HBhATApmtWdIsjp4l
	nqqsTREPApMN9G0tXcshPjaNntSxN3yzlrsNCrzMNmmJlQ3l6igIfHd8IJf+eQRgY3t4YOIiEl6
	17HRTBrVlPzpI7ESgQyPKal+PRoJJG5l4EluP0psO/bUvWA/DfxRSHBfga0VqpqANqBfVPf6dvG
	7dSGjAuWJrAnG0aNbXHw6YL8gno0IkDbvKafzyZl1GXTHba56OHUS6DPWl8SkodJTfi2GCTT1Yf
	dXyEgMbde99EtX+DMNtyo+uBrecOKwzrQO+MkKfD1eCdTmDNYJlwSg/NB16MjdHvEFP9JXQDcCj
	pQhSzK/SH+rY7B3AFGtA0uZpFt7azw6FN2CdTsNc2a9nP5wcK7ZpOZT7tbcihVNxo58AuxT+Lri
	Lb+noGFC3Iezw/KVDlaZC9QqH+/MyzO7ASlIHgIe/Yoc8YWDqah9GJuPvDja6wEVkVPbHM5cwGa
	LS/giuQmhnSYiFQwNtxCb7Rwcg==
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr6448576eec.1.1795273405079;
        Sat, 21 Nov 2026 07:03:25 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm16396954eec.8.2026.11.21.07.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 07:03:24 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Bart Van Assche <bvanassche@acm.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH v2] docs: kdoc: fix struct_group_tagged() parsing regression
Date: Sat, 21 Nov 2026 15:03:21 +0000
Message-ID: <179527340172.2367332.3292077208678045371@gmail.com>
In-Reply-To: <20260916214357.22573-1-emmaonana18@gmail.com>
References: <20260916214357.22573-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Onana,

Thanks for the patch, and sorry it took me this long to test it. Randy
tested v1 and carried his Tested-by and Acked-by to v2 in September; the
run below is independent, on mainline d0f871bfb831 (2026-11-20).

Short version: with a fuzz-2 apply the warnings in the four headers below
go away and the test suite has no new failures. The patch needs a rebase
before it can go in. Two things below are worth a look -- the rendering
loss and the excess-warning scope -- but I do not think either has to hold
up that rebase; that is for you and the maintainers to decide.

git apply rejects the hunks in tools/lib/python/kdoc/xforms_lists.py and
tools/unittests/test_kdoc_parser.py, because of 2d72a4c09867 ("docs:
kdoc: parse context_lock_struct() as struct declaration"), which landed
after v2. The kdoc_parser.py hunk still applies. With patch -p1 those two
go in at fuzz 2. Everything below is from that tree.

Could you rebase onto current mainline and post a v3? For v3 I am only
asking for the rebase; the rendering follow-up and the excess-warning
question below are for later.

kernel-doc -Wall, warning lines (the tool prints each of these twice, so
4 -> 0 is two warnings):

  include/net/page_pool/types.h                   4 -> 0
  include/net/libeth/rx.h                         2 -> 0
  include/net/libeth/xsk.h                        2 -> 0
  drivers/net/ethernet/intel/ice/devlink/health.h 2 -> 0

Those four files are also where the descriptions disappear. The five
warnings above are about the group names themselves; with the
xforms_lists.py hunk alone kernel-doc instead flags the 24 field
descriptions as excess, and the endswith() hunk keeps them out of that
count.

Unit tests (cd tools && /usr/bin/python3 unittests/run.py): 122 -> 123
tests; with only the test hunk the new case is the only failure beyond the
four expected ones, and with the two code hunks as well there are no new
failures.

Those results -- kernel-doc -Wall on the four headers and the unit tests,
no make htmldocs -- are what the Tested-by below covers. If the v3 hunks
come out the same as in v2 -- same added and removed lines, only offsets
and context differing -- and no other commit has touched
tools/lib/python/kdoc/, tools/unittests/ or those four headers since
d0f871bfb831, feel free to add it; if in doubt, drop it and I will re-test
and reply with a new tag.

The rendering follow-up: with v2 the field descriptions inside these
groups stop being rendered. page_pool_params renders today as
{unnamed_struct} twice plus its eleven field descriptions; with v2 it
renders the group names fast and slow, and the eleven field descriptions
are gone from kernel-doc's output. Across the four headers that is 24
descriptions, and no other file's rendered output changes -- I checked
every file that uses struct_group_tagged. They come back if those comments are
rewritten as @fast.order:, @slow.netdev: and so on, which needs the
xforms_lists.py change in this patch. I will send that rewrite as a
second patch.

The excess-warning question: the endswith() check in kdoc_parser.py also
silences excess-member warnings where a comment uses the flat name for a
nested member instead of the dotted one, in files that use no struct_group
at all -- for example 12 warning lines to 0 in include/linux/msi.h, 24 to
0 in include/linux/mroute_base.h, 20 to 0 in include/net/macsec.h and 30
to 0 in drivers/gpu/drm/panthor/panthor_device.h. Each of those is printed
twice. msi.h has no other warnings, so it goes quiet entirely; the other
three keep their unrelated ones. In msi.h, mroute_base.h, macsec.h and
panthor_device.h the rendered text does not change at all; only the excess
warnings go away. If that is wider than you intend,
restricting the check to members of a struct_group_tagged() group should
keep those warnings; I have not tried that, and the parsed members do not
record where they came from today.

The testing above was run by an AI assistant (Hermes Agent) under my
direction, and this message was drafted with it; I checked every number,
edited the text, and the tag below is mine.

Tested-by: TAKANO Mitsuhiro <takano32@gmail.com>

