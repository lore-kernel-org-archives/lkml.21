Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461572;
	b=Sk0F4qSYfJ1KACov1EblYmnRptIrSI18L5HiCX8+/nJGxd/mjVoDAaFkNLCg4UzM/Peb
	 HWhi3vhABVo71W10nrWrZbCk4FyUpFJjrOeos/Wvfd/zwAVREHY7mn6mU3qu8PoQWnx97
	 xT+QbPoLQU8MZLMU0gBiC7hToI4yafZK7sp9jpJr/B3wzVyeP3iybJiT7dOP1yInCYZmn
	 8Jq7Vph0K5+VFcbCTsCbGGkkziFjjWHU9xS+aAIGTC0TAJmfpq2fcm9g9eaTl35pCKi5c
	 rU9/EWMm4K0sb3IbXOBfIzTl0AqAUDJQvOcRQwckRJQ5eoylu1i92kbSepa0ATSziww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
	b=w4WM/baEzWhn0D+5sOeUUqU00tEqMuSKRaP2gFAvgf6mzx/Wz3eBubbMmyjfV9eya9nK
	 3aEBrxUzun7Hg1DECWQac7Exl6k51dlPZQzxjXSwQ/YXxiCewKRHTdGSKOS3KL/5YB9sC
	 TwCo8kEBTkOo1PGWwxO5si4aqBYyHBOoVA63hF26YxTx44JLDUSxA9J+s570lfnp+D3EO
	 JgwnuJrYVebK2pm2e4/9kC0rfS84ikmevyGkSR1P+ZIBktKGgLzbJT9xtSTDJiFPZLIO+
	 0M7o85G/P+CmA25aRnkaBL7biJEd1LymBJpDwixmX1kWuqCmCGzC4upeGSMchLKcWDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n28HukaN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC88606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC88606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n28HukaN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2206469f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461570; cv=none;
        d=google.com; s=arc-20260327;
        b=cxbrQR88fwA//gziQSNFJT5cKB3aM6LuB8T4IGHbZBMRTiGmU7UKlviTrAkpHhQ2en
         gUnxSjlASRzyx2ZAwGozKq+MBjSp8UyK4V19ThWL6bM0mcUYgARERxEZyVGp1WPcEd0s
         7JSGxMLzR/a7MUtXoKQHc91pVxpIVf8DLb9+ytKPxiujlXaDYEnbJA4Zfla5z7RPNsov
         BZmoNWmELqefdrtXCj5mOKV3Mw92E14f+XCcJ3Q/NInaAti9qVVZc9BYvcV2WxmePzkL
         jiQQgNzJnfGvbEdrtMIYsM4vNlKPhMFFtbab8DTzVxdDBrviE/j5SIMVCrfG64KgJyiZ
         /oIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
        fh=hdFRlbnxxkjS9tDxbo6Fpszunuktg8QIBrSh2pK7cJ0=;
        b=kKnXm87iK/dwQHKeTwB7TwsNJUuTGBFXSJ5utlfXu1NaTlvS1DA1ho2DH242PGoVrF
         ufcGgV0Dw6VFrD8ef7olOe0mRIyxqL8suZNJnBEdHdEzWhR+MigFMJ3QLm2C+K9HXrll
         RXrB7Nqo5h7Kuk23gID2Q1oULevwzonyqb6xVw8r8T+/K2OoyfjZ8yBKKKXezz/pIyJT
         wtTTbH7b0URDC0TVeu+mqIx0ZLQ+Gn6hsSUH+piAHg5FsDe4E4LhthbTLs5nE/4GHNay
         XA6pnJfXVB6pfvPTG0EkEX9wKfNhSBwj/ByA0pbLQ9GxK8WyapqtWltyUXXRm3d19jCT
         3l6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461570; x=1796066370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
        b=n28HukaNFQCqTup6fVHYT40skAr9jxtckFALMAx6WUj+mJ5l45U5RpQflHWBZMi4/7
         V72w2Cv+yveelniQyXQw/XLDXFPUmTUrMI5LHqE3EsXP0CMzmEHOXoQ+6yaLWMIv5I8t
         mr2IwwfWePTMA2BQ4VXJHC5PTeOSWl9uthPvRmrY0f+qfFsdyRVz0yb0ckEmYp7f6p/w
         Uvhslk/c6mUVInGxuuKVO6t7qbYB0aYh13h/QpQyya5vQ2K9pHm45orQHtnOr9s9OsMc
         NXLgeFS8ntNlIDzCDOR0pXe8ZyYelObCSl4hutpt8+/8mPkcnk/mlzF4mdlR4/xAIG2f
         bm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461570; x=1796066370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
        b=LfzPjzn92pq7dmYNE08QMgzE/3oNKvmnp3a0U15uLb1x0muTqic+W/vk99MCLgcyjc
         qY4wBHq6Hp/8/pWdjmLkljdDHCqZwZt0IFYFCUJ4cJ5KaeKAjw1WdzWTmEjQoDzAphUO
         9446G0FQFsd0ebRV6pTBYOwthDrQtTXaeTdUbrrl2b6fZo9McUCiHyGG3Er1JKYSjJ1a
         6WwGDXZJkpV8CyT0ldy0bPhR9SZir6Gl5P8RcGy4+Yvugiu1SuXFNvBniVeEh/t5sTQ5
         2Qq/itEWZEEOK+DSC7e0p7Jrsi15RPr7TO9hsPGG87JBZbIsWWOA1cf78WyIWluyVDCX
         B7jw==
