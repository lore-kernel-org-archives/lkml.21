Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795134421;
	b=somXEObyrZvpsWGD1zh2WZZqra8HrzYd3ZFSRzH4NY26NKSF/zi/wp4FemGlmHnKSrrw
	 u1WCjBkTlRRMy9kHrp2l7l1yRn+T5r9J91CUkpyQ5c8QsFbPpqI8B0aSvxfNb2FeUWHEX
	 eCfjiKLPTzO+AEz9Dnoqm60pipts8ajIIMyTq1VNWzWtlte9pydeWyC2PljyHrxpAwKhz
	 EkDzOFboDv+Ck+w1cFuMi95VJidFXYgSBZASeKgt7HC5q0mh8Pm6xe9ydKWZLlZUSBSYV
	 RKoEM224f3MvKKa8UvJJQIgkm2TQj2XGn+SL7BTn13+/OyWQmUUKrEn9N4uvyte3nKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
	b=IZGgEsq17x91FoLnkIMFx6wuiiUk2DceuCoU2gCiyXGXARqxFS2FgRpbTRzmkOTmSSn/
	 4oyb4ZDfhTk1BquJBwv98zF2OUgzzp+Psm7O7knwBNinxeFyRK3vOamK0FDHRnS/MCz03
	 az4Lxsdf2AQLVbmG0GKnv3nzmyQxgsCiNnhQPiqiUfWYsxf3eNyOFLzILlhddGQMoN71R
	 SVgUwiY88h5kxSkDSUgBzR+TI3XYqDmCndOnPw/IFAZ8xnR5glQcsUdXsH3dSf0onsQAP
	 76lCpd8Z1HCQqFC2zE+DNLcrvne/628tQsm0lbPTh1Ef/QZ4aqKegi17WQjgYYWpTlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlHlNBRL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD91606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlHlNBRL
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db5e13b0cso432559d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:27:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795134420; cv=none;
        d=google.com; s=arc-20260327;
        b=nENTbU8SznQrZVAlF0V4daIjXQYhHTYuPBq3lmUNeR9Ccs0lBbzS2cVKLZGtmyPrk1
         LP5JdZQcFCFEs4Z1C39sEHyVNGdJy21n8OdJMP2x/yOZ1S2ySc/7GfJGD9DejPmSGXY0
         sRKJv70LbfhwXUljRkpimJYJL9oNe5uLzAQ+wYA5njj663NsYaMyAAkNfVrgyTfJQFC1
         tkrrjetdH5aWotwaZ0jq+Iwe2ZUFTsrN+s92nW5207Uxc4ztuLIBOyxxsqd4bq6SrPs5
         WW2qs4SqWuHW/ZiZjCSDz+7EJBe9Nz3o6Jtib1IwcoHAVxP3Zct317DD96gv938nnXzK
         e9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
        fh=6p/Bgq86HQ43iDu2paNZ/ZJ6drGpL4h7YwNtMnFCzNs=;
        b=JpjVfCcAjvkSwTay1x0RFUw2+y3QavkbQvKiIzWYoEWJ8puvCHlILCJm7hNnawsdCb
         hwNUZ61nrXN0aaDVQtM8m9CfnGxuh72Jehpa+HIx1i98GKLlYXWPllwqS4B+ehHLkDEO
         pJvEdZN7osN/NiN4O5uSxNPI8Bu3B6pa0b2ol8uQtyeMg7+qD8g+xAAxd47/bBoRXvSD
         XjQNY2q3zZ4Gpe+5Pu6hp+VvbIqNk1f7kW0Ef2GmqAj1IA5vgfaULqwuAxGWt83H9xHB
         HF0VuOwKgpwBXLBk8nafHOUqO5kET7kRneGtDfRJTxAnCsiSF+O9v19GIar5Abus1+Rm
         r1MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134420; x=1795739220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
        b=KlHlNBRLnkbFIkyiQ4dmD5l2RFLqJtNmjLeuxHpj1TOb2ee2RnbntdxgZUOS7qRia2
         Z1Du+D9vzUBMPZJERe5mbTyxNkcJ3/9wS6aBfdwtP2Uk7LBdC3YCCct8fO/YWGwc3oMJ
         qaRGbJbwNmIl8HOICnk1tzWdc0ucVXEg4oInUi+qS79oBguSq0lU6dBtYaoM0ytC7m7K
         zIV6+IyVgbMxnr8QBP4xST2fozCfU8ujzWrnRvhm2HoEvbuPNk2lexVqSRugvuH4lVdx
         dYOMvIhUMbSRDqxoiLaAI7pvPureGzSOIjFhNw2LXDqxuxctKdTNMP14bClGPSBPDGl4
         67Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134420; x=1795739220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
        b=Ksz9JmTtl8UBF/+8KzTWmr3nSaPj2BG0eoszd0VbwzQK5wiurBULPsumgsiXN1EHtJ
         Ej9tuyMAGIxOe2T2ZUrxU6bF9VwADw5yvR/OAhRts2o8fKgCacAbAbPHlSuuOYKxxpHJ
         Hq8+iLMPpnKoUODxkK2Bsa36hYp530S17Ec35whm5ZPlgysSPpTwkwoE2oDCOzy3cFHm
         A2Cif7/+J+kmhBszEu3S6knuXsv9CqHPtp/8e4CUu34TqGF6EAWaNq5kizSaYSoOssQw
         ngMymrvhd06l3XftSzSzSHxoKOk67HMZzfhcH+MtcbSVSQptvrHDkZq6Q7+2+2D3LRur
         Vnrg==
