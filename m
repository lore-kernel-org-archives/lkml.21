Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685610;
	b=ThfZ9NPA+zI9YibUzaDOQZ9sizxbeVkKEtwR7dfcvvALgz83ccYE5Nwf4XLppKQ87BFo
	 lnvihaoESWJRPAdDCp5E77bfU6gR7EGTOmRkYE92gvuoL2WhbdoBSc5z7ZniizzfWWtNr
	 yTie9kjdNWDHFTUEmQQ9z+L8ackK0Q/dygHpNlvMjE4RLQDf7XaZfEa3u0YeGIRBBWK0A
	 DbYiM3hUld/vhAWsvOYtNDtdU7rO3b1JxMbzwdI337zZLD/lIbkLrEt4WvEgC3EoGHlPo
	 dG/bNxAU55s0xCE7Cd0a2dWQtzpxfpqdIq7S7j1Teb89mDtcBI7uY22aKOsP6Wln9Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
	b=FGce/ESloFmiegaco+Zf7fqM/zLB5zjFQmf70oVAfReHu62czmsnuoz6FGT83J+kNcP2
	 kLSuwGRd8i5lyI38oPISNa0RAd1D2BGyHxzywgyOsxkIBEWvsy60MoUXOplCWZEmkjJN+
	 XXcYcE6saBaMXaBfsOrCHVujr8CcOn3jzqlnlKXJ3uWZPzDwlmABx9WVfkTCAlJXEKMPF
	 +ANxV0Ne+uxzGPrYjKoUiubQRKbIszFn5SWqd/t6Q6xFWILtT607gBE89CnxpSM9edb55
	 reJJcq9raU3rkgjuEoJ2PtxnK6XuuGVByNxUiwAXuvBE40CejMvxZE7hwTIHOon5wVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+gRajnT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F7606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613F7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+gRajnT
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so7975343a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795685609; cv=none;
        d=google.com; s=arc-20260327;
        b=FMfdTzGrB1tUGjlR6GUL4cTEKCL4n2dDmkEUqGsgsGC9bTULYP4YHhQ0ccI46UctMx
         Ls9HqAhy9sR1jCiMETRxDb+McRoLMsFbDDkSSo5wO+nyhX7fCBbJvrA9hHxVdkpttbLK
         COgroMh4XfAVtpxn3F8dK6uIIvboJP0iwdmw1e/TkFj4oU2yyMrmcCj7ivM+VyGbiOIU
         mWrCCevH7e8j1mUTFgSRZMWPIri8BNv+Lvle0EPu0h6Q+t2lt5GJQ9PO0xZWbRMvs6gd
         S88swJb0204sEelTg2m7eHV7h97nFzYRKMUz/R0enDPUkT842lO1SHq0v7KuVuHFpMjT
         heBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        fh=ejw1wghsYEVOj4LH5p3oVriLHkDCVwBPQSc7EyrNIxc=;
        b=cRzjlxcm5JCwrM0nYysgGqjR8X6cE7KXLNcuZdnntE46SOiN4Swjjffh7lj4e+5DT6
         LczO//q3fvZ64loTa3DR+cemFNWX/uzNC3PG7Meue2qtO06CPadf8rAoSpx1awylX4wD
         KPvZtQmdZRD2WwgWR8g+yP7ljhzfXmnj3AcYZkSxEKtvygSPIFUAvyftH7ezsqmGsJGP
         k16V1DYECGYRr1/Z/Zk5NjIseZ8MGh7Lquq75Xt3vxGvfTMFy6wndJReH7bE0DELfLoI
         jWABqHVkUtfAeI9Ld3YE9Q1sqrqIbnqsGZwQeHBlynZcrJn/FpAKVpN/U/yxApBeNMua
         PKTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685608; x=1796290408; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        b=v+gRajnTMqxEUnBmLVuVBSZpf4CfM1xGLLbAvu+XkEd/MHTb9wNvkQjRV230FUCTX/
         1iEE9kE1TbhvhclT7QiTjTa2HjBwka7wFbfgtCrhOh/u6kz++vvmi2MqbUW9bbk4DK8U
         BOEqzPw5qtVUkwHa8KVsm7LQqTJlwI2xYfzVDjOxf5lFiaAaQYMQAB8TaVKNMEs3FB/D
         mx9A8Mit66jhDZ6Y7GOLjt0Uu0zW9BMGJ+Q8Qs3KAfmyWX+aAv2yYPJIBwSRcDRLC/Fs
         ADG8FCImuz7khE8RXLVVL61XdhcPHSTLWU5sTorVhUQNVtuWmL4C7QlYQGsMz0f192Ku
         xG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685608; x=1796290408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        b=PE0P/m4zvZvYPd+hOjEUKqwJxSJbG2rDFXbtuhB2daDCQYutGSUpbNfUtD/8y4WuiX
         6NyZif2/c8g86I4rAfhIkHnqJY5wUz6wltPVLhNzgH1zMrUIi7p948bDDOd5a0I+8sgS
         jNIFl36bgSYPUyHH27+8bNHI/FIYLyBZx8dxektV9zRPjIGHJzZ8QoO8JYDG7GfBVMSc
         c5nUo2Vwx7h38wQAb7X8vgSvDQG8/ZwaAdvdENxsdwCvo9Efb+DSXvmxKEeQ0J471vqs
         fTyxzOUrKvhLuF0rbFlMw7Ert4Z8DyF5Eh78LDY8ISX33xWT4vttCydODP1EtuNRRQcb
         /UIw==
