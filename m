Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963680;
	b=lQVn5YWPsyUxwAk+CRuFRvJ9zOR+ubomwanasPEktnA9ICIAn1EXCwAAZ7TtSomLf4oU
	 xcVpgv5XHg3szklLauwDA72tH1Rbyz4T68MfkumrOXeSIXvP9BOw5NSsIQqT3nMw8tB9p
	 SRlYAmFQ9sGU5pIJc9lHbXLTZseWSeXMTczgcobqwfVW0XgaKbqEc6argy1/HMhQkkSIc
	 k+SfeHswuEa352i5YTX1N6LfaPkvvHTQ7pmHkk1CfEUzMWbkfSfwh2HuFwMUE2/ua7e7g
	 /jNGEOMMcak/1zRf2C2XvyOT29j81mRkKnqrD4+MOqb4AnVRxlGo1+1S46SFUD7LguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=m8/kejje43/iSzUQBqp60HPt96dBU49CmzQKrHbpHKA=;
	b=0BnPpSQouPWfRJBOcyvFYjqOBHgHd/Xx08pt9o+YcC0s/vGXt35LjvaBuvEDzRCou1dM
	 CcYmAr6AKlizYD+qSX2VDgXRntoV/IVgdilQJRvEE0oYoA+MyGazrrPMUdgsrw9oFa4Ta
	 xbENMSjg+l/MYvaW6nsC4/ru7kb0AjfwwEZLrM7T6oof59XgJUQ/9iJXtcv/loqztalgh
	 xFtllwDw0KbUj9OXbJKCGhYHU6Ajv3YegLOSqz4OX/tlVpBcVcDXo02qNUA0YnI+3Iyy8
	 simQ/xr2vqiBqd5YYMRLOSsQkorIQ/gVa+UPXGmhRDOeCC8tk0XxrBrWXqQtArpFt/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2IHQ8Ki;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5691606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5691606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2IHQ8Ki
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b50dc340d9so7603c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794963679; x=1795568479; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m8/kejje43/iSzUQBqp60HPt96dBU49CmzQKrHbpHKA=;
        b=m2IHQ8KiXMRSrsUBjAc7o1Xxv3goS5UVQgUK2PHl9CQM8kCeg4JIJQrFcc1N3hIknM
         RHyfpqUyporiPFE4pFsG3sdghQhy0DP6bxXYor6nLmNyd2ywN7AgLoLDBjkt1EINQcKf
         j9gkZ2NrCpGQVbVFrRH1l82uhbBG2k54pYb+P0qrVSj8Sh2Om0JA7Q4BeaF4plDNGLYM
         W97/Yf2w78Tpg/9Zq0TSC4v17jrqcJOpF8b0l09A8lpK2iJNfKHy8ShAyta6DKLUqv1i
         MTSXtgIZHxBxZHJoZX4UhKTkrMDWb1U7i9s3RpzdFCrXBT6xXyUExoJc+S8Ty0hCYb+7
         oKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794963679; x=1795568479;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8/kejje43/iSzUQBqp60HPt96dBU49CmzQKrHbpHKA=;
        b=bcCn153tSdg70c1PhJk+ZACeQtd+PdQCoWCx13D63KrbMhzHfDDtxvOqnc8oFaAZs2
         AsMaWNr5U0ABz7sfcPyiBXYDcBax9F936gjpfvsjCWhoKVCr9xNx4K5t4uGy5WENbAS1
         3AQNr1Iwer8uC+4bDeMPEygUmL1wnjU0AUvcSxyl3ED5x8F0W74NN+U+m1rslmXKCnTk
         dLLfnh1bqgeF9tTgULVqJcJ1S+WASRnNXijDWtY3zSTz3dGc7tXAjHMCClQ2AEnWisAA
         hBYU00Uyge3KxpHzSyL3fWVszH/kyPzPEAkvYNuvjIy5OOqta+eB6CPVbJ94HmX4S7pm
         LP5w==
