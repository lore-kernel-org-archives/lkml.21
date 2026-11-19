Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123200;
	b=BwfHzAW9G1S3+otmwkcZS5GVlu3Do0ZVhLarSdEJe+ExkidzbTGSGaclV/WxfU+rvj24
	 4tBYtSMWaN3cM2wrGR7tKE7uy0LZT5lGfhYH4WDcOGPqOfgHrg9Edmtn5eaX3uEgOrIPW
	 gLlfH3rcdcv6f3e5+olsTgpM6D56Lh8bVMcM+2/uOQ7T+xvLxCEqCrZn/4H6P+1fOb07I
	 HT+M/b2AtjvUr3npSyoFQqLiE3YJG4hefkUH+ZRLt7rKJcBMZcNaB3t1s0r1O0CUe2OdV
	 0oWiznvFZgWfMBPGPLHvi4mXu87FGo0NkEYwcLJqCDv3CvO1qAXJoWY5uB7OWXtUAZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OZc3Hh1DciK5xgYmf0zZ1RClkKI7jh3AfHf4r9PdGc8=;
	b=W/WfXJ/lYcg2zZ+S923zD6NJFgXWmWGKQUkt3qN4qPlY+eGkW9onI3xuu2ngPVFnvKr8
	 aiscKSCOysf+jrQBxaMZwsG3sufVEEXPMEV/YqotfkHmdxWIhZ9ZrVobAWyMcHrJYOQSA
	 cPU4GrcAN/3JxugfHP3z/jNywe4q40ZpW8FoU2Q4zHT6XZSBFxOxDp6ebuOi3saTUL2dl
	 TSohbCx6eZsR6FocLFezJWmZabPDJv+K6q6qgZF2Bo5j3HbFgymodPp5Z+XdtZeeyuJ1+
	 0luvojPNU7x1xUjpiLGxpvfUynFEhYyNOO/Xp4nN8fNk0Mxm1UA6uT0iKtiGJDAFmNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iDC/YNiY";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD5606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFD5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iDC/YNiY
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so379305c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123200; x=1795728000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZc3Hh1DciK5xgYmf0zZ1RClkKI7jh3AfHf4r9PdGc8=;
        b=iDC/YNiYbghLmUQJ2nboQ+S+l1VknX/qKPG5qWckFR4rRYriTc8SXF3QQ9PeklkGVd
         /wlu7qK18uzPYzqjn6yTXZwuFszMzfAYhmiZcw0lRJYXxbVl1p6Buh1hb99VGY/3tIvr
         GqiiFRvyohhMonvX26kCYK2ABRYqVZSF6RtT1yg8liO6xSM1kVdl8PsOxms1+c8UahzG
         3h0IKAA6iugpmGOm+MYi6raMV11nRK1xZn7EkT8tlTGIWI4S4O4xRoX93SLrIavEV2L3
         ym8iPqLIye6J8KrrM0l7UlEh3xVk6XWSHdV0yAcN4uDjhpknoBZgoJ7Gp492tzBlI5l6
         Vs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123200; x=1795728000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZc3Hh1DciK5xgYmf0zZ1RClkKI7jh3AfHf4r9PdGc8=;
        b=s5mQ/kYCLI3n5GXsWRY+m1XaiNIp0cGU7dUbzgJlFM+q9QG/y+iHHcYgoscf3M1b9f
         oRdz6F5bFG0QWNyJjiDMVg1PTS/y5jSYSYV7GSxLEoNkDwtMmhJ329xlEexpUZ4dlO2i
         ojPnxZwyaBQCh437uPgqT2HP4AYz9GZVQGbzXLpoCIToxctp77Gt5zUeSh0yw2coKCjj
         X1Ye2hzbijiiGgaMQ8Jji9dAnZUHBbOGvLT+k0rDhx0mhHjQAb4zT0krdz11AFgVUgL9
         1shvdWa3ovqfTf+41aQugNmfiYdNgosexRMHYAmZcZE5TcFxe8+a1VioO7sw4sdkTrfJ
         76aw==
X-Forwarded-Encrypted: i=1; AL+hErGF/9oqIVxpQjCWnq0yrb5yo6zVdJ3lh7nFfyFRVENgTlbmw0qKIK085m87jsODjmGu/wxFOXdzLtHrJTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GjmuAfk1hLqKVH2Vn+O1nQmCBZQ+3vbSp0wDpcC15WdVg2lK+
	p8CmkWMAYOp0sqgGuUgMnO3+cCkPjpsNp83UgQhjCr+r0ULOLlYB/Zga
