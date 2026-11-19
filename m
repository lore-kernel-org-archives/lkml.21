Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795049900;
	b=cTHsjXGzYoHM/++GpoZffQhQXj9iQ3zEoPODs+eufTiuws2gUYeYGjvE9M/1Yk/Wxvsv
	 CsfLoOMLnM97xfkHj/8hVHdYGizHNZkhb31N9sDB9F7d3A/b2QZG12dnDypbOVbNPn3TX
	 3FYPgIEeL4RGHuVkNH+Tch03UyWqYHZ6KN9Mp4yWF/ucyry4ZeJuZwQ7lgLIgaIm82NpO
	 qAex+XRNGayRXgUlNtm6W85Siq8cy+xrOn6qAuvyIkak74o83qbwUr1HUIwZYe12G+4dS
	 3Tms1wpEIdKlHBQlyvzyiUwMEIIM+W/8sKl8jKMdSmxHddXYYPgACdAyrSPEJkScTrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WmULB5BRRN7myu8YelnTP2kh9LSwow9E6/6HbTV2yCY=;
	b=xAHpLxUzlXGL3/CgWh6qqH/7Nk5mnZLDCckHwGcp7j1egEVpYimmsljl2RatSUvu6LUw
	 LpCoBUkpSvb/ndbIeKDnesp3p0Wd+p1lLUr5u7yor95EFpsZVlohmabOKL6KPbufwB0/N
	 QuCysSMWyALoUEImWIg1UGon9U3n9U+e7Ca79Vyfh/vSQSySh+wgpVeT3BLqx+WVpF1xb
	 9YvCNmwLbWKa+CmM7rEXnTCVui4/4eRxabpCDYvWyyOaxYIYHs/w0yMlWb2KD628Jcibu
	 nP4flfD3V3hld3SyM5aWJ20hNJ4xprh9xBfv6GYN9n5PIQtqwzE/4An3U2zKf0aFPvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LghaJhlE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5969A606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5969A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LghaJhlE
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so15662001fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795049898; cv=none;
        d=google.com; s=arc-20260327;
        b=RQ5R6mxpPwKJmUTHWzNvwlyLrgC6dijFAGWBJFNzJEnuNebzDRiZrSjQdkmxHBbsJQ
         zeEd0wUTIQWtdoYX//CxWLuJrvQcEF4vm5xURHFj2j4koWVFrH5IWDdyQfhtj2MbdM6G
         JY45j5YUIWm3nruTmKxmi0F0//twUa2dk64N/uRxy5MpnDQfChcafnmQ5diq4dBUPfHa
         cuwNPlxoxgUUHGyU4RcvQqvo67Ia+AX24Hi+mFuGGGFI9bBJ2lk9MmsTxn3fco4Yhr5c
         d4IHd/zBylqGewYaSoGu64MO0e6iBEO7i4Rw+OYaapmSyO48xqCv+0br8wGMpw+0l+Z/
         zBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WmULB5BRRN7myu8YelnTP2kh9LSwow9E6/6HbTV2yCY=;
        fh=7IGib4gboOB2meJ8cnMw8fj3NnjcOMN+WiZqrXdhcOY=;
        b=DU8xppXNSIYBDv3GWfjQrSNZjlB165G0toU9Le2qvZj+4BjE5B2y3OvzTqfU0Gt/QR
         Fs8Us+ZH/Fxqa5raVhFnB25nr91WjNmoaNXPzxRi1qiqIDHwPuXXygCrO4KlOkCs6jc1
         h+I7+FMch6ZgmtUsPCtrN2etQNO/dzCFXdtIEqi3mEOn2tYhU9tJMaLNYGzb7iVc/0JN
         pHYHVQ//UNwKvODh8Kl3zmMBq7A5OI63CjpuZnV0xUO/CRxFcroyQhlIeGrFEse0/d2u
         hEcVO/WFClb1f0W9jPtuBiNnNQIFD15PwWsaepfDBSf540tgr3q8Y2zmSi3U2Vl6LSN9
         W8Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795049898; x=1795654698; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmULB5BRRN7myu8YelnTP2kh9LSwow9E6/6HbTV2yCY=;
        b=LghaJhlEIwS0qw8B+AlxxJ2DBn2vU2OykxKk3Qn4cV5W6W6iQuwnKvHNp/Go45CGxN
         jK6iSTJ0bd9WYMjixeIdt6vW0OYMyDcZhUo2R/wE9GJdtnoDWAdUGNI3U3vYVh+6Jzfg
         KSqpJhCVRbVc0c0BOOurlvVbu0xAj48JpVygQm4ZZRiClaBE7ZiUR8U65bMOus1xiwdd
         15O4uOrPY3m68UYV024jQxKo0NlGxWxQVdHkishL5of00rfSsYF0Kn13sItx9Y2bS68Y
         grDweeZ0m7BwVv/2hKyqCGzXJjSXBVkV13D+KzU/GwrNjSQw8eQb1mUhj20isbT3KxBv
         IYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049898; x=1795654698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WmULB5BRRN7myu8YelnTP2kh9LSwow9E6/6HbTV2yCY=;
        b=ybKohl0/kR3rTS29cU0gP7FlEFAcThmyZC8wTNfRAC3ATkpZ+1GHSWUTEt3KL2mOoJ
         MMFu+6vYkDshlDJWZBc1kQogZTPE+lu9ZHZdpZy0kFD3rjpaKfdGgG1hBe0HWYf8PvyT
         36dxiKFM0iISx/+3nB/Mb+Y3VFv4/4HvQQImz3+qo0BkyiDd+xhzZNS5TIqhERHesblk
         E9+v9ejPh00Y4omFL/2ejyBzLSQe//oOHNRSc0rRSlxOtaM2c/asTC4gdncNsv9rkZkD
         9UHjsYmiuu8BLPMQjZzrB2F41Dhak3WpR6J0qYRQYtS0JRFL/sSP/F8ft2iCtyPfbWpM
         jhsQ==
