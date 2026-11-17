Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937734;
	b=ckTmFbtJWNtS0xP/RuPbrKE3lMOZZ7aZ4CcaqmxtDbG5YWisnk4B8Vg9AWGuzAp6eGIR
	 +HSqiu4jkVo0q4cyK5Lq8yFPgXU/VwtrOyUAlmiitHoFmRdKhzWRSBRM9pKln6iRhlHzi
	 08qYokfpW2bi7Cpricg2U/Jlh7fokll2Gl8faWg1Slx4JHFDoxT50N//CtY+IzQZEH6O8
	 kp9Q/IcVQN8UaqgCQE+uvkzeNbCgDWQs4CczGOI97G9iNmKs5L1shxkGgTnmkI3ZMlxh1
	 LlXNQ/a4EkNWCfTqTHr31NsVISl8zMIEesoTCpoZ32/oOcVirR4ywWt53g/Yu039p3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QeImNSoFQjPxcggaJELITP7c9YTshF8TQbb95CzBw0o=;
	b=EI0lr9e1qDVrcjlQMKXmWPUBQQqimCvjjaAW0+f6pV0kQ5BDbB44sbAhsCBlPGj3gox9
	 m6Av7wvZIX5DwBFttM9E3TReWEg304c6UClhdsgMg9peurGYC6k5PL76JBDd3pJv7jnDq
	 WFhvjCkhOLBVbV99fmrbMecIUDshytbelPlKovccgCRv2w1NzpJvPKgL8aAye4B0jlrbn
	 sksqAo9coUX+6mAOLeK7x1bUja8b2gkomo5oinKqC+W/j8ze4Zo/bbzmsPQ6ZiGwNubbW
	 7w4xVTC0MYZ16W4qKffbmX3JaedvQLQEAX7/4taNjvG2N4ORC/+PpEOJ2neCoElS1iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XTzGbBVA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9923D606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9923D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XTzGbBVA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-381f65e4e4bso263103eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:48:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937733; cv=none;
        d=google.com; s=arc-20260327;
        b=MOMnMfEhG3e9yfSRGFIFkDomeYKsE0pjfTYTDVH2kyJOJrcMtwly8QJ7Puv/2fYU4R
         XujFDQye/8FEX/UIPwxGxG78lcFn0TtKVRTCtbq6yG0fWlpDtsZ5GCSehJnNzH21b/Bt
         z+h3i4InQA0pCtEZw1UI30fMWEKT/SuJlw13hH/DLR6L8jtUpNRbWF9TBRAxc5IaZq3U
         hryE1HezerlIj0e7OQovGjlzaHTho9KnH3RMlXHp4+rG+M833zvoVt68L11O9FbNpHBg
         lH2qWXvYkjpJ5/OhP/yF6HjTe9/zBduOFcESyUFPXrvptX7iYB1pnjY3RTu80l2udsSW
         5KeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QeImNSoFQjPxcggaJELITP7c9YTshF8TQbb95CzBw0o=;
        fh=RGaL4MsBa3LTybD2pdRj8X0MK4JuQmG4CW5+ok8p3oc=;
        b=O5KOh9KLN0bpcvAh0nt7QVZZV1vjPf3xvdg/D36s+CCqNjxtjgbpMrNUy7SEXEXNYJ
         n7fbfrwdKXRGTHHS2bRi15cGqMxl9VZzSC7svjk/e7C5743N87Y9KiKD2wn50zR4jX31
         AikLRHsMqpFUIs43Pnqote7oWJApQd+w90z0MkBKPJYnBWpz+W7/NetI4s7ux+7Qlp3h
         itiI7sJBCdQv+6RVCKBtVuEXI6crmRC3c1xvIu3rUZhABQhFS4zAJ5LP3wSBpdpP8pGy
         BKlOpZLcRuSlnjYXi7SuJOYCE5qIyDSZsb+dSgrNTBxEyN4ht7SNgzLgkZbVMv0/6tJ+
         gTbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937733; x=1795542533; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeImNSoFQjPxcggaJELITP7c9YTshF8TQbb95CzBw0o=;
        b=XTzGbBVA8EMGkkJRtwGAcRUm2z6jby3lUWVAUvm1GCtqwX6Sw/9S5zL94nDv+9/cES
         VZn2MUSX8ZcFzPu0nHUZSeCjXbuPtKAqan1Yid4Rc3PWA/9wfjgZEM2D33QCFtd3aSPx
         h+v6iM92ejVA3+tXzkDNH/Qnb4htsEE6Hio4eWvsZdkgb2+oX/d4oilIGxOvTEKh65nU
         3J6whsNjmOg8Rt0m1+m3FObH1g/+ZPyL6pj5mfIGBUPiYN2TONYpCuSn5XCsxHx+JeGq
         6rmjb1EyK0rr+uF+fnM0/CkzSCaXFMnTgWRqkxVk7TNWzx/kRZkDq1l/uRznDL+QhFlA
         wpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937733; x=1795542533;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QeImNSoFQjPxcggaJELITP7c9YTshF8TQbb95CzBw0o=;
        b=o4IbdisXySoQf0P0JgIPIbcZ6zNQk2gWnzh/YFAfb+iBhftFho/RXkpLZ2UETZFuK1
         QPpye0x8t1y7dpGPV7AXk3+pon4h49v/X8zICkuj7A/zSBJHUnhMoIpFBgxXvkkZ69BS
         XriMzLBZjZqEbDCPSGReUuQTSNeRVybwWZtrMbhFs0pPZQJKdCQq9S8FIzLCq7D49d3T
         vgJsWb0mlMjawdInfJfurmwtXHptuYc56f/XWEM2J9GitNf7FDqw0U+tD95ODpjJaKQS
         YLFJc8N4xLalbQaW1pFo63ipZP8Mjp0rm64Z7e29Dmu/PGR0RkVxYbkS1uS66i5ygB3k
         NAuw==