X-Gm-Gg: AZFdTZeKmP2TYyPMhAoPPDQEwEUAU7DdBFD+I1xvA7Cv+qL1Vyac1zxTqrLgev6/QIc
	OeZZAmtN+st0ZV8ebKkcLZF8C96lNymi2sjydJoYrynIaSPizuI9rOXnNSdrDwKmUvcbU5Yzr1m
	026xmZEba9EkgOv+CSqGDmcWi/E0u1niuw1DJFbMH/4rXbyyhlZOWgAeX7Is9tv4EN1qojOqyxg
	r6Ktbh69+/C6yM0udM2GSXc0H/7CuO3SLt5Mu9pc1durpuSTTCpNirPxbY5MMNnvYWPWJdPFyms
	uNnEI50i5DQBTcV50UKd6xCL6AgokzFmjYKyxOMU5lUpKN6ArZ6jHohdugyPfel26dWRiVDQWBz
	/UYamrSeEn/wQXR8WjbC/p3Il8mcrhkdAYD4tFZlmUawQxyWfOHTYTrsuGfnkjDbW1hXGWA4RBY
	KsT9lUSrt8Mq9lIn1Bv4n8Qx9MTASgzBeNdSrCcv3Lbph0s/uG+1srQHL3PG51/0gzb8D51zwfB
	o/nhzB1xXaRCiFusF/O2MYzDl6RPc++4DBpMxGOSvZ/9axfbHoeS0ANbbum2VdmoT6PdEB8BMuZ
	fFMcO49RqToSF2VW0Ovdi85V+sWtKNeAC6y2+zDYIRw08BRNMpd9Z8EluzDBk7EYcAnkT8m2Vbk
	u0WZ0pm+4Qryf8MPLM7Gn+dNbsFBIkZoLH4iL1rK4LL1hqnoxiVKcqAd4Md/HBHQmRwBBFgnS
X-Received: by 2002:a05:7300:3e93:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3857015eaedmr578371eec.21.1795123199544;
        Thu, 19 Nov 2026 13:19:59 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm1466388eec.29.2026.11.19.13.19.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:19:58 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net 1/4] ptp: ocp: prevent timestamp rearming during detach
Date: Thu, 19 Nov 2026 13:19:57 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com> <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com> <ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev>
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

On Thu, 19 Nov 2026 at 18:24:24 +0000, Vadim Fedorenko wrote:
> On 18/11/2026 20:05, Ahmad Byagowi wrote:
>> + mutex_lock(&bp->ts_lock);
>> + if (enable && bp->ts_stopping) {
>> +         err = -ENODEV;
>> +         goto out;
>> + }
>
> ts_stopping is changed only in device detach callback, there is actually
> no need to cover whole ptp_ocp_ts_enable() with mutex, I believe
> existing spinlock can be used to serialize this access, no?

Yes, the existing bp->lock is sufficient. I have sent the four-patch
v2 common-fix series to net:
https://lore.kernel.org/r/20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com

The revised timestamp fix uses spin_lock_irqsave() for the stopping
check, PPS subscription updates and MMIO. Detach sets ts_stopping under the same lock. Keeping
the register writes in that critical section prevents an enable which
passed the check from writing after detach has disabled the channel.

The disable path still flushes the interrupt-mask write, but drops the
spinlock and restores IRQ flags before both pci_irq_vector() and
synchronize_irq(). The former takes the MSI descriptor mutex on this
kernel; the latter may sleep. There is no new driver mutex or associated
initialization/destruction.

One additional detail is the PPS no-state-change shortcut. Once the
IRQ wait is outside the lock, another disable can clear pps_req_map and
unlock before draining its IRQ. While stopping, the candidate bypasses
that shortcut so detach still disables and drains the channel itself.
Outside teardown, removing one of the PPS/EXTTS subscriptions still
leaves the other subscription armed without unnecessary MMIO.

The source-derived ASan/UBSan harness passes late-enable, in-flight-enable,
active-IRQ and in-flight-disable cases, shared PPS/EXTTS handling, and all
six channels. It asserts that MMIO is locked and vector lookup and IRQ
waits are unlocked; six deliberately broken variants are rejected.
Both common and WiWi integration PTP objects compile for x86-64 with W=1
and KCFLAGS=-Werror.
This is software evidence, not kernel lockdep or physical unbind testing.

Thanks for the suggestion.

Ahmad
