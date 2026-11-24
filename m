Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795490847;
	b=qZQRygA3KgzTxzmho6xxPQlwNjuTKGGeQX3fN9/yzmyP4Q3PItjl0Ez8f6i1wj7BoiMw
	 Meb+rv0eIkJfnQtqRq5iQFGkTE2NquSD2vNcRnhZtB9TJVH9GM+vFetjuonO/oOb8zYHI
	 0V4S8AHloHpuj/TB+BNDOXdwp5Ws/WxgVbcI8/DBklI6yC13P4leUTBihOZy1hSVmbepw
	 ape5BgsFGMl595260+wLp4JF6jU5LobNQraJme1E3Q2oIvXD2ujP7UFjcBOq51Kg+brl6
	 mIYFwFlJNzfXnloMhW1KFyb8gpmbw+cgkGsuUOROmuN2SUYrF/2IOl9t+qj3GpqL7xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JiQXtAo3o2WNzv2cw0xwZCtmd/vlPYyEk4FV9girnuo=;
	b=zfEYFBaAsKRXweXzaG4wHOd+nxyhZJcCOeGPh1E1Qtdh36DwGtOe+sjZQOgjtPQPf5cj
	 3PrRhoZzIGp4MlozMow6ekIu6e6Nuio35xx41bQgZBcaGbsE0ZuHojyjg5v6ron/qL9Fl
	 iNDX6fVWpE8Z+lApJdai/eraPDWIVnFCSnmyteWRYqj+bNph1ChekcJWFTmxYLqqbcGxE
	 4A7qcq/tiRxtuYMdISVGGfOdjptMpClMkxhX5vEVlhg8JkwSnk4A4oLqzx6QBFJHmvGPP
	 4O7nGCPeCHHsnuyMHeOoMGmN4dRr09+uy6w8/3Rtw4Q17zFXkDpGWd2Qh6PGbU4Qcnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JVzybGZz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2872606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2872606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JVzybGZz
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55c7445cf85so656381cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795490846; cv=none;
        d=google.com; s=arc-20260327;
        b=Rs7FikqnJXArys2jeB4WSroE5waZ74CtQsQX+zMxHPWbrHVDANdzC4mkWm2GrCnTzX
         WEU53lPwJtnJekih7p/XSAMDiSBUKzWinzNBhzURqL7qje5OjwMrWrT/V9VM9bWwMzTm
         T49Wd7kkPJzoP1pz4P+bjolI38xv/QQNWg0E91UPrW19PZDPE4rxbmzAfk1hcXpprLa9
         f3qvfomngrwiDxJ4zo3GcL1OayVFJctmguLP98SOS/B7+vNyBol5pTA9HcDoaY2ThymB
         rd3C7Dvla7iGrAfJFCbUqzFX8E6V15y//tltLU+A+GzK1qyCdi+nDe7B7qWccgvm7Fnz
         sGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JiQXtAo3o2WNzv2cw0xwZCtmd/vlPYyEk4FV9girnuo=;
        fh=iueSw1iRPBr8habg0dgHBlmRPeHB90svpqA7nSOTd0w=;
        b=JvWilS6PtwwCkLnZlC5hZdy3V/MjIywDmmMx+L9i9l4bhPRDRjW0HKCb19zxg97Znm
         yXY5NuXEF787pS1PByLPnzTJduzIC4t4KfiFYWMWp9WWAVzYRy+GCSyX4/I3ruSZtZTX
         nryCGFEQuKK4c29Kgp8bNGJ6ic45pOrjerZo+frQiDAomiksCtzD3iyFNVTBXnTDnreX
         HOSXtiDLcw4Bj9kJQtD/4s265Vo/PAScHW7G8215jwpitxuxtA+mYlaSJ/gh3eZEYS/j
         zNWEJK76Rcfs6KF3ZSk9jq1QSNUTJoyo20g9wfEOmKLywJJIjDX+6qpGV3Da4iNSLZAV
         f0Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795490846; x=1796095646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiQXtAo3o2WNzv2cw0xwZCtmd/vlPYyEk4FV9girnuo=;
        b=JVzybGZz4oPbtX3QqoBYoJbLp8udaL1EJW4Vh3Vcrvi8wTTg3N4rGD77xVOYML7ZFI
         jN4ke2CYQuhyqPKLMxQQgOb1S64m64areXaOt10Y4i9Ok6ZvTSd/C2GffxzfqS93rbaT
         eHDUaW3avegiBlQbalvTTy+OO94qmc47Zc8uScOK4UdFw4i4wCbRwD0IoIpXd8P2viwu
         a/Ny5dFhRRRm/BXBG+OP7uXwNQwQ1XlJXLSlcjSTm0J+NGehjSqMqNqcDTY4brrqMQXv
         yBI87xUiVaRUpCtKE/UjMuwEFFPXNT5nKQGeoaunYf83/NalEX+4pAvAur9q39V+FNLf
         sd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490846; x=1796095646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiQXtAo3o2WNzv2cw0xwZCtmd/vlPYyEk4FV9girnuo=;
        b=r1aYhuvdxLkTbV9iW+FLJVHp6W8SI5KS7DGcGFp21deixH5+Zxtkt8A2/0IZHiTt/8
         i4kL2C47hQNIjiPGMdX9PVgCXmd9bajfB1zN/SZwjl0EE/NAohyRiLJ/CZujaf2PVEsI
         j53uRSoCmYbjRvJMhG4yKpjtY2R/8o5gVChfhJJ+3dEsCm78zqSoxzaHXJ4BfHu3GT+J
         0Fi9X1gA4lUFx7013IJXTXgZF33W6W3LMp18aH8jOmzMXTYQ6h+IKNfgz6OL5/Xf0CDJ
         dnTUI+cItW+QAUJfQwaNcipWlq5LxgEP77DqLsML33WKgM52lgVLEKkUknxvVPN0Jr+W
         Z82Q==
