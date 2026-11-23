Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453911;
	b=lrylvrrWu5B73h6ZAz3ATXfRXdfPEgs3q18DQT2pQFLp93ER5pQWdtA+Rvuq2n/oslLA
	 aMVvwHNm9DL4TqKE6uqAc9Ix9lQXLC1f8vHGIc0oG9jP9acvIXZWuz5wkhMsKKRiy6FwK
	 y3KQxxIoII7Rj8bgtoxn0QiGzV/MYHoHjtQgCSQZxWAnVzKqBNKsPoCiyg5cfFWn8IQVx
	 vFRnAwC3gN759rupX0ZW3aorC8Q1U0itYmkVahbpbtba8IpNpO21UE/2MQ6zaDAq19QS0
	 Dpj1DonnpKziWQNBe4ScQMCbsF+2VLeG9wfB5xFAhIH74++aJ2ZTrl6iZu8Sc5yC1lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
	b=2DkuLgBDbwXNl96/HrFREITGR0lOU1ZkL0KqgHHJrM3NGTqDPgAix4dt55xZWVot61Xi
	 0JZf/CDkN+z5SmQbAmgIuPgHvOWyWQgpGZOSDdf55Z/Se46+eebIkE4eJvRJjKoA2Xfqu
	 KAg9/nNetKndZYORYBVNWlSY51HgMBhJZXHfUBmyaAT+Q4Dsi0M1okfcpaB1YVR285oWh
	 JtMva9/VjAKtM4ItNCsH3aNKYq1jPKDo4D/TOYgrENJ6TFwgIwn1+HwF+kqps3Xq8uRsE
	 RiE/skbYZ7RnJmS0/yWAJNZGSzRqdIbYdj/5j4X3gLL6IxP/6qCmy6WTicfRncP9ROw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=cG0siZSF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=cG0siZSF
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so577947566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795453909; cv=none;
        d=google.com; s=arc-20260327;
        b=DeEgFIpDTLLUeeX6lJ1kZP9wy0WDKJX22/Sc+hRZFKJ6mqiHltCgHaKthCfXH73d9D
         07M3OXNFlPz1v+b+5zPJodxRy9Xqu8hWzcf5XlIUR9dsHPhe14JFQuXJlL6LS2saG1Lj
         7Smv+kT/uymTGiXjxUMISeQgLBqaf4t5yCBnla9q7KEiVldGq5FUFS/hMzWYM49QWhtV
         xnOLDyzziuQDhkvcDI/ds6H+bBIplVX9YRtlYRhXd+fm1EpIP10eAVEHuaGn9LUMM5U8
         rQ8KMh1iW5s1Pg48opOvugr5RJ6/v0TvnAclmRdNkP3MndUYXDHAGOcVFQsN40KenvM0
         cIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
        fh=OTTIJlo3pjHaorVYNl5oNEG4Vmkdbrjuicq4p243sJU=;
        b=IOprpzSiXP+SMhdvqIoL7cElTrwBrvI+QyJjIzC0+NDJcpxG1Poe8dH19b2M4Vay1s
         51bBW+Q/GA2zgczlt1SmJj2mhpWFqELlBGIXjqhmJtRfZtagOXhKC0ulOm5wHxxLj71s
         K3VA6LC2NC2DUN5g68/Od5jztV/aW5XydwL+MQ9KWgxHsf39n7N0k/vFl10aQa7FS0U5
         Jfey2I2RNEcymLgCFaoY61qRoiP7/E4hocoMKzfx9roSwNGD0PHqkKGDlfIJ5Pgu0Xao
         Y4iHq9/td7dNS+07kV9A5IDkfSjgL9EGJz0SVt4JIh/a2d4PrJO08LVKOpOaA1rwMck0
         c/Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795453909; x=1796058709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
        b=cG0siZSFYTpd4R6ZgQYJ8SXc+bG8ElcPj1nCBKcIlsZY4shb3awIkUOvQn5pkSc/b1
         lHPS1ExBDwp3M3cWTFoG7f0+Z5cx6Necf4BvTT5DlfzagAveWt3Tm6oSaG9VsQW8cltU
         GxbnXZvB4TRLielIYojVRurnjfGdsldtDi7GIsCla93CpWdxcqza94lGl6K2cioZt3Mv
         XIKvTFrwZUnX7pjtmu8DjwRXwK+reMjdG2Sxetn3ND3EaqRCfymK4LZGFl3s8TJ4Tzrr
         j0uxvZOoNSKTYXINbEvfcK3Xf5gco+Ed0Jx9vbG/998jlDxaPtjtPqcf5F/3IpAkttME
         Ksag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453909; x=1796058709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
        b=UVDfq6S2PmlBjlgICXle437ZfySOQxCZgPCaqXUFBp4q6+wC46kUglH9AOdzUwxQ0f
         LqXRT2sT5/G6R4zpuSqmB93wHCJdCHlRvBwcDwR+cvSO1r2bd9CSVY6F967pnCDh3QR1
         q8jFJbN2gAOdbT2IJI50rAHBZ0WTrCdmYr/fOvb1hawoY3m0gGaKvr6R3ej+PbOwcrv9
         Q/WxQ8ievp4/GotFU4rUOO7woEpr0qc7kIHmOF8SURlqRWgRk7XcIza7YeyvQjZ24gM9
         5WEfnpe1G/szW+FWlDAibsqtcn98j9uIhBhDNBhk4aKHIrcE7WO+VYsU4fSHgsJv82Pq
         r97w==
