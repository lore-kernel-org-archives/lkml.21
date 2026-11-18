Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794972193;
	b=XKAOIAlTmL4/EX+oT9K36e1iEPmYnQZ68H/fWBjD0/N+sA66zSe/fQ/OmWMCJ4rTi+8M
	 An1bfmgdDiV9GWf+vFY+3fNawUHF5InBHec4hRyihxDmfn6f5IW8Vfc9HHBoSkkoGfulF
	 ElfSJk1aTBv9n/qFved6J87eAKFCBsrPJ/ZmE7IrHdjp+YD2h7FtQUVeLnJUXhrgbWzfR
	 01FsF0t9l1X5nJaXEh4yuZBotse9YBcugFe0ipPO7vv0KdM5aGxDoR2MjIB/jOOJBQy4C
	 rnmn7w3mE/PIbjAxI51hMpfw/HuFO0Czi+d9KV4fY0Dv6zx2RgdLaogpRqxXN4rlHYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kgQVnIy2LaljVsYf/m21ANRk7tKYZaMS2Uj3NNM4z7A=;
	b=rs/tn38+RR5TJSKCObwzwz+daI1iFXW0xyOraZ1jWqfCr6ahKr2d0VmP8/IyoxbvQFbU
	 yJ4aXhGELSIos3dhVMnIpd/ZuiFtC2Z7fGAyUxz1qsNd3QII14W0BnWVZHGvJVrc//+tM
	 X/LYWzyf3viajafLDunivqvlGsGyeFBdS3e4H7e7JUQ5AGsfIQD+0UjKX3vaQnkruoJYv
	 aW8cyCV+UZ4aJXJAREs5ctISWbJaKyA4cAEo2DiGUh+hfXIqdfCIfH+CRHS8mNWeAL3vd
	 C/CCIB5B76yUiAeNxR6PpMng1vmO7nOTdSS+22QTHqN4nq+CH79ciiAphlcf3fabg9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KLI8Qo36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KLI8Qo36
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso476038d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972192; cv=none;
        d=google.com; s=arc-20260327;
        b=kwJ0Ge7PaROAZCK/0iqNblIU3Z5eJDmiRy1fMczadNyClbx5fgLQsR2r9AUOOHhtYd
         2CHNk2j085qU0ng1arMvHbNwBgl4t6CBhBPfXGl1MbKwQaMiXNYhVCXodf1KvtC3wPFl
         kFwOd16x69bclZjVFV9R0i4oxwpCUHIjTE93PUTDNydn/qdMkEe7wr47RuMT7dj+s4mN
         ZDWD7rYi02VQySleifNWWC7Bu3HdGF9ecxXf2tapVAygxIt27rmvvJsg1oIzJw0wiYIy
         OXBliPKM68jVwph+NK4Zwo6yJxzrfcbfheZre77z29UUCMSJTss5pqICLQ1Dltm+DbIy
         vfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kgQVnIy2LaljVsYf/m21ANRk7tKYZaMS2Uj3NNM4z7A=;
        fh=Nhn6NNYutlRnZgUdznw8ZdDMGw8P+bPggCanszITq0M=;
        b=IlTu3KfCKB3gLPKwIhwo2xucJA6jQ9LCn17lS8M+I5M45hmFaBxEB16fnbn/zCjKFh
         qahMW3W0XDH9FWeGw/fYvyseW6P1Ar2Oi1TWj8t31Fa6Ps7BjJdgPq2JXC1nQK8NMVqU
         cvRymcRq1EtSbI+QWASTU0q0Ul+/S5KyvkA/b4p1RUM5Axhg3pgSju6x2mspw4QYFT/q
         1pscHaWgYGGy/4PQ3D+SjaSMGa37ltoWED5DpQM3zp3WXxxEuzh10FUF9WRw+S0gQ48H
         qdqT4eFz9sisgC1gteBsEyICBSUxTqYP4ssZ3ma69k+NwzutwPoKxG7efvJgRU8PfEOB
         tukg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794972192; x=1795576992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgQVnIy2LaljVsYf/m21ANRk7tKYZaMS2Uj3NNM4z7A=;
        b=KLI8Qo364BwL7nv0ovt7YXaH30H9MsHyT3NQBy5iXFwOVtZNyj2tvKzCZ9jj8how0t
         4kEPjCE8ayOjBBoC07zWJ6kOWeWV29SJuSn4FAiO1++nG4/XM8BVk3Ma3uP5WaPtCrsZ
         I01vnC9yS4lNoEnKIH88c9OVJm03K7JDY/x0qjuKbOqCu3JpfsHCow/TyJC0cXfX04hI
         MBGmm9gkNOfBZH+YFS6S9hCzDgXqo4rPdFfCzo92TtyBTY9IEd/uFno4jpka1nlTp5d+
         KD2452zLoRb8ky96CYrRBhLF48y3UmdZeuib/kMnE6NiQtSTIgfJE4XVZhwtZVlkJpOC
         rj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972192; x=1795576992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgQVnIy2LaljVsYf/m21ANRk7tKYZaMS2Uj3NNM4z7A=;
        b=Mey8Y+4DgXcYTINQTIm5u/WEiRg6qS+imOr/EUKsuk81/zVz0swANcI4txQTbLv5B0
         Qr2+Kqf8n6ANOlJU1hABFNltPxywDUvZQl1ZcwYoC0wH2F/XtxMg0nj/Dhi8NT6kSuMN
         cdLtGiggd9tvNHUK8xcB5JjOHrrYv13+JQWDxP1mx5hKhdUqjGObfm83oHTKFTnHlZCy
         CkcnBbGxB0ZLIHCX92qa43FpMbhKZ+1dAVlghEwHuCN8Zc5Lq4wOhC5rHiVq3VWbZ28c
         r5CY7e9TQBQnAXqifVXLmmkOXPbP9xd3dSeKVwB9nxhA6pHh8Hb43Q31dzwjWBVXW9MQ
         zRTg==
