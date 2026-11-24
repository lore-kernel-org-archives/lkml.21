Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541948;
	b=ixS2UhA266R06dPO1bnhZohJXMMU2ZQHSJ2gBMN6fgZw6E7QhU7Cn7VDOmRt4KiI2LzC
	 uN8AV9irzoeIp9qlQ+OdfeI/6voC6lX4oy/i2hPGBKwYtgPVoO/US3e7/aBhbtg2L7odn
	 O2XYV3YCA9S3lyy9AhaS0/TWnaH00ge+MKRiBrWW3YpUGPzOS8nWqZXJTuZkoPdbxVEzT
	 vydA521UC0JxrfgmiCZXX163M591R8DZ0mCwGkMHVX+wI8uKurTVkccvCwlcpPYXwulHF
	 8inRa1cj1Y7PapTWod0KNGRiOn6cgnIShiAH/h6xc+xmTrEfQTzvdTqJiVjjYfLnx2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jyCwvSiXyapt+odS15hCGmLJu951HzG6HR13+BbHYtg=;
	b=rp+eTaYqHBmRtSpYqzsehrwuQzWgbl1qITm29iA7cTO3bcig2DwkiShav63oBkt/lwGH
	 x7rSAq4Q7xcCGHgXPtZYEeRVbDs0nUM2FlmmnLeuBR1CdeLRaufKUWUyA+LOU0UNZRF7s
	 tPZXby1xEg+EVGuVLwBpxyKf9bLXGsb6zrhXgQ8fPDMWRxZiVc6wIci+WqdWIeepnuSwZ
	 OVZSEL59kEq1zCfWwOI10NwxB1Ze6HWcu0DRT2FGxiiQ83p1Gto3e7uAoBH0OHIE4cOpW
	 OLl1zLAHEsw7JQdqbb1IgOJUJFWIeFPB5whL15aEF4LOjrWX5tPqqTXFlVesgbgAPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=f2gEbtGR;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B0C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=f2gEbtGR
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-862bb0a189aso2384414a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795541947; x=1796146747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyCwvSiXyapt+odS15hCGmLJu951HzG6HR13+BbHYtg=;
        b=f2gEbtGRDi6lbeomSvcpQ0QdCX8uct4QfSd6rDXyt5iasOa3HaTU0kM2N1y9PouN3U
         wr4j/znsIErMIKVSR++Um1IzoeWvwqgaeBK3tt8KD0bJhpLZiGfMS7V/8t/wDR/WIVui
         Xr/WcdODDDLYQ7EFrl2dovxre9oWWQOFKQgWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541947; x=1796146747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyCwvSiXyapt+odS15hCGmLJu951HzG6HR13+BbHYtg=;
        b=Q7lRl7HLsVaA8GdrREhMBC4TPpcPxPqbrppwUoIY7e9YLYIt21sT8vTNzQmjlgItSs
         W9Tqt3ZgAQfPO3VXaD5qahETgGhtk5H1F4MU7C8jmT6ngGTZpCL+JDElIgqq7Y4EQStz
         VHl8Xi1v23mRPnH1K7D4V35ChERhp58XY1d/VaPOKBonvZc+GsmJzC3xBH8fv/ykPBHe
         Yfm7Hf2/DTAsw67120A3+49/4LfgC82bF+VWcQdHtaE1DGZBm8y58O+znQZGp97UNrR2
         FjPUDrIhF7Cpze4VakOkncWNOUsVOzek+f/x8NaMPYLmpwgv0etIpaNTV9SCGb2sPsJS
         JDhw==
X-Forwarded-Encrypted: i=1; AL+hErFNq/+uPpCph15gihGeBMKrl7LcSsTM65XFwTww8V0Nip7L+muB+QtPEeDPs2NUn1C9tMiB1iyZTAubVlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DvQ/DMeZWlQlDAuMj4CnmRlr/HtLhCOUPISjR1OnoU6IzJRCH
	d3Rahqq+c1HmZI6STvT268i+sD5vwNeFw4e+dyNZcBLQvi4+i1OiwJbJs2pIdw//yNS4Ep4Ysdx
	sww+4qpo=