X-Forwarded-Encrypted: i=1; AL+hErFap0wWEXR37ojUFwbB+1zGSAF9MikpsVHJ2SnTuzatMX26568TWZabyJiE3ZeYwDKT5J7y0k6bPa61s9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gSvuWlxTb5HO+Oi1aceTyjJiLzSfdFr9gKmKsDTmtbMJP5smM
	acmqNvwSlk49DwO3I5l/12cpBGOnl7Sgcw4AZT+Yh0CGq5iLOP1Kapit4m7FxZdXKMir4rlph2e
	YKHEWfBHzaGrgt1Qyo/gVC8T40cLix2geV6+jz4Me5w==
X-Gm-Gg: AZFdTZerX6WKdaWPUXimfnr1r+unN1ZngWYjL1xayoM+tlmzEkgAqIDFss+oYzkMToE
	WY1ZhzY1U4X9yLQONElnPUfMiNX+MZiyuQk/F1H3yMZNlJXX3mBs4YPhYe6R5RgH+VrXapoxNhg
	lOkKHxJq/WWZLRejQzefOG4W6GfDHO2TknZqXHWcMB3cohJSsB9KGFPULfeIh2DyzeoMOwFpNHl
	kqoChKJN0TBbKV9LqftBmZitT3LpFZmqHX1fN+39EIfSVGlaILpdO/K9e2pPxtfa4yifQgj1GRX
	zRctyDw25Ev1ZGYe+1APB1gsCi12y7kdt9Gh/joBgj58EdRiddN5gRQgqXuAZj5o7YNjEW26Xl4
	mba89PD6DCNcqe35bSZtuBFGKu8BylDpbNA==
X-Received: by 2002:a17:906:f10a:b0:c49:b8ec:a9e3 with SMTP id
 a640c23a62f3a-c513aad202amr871113566b.43.1795453909164; Mon, 23 Nov 2026
 09:11:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awGr_tB3QXwnW1G2@kernel.org> <20261123165638.2161305-1-rmustafin@cloudlinux.com>
In-Reply-To: <20261123165638.2161305-1-rmustafin@cloudlinux.com>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Tue, 24 Nov 2026 00:11:37 +0700
X-Gm-Features: Aa3M54qI_gigBtcVlB0bVVMCDfPwHMSLIUBI_RteTpbOu_KmpWlOErFZfJySAUQ
Message-ID: <CAG6=z5tCJNyaPbOBYRCskXTCGkbJ_Zteg9Y-N_FFdU6Ag5FxDA@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: tpm2: test that io_uring reads ignore the
 file offset
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Shuah Khan <shuah@kernel.org>, Jaewon Yang <yong010301@gmail.com>, 
	linux-integrity@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#!/bin/sh
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

This should be GPL-2.0-only, as you asked on the RFC; I copied the line
from the neighbouring scripts. I can send a v4 with only that change, or
you can fix it up when applying, whichever you prefer.

Br,
Rustam