X-Forwarded-Encrypted: i=1; AL+hErFNB2E6ACkvssSMELHubZDiBgfQNmUcUBEm3DigwEPlu5DQd0XEA3QTg1TVpmfkJTYS+7hpdHATovBm2fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/klzWmAZ42sWOiclmLCYlfJBLUuiJQQgRLywfWUHLc4dhRktY
	RlWth5s2VbMIs6YkpKqwuj01x9/cfQOEM7c/OICtRHsPAAj0fXNnQ/zkbn8k2T4g8GsapKp3dbg
	FMKPrOBs5c0TwLwpJ03lhghyg06Nx2Co=
X-Gm-Gg: AZFdTZeFeCOTDyNjj4vqnrfYeCrRbJDAaMWOqJPl4zNiXdnWK7nrJ7yAGEXqfI4eaBY
	Q52/v0s7ALAJ2kp2oxlTO3KfqrbmEzcT+QVElZqNoC+cVJQZ84EouPAb3cJvqBmodglIMF1Fmrp
	QH1cDYmwcLPcfDiyeY2LfO663RMvveV+yIsqhAz+kYZU3uwI+qM5ep1BIGvG1xKXPQlqizXvZ7n
	Lpy9Tst4y02LIawSvQmTv/OOkjW0Sl8yjoNTiloxi7sOmU38OlwHtXOOMWDhOQ4Pc/1ZEpjtP4K
	KGIsFmdWqrlbxQUsrvuYPA7BBUE44G9NAbJWqsZ5YdoyMKlLa7strEQNmQvmmAILCDk5Gg6t1Rp
	Grc7eVKUB2UP9HJxYG+LNbe2oeP7yth2g38U20A==
X-Received: by 2002:a05:690e:bca:b0:679:9afd:c0dd with SMTP id
 956f58d0204a3-67dd3fb2cc5mr535222d50.111.1794972191725; Tue, 17 Nov 2026
 19:23:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260510200047.6117-1-contact.kartikn@gmail.com> <c000f684-0989-4ac7-bd40-e6d224fe070b@baylibre.com>
In-Reply-To: <c000f684-0989-4ac7-bd40-e6d224fe070b@baylibre.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Wed, 18 Nov 2026 12:23:00 +0900
X-Gm-Features: AclHuK_ZkY0RDSYV2_RKJg7dT0_TwSkJZ-C78piu03I2zHeguqiI82HuVMbgf6c
Message-ID: <CAKbEznuLqhXx37ubw1a1aL8QXy-G-ULsME6i8=ZbrkO=2A=PGw@mail.gmail.com>
Subject: Re: [PATCH] accel/rocket: fix ignored return value in rocket_ioctl_submit
To: Daniel Drake <ddrake@baylibre.com>
Cc: Kartik Nair <contact.kartikn@gmail.com>, tomeu@tomeuvizoso.net, ogabbay@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 17, 2026 at 11:27=E2=80=AFPM Daniel Drake <ddrake@baylibre.com>=
 wrote:
>
> Hi,
>
> On 10/05/2026 21:00, Kartik Nair wrote:
> > rocket_ioctl_submit() calls rocket_ioctl_submit_job() in a loop but
> > ignores its return value. If any job submission fails, the error is
> > silently dropped and the function returns 0 (success) to userspace,
> > leaving subsequent jobs potentially in an inconsistent state.
> >
> > Fix this by propagating the error and breaking out of the loop on
> > the first failure.
>
> There's definitely a bug in there, but this approach is just replacing
> one incorrect behaviour with another.
>
> After your change if there is an -EINTR generated from within the job
> submission, this will cause drmIoctl to retry the exact same job
> sequence, likely causing parts of the sequence to be repeated, possibly
> with negative consequences.
>
> And on other error paths that would be bubbled up by your change,
> userspace won't be able to know which parts of the sequence ran vs failed=
.
>
> I think we need a deeper change here. Is it possible to fully prepare
> and arm the whole job list first, without executing yet, returning an
> error code if anything goes wrong in the process?

I agree with Daniel.
How about splitting rocket_ioctl_submit_job() into a prepare step
(everything that can fail) and an arm + push step,
and first preparing all jobs to check for errors?

--=20
Thanks,
Gyeyoung
