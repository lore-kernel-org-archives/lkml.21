Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995332;
	b=kZjsKrCqiTxfubYki4NWh/AI4r9yIMEkP85eHVnrmrS+qS5BqKgDvf59NtN1tvKfl13p
	 Fr3PblrGOM5LiunSuBY0rh+I7sPRax/ZZ75aaO5mheXxM1g75A+ObbnSuIBQyq1hR9RyV
	 YgtFCcSoixWtcdVFXcRoMn0oSn6Z1/kwQ4jadu2KfyC9ZlMJpVe8Tf6tZnYCqdCea6wJ1
	 C74wWd39rTfBC4lwNdHtQtmtBOeCw7RwINIguFK87gx1igfRTIdCuv8tXKWHtZSU64QSi
	 QJ6AawRsCXFMY01MVWvdqT94dwBFr70qs/dL0AJ0gwangByhRco7D2p3Fw58CsiyBHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/Sv2HxEY+lmdMQ/mit5Gq6AFEQxxU55cOeDrN9MID2E=;
	b=eS5dSx0cJ3pyFwbz15lK8iDPXr0tCSlOgFanfpMx2zf3gJu0J0KEh24Q0m6vQT6U2eAf
	 wDihktD7GbuusNB3R9EoaJJI77lyGgzH+JZfJSBXXBcTMbXpZkQVzXT5UyGrGXHVtWYPf
	 wuUdKGuhzzx2wpmhZXmvzXyIZV94wlPI4TKRHg9IOTb/bsrtPqMGf6Z/+fS3uPfhjC2Wl
	 23rOaOxPPs+fpvAeTECvwTzwXhlM0OdDMRxRLp4ebA9+dW9oXQQNdjoS6W9NYzuCGQwjK
	 odw+OiW+DQcQl0XN5pSBdUCbdCh6w5ZB7OmutWEHabED56/izOwTQb5LSmD0l0bEyPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6gRC7EV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D53606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6gRC7EV
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37198ed3727so2240869eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995331; cv=none;
        d=google.com; s=arc-20260327;
        b=Gp+l+9veKcupRU6dJwWkd32C/wtiZEeAnzWAEbk9asJV5xAVDoIFiDV/MShivs4AGK
         +m7Z/VhUFVId2eARfuUDCJcJJ1K3R9GzumXaU1jsYMtuyi0ETbGBHMcgEv2jr+/qbNXY
         bd8psbEmuiPwblIrs2cDjInQLEfxe/89X4Q6GbKhGur7zr/9fSbIJJCNOp0QvbyfpAbi
         dSawVh9O7x38Dln6UUwT/8KwqeQwZY6e+eE114xeUW+5mlH1LC8K9rGJq/6agUgei0/D
         rNtkzzm6561gcHgxthbTHpMhaLLh/Gek16CRjsX1hOTP/s84KH32vaazGgPKTXFPhpUq
         M6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Sv2HxEY+lmdMQ/mit5Gq6AFEQxxU55cOeDrN9MID2E=;
        fh=+1CDPDq7UCPyF4VrMqP6iK/pjjo0ik6dGyy4DHT8klE=;
        b=YI+ADAff3MKhkizZoZJMYZIUe7R1A3h5W2UAWSZZ9URyISFa8XCfZMerF0RwNCU+ge
         DNzWh8AZDQLehw1ZV/mCNu7rJiyZ28LB/cm33mUzNuf9j119TDGSo38o/J6C2innp9a/
         Bhb1dLyaxIPC9eqa55g+JBUSjT21FypSVHyuR8ZZNcY6OOvMzDbMioR65T5dvSyjzlWe
         cO4LWgXpGSiuwn3nFc7tJfkW3q+eWaaaTKSu0Zj6nZldjA+twIplkcGGiHLvkvMLTaof
         ElQeRhBfUsy/5+dXfPrq4DKwI5wYy97IJr9sYq7S/rRVQQ1i3jFZqI4bm+ZNCiGrA7i9
         6lww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794995331; x=1795600131; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Sv2HxEY+lmdMQ/mit5Gq6AFEQxxU55cOeDrN9MID2E=;
        b=Q6gRC7EVTZhfpZ/7JOgPasWeBh0J+aWdxzLh1FRqaNqa7e5a778XYbWEHhJFIMva/O
         R7ib68uw1WLPQlaNxRs7JoZF0qgMqWx01jMyY+ZeZjxVwY9yUpf4nHYrlvIeV4HAgjLW
         c740bcgf7UFDv7dKhdeGMyRSquxyzqjMTjFlpJjO0bICd/L81lFCDtpC7UFtJ8rqNEbY
         PSIwnwzHOK+Ko2pP2/tdHkotiHDo40PUcTxMqm530z7JPGCsdV9d9kVybGbplpsSbKNs
         XYK//Am6oukUjkcvSzTi6o0umbKahn7aVFz0DSRyKaZvmB4vJCrqM0jOZiEPzzMWDkdR
         VuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995331; x=1795600131;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Sv2HxEY+lmdMQ/mit5Gq6AFEQxxU55cOeDrN9MID2E=;
        b=Xl8LOG6rCigEfrr2IRMDelCP/BYLmCkwCcKkyxnQc+jsJ7359X6secTgfVMcO7dD/0
         WXpVOc5SjELq76uYk7lUsWg1P8ME5jBfhCBb5sNp4UjnULVWOAhu/piBXlBhAxgyqK0Z
         coUGp8flHYjh4DIzJoZWTz9FczVA+adxc4QtkGeJHA3RfcWFb/BifehXz85+quNWY8TI
         p72MFGRspviqWDrUCF7RB0+i/CyLFTyDskEwWDZ2zyUodMRl5PmzVWYsw2wA1VQcLjDI
         3gmZrs66YY2cecHPzQvWkNfppm70SkEFhiWBA1C5mNgZGvTxC0eMyVTfNJH+NtDJu/Gn
         UqPA==