X-Gm-Message-State: APuU4Z+nJCvu+oAPqmTkWQ29HpKVkhPGTpAfKA1tZjR/3PPcz7iE6AnD
	rCNh7V1s2poM6E0wydW2qyhr8wdIJn1QbXYzbnGhN83qlEKcYrtuOM2z1AAJW3b3/Gq16z4YdBD
	4bTdJFlFdnXiE3ae8WBXTYnUc6hv+vIqZOdv3W5EZ
X-Gm-Gg: AZFdTZeeWkwlFoaBnu7PneK8lpf7DeMdChL9O/oIU2CT+aoZdvF7gd61ZAzYI8mbBvL
	GXthu5yviwL1cWD6j/rk5Oa0q8cKsQyOr4IS5XT5o7xI4oMYLhLeB87liCvfy4lBvUBs+kwLmWr
	ntc8lzefqBOwgwwKXDel/S7FpZsienN4kIHkNSubMmXIGp8OBF9vICdswTsKy4TMz3derA5MWPf
	0GQiooZYCOzlXh8+Wrlc1kjSdd6fpfnMazBXbNrIrrU+0xIiv6H08RMFVAxzbrJx57Ol8MU0dW7
	uctXfvL+JuPgq4PIi0mwFtDuxPb04OsUp1ct3X91ljYrUOP9ua245DSnw4pl4hzq8MZwJJJgeav
	5ksgZXtK99U/SJKg5PVu2ehNquIqmOj3Dd7r3A8dFcbLZWb51p8CX3yScyH5PSnBbyPxxyNbgai
	zaAPiMAlli61u9VtbmFaAkSAEK6XFOtKIO3Po7b1ecB1vOvKYO2dcmByJu95VxsK7WivhLej1Ys
	URWxonb6eV+wn9cl1hhu97IdApUf67a4K5uPQ==
X-Received: by 2002:a05:6000:2c04:b0:48e:7470:9e98 with SMTP id
 ffacd0b85a97d-4abb683b5edmr27126763f8f.39.1795461569942; Mon, 23 Nov 2026
 11:19:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com> <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 11:19:18 -0800
X-Gm-Features: Aa3M54oD0fqb0QzJ1JxemEFVbLUl9eeKO0PJLFfAF9BIgQm0rAlM82UhzRRGwNw
Message-ID: <CAKwvOdnoH+dunhAeK0y8T-qYyJrLCwHP56DzaLEAkbZEpKU8Ng@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb+git@google.com>, Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:12=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Ah, a week after that commit was authored, the same author filed
> https://github.com/llvm/llvm-project/issues/93449
>
> (currently assigned to Bill; Bill, can you PTAL?)
>
> They also filed
> https://github.com/llvm/llvm-project/issues/93449
>
> https://github.com/llvm/llvm-project/issues/187893 looks like possible
> a dup of one of the above.  Bill, can you please take a look at those
> 3?

2! 2 bugs.  I was up until 2am with a screaming 2yo who has an ear
infection. I think I'm seeing double...

--=20
Thanks,
~Nick Desaulniers
