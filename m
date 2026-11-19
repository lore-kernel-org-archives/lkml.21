Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795115702;
	b=ycG5nEByXFTDzWRUDd24vbOXnZfYmvFcFWhPpH+0LBOhMxAytWjGDCs1WelTFeYmW/H+
	 C3lM+E6wOmBerOBpgwd9ItnwNTGbK798qbp/G6hFYr876E2izJET8KwxYqP/l/R86UyTF
	 5IecKNp96OSDWnDhNRLYhqH+9a9QwPllbWA/gCIf7w3MLm/8BHbF58mEngIAv7noSGF5u
	 sYYb4IJ4PhoyOKyyjCFop7KV9g7JuniUFzVua5vs5ErRWn3c+hHUerMaBnA2Ll+SlmMn8
	 wCebQ+r6sO86XeUT2RkAZgoP2X0+w0KcXH9+SHy5gBN/7fyqDKdEIwMKYEhlpzpBT+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZfGNZp0FqXRF14R2lEvSl2W+3CYQf21jFvNPi6RI+VM=;
	b=a19KsRCG6d5T7m0BIDpYVatJgPAlrMzHvuefADT/IaayYEFpC9z6dbjT36CdllrIxbLK
	 mEMGiMtMSQvAeVBOa6rCdIsZOZquiFBSziotqYk/fCD5F+OkBXaDg3a6faBNdjriT6afK
	 CmqFh2/alfDVKs68XachXX2mLspEowHu0KPWGe7OS6IjZaIi0xxvWBtv6/HNQTdxIcDxC
	 U6HPwRa3iZLWcS+MMh+Hr/bAkoFgmQPFG1Xxk9JYOjmtvV/Sd/KD2HGVVSSEnc1ST8SkO
	 ULunIEnhqxKMKboRxogrF4tZpz0d9bQdGJ99QlaAFCvp5JG2yYePCeLaOzznYIFem6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BM8VDiiC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D78B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BM8VDiiC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a358881793so33072f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795115699; cv=none;
        d=google.com; s=arc-20260327;
        b=rgs8AP70lmHTlisKidbW7JUldwNT6kLfFXhq0ER3wincfTh4aKkiSRXPhYX5Ilcop6
         JjQOZJpu7guffjgOP81JlD2q2/iMIMGcSxk1e5fUfoqzyNSNAaxsK/dOfciNdQm0bqaa
         hLdak7gxAyGoKZ493+x4T1Cj0oswOdf0j2hAvCn5eLjyXQGvLs9Zg+uG1Oj8/U/3kymT
         PpYzLc58l9/PPcFWevlhx3jVkpm+KCRUhnkTypb7QuyeKm/yGcLN8kHyJTSZmNEydXBl
         FZIndBIBW0fP7jHIVco9MWea1fOPfzUm/UfDwRHMJoQgYDy2Oy+wsmu5uqycBw6GBfVd
         mhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZfGNZp0FqXRF14R2lEvSl2W+3CYQf21jFvNPi6RI+VM=;
        fh=BQkAm39XS8qdxLcpn0hGOZDlsuwz5P8rsCD05pmAD/Q=;
        b=gwod6vpg4i5AQmFSZDkr/lIqc3ywqst25f5Dg4sdnVKdVXHQzM3DQcPlL9HzKBlJoe
         7xy13lc20e70TipZ52YTB9kHgpiPvyt8jSjciO5EqcMoOxEtMjZc8PQct8A9DXjv0l0C
         ZJe1N5wCEDmG2KbOl3J5NIaMXGr543nORqPuyGW6jSXr3YrZpr1e12H/yYDD8WTtIR2e
         0wpwiWcKZZRxKjeOONaxIGidM6icIh4eL+XqzXAJx8WOsn2M1UYlEV9WsKr3z+x5Fggn
         cfVDktdxnnn6ibuZXsWxNHrr5QXBo4vMeOBA55+Cv+pcs+HMniGh0D2afqapmBqFvmGp
         gCsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115699; x=1795720499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZfGNZp0FqXRF14R2lEvSl2W+3CYQf21jFvNPi6RI+VM=;
        b=BM8VDiiCqZFgdJ20G+mihVuZLMXA3U9Rr6crtGq/+369UrhguIi0LP03Sbforbacbt
         KaQK0lpAB4DGcsi63g0z70euu0QI57qr+dxKyBlfXEXWg2leNd1Db00d3XVvBUQUSdLf
         U7PGMvpdI0+4l/V55/PdY+6XJSuNJKZUrHcMYGDNLJcs4ttsk9UVu5idq8jq/QZy2jic
         rkOjrFDOAO6HbLM3i4nhsH72KREpilTRTJyyKHJZeu881I8J7cPceH0PnYU9gjHV10Tw
         xaY70aiZ0tZwpJ1i+is4AtITX3brOnCweGepboOxLr70vwiMhst/FQpuR99oOjRFQEUt
         Afbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115699; x=1795720499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZfGNZp0FqXRF14R2lEvSl2W+3CYQf21jFvNPi6RI+VM=;
        b=ipMZ30Qmznt/USnjdGLmg6WKRI/7V24pQJMR4dg0rvphIffmCE6Jw6e6Xf35ohhwHe
         2yHIOgTKatLmFgyBBMM9zIfyw0CLn5B4yCqOdEg4878Mynw/d52SB88yKjXQdllrh8Gz
         y5x2rRnA0OWpt6DGyC737fkbRReDHfZ9uKeXP7WRXHacrZ3zxl0TzWHzZGDR07qyOsBq
         OLlkxePPVwW2gcYeqcRghS473HvfscADJD1o0WhOg8W+mzNAou1+aGupwXkrZqRVeyR3
         j4ohTH0+MSiklOPVIQgyNWDbVZod00XkcFzyABczp3NFYbAEmfod6ybNCnFSg4AqQZ00
         74IQ==