X-Forwarded-Encrypted: i=1; AL+hErFfSkFKAnNx1/hou+06W+oxeedjiULWvzQ5WRdufu/dfsKXwaO71q8WqiP/c/smusXNGfDJBKiuhPl2DVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PuD1PUH5IQdxX3ZVK6g8yPoTLR43shnCBJXsgt3JGMIFZfAnf
	uInj/umMU5tlhSUbo1V7cP6X9/UO6W1MGBoGto5nGEO2FRw0p+mMNs0YkpEU4Npn+eUzPsxymvQ
	Z6NuRjps+fPyLYvwyRr9WDDKeIlrAxnR4CFG9fy67
X-Gm-Gg: AYBFou1bCGF31d3C7JFFDsJmCsOedHVtZYjXW9NUTWricwcMMEhM+5Ww4kFGsSyPwCp
	hYSkwuXbafasSbGFBz9HvBA1V6c75cgBqql1QnU4dwxTSsXK7tPmDae5i1Jl8Z+JnApAvF9DNoz
	hJLVKPQXaykP2q6A8mVtmbDZbttITj3LGGUxTzJugpIJaz3ThgNfueFCFN4Qitm4NctN6Ktp39G
	nc63V1144MDcxG1I8c9YmGwvm/dQApvzcMPOSmocuFjEZWhfDkYzcAsBJj17Qjioe0v7+sU6R78
	GGXWJBUX+dm6VovNIvxzPxEkRU2jl64h1XUmCAHojZnV6A2u1TW7Bmoeuwyj1hDoZvBABI69kAu
	GJlgF9APEQwGvfp+tlhCdaiYPEheUBJckSjiXizRAA1LLJVfaWRKSpvb7bjg4lI3lcuwG
X-Received: by 2002:a05:701b:4590:10b0:145:ac96:3917 with SMTP id
 a92af1059eb24-1b53a470bffmr4189203c88.21.1794995330669; Wed, 18 Nov 2026
 01:48:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794869902.git.bvanassche@acm.org>
In-Reply-To: <cover.1794869902.git.bvanassche@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 18 Nov 2026 10:48:13 +0100
X-Gm-Features: AclHuK8ambloCy9UjL-2iIAKWhaiq6LwjHSDeRQhyh2WGlPKJkHe9Y-ZzLWyMtI
Message-ID: <CANpmjNM6uRoDb6Gi4Ycdof+jyqHr93VR8mDAhFbNR_JBC03G0w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix three Clang context analysis issues
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 00:00, Bart Van Assche <bvanassche@acm.org> wrote:
>
> Hi Peter and Marco,
>
> This patch series includes three context analysis fixes:
> - bit_spinlock: Surround the bitnum argument and macro expansion in
>   __bitlock() with parentheses to avoid operator precedence issues.
> - cleanup: Mark __free() helper functions generated by DEFINE_FREE() as
>   __context_unsafe() because cleanup expressions that unlock trigger
>   Clang thread-safety false positives.
> - srcu: Move __srcu_read_lock_must_hold() out of
>   srcu_dereference_check() and into srcu_dereference() and
>   srcu_dereference_notrace() so update-side callers satisfying the
>   lockdep condition do not fail context analysis.
>
> Please consider this patch series for the next merge window.

Acked-by: Marco Elver <elver@google.com>

... modulo pending v2 that addresses the srcu patch's concerns from Paul.

> Thanks,
>
> Bart.
>
> Changes compared to v2:
> - Split out only the three standalone context analysis fixes (v2 patches
>   1, 2, and 4) into this series.
> - Dropped the lockdep and RCU assertion behavior changes (v2 patches
>   8-14: lockdep_assume_*(), lockdep_assume_in_rcu_*(), and removing
>   context assumptions from lockdep_assert_held*() and
>   lockdep_assert_in_rcu_*()), as agreed in the review discussion [2].
> - Dropped the preparatory __must_hold*() annotation patches (v2 patches
>   5-7) and the tracing branch profiling Kconfig patch (v2 patch 3) from
>   this series.
> - Updated the commit message of "cleanup: Disable context analysis for
>   __free() helpers" with concrete examples of __free() unlock helpers
>   in response to review feedback.
> - Rebased onto current mainline.
>
> Bart Van Assche (3):
>   bit_spinlock: Fix the __bitlock() definition
>   cleanup: Disable context analysis for __free() helpers
>   srcu: Remove check from srcu_dereference_check()
>
>  include/linux/bit_spinlock.h |  2 +-
>  include/linux/cleanup.h      |  6 ++++--
>  include/linux/srcu.h         | 20 +++++++++++++++-----
>  3 files changed, 20 insertions(+), 8 deletions(-)
>
