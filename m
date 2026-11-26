Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660266;
	b=KAqpMjQ6a/fTW8LpqoA0VOuQ7KpDmUnP0yX5yE3epng2Lpk02Oelpib4zNTOhL0MOXeb
	 jMnMncarykJxdEyw2tC/CpbsfY1b8rFt3zWgWxpczir7Epfg8/j8L51Vd5fVn09q0Piw5
	 zceMrGsgXhFFhUBPmXsuRMtEk9R5TYZepktWTL1iUTomroKlBmzAd8/q6LDnj2ijmul5a
	 L5hL5dzbxf4fHLa/dtypXrXXcVcp3xxvEz16HoNrQrA3F63j8Pogc4uePSTXPLBQ60YhM
	 ZBCIKxvXeaXXq4bxOAd/8c/S5a/dCjoQbZ7RDoLV9FGDnifN8MLdHefK2Nfchygpgig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D9BbuCBvz+3YcHKVGn/xJbMHO6prVxAgpemJ515Bw74=;
	b=zOZqKaMIUTVmM3pkh0EWc07NXU4AKFATgewC6ZBfxPguivNFHFvo8G3tBpIKLZNUqwSL
	 7cGrUUQXzJ7w2l08f5H4Fc7HLwBpvfC3bTFddsQVhYmt5TPsgJBJ97RL1ugaSTzW7lPpz
	 Mr6wFPXByJgO+3EqRUf39cLvTEXPgyi4gL4HjkASrrf0pDGW/nhjeCGiMGDozgiaNRP4f
	 uk5W4JwwsZfx/YFxeJpU7tbIMOVEeezbm+bSzUEWBH84fSDvDQYplX67A7tLenGSJuJwz
	 hUaqHaxRRbhUZpzFO7AJO3Zmu/fmdanjOUugiD64RkmfsBY6eA9yDExSl6BHdtcb6xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCZ7WjGJ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87830606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87830606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCZ7WjGJ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4058436f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660265; x=1796265065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9BbuCBvz+3YcHKVGn/xJbMHO6prVxAgpemJ515Bw74=;
        b=UCZ7WjGJV3lOB/or7KBd4OYdQpi8Ezg6nfoYaY2l9e1dn8bhqJh9xHFUtPITfqA5NQ
         lliWmfyOrAUG2/Jyw/KdVrCUqklOQ2Z95kNFN8RxnCV9WD6fLlujwcVApYeGQvYF3PF7
         qyX4kc3PY4Z6YG6espsUV453KDyN2N2+G7mx7QMRjiaehiwUizFTVEQYVEgNTvp6pdqw
         eOUAZbsBaIOnPaJxd+ys0WScP8s6uYBfxDG0khfT1PUmf6M4BsowfD5YJTQNaOvfbExL
         7SbLDszH9utOYB068IZt7kM/PHkoi85zwqkBo1TLel3SGDwXM6FIvyEL1FFSPllloUfQ
         ZpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660265; x=1796265065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9BbuCBvz+3YcHKVGn/xJbMHO6prVxAgpemJ515Bw74=;
        b=eQPwmyMQHQwjVSEubv9UbOnKNQwhU3JKxRuorqnuWSkz0xlwdfbByJHnnG3Vitrg+0
         3noPSWMQT7KPKHMQSbkYG8dAiu2RCkknv80AE3Fg297hmp2WQAs/MGCunv5GjE35xopO
         ZRgf7z5qrathhOkn4iCHrzzF/9zzNjf3c8NUMKGlp9DH9bMXFpBhRPTrswE1o1MPymcU
         J4FFINehHEOpTB0CXmkum5Cgrb6hCJUm1DwlaSBGYYrt1/i6e55eLa6El0Gs2lptk9kz
         3i4koXQ82iUfvdUDE9m5javnVQ8FTbehBnP6OzSHSy6xAmG9pJLMTiC7pRakkCui7hNl
         Jlrg==
X-Forwarded-Encrypted: i=1; AL+hErF49l4QHL+9F2q83r6V9UOk/BN9HFAQU9ruaGxEYxYeSh5zCJ1jyNkQl9gxcNEXMMqLf4yIjT99n/biuVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+L1khjoU7/7Iofn1GmPJ2cJ4cvA0qUrULGGumc5+zSYyEb8A7
	qqFtyKDFk3MfoFRL0sOOcNgCtgqhKHbs3O9eF40BFZo/xgvEi8qyVRzI