X-Forwarded-Encrypted: i=1; AL+hErFXUWb4igvQUOjn49AoFYvL4WJkMtixk8HlUiyAU9ywGPkCr7x94Xejc2fA/j+ZD46XJkjVxQ/B/qd1Fw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z93w0cQg4Akv0bigm+fu0yq7Rv6SZPpErPMG4wdyMNxwzvvt0TB
	x/xClL6lW7ZVhMHxKfBTNkYqovdnac5vag/RhEYtAeLCgR85OeLGzsYegmJjMIE0jyNTHhQwuba
	NL1luUeMSPxjFUF6RFRXpVxQWojsCUdk=
X-Gm-Gg: AZFdTZfv7TqdzF8fGjVgMyfCficvRqZ3B2C20+VFYyJbM7igW1urT5d4zKAmm6iLZ89
	Q3Vs354dKHH2I/Tf9V9KQ2F07EQCeMNxECqPlNyKoT/vYyhUIn8dqzbvnjwBM8l8Jvd54HEb4cM
	kW4+wrMNtZl1amdKtzzHbvdD4N0r22PZG7LfNLFHVqjC3w40MEhTMRnKNaoDzPKrG9q1SUUXsP0
	EHl/HFuhRuCjZe0UO3gQ+1qdx34csG4ztMARHkr56cz7WDhQrT0pCQ6yej8Y8fZ7wjwPHPAXkjT
	mQUwAoK08AnHwISnJg9PRNL5erCmkWIOFFycFTNvfUAZGyNzBFghCBTQgKQpLXBY7f5k6VCvOwn
	+c0UoFUP7bBKtDzxdMeApsu+WUu1fk0pagyc=
X-Received: by 2002:a05:6402:400d:b0:6b3:f891:c2d4 with SMTP id
 4fb4d7f45d1cf-6ba37ea5360mr13616725a12.29.1795685607957; Thu, 26 Nov 2026
 01:33:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 26 Nov 2026 10:33:16 +0100
X-Gm-Features: Aa3M54pI24nQZXDlYenmTwMKyRI5daIxAw0Ak8m40BV3tPU-M9NeeIVYIMbKRNc
Message-ID: <CAORyz2LXi4vpwb2dEiq8R8t7x6nUk-DBUNs9t-cCrP7rUodbHw@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up. With the bit set, the timer that
> mtk_gpt_setup() leaves running could latch an interrupt that
> registration doesn't acknowledge, the kind of pending interrupt that
> commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
> leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
> timer before enabling the interrupt, until the core programs an event.

Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # MT8167 Sony PSC Mini
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
