Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795803529;
	b=EW2mlT/kqykq0NbcTliPtmTJtjgdalgj0N0lDqNlEOCL3mIb3QYwhAawVyoUVEr/5Myi
	 rYLOZ7f7zZ3DOzKOETskbbSsjKkmtC2dAnRPaDbNq3bMHmdPhb/52GpdqKam548K05FU5
	 FQA3HQgaxmFfwca58luwEUPJNxulQqHMn+k9cjVd0x7ltEOVde1Pl3rslH3tlAYwB1qRs
	 9ZnfrQHXsrfSBcGN2sLH6WYYM6IhKqslSly/eLaqf1IwKfFlZeTrnh3LMZL7q7tYympof
	 AWb7KWUBMFZX/gPNVZ5Q8eEfWnb4T3OPnQINhQqw5ReL9iLBTjr66aBApsLC44p9Rvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CnX7HINTr588U0bg9W4nQOssNhFb49IVZppErEdXcp8=;
	b=pPdsLygne4WoWPpbyBwH+0gUCB4yNxdOdV7fHdZj2wGl8C6HN0F+OtNNWw4Z1mQ3FBBB
	 dq8HQyjHb1kC4K9XEgS5ELBSRUOQyvxbJ2HSpooXBbDgbPj62APQK1G9Z07ozOBEiX4TJ
	 V63A5cLhhL+wDg1/x7stQQdmlXm4yXI2P3B1jgzlYo7eEZYGA9wT8ziV6rD18S2CqNQpQ
	 GxdxdkGJ+gn+99Y5FMs0kzO98UMeR9dV9RX4S8nFffaJAV48jBRr+bjsWn4vBwVq4Wtkc
	 o7ZQd0Kzb7rrWoHbVaILnykfkxUuTQj0wL9sCj4pu6xv1yw5RPwjh7rvl7/cpbBUPpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftII0uZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC6606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACC6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftII0uZv
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-92123f02faeso87647536d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:18:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795803528; cv=none;
        d=google.com; s=arc-20260327;
        b=aIAlje0sMyJWQzh3T6rfoPtGrJq2fZy2Szgoas36azudTUwWrwYvGeqR1k7PLQRrb3
         pCghpz1vkX7eHhzkY0ouox8JIfHCwpiHNd6wFyhgbu9dfINtpZu1K2bEl4Q61sncHDeO
         /natjcupLiHIgpxzCcLWhTEgCmgDPr1b85bVEbvN6ovpmGQGikMxkYgvEWri2xZ2jsqQ
         X/E/ZuK/E8Hl5yuShDlkzucuqh1qCrU32dUkoeTS1cnaZldrD0JlN20YTY9rkrxnyfAl
         KLwCuXdlX0ri4jRo6BA1WU5pXTPCt26cA+WxnBLwHYMC5j4504zj31ihyJ2haMzr9Byp
         WLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CnX7HINTr588U0bg9W4nQOssNhFb49IVZppErEdXcp8=;
        fh=Xd7nSXrQFvdIAw0HCbH9cvy2lFSJcGWE6FwxJ5Rzkbc=;
        b=jCSwrQQLSz+SV77Bab60ZOOX1v0R5Qyi6ldER5jhTj/mHUFeDPcqcMPUPBb/w9Cpj5
         RMJa9aXokSiuDmxe1eNIW19Xy5meqyCqD3fnmpNiTZ5iC1CPfa+XvVtCduCjoUhNJsFr
         9KDp3BGgskKUeMeHwmEgSLR3dlzG7DgEFMKj3uHgBcKI/MwOac8d+xuB77UjVE7sk/zK
         i2kwRtN7CF5+KpS68TZkxFaWbzTuPXTOjzmC5YzyfTXT5QKZKAWdn5yasa3LdBMyZx1I
         6Heqbvl26wVGBwKEbp3u/DNpbY1A/rNd1HMB9s2bJBhZqKJuU5sOcgQU6qwMsstAR+Np
         Ij8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803528; x=1796408328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnX7HINTr588U0bg9W4nQOssNhFb49IVZppErEdXcp8=;
        b=ftII0uZvL4qz8CEV4FYd3uFfw7yYEmkDAmIILC3TzCPzP+i5Cc9V+9BUYy5xYOipNI
         14txHmg0ix4e+Jp2iJtCgue2/t8a/NkQkqvZVOaVZG6daSfKypA94/Z7JgU5UsXfON3G
         nQGn6NR5qgxeqmIus5/uRt1vJj1caPeMfX7HRwnt/K1wAbUNblRivOsDyg4uTQcO/BWq
         eN8gLVONRHG7hjosv7QuESlg0Y1CDXoM8Js7cHuVcYJPUpNmcWr1AmGOl3klrbvvSkDN
         brjnQ4f9hxaMuIqf+4QSAaARLORg1L+CKN46Z+aDPqX9DaJBY9E2vLIIYUAaTRkFpSh+
         /nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803528; x=1796408328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnX7HINTr588U0bg9W4nQOssNhFb49IVZppErEdXcp8=;
        b=wa2OntZDyqocmhVBf3vHHr75Tp7O4I2h2JsZoJL09BnvPKHqZSBq/e1fG/zvVhFBGt
         SeOet8FNSkS5QsdQS/tcPeHd8oeXccRE4Cy5t5fgrcfgiWU/8TCBc9uE78RA/JqXMmIF
         5VGJzfQIftDidN8ovrNF7A4mTm7xNpyrq/gWent9GChzhjPmMpLkTpCeq9OuhKWLBLMa
         HWpQh13Qp4U5zKhTkRPyb+SLwXOaD9ajkva3Xzz/ImXqBeVnlUTa5xkSlfzelUi+D9b7
         6xvXtCbuLBGtXp2nfWMDX+/0U9NBaV2zSq4/XsD35he0mdrXubbpTAJC3UdkSQhaFJ6w
         Mz7A==