X-Forwarded-Encrypted: i=1; AL+hErEuM9qbdMvpA8FK2HG7yp6DImAZH1LI9XuEh7D5pFG8rHTQbY1sAjSEQRmWRLZG44ZjicJfzt3xsbUgg44=@vger.kernel.org
X-Gm-Message-State: APuU4Z9icgZas3ToE9B/hr9HCptUqLYOmSXjyIdOhnshTbbflyOYdSTT
	uPeJGJqu2rgSbSiDkUyluS5OdRqzbn1HkRXzO02BMumGvmF1N5GglwSDits9C6ZK4jx+jxnCfzp
	7nHvbooa4uClxKm3fBo4QJpW+E9ZFZXQ=
X-Gm-Gg: AYBFou0MsPtFBMj/TpDCqI7G/7F4QKLgZT3L1zlZPXQJelnpgXVvRYGPfML9zjW7p9l
	oSWn6wKJGkBQhAEl4LwGFC/5E+XJCj47lLWSo+jpsPOkVCYWX1AT6WaikTrqXHrWUcFKddJYaT3
	fSMhvfb2jzG9mGrzIikqXEdGPEJ+dv1/jvL3aHW57mtu61mTfM2ReUEfXaimZjIPNcBW5XpTnlR
	xNzTTcoUf7wLZz4XPRQko4nVopxpW4ZzUgfUrX2oa9qph37xYHvE/a0bLCq8EnzjjX91HePfh+3
	oBqBQDGcAqaRcz/u4cLPbTBJenoaBSfAKuljlBUCMCorwfGc+nYbB4cEyYKn/lrqFIEX2cw95Y/
	ZrNpIUAMl26fwKDDv2imULZ4Bi82nsO0/AYPzQyZ7H4Z1AENXBO8PZwpQkjAUJhBDU6aCnNsSSO
	yxlqtVcysfTP8kWTYjHzvcTAPkZUKJV75EsHRBVG/pHvP+4EmEg6W/PcI3MwQEMgqvmbW5De/C9
	HFCWu07vmhq4nnG0EQoVXro4IFTHKApRVxoUPdMtmFNTK7789bdNTrBLrx/+vn2Uape64S6/ctq
	jVsGe5ZFjA==
X-Received: by 2002:a05:651c:1a2c:b0:3ae:68:d07b with SMTP id
 38308e7fff4ca-3ae670cf580mr12208771fa.11.1795049898159; Wed, 18 Nov 2026
 16:58:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081248.21059-1-danjwade95@gmail.com> <20261118104353.GN1813469@noisy.programming.kicks-ass.net>
In-Reply-To: <20261118104353.GN1813469@noisy.programming.kicks-ass.net>
From: Daniel Wade <danjwade95@gmail.com>
Date: Thu, 19 Nov 2026 11:28:05 +1030
X-Gm-Features: AclHuK9RupdcoMxYA3V6rh5w4L2BDyhmtlUMf1cZuVsvFCWEi_9cy1l0uFREU_M
Message-ID: <CAMn7ay_NX9ULF8fYko363U6bM2XzgyT4dkRVBv5CJCM6zQ=neA@mail.gmail.com>
Subject: Re: [PATCH] perf: Reject group leaders detached by CPU hot-unplug
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Kyle Zeng <kylebot@openai.com>, 
	Aditya Chillara <aditya.chillara@oss.qualcomm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 21:14, Peter Zijlstra <peterz@infradead.org> wrote:
> It occurs to me that changeing __perf_event_exit_contxt() to use
> DETACH_EXIT | DETACH_GROUP, will also fix things, right?
>
> In that case the STATE_EXIT check from fa091f46c383 will catch it.
>
> Doing this makes the various cases (task-exit, CPU-offline) behave
> similarly.
>
> Does that work for you?


Yep this makes sense. Much cleaner. I will send a v2 doing that.

Although one small difference still: task exit wakes pollers and CPU
offline doesn't. Which probably doesn't matter given they aren't woken
today either.
