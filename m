Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693934;
	b=kgfL5Ox83ZtCye95z0CepLXKuaIRJGG+VeZBb/Proq129x4t2upHObIu4HvzLRlkLyTT
	 XSEu0nD1SxfkrYKWskB/OgyALpnSmdJ88EEXSfvwTauWPVbbp42MOuAFItt/kUU14L4Dt
	 t8uYx+WSYtxeudtPSsS4cwgt2YgmVSm3lkK3nrrIbjEt/g+KTx5MJ+ZWyDSUTb3RXhVuH
	 /bos747po5kVRUKBFJXNtUM7XzcRmxgl+tBRB1anNKC9QdM2rSimU+WQy19To/B41M66F
	 +LGsvpFpxxrrvEsCBOGRaDONWqe93zyb0I/qTYGBf64BCni70AbhZ4eR56HoKDI+krA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
	b=0OUR1QSZQjopEd2bqGyHQA/dtqNKUKRsa1OYWFzqNzt+0HjMeeo4cGpL1/JhfAEXZ1uq
	 gItcXv8+7BTCwnnHg81varaRDpq1U1J2jRtPO5EMN9ynwMM/qA/jF5ojFgVSbI4k58NvW
	 9OS23t8JzS9jJN47Avsol4NkDysgs54feCNBf/TX/kja84XAHQDzHF/K9UDSjgI1Af8qq
	 +KOLSG2yILewMtLn8Af5RHcFtuVhfhF05woRVWhjmG5UQXWTg1ZgIuBfGBol1WoAELb8t
	 bXJEqlLHTTcDtRwLSQu/yirKGlDsoIpQMhEaybZM8T+CA5G5O7bALWivUdMEmUd9bFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JT06c3QK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JT06c3QK
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67db763cec7so7107689d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693928; cv=none;
        d=google.com; s=arc-20260327;
        b=lHmm5r9OvdcC46wJunjTkIIGsk9LEfN6zPAn8u8fxlj5Fsqfy4liCF4xiPQZM5PCTY
         AzzssZcH/d5j0u/qxh70tys/j/1Hoc1qxRVhCSFrun9EckES427eN/+IbK6V9uRyyPxV
         qxmrd/r2GzlyNPDYMVkqIab4EAGB2Y5WxjzUoXBD8k9L8S27Jv7sFs3pheJAWNT23wxE
         rZ4T6kQTCDjwNy6Yrev9HLjvuxxg5iEiqCdGJ+Z6yABW24OC+c4ZEpFSnrcvPRN5H0TL
         DdGZUjfzxIzZM4VShAlJK0wLwMe9pE6UvLU2Ddq9nQfJlLsFJm2rzfV4+zMOanzIW7YE
         tRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
        fh=cR2P5ibWQB7QFObflTm96W8Rw4QFzUJblOqKx+jvLic=;
        b=OYQg93vKs6Id/fMIgKkGFCIP78BM9m4+YQO7H4G4Oin1WnBd8+PYtlM/bkythR4NCa
         a1CaqhdEgkKf9XqfP47j3VKRt/uCAe61jm2BKfOKML8VnsNkLRShEHb6c96AEdY6ZuC7
         AO3LnOAEl+DHMqa/pxz+KgPa0qriymCL0EKzr4X+8PNUlVnQ4Wb+cbfMUyhuYDvGNjOv
         OF2NeYWnbrhO7r6bSyFhyqd7IH2rRsr7ytQgyp39pbot227G9bRv67pb/KoBl6wAEYwr
         vv5kU+d8nF5CxXFKhLneYxYrrll2b27kLY227PYyPj8nbX21jdWO2O2wJxv2isq/TLcZ
         4dsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795693928; x=1796298728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
        b=JT06c3QKKCr3y0yVzTg+ate4KNvDPQLtPIUqXC2lnaoO1aKE1gjCZtRZ9qI2BWd8Mm
         UishDTnalNfXIWDh1EGZLG49GSRHC8u0qeHLlJ7Vy0vED+jjnLxd5tkJBybcBu20cAUx
         6DZXprA6wHS+OYNrVjq1zI18LZH1Bt8ZJ4LJobtqfLybwWovB37LpcwGK/D833KDbW8F
         +VYBYEUbXjWAgP5hCkHBmku9c1uHOCOFZL6pNgeCtZYYsOfEhtCLPp8+LVLRfYO1BUl1
         2cQujWKHYb+8iHKafr2QX++U+cY5W/FI0QcQK+gTIAdkKTJwphsDfqYlM3HhloKhU0QU
         5l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693928; x=1796298728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amuRKHtIxZCusSd7NYHmthsgJGB4hV/bj//XXqhJ184=;
        b=tpa/J7UeBHuWODENRwNe2byVD7Rd7KBVRj/Xjv850QbIbWAInVgFqJa75NLfXoLJuB
         x6dTI5LTptqk6Oq2QmH7fwo6lZo+DkyUvbZLrHJe7wKsnRgeb7J9s/SH5/hgFJ4u/Q52
         2jyInPjkJuyQwKMIL0We5er6Kz9qYjcs6DWjkME94eFlfmOAdEWIdL1ZKoa9pILskNmc
         WLusanxvhbhFu27ujZSQ2xJw2+vQ2HTVo9OqtAGIW4DImJJpyP5S5sP3daeIcQyVTEGQ
         zGCyiKuCofSt48dqZUm+/9meQx/lmsTDhzsXBZHoBpGucaoc9EXjUOzeoRZkD4wo2Wqi
         +/fA==