X-Forwarded-Encrypted: i=1; AL+hErEUoX7Qq7nOQr3XS2duqKuYzIEH9UWt/TT/2Wc0IEr8QuX/cKj7Tiyge/ySCZnGd9Yw71i7yiKEpv324f8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xnssMcgzI2V4voX5rGakURlkVRRUZtghHX67ELRqtGGqT1SMm
	wgf9fp7U4PLzzENezWH/IDHzvQ+TyI8o1aLvDkaYDowZclWcfC8ClxDnFyJSQdrnTe3S6gNdj+W
	j2gM20b64oJpX4SUFDdbAYnQWq2+7zdylChIneRk5
X-Gm-Gg: AZFdTZfumbLzakxuGXluP05BNK9Fxp4E1yfBxZ0eLdY1f1TowIPzvD/lbored/kn4xs
	K3n82rj/h8KNVymyezVqYExqzRlJYPPzoTMCdkEy1FDgehKJtQk/b+bhaJiLfddAEJRZBy2EuiS
	JCY4pfjfYM7Sri5ZA8oQe2S9zeFLWnWTOxUI7lBiR4uEuazICyYQakP2VDvz0M96PKNM30bqFna
	a+uYSdD0Pg7vBffyE/UDz79/akdmUxHM2fhmFJm3ySXPbJNKXbGn/m9aEqTxqTjpDS2GGzV/D5X
	Gq/ZpZM7yQeZR5hrnZ0lq7Do6tBe5MN9VmEtisSIxzNVxTNGEs6QiQSKB0tncEWiipUSk3szOQY
	tCTFeyhZJHy90qdsnpSgiNt5Um04gGO/o8KaW
X-Received: by 2002:ac8:6542:0:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55d88fffc05mr49383221cf.9.1795490845197; Mon, 23 Nov 2026
 19:27:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122050405.80335-1-irogers@google.com> <awS0QkL6JuMfC7Z0@google.com>
 <CAP-5=fX4-HqRbB8zWNSUFyCc4Lzz44iNmok5HJVj5O1+oqoWOA@mail.gmail.com> <CA+w=M=TtEOjHR83QWYknCdSxAPxMNSmQ8yHdVJOXcecRgNEJNA@mail.gmail.com>
In-Reply-To: <CA+w=M=TtEOjHR83QWYknCdSxAPxMNSmQ8yHdVJOXcecRgNEJNA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Nov 2026 19:27:14 -0800
X-Gm-Features: Aa3M54qtiUMX4Q38ODAOzNu5qyFDixnhQ6fLkCkxAsQyceRWQZcJSGJusRlceJI
Message-ID: <CAP-5=fUy+Rt6=8eTDjJE4KKmhToDgYCTrBCeB5Yc-EZ8kvrcUA@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] perf symbol: Sorted arrays, DSO-owned lifetimes,
 and memory shrinking
To: Alireza Haghdoost <haghdoost@uber.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:31=E2=80=AFPM Alireza Haghdoost <haghdoost@uber.c=
om> wrote:
>
> Hi Ian, Namhyung,
>
> > >
> > > I've applied the first 6 patches to perf-tools-next.
> > >
> > > The patch 7 was bigger than I expected.  Can you simplify it more?
> > >
> > > Also I don't plan to merge the rest patches as of now.  Let's wait fo=
r
> > > the lazy loading and try that for a while.
> >
> > Thanks for merging those ones. I will split patch 7 and rebase. Patch
> > 8, shrinking DSOs, etc. is kind of the whole point of the series.
> >
> > Thanks,
> > Ian
> >
>
> The lazy loading v9 is rebased onto perf-tools-next with the first six
> patches, so it now works on the sorted symbol array instead of the
> rb-tree. I'm going through review fixes and should post it later this
> week.
>
> Ian, it uses symbols__visit(), symbols__sort_read_lock() and the
> symbols array directly, so if the split of patch 7 changes those, I'll
> rebase on whichever lands first. I'm also happy to run your remaining
> patches on top of v9 against the same profile as in the cover letter
> and send the numbers, since the two should save memory in different
> places.

Thanks! In v9 (sending out shortly), symbols__visit() and
symbols__sort_read_lock() keep the same signatures and contract:
symbols__sort_read_lock() merges any secondary sorted run or unsorted
tail so symbols->symbols[0 .. symbols->cnt) is a single contiguous
sorted array under the read lock.

The only struct symbols field change to watch for if lazy loading
populates struct symbols directly (rather than via symbols__insert())
is that num_by_name, sorted_by_name, and the sorted boolean were
dropped in favor of sorted_cnt and sorted_tail_cnt (so sorted =3D true
becomes sorted_cnt =3D cnt; sorted_tail_cnt =3D 0, and zfree(&symbols_by_na=
me)
alone invalidates the name index).

Running the shrinking patches on top of lazy loading v9 against your
profile sounds great=E2=80=94thank you for offering to test and share the
numbers!

Thanks,
Ian

> Thanks,
> Alireza
