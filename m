Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795491928;
	b=reXGnQYcIHt3G+J1VfFeUlRG+wZdqJ9sg+oqeAV3afEcbLUMuKlnnUcZfzKT0E2Luq7f
	 jpLVLlWDvZETLrV9kJF91I8CX0JMt8Cj2zQL2kbgYO4CtUaKoSJDT06d7edLz/DxAEG1h
	 uNt5Zl4TNUntD7vTXg4j7ifG08ap5a/oCxaD4+6FyDo/5BqEj8CCEizXCY5XrqRHGFDrS
	 oU59B2QTQE1BjkTAiO9tpOH1vS11qPirfCmAYHybl1YLlztFBzo56mMjDHzFLklQNIaXv
	 YAbMQeZlzlUtF25bA/3xx12dmAMWSV4YIDI/oaR1ePw86aWhdlni1u0IfScDVBf+wCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
	b=nIbSCebK84t7xlAGmtb4askF5Xwjq8zCr3/L4Xcze5rAZi4CN/oYSWPlbGNlCveOCbwZ
	 v9doeDix7oVeQ1sPni86kHkHr+NxZjvJnG53xPCzqG+tXMu0+mYfHYI+XnzJURF21bgYZ
	 krjz6jFaK2JDpeH9QRvot0n27AnL4xWQgbEio4ki20qxSF2S79zsKF/3GqQQQLg1ZYqRU
	 LqaubceNORBj7sEWP03THBKPTT1UHkKRFmxhLmgYTNjhSaWbfzhBm6wCrNOv8nb0T4RlY
	 cNVa3pfUOxh5wcYxwkUaK7oadaOB2kyS583opfSDKRpA9dniLyIFaEx8EUCHWs4xbkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=mL6KHw4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B163606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B163606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=mL6KHw4b
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so5814132c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795491927; cv=none;
        d=google.com; s=arc-20260327;
        b=soH3fu2bNFwKcXOUP/oAYEn/jbOZe3wJeE3QrGmGo3hMhyEjMMezIxWZ82N4Ib5Hnw
         WU34sVfc2qKqjZtwitTbpQN0Nj8tVi+NetrwdUb1juRgPr+HM68oI6PULgPjB+fuFBTU
         5OvKEtJcWYywfBz8ArxtSycCkMQYLtvaTk6cBf3z9NMuzB+t6BJlf20VqU4LX34Ayq7v
         XwddQdVlULBZZV3gvlTab02f3g1Bh/4qgQ5YCLJp52sZ63N7OIugsZqqVjEUx4d2B8qI
         /Ce+d+Og9ypwHVIytuD1q/YhDi91Jx5WnzJxZputwkTrIrjCUCCfllNnCXgOJDpt+8qC
         M0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
        fh=5dOuAv4SBCavqL2890mXKPJ/2/sq38SsgRkdtQWq4Ak=;
        b=TTNeG4ByF0BH/EDIKYffMo7Gb3Oas2UxUY6ygZM6+1BB5OoyQvcis/0XgLUjAY4DDT
         mLYfs7JMkQISY5RT0E6QDjcTMJ7Stz7AOojpcdIqnW9gJDYK2yb3NBc7j29Nxv10aufr
         +O4LcF7wXN4vw3dvsMibGi6xR2PC1AuJ7qS9xFaD4J16vwuN7U6D+NuWDtRMYnyBuGY7
         ztv6KK14A2+xBY/jUfQe/qHP9KYx1+rNLFXoV2Y3LDuXX1xo9Y3Th+vQfkoLRc6ZXg0d
         sF/thlG6kWHg/xHc80oRcXwPwLH5Ap9kXRFQzwD2x48lCI/ozVPyRus3em1P271LNUsX
         oYzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795491927; x=1796096727; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
        b=mL6KHw4b0KLimydjfHoPp53Yxar0dSnFLxK17BJz+GuI4raQi3w+QD1RjR7nfxFcqN
         AzmBcMGaKJuDc9v5uZm7+EsVcsJMNU0QgUjTouIp8ojnqKjfKj3JX+wXKaNo4IvhMpKH
         E2Wt+4IBKjIFGYOMSso6qvzQ0Wh9Q6/bw8Huw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491927; x=1796096727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
        b=PRrrxVxCXW1tdsc154Y1SizjXIrkMsYBPsRxKsm6vShOiI1G/0lxUhn1nuh2FUhQaX
         2y/LK8UFXAUCKyMlc7jfsaL9/yDEtIQq0W4QNtM69aAx9ZbhxLBs0RNXqDg/MmgKptuI
         TclQMNnAqZ9zl8gcZ4q1h+BLA9Dq3m7KvPQPyTr83LHUpYmQQlKVDeUc3vgB2d2U7P5M
         ZL7Q1WY+PCocoGxP4RAWy1Q1qKAU0UY/tvzZJBMmRp6PV2jWDCb1OF2fJg+He5S7mBVY
         o1VNFaE+BHL/8RB9tAqWBu0PHI0UbvPWtzIpXPwBmT7VCJnWiHmRlDbdP6dNSfAZm7Nk
         fT5Q==