X-Forwarded-Encrypted: i=1; AL+hErG+u6EDSxeSna0+/WeAGLQjmV8OZXu/FUmexLDrGJ+B1t6c5fAYHQ+vuio98okJWGYiXVby8PkF7exs+ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mdi/svGxT5uNNGci1azy9GYd7rugNkN5g6JJc+sRX1pRVyleM
	HZRRdNT8hw+A8T4/xkqhnbq8jMgHWT17e+l1dktbMnf7hz8NbzB7yoDikEclq0oQAUL28vrM4Qb
	T4uyptwQolLdJsRPXih3g97C8U33g4VUW+04qrts8yA==
X-Gm-Gg: AZFdTZdb0mDKLancDixBJr2wpt6YO7PU4udya6jd/qoWfp81w2r/0wT4UXOCVlt+kcq
	Fb2+DwnQJdEN4oK+yAPoq4Vhr1mlXUA245sAZBjgZusu5vSTlzg0x3YtzrhZOeeFDVIeyM3hLi3
	Ze4HI3J4LXCSjKk1ou0atolnRqxi6PCFigoi12anFzMWBXUhLgAHtWT6H7nj57IGY1cpY0tWHrQ
	SAq8AWE/12qvv9zXPMoazctUVslpbKsAR8XJGiAV+8h22Xc8QDi1Q8AhXXki8qOZP2HLjRBRVdk
	/cDxGL2b+juBIVzhGn6IU5rEWwYtEf/HHIqbvefdaP5oLekvdz2nt/cYYg45hstaijam2puntus
	8xXBe/h/LzDxvQIJmW9oENTj4pwmJrnodFGX47oYGKIce1ucXsGcbppap6E76VHxKkJtHyB111n
	P/++rZ0t4xam4IGBkVyqdyLC/np9ssRcTrwyS6iV55gJ4VdEl1PYXKiw==
X-Received: by 2002:a05:690e:11cf:b0:67d:c7c7:f906 with SMTP id
 956f58d0204a3-67df4551fa1mr7645191d50.158.1795693928129; Thu, 26 Nov 2026
 03:52:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com> <2162b02c-642a-446c-973e-ca80607da294@arm.com>
In-Reply-To: <2162b02c-642a-446c-973e-ca80607da294@arm.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Nov 2026 11:51:57 +0000
X-Gm-Features: Aa3M54pjtUNnZ71ASyHQ6UnEf_ksRPjhBZS8ywckgTsHxI2GyTeeeUEsLldr4BU
Message-ID: <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU throttling
To: tudor.ambarus@linaro.org
Cc: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com, krzk@kernel.org, 
	rafael@kernel.org, daniel.lezcano@kernel.org, lukasz.luba@arm.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 10:50, Christian Loehle <christian.loehle@arm.com> w=
rote:
>
> On 11/26/26 09:16, Alexey Klimov wrote:
> > Hi Christian, Tudor,
> >
> > On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.co=
m> wrote:
> >>
> >> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command wri=
tes
> >> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU cl=
ocks
> >> independently of its interrupt mask. Setting it to 0 C limits all thre=
e
> >> clusters to about 200 MHz while cpufreq reports the requested frequenc=
ies.
> >> This was found through trial and error while tracking EAS regressions.
> >
> > Cpufreq reports the requested frequencies =E2=80=94 are these cached va=
lues
> > being reported?
> > Or is this what the kernel gets via the ACPM call?
>
> Requested frequencies are reported. The 200MHz I only deduced from PMU co=
unters.

Tudor, your thoughts?
Is ACPM reporting an incorrect rate or are those cached values?

Thanks,
Alexey
