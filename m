Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084191;
	b=j2Kjn9Y+4V69WkaQ1QbhY4eu0zQ3fqJYxYc0UJZLl4TXHhH3KPjGe9IHQsVhgdCm8nFU
	 2ZePfztJAZDboc3fBP68s7C5rP5sAMQb5NeNDoYfXwJB7B0bLe/1/DXSMLMNGZsA3ukxn
	 64VjSL6StVFIZt6NpygSuY98UHYAD6a7kkBBcWsx/6N+08lHxjUsVuvSFi3/3CF3bp7za
	 AxJuB1BeGAIo6k2QfqnORCWKIIuIeC51XBkNb/er/WbPv6SPn5Ts1MluG8APB4/xfjTBq
	 m2MoaEw7rWxIbCApMsrQ/BBFUTXYzo8Joffu9/9LgXeHhOZ9fD9af4qYTCu3eUrck2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084191;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=0WpfOI5xeWJOkMh3kbT3N5kNiSFKYr6MVMM+doisFww=;
	b=XSFVy2DYzFeqGr8vfa3hMuiJIot7Rd4entST8+xpW0ZRpgMx7o0d4eMwyT68BZhtVAFX
	 m2y/8enO4fSKgnntHYX4PQWpWtXKOgi/r6CUS2wQ2VYoF8CFaAlfWI0u+asPtkv9pTEV9
	 vOibaxVDDQ1fWiUIJF9fWO+x+v13FhUmFaxNhTT0i8ZNZxl23pQ61A9qGMXSuMHh9XN97
	 bpuk0UhFs30wr+ojV/ObI5yfR5T4oyDIXaXuOZ+weRTUIOynEK3Ps6cqW7/T9CC7+8gka
	 NgB3w2O7B+2njK/ueot+w3GzVSjGMpUalc3STkour+j4BiG1ARTL8SbKtR7Vs0Odenw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC24D606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC24D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ee36376a0dso1050156e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084190; x=1795688990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WpfOI5xeWJOkMh3kbT3N5kNiSFKYr6MVMM+doisFww=;
        b=zPKLWZxxSvbcTOO2yec35GnQ5FHHU8R5EF1zN2eeES8/H/GttVwQ/P6i5l2cysfVxA
         BENkbfs+jOGkDTcmaVXYw2UPIlM6Hg+wStButkvUDcBNa5IezkuN86PItSZigAkc7/lf
         VU1Oc2imUCdrwhzVe+OA+L7gQ0v+P4jWbM0/JJfA6fBfYY1tIfDIEcyfUBspSljgdxip
         7iA0hY8VJkgAt5jm1lLKgnG+0iZxoeFYXktek1Uy6dMIyUg+PeYWh/sLfTm9LJqL7o8e
         kbf5zjRf+3bP8E3GHALhMtBSCQBJ6ozNZ3zrFHoXamkjAuegfiJ/bjPomHLn/BHk20Tf
         fWDQ==
X-Forwarded-Encrypted: i=1; AL+hErFiATlX0nmAgfwiF3IHrvk3saXl1xm3O00Xex10PISIWfP3gJmkWXW3AUNf43Zs5IGkk667LNcRaVcz3cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PLWgXJU8JYY0BU5sfJdHt/buCLK9Gd+fT+GtjnL+c/TgEHPzI
	3wmwfyeS2DL6lH0Rm5wjxZ+Cat/oH7eRXfoQpDdbJWPdl3KXVEESejEpn5zL3W5t
X-Gm-Gg: AYBFou1lAPf3tF1izj/sOlWTNX5RrzVKcQ4KsWoL/XQXH8b9nrwQaNcSKcfZDx+PVtg
	2QmgaeXR48e6pa2FzQcxu88sEKjYCplgPW1x7aUJThD+nZUq9qVH+OhBKd0b+6xMaJU1tOuxHl/
	L3hVrpEDTgzAHOUL9kOt2vrPlk+EH1eXlYsH34mQFOVJSekAjng7rnRRjgD2UVxBJUnFPJBjSnc
	YqYsaRfiVDACSmenPUJ8HcOVYdEkkZb9AkwnWDW5DE/rhIh2UDFS+6DeaZTmmccWMi9yhE7BD9b
	ZJEZZqD3sY/Nj5g1UHAMQL/NzeaDnvImqPhvDOETw4eqccoCarLhi2MwDbFSlFDjJ322F+1HicL
	Fs4MoH0XRkRRtUWkAw0MIU/pvz6MkeqbWpWvbcxyQqYV0aB4VfpH3dEPM7g9e/H3Qt5LYPP3JsS
	lyIiEp7TAK+/cV0mwMLTkCkRZcpta6dX5PinY4bsVkmnb28pZfj/mSdOU4CPt6Bktkq/gXIJMAJ
	lIXVrTcZNR33NqrrYRDsI96DS62mFt9zIojTtzuH4mpMAjAf15RpUpe7IwR7Tlr6nZWIf4CVpb7
	g7ZLGjddBqCSWl30NfbiYjH+XEWr4THoKHD3pT5J6pJ3esoHMgsOa6Ll6i//6VBoKqz+ZV3UonX
	V1y/Tw9MC/Oa1
X-Received: by 2002:a05:6122:8b1b:b0:5c9:c60e:5cf5 with SMTP id 71dfb90a1353d-5ee6471e470mr2995383e0c.19.1795084189885;
        Thu, 19 Nov 2026 02:29:49 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ed7adesm3732445e0c.15.2026.11.19.02.29.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:29:49 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1215550241.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:29:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHwJeEVAlcNloWbhUhtk01qMbyKD60qWBgdRcvhKjdXRMDD4O/d4w4YpFZ9yACn2zqqscZB77JpteIL+ck=@vger.kernel.org
X-Received: by 2002:a05:6102:5695:b0:7a6:85d6:84c3 with SMTP id
 ada2fe7eead31-7d6ba17d7b3mr2441645137.3.1795084189032; Thu, 19 Nov 2026
 02:29:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116200515.352387-1-sashal@kernel.org> <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
In-Reply-To: <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 11:29:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>
X-Gm-Features: Aa3M54oHwNvpgtGGkx_hv66KseZDPeTjivSHlg9HiVrcMy2kadRraoCGcLtBLg0
Message-ID: <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	David Hildenbrand <david@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 11:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 17/11/2026 10:27, Leon Romanovsky wrote:
> > Since you're already making changes in that area, could you add a sentence
> > asking reporters to provide the full dmesg stack trace?
>
> If so, then trimmed. We do not need all addresses and registers and the
> [time markers], but rather the calltrace from decode_stacktrace.sh.
> That's often review feedback, btw, people just paste huge bunch of dmesg
> without thinking what is useful there.

And full build logs, to prove their patch built fine:
https://lore.kernel.org/all/tencent_684DDE3E94F7C2470E5E02BF79AB1A1DB906@qq.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