X-Gm-Message-State: APuU4Z/H+Zv3+aZkfuzFrTkmwovry+EN9iy6BF27/Tp9IMKIwAF7Q3qJ
	89IKu6IET+q8XJnIjhrq8wq39bRY1b0rOVuqlOmp5ZoMuV5CganKgjV4hJixab72lKYayF3k0Rs
	vOhldcyS2OCjKTIWQOYDpy4TfodL5mkWhSuuNhvhXgw==
X-Gm-Gg: AZFdTZdAKx9COxZxFSF6THyyZmYfE8KKM2covTSQtoiR7YnfT8wx0+bUodUR0TLa4J4
	mgFkJJ/ZjuSYezNx+vtLnFMEcBxhn8bE6AYsOEny31CoI5eJgbBSmLU5GVIs//1FcxAQSluJZaf
	O8alEprG5SunmCVZhleTK6V0Pu+mP5PUkNSGxqFYS05bt+0SM3pILN0ryhbxJiWVzphYdQ6KLBo
	XbkyS9S7F2LkmD+g+0xjCbtZr0kC0U+x1d/MNqUC4bBQkP1Zd+gGcyLIOMZeZE3AmmzowdMv5mj
	cvBLEI47vNYSQsO6sk8zTduoUjOXoCn+gIvX10Lwy08xo0aShLTnn9ikPGcYp+JEO39JKXBmDKG
	ExVjvA6kWKk9KLqizha01x8gJmyhMn6gn/TVApL9a14aVwkNzKW7ehRHob2LX
X-Received: by 2002:a05:701b:21cd:b0:1b5:e9d:c641 with SMTP id
 a92af1059eb24-1b5568bc08amr13417093c88.18.1795491926992; Mon, 23 Nov 2026
 19:45:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124025555.2348580-1-daniel@0x0f.com>
In-Reply-To: <20261124025555.2348580-1-daniel@0x0f.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 24 Nov 2026 12:45:15 +0900
X-Gm-Features: Aa3M54rZ51tZkUYoAXWOn99Dz7MpcsEFJ1pC9mQcihsDmDqKlxmxIqXJBljv_DU
Message-ID: <CAFr9PXnVV=HtAEeCO69-iw0=byRweauT+KqRYmMsq1Y6S6mfuw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Define the m68k-specific syscalls with SYSCALL_DEFINE
To: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Replying to myself..

On Tue, 24 Nov 2026 at 11:56, Daniel Palmer <daniel@0x0f.com> wrote:
>sys_atomic_cmpxchg_32()

Sashiko reports that this got broken because it can't use its trick
for getting pt_regs now that it's wrapped.
I'll send a v2 with this fix at some point:

--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -514,12 +514,8 @@ SYSCALL_DEFINE6(atomic_cmpxchg_32, unsigned long,
newval, int, oldval,
                   Make the kernel do the necessary page stuff, then re-iterate.
                   Simulate a write access fault to do that.  */
                {
-                       /* The first argument of the function corresponds to
-                          D1, which is the first field of struct pt_regs.  */
-                       struct pt_regs *fp = (struct pt_regs *)&newval;
-
                        /* '3' is an RMW flag.  */
-                       if (do_page_fault(fp, (unsigned long)mem, 3))
+                       if (do_page_fault(current_pt_regs(), (unsigned
long)mem, 3))
                                /* If the do_page_fault() failed, we don't
                                   have anything meaningful to return.
                                   There should be a SIGSEGV pending for