X-Gm-Gg: AZFdTZfrOrbb5MJRrOcYmsJmANME7hP2t8B6NwZwCnhqiri7JxsCuCWyVUmHUTPpl/j
	kaNbkAv1ChpX/8G/Rb39HPR3XpgysADlh23RL/hHVmaaCMnu3sOwn9jnyFF1vQqnW/NXpGkMK3f
	i/ZO1B11hkfQWXJU0XPS7LClVhCxurBwNGDF/f0tB6udSgwEGxNACr0T1vFyMYiQts5hVhHOgJ3
	XOFrUZtzOGWFSAum326oaMhS3v4tT+XxYuNXg/GP/ECyxaJ7XSJkmmrhLSPt51idQ0ljbO7eNC8
	NHnTWAEf7bkYPq3hN8fIlhUKcqajzGTjGQC2V8uLsocOV/+A57gQdaQMrz31vODnUJm7Ak9LkwP
	8dfesRIwgyQ9WqonIztCU6inz12V0BezfJi9FRA6v37c7KILgiaWB+B876GSS/fPaMI5f0Yj1JU
	bz3XbdG+1kGoxribB7ub9cCLmROn0TEO5dWchMArHoej7QjRtLKDkwPPoj8zKuQBLbyAL4CUJdX
	N2SXfRqjhgZ2m0W39RpGg0qh82KQbyWouExdRhkK8IKT0PdZp/AHFBw8YLXjcrVsZ8Oqc3ARsTo
	nbxnMSx9/Ah2Lpv5f1uND5MhDz/GSye4YQOtxNTSpnJ5fDRAAZ3XwuzQEUgP+tddWMcwvbtAk1V
	10CL4TUJaV/YNI51NVmvmje7VNf5Nd+YXhJlau8bqrpHs1NB26xxw
X-Received: by 2002:a05:6830:4487:b0:861:5b84:4fab with SMTP id 46e09a7af769-863159af3b6mr15626513a34.27.1795541947281;
        Tue, 24 Nov 2026 09:39:07 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdaf7sm11667094a34.5.2026.11.24.09.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:39:07 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net/sched: serialize qdisc timers and defer SFQ rehashing
Date: Tue, 24 Nov 2026 09:38:12 -0800
Message-ID: <cover.1795540952.git.kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110044450.51921-1-kylebot@openai.com>
References: <20261110044450.51921-1-kylebot@openai.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series retains the v2 timer/reset fix and adds one focused SFQ
change for the detached-timer accounting issue identified in review.

Patch 1 has the same source changes as v2. Patch 2 moves periodic SFQ
hash perturbation to enqueue, where the key change and rehash run under
the packet-path lock. This prevents the autonomous timer from walking
the live device's ancestor handles after its own hierarchy is detached.

The separate HTB queue-association and offloaded-leaf purge findings
remain follow-up work. This revision does not claim to fix those paths.

The original PoC caused SFQ memory corruption on an unchanged kernel.
A separate unchanged-kernel QEMU run reproduced the detached-SFQ warning
in qdisc_tree_reduce_backlog().

Changes in v3:
- Retain v2 as patch 1, with its code unchanged.
- Add the SFQ-only detached-timer fix as patch 2.
- Preserve the first perturbation interval and use deferred skb freeing.

v2: https://lore.kernel.org/netdev/20261110044450.51921-1-kylebot@openai.com/
Review: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110044450.51921-1-kylebot%40openai.com

Kyle Zeng (2):
  net/sched: serialize autonomous timers with qdisc resets
  net/sched: sfq: perturb the hash from the enqueue path

 include/net/sch_generic.h | 20 ++++++++++++++++
 net/sched/sch_dualpi2.c   |  3 +--
 net/sched/sch_fq_pie.c    |  3 +--
 net/sched/sch_generic.c   | 11 +++++----
 net/sched/sch_pie.c       |  3 +--
 net/sched/sch_red.c       |  3 +--
 net/sched/sch_sfq.c       | 50 ++++++++++++---------------------------
 net/sched/sch_taprio.c    | 16 +++++++++++++
 8 files changed, 62 insertions(+), 47 deletions(-)


base-commit: 5f22fb20497f4983094131f00a734362300d22d2
-- 
2.55.0.openai.911.g06873a30d2f3

