Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023486;
	b=XmP/tlVclxTUEg+L3Dl2otuwQ6ju2+r2QDafWTjMcOfVgm19apb/+o+VGR63j2wJFlPH
	 wvQL6PM5A2jY3M0k8bkyvF6CY8xV6C7t8tNpufzRYy2qOvcoEmDzV5nVY00adsDfDRrH4
	 z8suv5zTmm+t69dNBH4D3QWsB2tSeOY04mlNTdBimIFYI0ZLsSU0dneRxDbJN9TDB+17f
	 hLNhk7lmKX2sdxMAOBipUO+k2/Pi0Kd1jjwWAvp9hl8D8XRKB3VpWHZ2xQGpuZiraR+SI
	 b+1GpIFaxQW9+LUbK/CE4uCz0uAXUvOjrX46AMgh0lRJZJoC6b90pmoVkV2iS+h75TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9XinJYc23aTzc1eZ3Zb8fdPpoBmzr+cm88xaEMLHGT4=;
	b=oIe/exEl7/G7IovQyjwRsMYsZ1If4jPSzDlTnqTVAs6lfw2WuMvFYvbNVJT/ylEijwJC
	 GJPE5fkobz90ytNYHfwiVgtepbP8mGoQvsPJ4N4bAkjsI8pYQngmC53zFQU82EckQFZzL
	 DdcOpMJ9pUC9+EbGNy+3xYT1t6gJZ867lTa99bbR8nKcs9p5E6lASqkRKKmhXBHDd3Lba
	 cEpY+hYGQZO/hAJ/h1m8kysvv3QyXwFJ+FFY707yaSG3jTWf61siOfgjTofhn+XWNgwII
	 B84KLrHXnh13jRER+J53GUVvwizZJu2P1AlQrBdsfCM6FYVElILx5IgK7Y5IpfmsMOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pPpPJsex;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E236A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pPpPJsex
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so2002220c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023485; cv=none;
        d=google.com; s=arc-20260327;
        b=JWtTVML8dP6yPfrNYbZOIZAvAQXL+YuBqBv5NcZWi5nVq90ENkImkrbaAuciMKpbt5
         0crvR/SMEMsEnzUjWV0FWwDjE8ocOlzIz7I1IiX9h5pWoBDkKsr9lQ4VCocUpWAoqVUK
         gzKiwY57YwygpCJvlTkXz9Cm1CNUEZTA3ZGX+1mOPCz+Zl+ssUdFkG77kBMWGGV9Ls5H
         BdyLAP2ZVDyk1wXeiQ1kWIPHGFzvH3y8f3YkP43fR2QafGWuyIFVATlj6H9tDRHOHbLn
         EKUz6aha9f5GQKSyKVImNwAIHTaOJGVyTdr3aut1RQZf76EYlZI7rI0WtxN1ve/7vmpz
         Z/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9XinJYc23aTzc1eZ3Zb8fdPpoBmzr+cm88xaEMLHGT4=;
        fh=FYR22FlTta4sv42WsHRipddjZXIVe7DIz646HOOZDKo=;
        b=sumitWyb+8CIb7G3b3uW0KUmWmnS7vF7IsnFSMlU742TU4rQev/Pg0aFJMxAe1gwpy
         1aRccQo8RKgltWoZVtM03fsW27BWdiyd2XN5WwD7sQcl70GdsoEqHhw8Q9PZ4BujDvzr
         qRIUQKMFLVFMH2uUNWfrTxST86WcfWoyh5TNGigihxmCCkXYGu5tVa2qd6wjFANYOc0j
         0WNQsOOnxsg5M6cEBDHG62a2HcJNAy5sBrbYizc08WalBB0mddaIV84C1FjABqBHtcmH
         w9CF6R2rUb2Pg2OIAJuXQn8Ivk9r94u8/FaNcFSrCDwat9Mc6+E9X+OT7L/fUWEPr/Qy
         Mc2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795023485; x=1795628285; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XinJYc23aTzc1eZ3Zb8fdPpoBmzr+cm88xaEMLHGT4=;
        b=pPpPJsexIsntT+WjN2QIJQsnpE+HhrkkKcPtu4GiBtx5JRVlIwVRu45ltgZlrs431A
         KbqSoPYXxhivgSYfNjmizm75Z5J0kLlUrPT1arUUBNJBiYovJTzPFSvIZRf0JyZjCWhl
         BlwSPbvhgwWWwbckfttx4xA8pCb0r0Os7gWrup2/nggf0wlg3d1oWPTy3bpQfo7Lsf3h
         hp/+xV1OPzX19uh85Z2aDoMGOh+fuF1oxziyDXymvUMx9TuG3EIZtef0G1/LoBK6+qrP
         ajEqiXvxysl0h9R0suBhvWlQA6IRj7keq3zSGA7mnrrttt1lE1NWMI0yGPfB/pCU+oM5
         FUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023485; x=1795628285;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9XinJYc23aTzc1eZ3Zb8fdPpoBmzr+cm88xaEMLHGT4=;
        b=cCK1hBGywp43j7jlhqXLmYjUjn3QkgIEEzKhiBrz59r7cvQubs1e5W9uEXJJ7nOc6W
         fjTBmxmFEJsLZTRKj9lSUx8PBn4QmI9VlN4eUYbEIm/3nslmIzoGaDDgv722Dbur82Rp
         2h1MWxKLUuTQO8G2Jctt/0fG4Y+mlzIfpoxWFp9oT9LWbSa+niVr24rIP2Jzwjhxpdj8
         nL0xhRxgoXhJsUAt8ow2yo90ANOsQmW3/6nCIRpTptDsKraHx/zqDtyMlcqSz5VLmW23
         sQ1A/I4e3I+TH/UzdTV4DcdvRMHIg8fPj3KgjtD2qY44loF/qsH/O6ioOpsgjV3y8Urf
         7OfA==