X-Forwarded-Encrypted: i=1; AL+hErGWTt/i2LTAEvnUtqLYcfJDjCimSgzH+5JC/c5EYtulP20n9eS01jgCulEoq41BFAj+O22nY5CfOOoXQc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e2uKvrjVDPls0XX5X+4ldBI+XSiwAUvMauOx5VG/cPYC7Vtku
	HeOEMmqWF9kcS52F7WZQnEYbSStHrvHLulOr4t0sYNw7S35ez71zAuEpdgh4QZYIrAqM6qdHG0H
	tqhZfozPpK/DpfvyTnJZl1h7Xq6vFJlk=
X-Gm-Gg: AZFdTZdu+eagICjzz9BopTmtD4BJzzrcMJRbr7pYM5Qb11pPomUNnt8S2P7EPg24L7M
	QPA9vn7pC3VS6lH8sSafurE4ePgyfYaXZ5g9ndOaO2kwAdu8Kly7SOsVUlJhisSUgwIkyNYYTr3
	nqGQ5TUbm3JYldTBTfzvhyS8T4CFTgYEL2FGd8f4cfDxU7QUSjkO9IyykgxOOyF4+zt5vVKNetr
	N9fQvvzqkLur0PPTf54f3ODl/5HtIiHy1kbBzBtrE2htWCvMm1ZlhgpNSzjdipUcCjOl5zrIEqR
	m1ACurPxt8ljg3c+7Uslgg+925Me0z6pZvIGfHXGhod6F+1Y8A5JJJ9nrzBY9vmuEsv2AgtmjLV
	B3MI0Q19qw962S1nRJwN1FFk3+8mGMmGH3AOO
X-Received: by 2002:a05:6214:8605:b0:91f:808:3ca3 with SMTP id
 6a1803df08f44-9213497c81fmr482391956d6.1.1795803527693; Fri, 27 Nov 2026
 10:18:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126214756.39027-1-artem122novak@gmail.com> <awk74XffmMjYTJ2j@ryzen>
In-Reply-To: <awk74XffmMjYTJ2j@ryzen>
From: Artem Novak <artem122novak@gmail.com>
Date: Fri, 27 Nov 2026 12:18:36 -0600
X-Gm-Features: Aa3M54oZ8HUGbd8-fH22ZUEZRMgFxjOe_Amsq0wahO5RnRYzQOIFu-_S1bcSZv8
Message-ID: <CAPufuhYk8dZP6JOgmhqDOa1JXpY5w-GCLnPkeLe_+brxNb9utA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ata: add missing newlines to error messages
To: Niklas Cassel <cassel@kernel.org>
Cc: dlemoal@kernel.org, linus.walleij@linaro.org, viresh.kumar@linaro.org, 
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Niklas,

On Fri, Nov 27, 2026 at 2:14=E2=80=AFAM Niklas Cassel <cassel@kernel.org> w=
rote:
>
> This series does not apply.
>
> Please base it on:
> https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git/log/?h=
=3Dfor-next
>
> or linux-next.
>

I've rebased the series onto libata for-next for v4.
Thanks.

Artem

>
> Hello Artem,
>
> On Thu, Nov 26, 2026 at 03:47:52PM -0600, Artem Novak wrote:
> > This series adds missing trailing newlines to error and warning message=
s
> > in four ATA drivers.
> >
> > The changes are formatting-only and do not alter driver behaviour.
> >
> > Changes in v3:
> > - Carry Damien's Reviewed-by tag on all four patches; it was
> >   inadvertently included only on the sata_dwc_460ex patch in v2.
> >
> > Changes in v2:
> > - Fix an additional missing newline in sata_dwc_error_intr(), as pointe=
d
> >   out by Damien Le Moal.
> > - Add Damien's Reviewed-by tag to the sata_dwc_460ex patch.
> >
> > Artem Novak (4):
> >   ata: pata_arasan_cf: add missing newline to warning
> >   ata: pata_pxa: add missing newline to DMA warning
> >   ata: sata_dwc_460ex: add missing newlines to error messages
> >   ata: sata_gemini: add missing newlines to error messages
> >
> >  drivers/ata/pata_arasan_cf.c |  2 +-
> >  drivers/ata/pata_pxa.c       |  2 +-
> >  drivers/ata/sata_dwc_460ex.c | 10 +++++-----
> >  drivers/ata/sata_gemini.c    |  4 ++--
> >  4 files changed, 9 insertions(+), 9 deletions(-)

>
> Kind regards,
> Niklas
