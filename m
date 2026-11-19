Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122673;
	b=dBgqMo6mipRr18ypHcY9QbpXvqV9HUMYf0mSQL/HU2tZVy6TPAMiwVb32kJqdzsJZ/oG
	 6z45tIHH/iREhX6Zoq9L4o5qOhlpKY4udDUfLC8w1Qa4Xs0vZh0/Hv1s2CCaC1oIm/awA
	 cllRS4zHrUWy7Wz8gSLoShtee8LnsfDtZRdMPxzTOc8D+dbzpPafsRVsA/d/n/lKxX24p
	 sGgXqyDFm26BQV8t/3kh5otFDDIn0jHH4qJydTUjhk+VfJr3Txc7iB1gpPnb0nMIW/h5x
	 FR+SfQCjFpL239esPV4MK6O5O5mvXQ2duiZZ4VfPYl6tkIdQN39YqMKl+GEbwYPpsNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122673;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Content-Type:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To;
	bh=ScKb2Txo7PUadWX75s6dqv2sWiItckJPMMvpa81IlPU=;
	b=N+PTZxP1KY6QlsxbO42f1KTxMavc6Ood3XOIO/8idOvM+wHuiZy/2BRRTNc3w+invv6i
	 P8kRlJGUGcHf+Iu7J9LTR4lrO7NpZ2+mTk3x0brdpnrGUDOwI3u4O0kwzUQ+USc0vyyHI
	 4UAdDI+4NwBf/SE5zZ6P6Ijn06C4vRp7JmLbTs9a9xxpFZ/k6NjWzRnMFDHILZUvn5cy+
	 AAublk9FVI8hMQ/YPjACTCWBb/K+uSFiR0siERAT9b7Xc4NqatnG1hkPu3cnPV3saVq4f
	 4emMUTdvpQmtDkYx40X/DUAwzeBL4WJRX8WDvTuSlltd9bJFrhpy2DkegZrfxF2CKUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A4VGx4HO;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBE7606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBE7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A4VGx4HO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795122672; x=1826658672;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=SagpMn+X/GzYwsQ5+t4/ZBhyvwD4OLDG83sYMEoYWDw=;
  b=A4VGx4HO37Fp8TvsoxRjm+qoWT1cqySGE2v/sBgI3Q5GiHwnLoN6aLyl
   MJRQ5OD4mC+PUDfdxmvAsncw3rtXVUfbMVup2r2xvR2tT+WAYmQ4nj1Y0
   WXuUyCFig8oML38srg+oxFYng82JrstLwZxZ5Y5uN1+jXDqHGSRGRaJB7
   7c2kFyK550Clr+hcddzuefhWv+BFge4aRn6FOmJDHxX8kUYQjct2wT648
   iQ+agr1HCnWtAecLR3b92zXiA0bsRcEQ4PN6vCM5NYPTVvFL69prwf14k
   QxTuYar/w7qIZPnhCS7E1yMPQCStkpA8N8zGR0O9s1eLDRHvlI4FY/I+p
   Q==;