X-Forwarded-Encrypted: i=1; AL+hErGR31x13p2YnDzxPPQ8QyyfCqjcMK49yepLAt5zrvSXEiTaRjmpNWHFhAEyNwEPr53gBO3GIw4bijqrpJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rEmR+x9P8JktTnTSD2o7V8LOlWmx5Nf/jK5emdZ2/sSnQ5jrv
	bV/cxvp/qAPD8SkyISEfqYzOlTdUfanIolBDxmhyBDBdmNFOaLNbz8F+1r6TiT9XA7GSMWkq+BH
	WqPgSdhdx6PtfMHjCqdYepzBYfqzZoTUNrSb6PnXR
X-Gm-Gg: AYBFou27eZXPm6nhG/IfGVTLpBgMfbkPGZnygF3NagmvcZ+ZojqqrKnbAAgk2JjLfhx
	of0f0v/0G0la0WyXJlVN9SAbGaXqLfiDyfo05JAfYoTg7XxSSK09OFDhc1RgpC6gvZFZfFLzZAm
	/6j8/4rZeg0euGALF5DBSk6oYK6YP//H3fLj3fs+bH70AfW5k7ypQVl4Wpw64/o0i29cekEzzpu
	8eDG1j8K/ZRAsDR9HEzVm4nRmPmKlQs4ALs+YvYfywWK+krtDmbkfJ6cu3spfPiEX6I2fL6FBPb
	xGs0BbKVQ0MNdRWNLRJ7ZfpzwM1UtpQiwlXw4Hx3WY1WkCwBqH60eL6RT8utNT36E1uK18LT729
	n8L7KxOyo2sB7Q2imNF1I/rbHOXTA69fie2fK2yJj3asU8mPpx/aOe3MlNj/GT8LGDfgNcR206Q
	LhzOB8547J2J0=
X-Received: by 2002:a05:7023:d0d:b0:151:2e62:fe8a with SMTP id
 a92af1059eb24-1b543d0cbbemr278336c88.40.1794937731249; Tue, 17 Nov 2026
 09:48:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116224811.3362188-1-tadamsjr@google.com> <1401d9ab-4075-46fd-8a99-ed818762bb1a@acm.org>
In-Reply-To: <1401d9ab-4075-46fd-8a99-ed818762bb1a@acm.org>
From: TJ Adams <tadamsjr@google.com>
Date: Tue, 17 Nov 2026 09:48:39 -0800
X-Gm-Features: AclHuK8DUWVfohtoo3OuXqVpuNGoNl8loZSKlafAOSespKxNsS6LWa7OKmIxN1s
Message-ID: <CAL54JgcvZodLtJkPEgD557RXgJ6_HdaORaHeRGQopOx0ULvm-Q@mail.gmail.com>
Subject: Re: [PATCH] scsi: pm8001: Offset hardware queue index for MSI-X pre-vector
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, John Garry <john.garry@linux.dev>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 3:04 PM Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 11/16/26 2:48 PM, TJ Adams wrote:
> > -     return blk_mq_unique_tag_to_hwq(blk_mq_unique_tag(rq));
> > +     if (pm8001_ha->number_of_intr > 1)
> > +             return blk_mq_unique_tag_to_hwq(blk_mq_unique_tag(rq)) + 1;
>
> If "1" in the above statement is not changed into a symbolic constant,
> it will be very hard for anyone who reads the code of this driver to
> determine where that constant comes from.

Good point, and thanks for the feedback. I'll send an updated v2 patch.

Thanks,
TJ
