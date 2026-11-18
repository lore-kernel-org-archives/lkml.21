Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973209;
	b=r7/0GXFz3qFiipYtn7HoSqmRjHCzYHoyok58VdAxEOweDEb90gXNfDOrGqgHuEW191+Q
	 NFzjQfT6AbMXBvI1KIhMd9S1KDPUIM1shiubYlG+4VfjnPYk4FJ+K6YtZWIDLCTlW812W
	 73cwRiPynwJOg5tZipr14JiklugoeS4JHaiEMjXRPPMc7i9ohP0KA3hoTszwr1otzqUsH
	 vwT61s7b0HiEPwQQQkxonBODkwKgq7JHAAjLnox7s/T0DYqNHivxbSGZhdlztbLKKs30r
	 1EVjFngwiq/X5i+x3HuVseELLriJbxh842e4PvwE423zKSEZ8tAvXRoIilAwCHcVfow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973209;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=nxlrqYDPmgF72/xL2i4J75YGw/VlBLqXYNwjkYeKScM=;
	b=FpeSzBykuWUiThR2iNrgVtzVrnd3iHoUsPyX5T/nhcSiYB1tgg199mn295803mImKLVP
	 ZdpOdJb9G5G+MjdTjqJ61gX1F25sMDseiOVvbkqcAzeGZVqFnoXJyYrvPGE7MvZmyVqJZ
	 bjMnkSNm93hnEIMVDY7EDwJON229n8S6A6ScuKqqIdl0U3ufnCgtNXryV/9V3toj4t7rX
	 9HwpoyNSbuU0utMOCX6y0vDJLw9X0Fs617VjAkWVdXCi9CSoz1+xHBIP2z7dz8cqEVV4g
	 G1iRthl9tclOp23r6sfGpNKYs2b800u9Wr4fgoTlpQy/sWYb5KFvIoPaXYEp+IDuPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghpW+w5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE09606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghpW+w5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061831F000C4;
	Wed, 18 Nov 2026 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794973208;
	bh=nxlrqYDPmgF72/xL2i4J75YGw/VlBLqXYNwjkYeKScM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ghpW+w5JF+RqNEoUnukjPeRbHBTsONhE9hel0JvVqM+XTuOVcpx/5kp8yVgHfdHVp
	 RiEOiQ+wlQZpzbluqX/1ExiVz+gCavZdmoSi76QMI+Qa13CP+sLb39oS7mT051yWt8
	 /8gxmMcYLQx3aeR9U6yyuhtbdPcIuQohIL5Mvj9Czfnat9lfJwc8k+vovFo/HRGUq2
	 CR8yWBNpQ/QvT/sUxp3LKZ4kKgcMGsZgXzQOs4ILsXf4fw3FNKwolA5URPd2+8IZ1r
	 fGud3CumLRDRqHnVfSRFWjDage2hvFK99LGcfaiOXEKwlXYgxhFGYdRvz7LESVp7qo
	 rsa81iM49kcmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F152C392E983;
	Wed, 18 Nov 2026 03:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH v1] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179497320678.1446207.12594230734069147905.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 03:40:06 +0000
References: <20261106190559.1906130-3-conor@kernel.org>
In-Reply-To: <20261106190559.1906130-3-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, jszhang@kernel.org,
 andrew.jones@linux.dev, thecharlesjenkins@gmail.com,
 guodong.xu@oss.qualcomm.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Fri,  6 Nov 2026 19:05:59 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> RISCV_ISA_EXT_BUNDLE actually made sense when it was originally added,
> since it presented a simple interface where users (be that in kernel or
> userspace via things they are presented by the kernel) would check the
> exact extension needed for a feature, rather than muddying the water
> with parent extensions. As a result, the kernel does not track the
> status of the parent extension in the bundle, nor expose it to
> userspace.
> 
> [...]

Here is the summary with links:
  - [v1] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
    https://git.kernel.org/riscv/c/642fb67393c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


