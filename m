Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706675;
	b=JeRtQuyNFZqIaJ9iNa+KvS66MnLw1CObHJcWf7nDdjm9FaV/0aFIaSj6Ov3oMtw3Tqfh
	 dbC+A3uchm3qT0omE3oCPOtMHtnw8wngezMEfhszI9cyYEExN2Ez1/3k+/5jF7tSRzwHK
	 Du7EuVSphsZPaq3YYRjVZ4CTBWqFCYW69zBiUjD9vmhy3XWXauMmVu2bYlZKyK/xIigtR
	 lG195lFN+DnBSvrCZDV2+oyunyU5bPg+1BMGS20LCQ+qFAw0crEHaioh01jwriFoPt1IJ
	 8E7LT1cZ3JUTfzUU6i81vD+9IF1za/cY0L4tmo+rX1U3kNC7fNewTd18tnqbMxNHtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706675;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=oyZp6GIvcpweU5fwjCc+QvoMsk02lNyi+HgBwgbOqog=;
	b=twDk8LcoaH+VEtl/1F9wjTeWNAcCtM2NOl4XJ2QQpK3wN73n4GiB6ftz82E9XrMri8Sh
	 GLAia1MxRKsj1ebsBBSSJtheYweMJblFQzyhlT+hGVtvJmRFvYlJFmpjHxGKyX2LQbnMe
	 VSrl5Qw+sgtLu5s2EGlM4TuuVjJMQMXQ0xpZtlNwO28pRtrCt7UqefspsnW6TOIGA6NEt
	 UrOrzYSiljx2/zVVUaPOUlU1QQqlfvoFNLjDs1SOnNxY3Zak6ErRWu/9BxWT+2dF6r0Pj
	 +LzvW9hMpCpR/y/512HgheK2f0UqtAePnosJAwa42j8QcBNBMows6fpesVFsjWqh0xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WxRAdZYm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857C8606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WxRAdZYm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0949F1C2B;
	Thu, 26 Nov 2026 07:24:31 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 836323F632;
	Thu, 26 Nov 2026 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795706673; bh=FDdQIQpOoRxvJbj6lPjG5MBExNl3QFoCUrLhmLfkHx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxRAdZYmTSx8ZIyUYLIxfggtJcEB7rf8gN4gNDhhlKkrP/9f18L6oV1/Q7BD+MdsO
	 pFBQtoBKm8Njp/a8/zn9W3LP8Ik1iwWGI/9xBX/n3JXvs9bZR4gSHG4NyYepR3FU03
	 LiZEYj3tkk+EG9GvmiIzmH0lr06IjE9YLE8M1UVQ=
Date: Thu, 26 Nov 2026 15:24:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: will@kernel.org, kristina.martsenko@arm.com, luyang@redhat.com,
	dockseed@proton.me, jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: clear_user: keep alignment padding out of the
 zeroing loop
Message-ID: <awhPLR0Q_UjkjdDs@arm.com>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
 <20261126125033.1692064-1-jhladky@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126125033.1692064-1-jhladky@redhat.com>

On Thu, Nov 26, 2026 at 01:50:33PM +0100, Jirka Hladky wrote:
> Commit fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
> restructured __arch_clear_user() and moved the loop alignment inside
> the function. In doing so, the loop label ended up in front of its
> own alignment directive:
> 
> 	1:	.p2align 4
> 	USER(9f, sttr	xzr, [x0])
> 	add	x0, x0, #8
> 	subs	x1, x1, #8
> 	b.hi	1b
> 
> The backward branch at the bottom of the loop therefore lands in the
> alignment padding, and every iteration of the 8-byte zeroing loop
> executes however many padding NOPs the linker happened to need (0-3).
> Because that count depends on where the function lands, unrelated
> code changes anywhere in the kernel can shift /dev/zero read
> performance: an irqbypass reorganisation in 6.17 [1] left two NOPs
> in the loop and cost about 30% of /dev/zero read throughput on
> affected builds.

The NOPs don't change at link time. The assembler already ensures that
the .text section of clear_user.o is 16-byte aligned (due to the
.p2align 4). What can change though is the position of the function in
16-byte increments and the two NOPs inserted before the sttr can indeed
cross a cache-line boundary. The loop executes the NOPs unnecessarily.

The irqbypass rework only moved the function. The NOPs have been in the
loop since the MOPS update.

> Norman Herms diagnosed this and proposed moving the label below the
> directive, so the padding is executed only once on the fall-through
> path and the loop body starts 16-byte aligned as intended:
> 
> 	.p2align 4
> 	1:
> USER(9f, sttr	xzr, [x0])
> 
> Measured on Ampere Altra (Neoverse N1, no FEAT_MOPS), reading 4 GiB
> from /dev/zero, two otherwise identical kernels built from the same
> tree and toolchain, differing only in this change (two NOPs of
> padding in the unpatched loop):
> 
>   kernel instructions per MiB:	797.5k -> 536.4k
>   throughput:			11.6 GB/s -> 22.3 GB/s (+92%)
> 
> The instruction delta is exactly the two removed NOPs: 2 x 131072
> instructions per MiB at 8 bytes per iteration.
> 
> [1] https://lore.kernel.org/all/20250516230734.2564775-6-seanjc@google.com/
> 
> Fixes: fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
> Reported-by: Luke Yang <luyang@redhat.com>
> Suggested-by: Norman Herms <dockseed@proton.me>
> Reviewed-by: Kristina Martšenko <kristina.martsenko@arm.com>
> Signed-off-by: Jirka Hladky <jhladky@redhat.com>
> 
> Co-Authored-By: Claude Code <noreply@anthropic.com>

Nit: empty line in the trailers block. Also we shouldn't really add
co-authored-by: claude. You can mention it the cover letter (if any) or
the text below ---.

And probably a Cc: stable.

The fix looks fine otherwise, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