X-Forwarded-Encrypted: i=1; AL+hErHHWfmL9IJuXIagBduOGYpzgmU5JObNKzi0Bw21cL9/pXfxqR+qwGWVmuIb5YPzFx5kpcAy2bI8hRZghq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r/TGRjz4ST4BFulWuc1NBAkUIE5hT/l0skl3+qkNYAIPcsluL
	Dgx0JLJGhVPcT1zfIrf4feghZaX4WpBDKt1yuL7UXT/3Ps4bJB+TErjO9/i7w5yMolzZNzoH70G
	QWU+PROcg4iq/XRdiwF5cm8BnZYcxh1Bth19OpdHY17f28t0+4q+1+VNGW8U=
X-Gm-Gg: AYBFou1QBwxdFTf6t44u8tGb234Gugjg8A8510xr5L2IWAX5blAl3Qg1qS36EutNQDf
	gsAeFxkA9qxIg+PocWZgycEfJDt9SvPs/M+IVoCB3AK0mlebREowv5I8zMpyAcusjYDb4G+akRe
	Lf7x/ARqIoYN6Nk9lCQxXQRGF2gNe9zpHV3Srxp1G/S+63j0X7j2EKn5dSd/Hp82XeDl9+ip3MA
	KkwC1t0owTkPXGsg+NJuwvjAJV96BvHe6RKfGUcwkW0XsZ+KjsuHgU/WbN0WFD1zvbm6jjqLVKI
	qlFLuKln/wUf1OWj+t9B9MeI4xlvFmZvbgsEm80hzxWp5MUndhv5VQaw2rRzFQBvpQMFIwKmy9k
	cDyZw2zQ7VZZ69jsDvuYgqI14FzDhc5Fjf2BnbtCzckISHIkZIsR0/5s4E0rH4n1JfnFfQ5saHp
	9i2+vtS4DtX9THqqpzcipRdXCCXBM/nVcPWJJhFDjHnXmm52QwMTU05d92UAhnmOIKaG2e
X-Received: by 2002:a05:701b:2511:b0:1b2:6cba:7f48 with SMTP id
 a92af1059eb24-1b543c2e6d5mr2710784c88.31.1795023484139; Wed, 18 Nov 2026
 09:38:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117175558.4146151-1-tadamsjr@google.com> <350d2c49-1a12-47e2-8720-8deb8e322531@acm.org>
In-Reply-To: <350d2c49-1a12-47e2-8720-8deb8e322531@acm.org>
From: TJ Adams <tadamsjr@google.com>
Date: Wed, 18 Nov 2026 09:37:51 -0800
X-Gm-Features: AclHuK_0NsTuXEEac6siFWSTVFj23klwMEJRHXzUGkWjbieisM9ywPhJLbID-UM
Message-ID: <CAL54JgevCiOLgC3XegnrMO6RT15gXqdDP+L=BzzKqt9OowDCOQ@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: pm8001: Offset hardware queue index for MSI-X pre-vector
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, John Garry <john.garry@linux.dev>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:27 AM Bart Van Assche <bvanassche@acm.org> wrote:
>
> The surrounding definitions have a tab between "#define" and the
> macro name, while this one has a space. Is this intentional?

No, this was unintentional. My editor rendered the tab as one column
after #define, so I didn't notice. I'll fix this in v3.

> A side effect of this change: completions for the highest hardware
> queue now go to outbound queue max_q_num - 1. pm80xx_chip_init()
> programs that vector as the fatal error interrupt. process_oq() reads
> MSGU_SCRATCH_PAD_1 for every interrupt on that vector, and also
> MSGU_SCRATCH_PAD_RSVD_0 if no fatal error is reported. Without this
> patch, no I/O completions go to that queue, so those MMIO reads only
> happen for fatal error interrupts. The code is still correct, and the
> driver used that queue for I/O before commit 42f22fe36d51 too, but it
> might be worth mentioning in the patch description. Alternatively, a
> follow-up patch could move the fatal error interrupt to the
> housekeeping vector.

Thanks for pointing that out! I'll just mention it in the v3 patch
description since I haven't tested moving the fatal error interrupt to
the housekeeping vector.

Thanks for the review,
TJ