X-Forwarded-Encrypted: i=1; AL+hErE2E7Ce+Qx17frxd3Y2U6Bu+XWq/zq7fDNXYJLoSEKotbio1vnE+y8HVo2FuN63Fn1vDhSgcMYQri6eJ2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0zJ6t5ZxP35ycu8+8/RowyQGfbKBaOKTF+0aiGPIOaF3sZocs
	FOZYrwTQRRWLv4EL1hjcLIeTRmYk1iMECXBsUwUfvLuOUL+dUGR8I0qZ
X-Gm-Gg: AYBFou1/nAByXElwrrR7HMOFPg6iIy/v7c2v4CL9ADpWBMs68bfIBpUKWZNMuzeR7mi
	6kaMZ8/OIreeILm3fyWnwvXtgQvXtNwRPuxEZsd8U6nC+63OrRYrv97vsG5xDophUoRjbIUZYZL
	tzw0+xkhxfgrr/9jKUkwll4IrecYW0K1EBkSEoQfSk8aa6c8eMUroBx6gAXtHcOo8oPVWmAn8wW
	Wrl0ONpuVxwlSqJxgo+iPRjgb7XRrYsake20c/kHpHBsZJHmMQkIYbp4nRcMDvNsavymWP3eWja
	OnJpITRY9RX7RY1FMaebZL1VE2eQvWaIuIfBMf1eT46eU6wucaqwtpRKFOxrj/ZVbmP9abRe2vi
	Kmy0T3lyDzlzhOQJcYzpJOo/+kU7k1Sqxd8kRkBpo+n4CP6+zLX/9P7sd+M6sW7IcOIUkVM5WMr
	BLKrZSdWJt8DzlFqdHul+88u8mOycFNe+HY+HEubUiZIzJYfeScqaiYs7HpsIEtThOVZ7F4pc8L
	sjvmZ3qdc9DBkGU0kbXg4dvzP0BidhrvczD/UxPTtpXnZY9wJVZlkdtlACh5pBrOS+pdd7yHOwP
	yrQV13KLrhmAcm5xs4h2LPPS4cEqEILgqSJ8Iu8E1f5y/ylR7jBMiAA219kCAa8ZIow=
X-Received: by 2002:a05:7022:ea8b:b0:1b3:a881:a67b with SMTP id a92af1059eb24-1b543b7ba68mr1691999c88.1.1794963678164;
        Tue, 17 Nov 2026 17:01:18 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm2636759c88.9.2026.11.17.17.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:01:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
 Yosry Ahmed <yosry.ahmed@linux.dev>, Brian Geffon <bgeffon@google.com>, 
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <18e8fc17375582a2.3137322e32332e3235332e313736.2a6db6.0000sendgmr@google.com>
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4>
 <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
 <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
 <avVVRYkIAQnLC_Yu@google.com>
 <18e8fb5c1c4d127f.3137322e32332e3235332e313736.289d37.0000sendgmr@google.com>
 <CAO9r8zOtL4t5pwQOE=SAWeg=k2TkhtNXgV6CJJGNTwuTebKpBQ@mail.gmail.com>
 <18e8fc17375582a2.3137322e32332e3235332e313736.2a6db6.0000sendgmr@google.com>
Date: Wed, 18 Nov 2026 09:01:11 +0800
Message-Id: <179496367147.1128372.9610535275148675145.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-18 00:27 +0000, Chris Wiseman wrote:
> On Tue, Nov 17, 2026 at 4:23 PM Yosry Ahmed <yosry@kernel.org> wrote:
> >
> > I would rather drop it right away, but I am fine if you don't wanna
> > bother with zswap.
> 
> Works for me - dropping it outright is way cleaner than adding a
> Kconfig knob nobody wants to maintain.
> 
> Nhat / Johannes / Sergey - good with a 2-patch series that just removes
> the zsmalloc shrinker and adds the unlocked zs_can_compact() pre-check
> for manual zram compaction?  If Xueyuan doesn't grab it I'm happy to
> post it.
> 
> 
:) Thanks, Chris. Feel free to take over the series.

