Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696102;
	b=Lm47Q4PK0am4qOq2zEt9OMY5x9/MhLez2MBIwsQLykrTNlCYxlydnmjR4dDGcJkdYV7M
	 vZiA41mnWhZcBXsjy6NKaUGQIn6C7XpumpFU5Db6FNpGj7rDPzjHJSMoM/OeKv8tqfLX8
	 xifNwFFNqsIviTvL3KnkB0f32tCUiCFWP8tZVHOWhRCL8hQUnGJkj9CwaKfsOzbppM77W
	 CU29VDluZ5fVgDHb5NPCMJL6XijS4vNyV7wjqsaJwv3oT+TL1jONPXdlQFKrzZA2VFHzx
	 RKVnHhVlgEbzIx20p89YsmpGJIRluxCom9iTPLc+SocRThfHshgR0QupbKT4yGmoPxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696102;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ArlvmEMGN27jBhN3Cy984yIjnWKIqYZFJD4/EaUdqjQ=;
	b=AWsAQIbAWJHom9Zb4vdGdXHTTVd6oK+54OSyuGM8CU890bxosBRrtDjFXfGEedAS9viE
	 13faRnKckPMKUKdUuh1VbqyjarzvWqjBMA98qMn45b4mZwNC4VEzSTamdM6tq50ndDhKn
	 WcjrLDq7CFYa0t3slLoOwN0eRwBxoGxQ+ZqBwueVAHCr/Rs3LpwY8emQLWQj0efyfnbGk
	 yvCtfmdl2cjzmusv7PeKfMg8dS2apTBiGJf3hvulTPr8KGHgQG9SEP8X1PK4rznzmWrsH
	 yRdiav6e3ixgX93qPaXc8tjOWmazVgbz3eSVSUmYvc4Y4BCKpyILE+qxJmE0ywZee+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AfzYxK3P;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E62606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AfzYxK3P
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E21AF1C2B;
	Thu, 26 Nov 2026 04:28:17 -0800 (PST)
Received: from e142392.arm.com (e142392.arm.com [10.2.213.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 882243F86C;
	Thu, 26 Nov 2026 04:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795696100; bh=HCbX/IbazWKscucgT5cWE9fT0tX8wPV3R692kWKmp2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfzYxK3Pjv7BE1onmPbYnITfBJtYkGApfxkf84coUMyq/ikkSSiuok7/U26301SFW
	 4sgz+Z6fwGvMaNz1l5c0tmQebjLImimHCBuVkQapkeHXNXbIF7VniC/jMIwmVXaEbH
	 UIHBj6Yssf3HCc7Iz8RIoCy4IjyPIgw6tE13W0aM=
Date: Thu, 26 Nov 2026 12:28:13 +0000
From: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: will@kernel.org, catalin.marinas@arm.com, luyang@redhat.com, 
	dockseed@proton.me, jmario@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Claude Code <noreply@anthropic.com>
Subject: Re: [PATCH v2] arm64: clear_user: keep alignment padding out of the
 zeroing loop
Message-ID: <lnh4ij6zpo5haddbkvxjp2gui6xlgjzaxkrmh26xgovc2b3muz@2wapkzpfnceq>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
 <20261124233043.1289050-1-jhladky@redhat.com>
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
In-Reply-To: <20261124233043.1289050-1-jhladky@redhat.com>

On Wed, Nov 25, 2026 at 12:30:43AM +0100, Jirka Hladky wrote:
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
> 
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
> Signed-off-by: Jirka Hladky <jhladky@redhat.com>
> 
> Co-Authored-By: Claude Code <noreply@anthropic.com>
> ---
>  arm64/lib/clear_user.S | 3 ++-

This patch doesn't apply. The file path is missing the "arch" directory,
it should be arch/arm64/lib/clear_user.S.

>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arm64/lib/clear_user.S b/arm64/lib/clear_user.S
> index de9a303..143d2f7 100644
> --- a/arm64/lib/clear_user.S
> +++ b/arm64/lib/clear_user.S
> @@ -37,7 +37,8 @@ USER(6f, setet	[x0]!, x1!, xzr)
>  	subs	x1, x1, #8
>  	b.mi	2f
>  
> -1:	.p2align 4
> +	.p2align 4
> +1:
>  USER(9f, sttr	xzr, [x0])
>  	add	x0, x0, #8
>  	subs	x1, x1, #8

Looks correct to me. I didn't realize that putting the label on the same
line as the alignment directive would have this side effect.

Reviewed-by: Kristina Martšenko <kristina.martsenko@arm.com>

Thanks,
Kristina