X-Forwarded-Encrypted: i=1; AL+hErHhmKrCt5PyfVYZThddggGxAvgtF28aPjBXOdYzMyYwpprHDPE0CcZHV7TwUe26/d9k2EVfcZ6C5xTn3S0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7ltPwXggk67gwcI3VXtmwXSd0MAWC2Ytjqf648vo/2hxFOIHD
	E4enCcjDFpxBGya6rQX7n5gDzZ1e9yAFBXi/YUZFjWh4PI6TpTSI48Abuez7BnpvtCkFvEmgneF
	OWK9v5UyoAX+xJIJeSxcaCaaFVkON5lk=
X-Gm-Gg: AZFdTZe76CXjqwRsMRSbq2ZkcIVczosTb6wAHsbk7ugujITQQPYIAfJX699D+Ph5EOH
	D+MCFbtXYSuyhp8LujhFsSpt0pCmHvwvx1y+q27lkpHbMT1srJ7494TZpGGG+U+Q1Za+cRccehO
	p5xtb+SuUMy+yZdNg/UXX94gp2gRjOFLrfoab6Ot7Yykp7zB2GSTVeod3EIRt4ZYoU3kdEUVQep
	REPR6EUryYfIW8tyMy+1QN0zuBOxN6Bc2zqaagXaxTWojewTM4tI0L63B9TMpEYp74PsFlPNvBx
	2CQi8br4Ayoe8t796E3sN84Z0GEc8Jt+SGRhoo8as5RnU0vdhSQYat/mnuabM1eW6b6Z39kcQu+
	q5hn7vWLpwYC9z7WMmQlvPCyAnD2xrG0LScQG+HyKd0GCmW6m+NKZBU+cF5tqRHWXLONJ/EpNwa
	W+D9L7KQVkdFUPA1QI5IRUeDht26PHhpsmH8qNH7oyAj6ahb8+UIz+itCFrIpsv67twqJ2NA==
X-Received: by 2002:a05:6000:1a8d:b0:48d:f39b:83de with SMTP id
 ffacd0b85a97d-4abad6a42dbmr895329f8f.3.1795115699220; Thu, 19 Nov 2026
 11:14:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com> <20261117-unused-sym-mm-v2-4-2f845e94dd50@amd.com>
In-Reply-To: <20261117-unused-sym-mm-v2-4-2f845e94dd50@amd.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 19 Nov 2026 11:14:47 -0800
X-Gm-Features: Aa3M54ofpta_fbFOGjurxuCbx318jL9bD4qka8Yzj9XEA2lvZOYSWWxaKEQlFjA
Message-ID: <CAKEwX=OUgd9pMbMDoDsj3z8+D-8SfEc9SDe3qX_CcX30pCrPTQ@mail.gmail.com>
Subject: Re: [PATCH mm-new v2 4/5] mm/zsmalloc: remove unused zpdesc_lock()
To: Shivank Garg <shivankg@amd.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:17=E2=80=AFPM Shivank Garg <shivankg@amd.com> wr=
ote:
>
> It was added in commit c1b3bb73d55e ("mm/zsmalloc: use zpdesc in
> trylock_zspage()/lock_zspage()") but has never had a caller.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