X-Forwarded-Encrypted: i=1; AL+hErHQzhogJr+LHe7UC7CH1ZPPpfAhWfXiyAT63QUAXi9+k8PH82aql4y+bO+k8Lfxfe80dPG28wj1kG90vY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T8MjLB3/PlPVBuBvYaoOBdh2NhKd5TwL18meQ9XZjRe6rIkD3
	muo6qTxcbULfkbAMgmLl16fSzeJ59uXKVQKulyi30i5qsWSxjq3+sT42eaIStnOo75MEA4V+YAE
	Uk4bQq2GnaZs9zACJzL/AnXrJHOzmtUafEkW3Ucc=
X-Gm-Gg: AZFdTZcWuMhU4eWiZRGr5eMORPBKeVWejI7q+AU58pzfQm46XcNxWEL6HZMOAo4vaoK
	8znUa9LMLYf4uBGqibaVyGD1AAg+hVMWqPRvywnNJQS9JCsPENaEXUeujYV90Vorw71YpIRWIXE
	0D6B1ocRw9ssze41JYAVVqja6yCCDSV4/thKxzmXbNgLUwCxobt4CWSeXX+gYbhPBomeo4+4AR+
	b9VJTUAr4fsB+O5ynDFVOSdw3UlGzYCp/EZx2MNP2DI7HCF6WIA27pL+Ilpj9XlvxcaHK8UBY9x
	Zgm4OyCZdvGmrH/r8rK+exM/EEOLzs+FlGlFKtnA6t62FPs0o1uIzaKlctZ2dhSmGuYWEcbHlvj
	QWdWY6gMItMHb8tVtnc7GJ+idvUws//E7VDu8f64DaMgTqEjKZGlqPGWag/qkXkLrTNVSjQ==
X-Received: by 2002:a05:690e:11c6:b0:67c:4b5:d5ea with SMTP id
 956f58d0204a3-67df40d1b21mr504880d50.0.1795134419928; Thu, 19 Nov 2026
 16:26:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119232935.1708458-1-thiery.louis@gmail.com> <20261120001114.61077-1-brayniac@gmail.com>
In-Reply-To: <20261120001114.61077-1-brayniac@gmail.com>
From: Louis Thiery <thiery.louis@gmail.com>
Date: Thu, 19 Nov 2026 16:26:47 -0800
X-Gm-Features: AclHuK8HpDb3YGyRkewngiL9iq-G_WUfJKYzbVW6WD48cpmbOt2XettliD_eIU8
Message-ID: <CANox1RhDMiP2nQodMyf5KndjymFKCqgXLWRPf4kdwko2ifkCWA@mail.gmail.com>
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to truesize
 for managed frags
To: Brian Martin <brayniac@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	Pavel Begunkov <asml.silence@gmail.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the corroboration, Brian. Been playing around with this for
a few months and missed your report from this morning. Happy to have
the Reported-by, Closes and Tested-by
added.
--Louis


On Thu, Nov 19, 2026 at 4:11=E2=80=AFPM Brian Martin <brayniac@gmail.com> w=
rote:
>
> On Thu, 19 Nov 2026 23:29:35 +0000, Louis Thiery wrote:
> > Only the in-page part of the offset matters for how much memory a
> > fragment ties up, so use offset_in_page().
>
> This is the change suggested in my report earlier today:
>
>   https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sUDV-XJi=
BPd6R3Kuqc-7Q@mail.gmail.com/
>
> I applied this patch to io_uring-7.4 (0659e44ce739) and ran the
> reproducer from that report. With it, SEND_ZC from a registered huge-page
> buffer is charged the same as SEND_ZC without one on every row, for
> hugetlb and THP, including 8192 for a send that crosses a page boundary.
> On the stock kernel the same run shows the overcharge.
>
> Jens, if you apply this, could you add:
>
> Reported-by: Brian Martin <brayniac@gmail.com>
> Closes: https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sU=
DV-XJiBPd6R3Kuqc-7Q@mail.gmail.com/
>
> Tested-by: Brian Martin <brayniac@gmail.com>
