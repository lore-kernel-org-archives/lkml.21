Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017701;
	b=u+shE9e3mWfIjB2X4z0mUQN8ZDLSwTwolP51bXBN+HxaGZl8I0OqIEskFGmrDkv+I0lK
	 Aekq4xnUmOGH2YzElu5i99znJ4TX6FmhetxpYTy9bcMCFfQo7pJ4mAdjUhuE2Wr2RG4N9
	 NnWAVcN+Yv6BwEMVeI7E1oeDEUh/nFV4fgJYeAMi2rOxwTCIwv3yPxhC0a4DahSU4QrAe
	 //hMwpZXmnZgHvrjF439IpKtODgAQHWIa1n8srftnuypl/L8txIiGXu1nes4QDcID/EHY
	 b7QUzFBsTR6wg5Uj41NtEYoSV7zT7Fjd+ASvpxdIsXmb4JHqjXnF3YiE21Skup77ROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+2RLaCA+CTvvhLn9hoYoWmbd8XvuHHvjif/znAEqg5I=;
	b=GYeLnos2XXjPO58xc3M/wudz8N58pZ5QotbvLKQHVCZqZJRLg7U0Vz8TdiZcLJjGzZSi
	 iowYz2DHF2hPryNOukbSMM0edwYQ2dEJ/ClLYNIXHtaHUUe4hpCMTiSiKii6aYYQqxuwk
	 WpSwK7UH7gfde5U2ACarc7V1UXjOeX6nsiWLdVlFKEx9tutNsW2jRQcAucADSSi9zFVKz
	 NM2eyInWNB/++yqfH2E/6D5/ob7UNWydsX9WmkWxjSk8dupzoWvNIeaJrm5LeVL2J7qqr
	 BMxql9io8wgDa6iRChCMo7hiLR6Lnt4e9E4vjIAuDuUUFbTbYfEsUyH5tP3Ycv/DwDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FkUyYAAh;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B7606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9B7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FkUyYAAh
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so1614925a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795017699; x=1795622499; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2RLaCA+CTvvhLn9hoYoWmbd8XvuHHvjif/znAEqg5I=;
        b=FkUyYAAhaw7xBnz3AIlHyO40fGm4JohW3nNn6SQ164hbyqNEjCtyEdZjRcoYshIbGQ
         4vutcmfeu1fM18Iob62km67g4ywxGW/xTL5fiMusIhTiY13m4fxBndoVffqTT4wP07JT
         wtFBIvrluo3EyJ3Is9wBLVNvX4Ycr5t2h7OAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017699; x=1795622499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+2RLaCA+CTvvhLn9hoYoWmbd8XvuHHvjif/znAEqg5I=;
        b=zF+qOfrSQKhTM1vIr4onnnBsBNXfx3dPINv4TgLscGaUrC9kfNI54kCSjv1jdHZnAz
         25E8i++CQNvh1QZgKpdUVeab99wgS3V3BRQT1ISLwk+5WZhrDmASPRMit14o2jGgC+vD
         NEmza2HM/7ZwR2IWa3Ke8AiSA5XgCAap84+rmytmztnrCflzAxQau8xMbjHFdWi5zO10
         mygdevoz33CA2AKo5mXE709SvwbYpboO/l+DLVvWn3/dVM2BPyf/qXeD+aRecBADG/Mp
         Vm4KR3VPN9nqunw3Bbbel5AwtzC89bNQu5JKOqLjhE5KaOo77QTlr5F11kwOssVMKL03
         4tzA==
X-Forwarded-Encrypted: i=1; AL+hErGay2DYwbNz/c6w7zmT1N+eRTfOwNmZsmNOjI2nKo0Q14pefR4vqDfyNNdiD+pF6NGM37xnPj9958ydX/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87jM5ykiGDWv3pKNpS5bkKrNy/D8JzqIyiX7I9bLKVmbR1eyE+
	4eOnwimgL4QjoMmDFJtIv0vPu2DVINl/EEhkZdTKcfMKETa0Khi8EJMQxg7w2TOd2HXatm0BoqX
	sfuGr6Lg=