X-CSE-ConnectionGUID: bxLaBoekQb20W8KtFVnCDQ==
X-CSE-MsgGUID: 1uxI/M4bQP2W4aBovw0v5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3883124"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="eml'208?scan'208,208";a="3883124"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:11:11 -0800
X-CSE-ConnectionGUID: b65GeVoxSg6ziln8waPqhw==
X-CSE-MsgGUID: WzYVDOgTRnmQlFSRoMTXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="eml'208?scan'208,208";a="10423641"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO [10.125.109.68]) ([10.125.109.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:11:09 -0800
Content-Type: multipart/mixed; boundary="------------mcVJrfdyzDCen9Kov9mcD05b"
Message-ID: <cf3c512d-5b02-46fa-b1d3-a1a10a1f3a8d@intel.com>
Date: Thu, 19 Nov 2026 13:11:05 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [kernel?] KCSAN: data-race in fpu_flush_thread /
 skb_copy_bits
To: Marco Elver <elver@google.com>,
 syzbot <syzbot+b07ec23d35be305855be@syzkaller.appspotmail.com>
Cc: arnd@arndb.de, binbin.wu@linux.intel.com, bp@alien8.de,
 chao.gao@intel.com, dapeng1.mi@linux.intel.com, dave.hansen@linux.intel.com,
 ebiggers@kernel.org, hpa@zytor.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, seanjc@google.com, syzkaller-bugs@googlegroups.com,
 tglx@kernel.org, x86@kernel.org, "Bae, Chang Seok" <chang.seok.bae@intel.com>
References: <6aff5b8e.4ea6388a.d0c9.0001.GAE@google.com>
 <CANpmjNOBWLCJZsyc2WZoOaF8QOj8a+yE0Puf6skiLNbjUrANjA@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <CANpmjNOBWLCJZsyc2WZoOaF8QOj8a+yE0Puf6skiLNbjUrANjA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------mcVJrfdyzDCen9Kov9mcD05b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm not fond of the changelog or comments as-is, but the attached fix
looks sane-adjacent to me.

Chang, any chance you'd want to dig in and make sure this is a real issue?
--------------mcVJrfdyzDCen9Kov9mcD05b
Content-Type: message/rfc822; name="[PATCH 3/4] x86/fpu: Reset the fpstate on
 exec() under fpregs_lock().eml"
Content-Disposition: attachment; filename*0="[PATCH 3/4] x86/fpu: Reset the
 fpstate on exec() under fpreg"; filename*1="s_lock().eml"
Content-Transfer-Encoding: 7bit

Return-Path: <dave.hansen@linux.intel.com>
X-Original-To: dave@localhost
Delivered-To: dave@localhost
Received: from ray2 (localhost [127.0.0.1])
	by ray2.sr71.net (Postfix) with ESMTP id CA16CB5D
	for <dave@localhost>; Thu, 19 Nov 2026 13:07:34 -0800 (PST)
X-Original-To: dave.hansen@linux.intel.com
Delivered-To: dave.hansen@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
	by ray2 with IMAP (fetchmail-6.4.38 polling linux.intel.com account dave.hansen folder Inbox)
	for <dave@localhost> (single-drop); Thu, 19 Nov 2026 13:07:34 -0800 (PST)
Received: from orviesa002.jf.intel.com (ORVIESA002.jf.intel.com [10.64.159.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id CB86220B8CD1
	for <dave.hansen@linux.intel.com>; Thu, 19 Nov 2026 13:07:33 -0800 (PST)
X-CSE-ConnectionGUID: rKqoRxW0SM2BR4FBPh9MRw==
X-CSE-MsgGUID: l+FYn7xzSW2WCwk6ILf7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10554561"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 13:07:34 -0800
Subject: [PATCH 3/4] x86/fpu: Reset the fpstate on exec() under fpregs_lock()
To: dave.hansen@intel.com
Cc: Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Thu, 19 Nov 2026 13:07:33 -0800
References: <20261119210730.2D32F7F8@davehans-spike.ostc.intel.com>
In-Reply-To: <20261119210730.2D32F7F8@davehans-spike.ostc.intel.com>
Message-Id: <20261119210733.7A3C75E4@davehans-spike.ostc.intel.com>


Written by Claude, Anthropic's AI model, at Dave Hansen's direction.

switch_fpu() and kernel_fpu_begin() save live registers through
fpu->fpstate, using its xfeatures as the XSAVES mask, whenever
TIF_NEED_FPU_LOAD is clear. Code that changes the fpstate pointer or
its contents therefore does so under fpregs_lock(), which disables
preemption and softirqs and makes irq_fpu_usable() refuse hardirq FPU
use.

fpu_flush_thread() does not. It calls fpstate_reset() before taking
fpregs_lock() and before setting TIF_NEED_FPU_LOAD. At exec() the
registers are normally still live, so a preemption, softirq or hardirq
kernel_fpu_begin() in that window saves them through a pointer and
mask that fpstate_reset() is in the middle of writing. KCSAN reports
this as a data race between __fpstate_reset() and os_xsave().

It is harmless today. The embedded fpstate is only ever written with
the same default values, so the racing stores change nothing. With a
dynamically allocated fpstate the save lands in the embedded one using
its default mask, which is correctly sized, and exec() is about to
discard the state anyway. The worst outcome is a WARN from
xfd_validate_state() under CONFIG_X86_DEBUG_FPU because the hardware
XFD no longer matches the new fpstate's xfd.

Move the fpstate_reset() call into fpu_reset_fpstate_regs(), inside
its existing fpregs_lock() region. The vfree() of the old fpstate stays
outside the locked region since it may sleep.

No functional change intended on non-debug kernels. Compile tested
only.

---

 b/arch/x86/kernel/fpu/core.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff -puN arch/x86/kernel/fpu/core.c~fpu-flush-thread-fpregs-lock arch/x86/kernel/fpu/core.c
--- a/arch/x86/kernel/fpu/core.c~fpu-flush-thread-fpregs-lock	2026-11-19 12:52:10.079375387 -0800
+++ b/arch/x86/kernel/fpu/core.c	2026-11-19 13:03:51.610146974 -0800
@@ -824,6 +824,12 @@ static void fpu_reset_fpstate_regs(void)
 	fpregs_lock();
 	__fpu_invalidate_fpregs_state(fpu);
 	/*
+	 * Resetting the fpstate is only safe with preemption disabled.
+	 * Otherwise a context switch could save the registers into it
+	 * halfway through. Do it here, under the lock, not in the caller.
+	 */
+	fpstate_reset(fpu);
+	/*
 	 * This does not change the actual hardware registers. It just
 	 * resets the memory image and sets TIF_NEED_FPU_LOAD so a
 	 * subsequent return to usermode will reload the registers from the
@@ -882,7 +888,6 @@ void fpu_flush_thread(void)
 	struct fpu *fpu = x86_task_fpu(current);
 	struct fpstate *old_fps = fpu->fpstate;
 
-	fpstate_reset(fpu);
 	fpu_reset_fpstate_regs();
 
 	/*
_

--------------mcVJrfdyzDCen9Kov9mcD05b--