X-Gm-Gg: AZFdTZfMPB3Du2Dlnoevdz+h6FN8RKgg1DHOWkEsXGmf1olM4HJZOwn19pyalD0Nduk
	rVm/zZ48H3piUw6NkWf4K/Pt3HDakry80kdTQoTc/fCe7V6yB9Vk06/T69Pm0ltK8uPiFirmR9X
	H27MG7g+fwEb2Or79ORfzArWPaPg7hh/8xWwQZkVZRiFrD3UEV+AFkYoQq0C6kOOmZ8DuAq7uCC
	UE6B+eyAaneOE4oQYubrZlz+kIwslFeiIwMPF5fym4Z6NWMiptv8AOmDg3Dr2I3m+KR3TYGo5S7
	DYlS2xBV4utiggux0vTDuYeb+Ws8G1x6qYP2hVWmro5EMdwsTN00Fvwbns3STvF0DblXM/vZ2VL
	yXeuema0aC2VJUVrkpQ7YfsMwh5X1eGamh4F3PLOuEIBuiWGsyFUEHruahB703AaYL6LP3K39pQ
	URZRPE4/JZQ+yNI+hT4aDQ4+HgGr4JprIU9/ZLZGPvVQRzkRTjtvriWYi0Oy9gBH3UwUdNt48Dx
	UMKMqFbpLbF/1/kWR7eQoTeveHJTGOrPfKYFZBaF4Z87/JHH22Ch0N5CpERHikSsIdrn0J0kpeP
	u9HY8mAkOgrl3gUSTLbtZYri+QIuKk6CSiPKGDdDiNHIWcYN1V1+wCvnnArNx7PKFkjWYt0SbYp
	czt0Q5RUsFCEqrGBHQJFirfLHalbc+uMOjI59GK2yTD5Hc98X5wx20JR9DqJpc/xNw0AHDY/3u/
	vnj7pF7WNqn5bZsx91WnPiRTT8TN9xrEvKCHv5/w==
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr38680089f8f.22.1795660264607;
        Wed, 25 Nov 2026 18:31:04 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:04 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] sched/preempt: Check notrace preempt-count updates
Date: Thu, 26 Nov 2026 03:30:51 +0100
Message-Id: <cover.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

With CONFIG_DEBUG_PREEMPT, the notrace preemption macros bypass the
underflow and near-overflow checks used by ordinary operations. Add
checked noinstr updates for their existing callers and share validation
with preempt_count_add() and preempt_count_sub().

Patches 1 and 2 mark the arm64 raw preempt-count and reschedule helpers
__always_inline, matching x86, s390 and asm-generic, so noinstr callers
keep them in their own section.

Patch 3 also disables branch profiling with DEBUG_PREEMPT to prevent
instrumentation from reaching noinstr text, covering both
PROFILE_ANNOTATED_BRANCHES and PROFILE_ALL_BRANCHES.

Patch 1 is extracted from Hongyan Xia's entry RFC. Song Liu also posted
notrace annotations for the same arm64 helpers:

  https://lore.kernel.org/r/20261023011049.1164625-10-song@kernel.org

Changes in v2:
- Patches 1 and 2: no code changes, added Hongyan Xia's Reviewed-by.
- Patch 3: replace the Makefile CFLAGS override with a !DEBUG_PREEMPT
  dependency on the Branch Profiling Kconfig choice (Steven Rostedt).
- Patch 3: remove the unused __preempt_count_inc() and
  __preempt_count_dec() macros and clarify the changelog wording
  (Hongyan Xia).

Link to v1:

  https://lore.kernel.org/r/cover.1794814699.git.kmehltretter@gmail.com

This series is independently useful and also provides the checked count
updates planned for follow-up IRQ-entry work. It does not change IRQ
entry, trace-recursion lifetime or TRACE_CTX_TRANSITION.

This addresses Peter's suggestion:

  https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net

The series is based on Linus's tree at commit 4dce97c6c265
("Merge tag 'ext4_for_linus-7.4-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4", after
v7.4-rc4).

Testing:

- Kconfig: x86-64, arm64 and arm builds with Clang 22.1.8 verified both
  branch-profiling modes, DEBUG_PREEMPT and non-debug configurations,
  !CONFIG_PREEMPTION with PREEMPT_COUNT=y, plus allmodconfig,
  allyesconfig and defconfig + debug.config.
- arm64 v2 runtime: Clang 22.1.8, W=1, PREEMPT, DEBUG_PREEMPT,
  PROVE_LOCKING, FTRACE and PREEMPT_TRACER. Full Image and external
  module builds passed, .noinstr.text disassembly showed no
  ftrace_likely_update() or outlined preempt-count calls, and QEMU
  boots verified balanced load/unload, underflow rejection and
  near-overflow detection at 0xf5.
- Additional v1 testing (C code in arch/arm64/include/asm/preempt.h and
  kernel/sched/core.c unchanged): x86-64 Clang 19 objtool noinstr
  validation and nested-KVM runs, arm64 GCC 14.2 PREEMPT_RT and
  allmodconfig builds plus native Axion boot, and ARC, C-SKY and MIPS
  builds and QEMU tests.

I used an LLM to help extract and review the changes, write the test
harnesses and prepare the commit messages.

Hongyan Xia (1):
  arm64: Always inline raw preempt count updates

Karl Mehltretter (2):
  arm64: Always inline preempt count and reschedule checks
  sched/preempt: Check preempt counts in notrace helpers

 arch/arm64/include/asm/preempt.h | 10 ++++----
 include/linux/preempt.h          | 23 +++++++++++++-----
 kernel/sched/core.c              | 40 ++++++++++++++++++++++++++++----
 kernel/trace/Kconfig             |  1 +
 4 files changed, 59 insertions(+), 15 deletions(-)


base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.39.5 (Apple Git-154)