X-Gm-Gg: AYBFou2826pNEfD8qtBU3n0+TEZq03EHALb7AjedJrT2F2ckmoY4j2di1z70yD/UHcF
	iUaE6d2BoFjl50PrNP7Usitx6gbd/tIHPRUNZXveEXLWUXp78bcxk5PwG2Z7DdgmhtHQ3XsAx2a
	iWnjPm6/QrkCQICCyolGxRtiek9jf3Z8IrdsDskmGkRjxYSJGFid4Om77+kogxZrDU7RScKoyQB
	dkhVKYSTlgNKzzv70vvDY5NQjfZOBj7KwmKwQriApAYqvhYtan90Fs1yrWtzxvasc1Udp6qie2+
	bLcu4zbcK6fSdJWVMzcj5G1FWtofyhPhDFDwOyUqzSz7iWavx63RrRP624SDM21Ku30PNaNMZS8
	8ByX7PFhwCKpBW8IMarmm7aDKlsanxwS6FLLsmU63zcutLpkXCc6gtz84bQtkQ3suZlieDgyVtS
	OAy1N3NkjAQVzWMCZXcj9k2xK+mqevKHmbZF7cEP1KK06mZ/Fxfg3rAPac9EPG0LXkSkKIV5qCp
	JO2NYkW384fjss0Mr7METqLx2pOmq1PJr9uOGjx7kaHIWPgIZEMURyF6hY7X7m+PNJPM0K/f7UC
	dO8s08WkicZ6cmNsV35pIuKUI9cF+5hkNkW8h9AGfAXWDiS0OsKtXBQRpX5kHe7ASFxnqmJZGNF
	/2fc=
X-Received: by 2002:a17:907:968b:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c510e3a717dmr290282166b.40.1795017699084;
        Wed, 18 Nov 2026 08:01:39 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d4726sm15487166b.80.2026.11.18.08.01.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:01:19 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d581da0aaso137105966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:01:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFYsrFOOR5WSf9I8bPo9nKC7OoUgHOdr+bmi3JiTuLvm/QeYLRn4kXFtAES0bnzbZJQHVW+uv5wNhiMn8M=@vger.kernel.org
X-Received: by 2002:a17:907:cd14:b0:c51:24e9:c474 with SMTP id
 a640c23a62f3a-c5124e9ca9emr12311066b.16.1795017678422; Wed, 18 Nov 2026
 08:01:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pipe-epollexclusive-wakeup-v1-1-0af6283e9fda@columbia.edu>
 <avxWKI795DthE8Sb@redhat.com> <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
 <avyODoFhZ_M7YDU5@redhat.com> <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
 <avyVwg-5ef-pXZkG@redhat.com> <CAHk-=wjJF8uZLfVbbqei9-fhs9K70i2OnVreCV-rQF9EGKAxJg@mail.gmail.com>
 <CAHk-=wjqParwoB8wb9KfGVpbwUwvKvObpLOo=XPM0GGfkn3ibw@mail.gmail.com> <av2juQijIISJAgyf@redhat.com>
In-Reply-To: <av2juQijIISJAgyf@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Nov 2026 08:01:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg4RgBYZcUU+c16XxdZ4UbAaazJkUS=R6=tpN4xUBdDRw@mail.gmail.com>
X-Gm-Features: AclHuK-jO2btqFqtri5NH0SNA66TSaufpqFn40OH8HLtU3lTATNZK-kccXjyNlw
Message-ID: <CAHk-=wg4RgBYZcUU+c16XxdZ4UbAaazJkUS=R6=tpN4xUBdDRw@mail.gmail.com>
Subject: Re: [PATCH] pipe: keep per-write wakeups for EPOLLEXCLUSIVE consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org, 
	Mani Tofigh <mt4022@columbia.edu>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 05:10, Oleg Nesterov <oleg@redhat.com> wrote:
>
> What if we add, say, WQ_FLAG_LOCKED and change prepare_to_wait_event()

No, I absolutely detest conditional locking. It *will* cause problems.
Particularly when based on something like this where the locking
depends on not an argument and a call chain, but on a (potentially)
long-lived flag.

> Then we can trivially redefine all users of __wait_event_interruptible_locked()
> on top of ___wait_event/etc.

.. *if* it was passed down as just the argument, I might be open to
it, but honestly, even then it's just nasty. I *much* prefer to have
statically visible locking, and have the pattern of one single helper
that does the core work, and another helper that just does the lock
and then calls the first one.

Some duplication - with explicit naming of the locking status for the
special cases that are called with the lock already held - is much
preferable to dynamically doing the locking (even if the compiler may
be able to then turn it into a static choice at build time, if it's
not obvious from the source code it's still "dynamic")

No locking hacks. Locking - along with memory ordering - is special.
Locking is *not* a flag.

           Linus
