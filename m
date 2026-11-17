Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953721;
	b=357MFxwqbDvvrHMhom6zqEkriDvW2ssPkZs65XMwu7iosNLNAl/jmVMqOd8scvaaZY6u
	 ik9CqkSKrIrtIK7dJuTQqk06FnzkCaD9wEktdikqdMx0RmXO1kZsRJcclE6336W3oPo6G
	 8TKRpFHN01yZs9kVGYr0t2uRMv8n6wfxeYRlx/CBgAqyRi80mnDV64+nCfIQ/CTNuQo5w
	 /zA1fny/YFLWfLm57su0VEgN+kIeKIlafsquHO88xHk5N+rGNhf2US/NMkDgd54BVNsjv
	 jrx3YwWQlvZO1Mf9wPMw8HPu09PsElwipZuKjsfC3FaEknUuwsIpGikPOtOmCkRhWbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
	b=HHK+vGnh+Fi7OOgAWgg+klbhHxOxhQ0CzmgyiTDZxQQaeZz0Z/Glhp2QnY2O19rq5AYP
	 HF/iJkeQ+akA3IV9wAOLscAv+76DW4pAgifAIZUth89gB7k9UF5B7BzNJ4YsOPSO6153+
	 tdlNbbQbfgiySEx4srSPfkb+9LYbU4kpe1KgS/3w2SfRDYQXndrt6IcpZtkfdJMJX08Xc
	 qqZDCcdM/4VFRk5SrPvFplTfxeMstxVFmHUGm+H41OABFT0RxJ4lQbyklnpxz4ZSGYVc/
	 xcHRJyRFo6eu7KFCRncAGY2XwPqQH5cUTd2hXlG6libzrxnFSpx1enEzf75ml4nN7tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bgCGzzDE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C900606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C900606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bgCGzzDE
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55be673e029so30531cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953719; cv=none;
        d=google.com; s=arc-20260327;
        b=qJ5OYTz8jcJBdmuSxLp9URCX/3mD8Fdq/TEvbW+ph0iBfOTvJWdfD8d/yw70c+R+8P
         sOaGWA6vfQqzNrnS5y0gsm+/fDwLPlAwGRUs4rpoWQBzeCdmrmAgIE60V7+awhxdVgsY
         AALJJMJaO9y1DeSk9YBCZFFOqt4M/Il0xMeLXDPg4OVCB9KNBSI7VCado8O3kDSssglw
         T5id2xdiN+nXvcaEOfzQrA6WgQLRiKMFvEDHw9dme4W2tWX9xfvnxWTQHlgyYG6AYj9M
         4hbeKPuhlBprAQXJjzohc7ufNAyr4vSO/37DU/E3DBgGUz9f2VnhDkMXio2+m+P62YWW
         7qkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
        fh=MxoVeJdb+km+ImUzTIGp7rEglQG9IQTR59WXLKe72rE=;
        b=YIUGaHwOU3M1LX+GriUvzy5RUAVtZ7ow72DxtMQ292bXFCaCrzJbfPZ8cud3HJsbbj
         tBCJ5u4HQPqwh2l2VOfE+o6MgB/+WdHnZQxQlfGeYnc9S4gNOMBhYBqI1iE3Jb91I7Nt
         MCHUr0whCEPSw/vlMfhzRPtNyHM5gJBUsYV3A5lWlEroAh6ML0J4gO1EJvWttrPI6pA8
         W9fND9/vGAqOCfG+iD7lprpmCwTyVYc89AcpGAJrdE3n4+rEDG/kRy4T2uTpfa1KqTx4
         4oi9vqYMlRx8hzPRGt6mfdyzP28I1egfeQ4IGtrPFlIA0P5XPbGKsUB+/KkvSlle0zaN
         7NkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953719; x=1795558519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
        b=bgCGzzDEbDMpry8ZT6DPvMWJQ3aAmdRXRLD2kAmUxqSs75qpEvnWAPvNbVV9Jytnf5
         0ItH3/Jpw64PofY6VHAxiz7KscX3E5Z9Oyt2Dny3C3eEOBi9HWiJ7bfsjHplk44cP8R2
         Hert9bqS/SD59I8qExIhIwHhWs7kRAm5nzAxOJ1LPW7RHD4k/dbuxtsh+9fM+wOpeXf7
         dN7O+IF9pjaTDT3IQV15NP124sUBAg/jv8e1fFStwX7+gzlslwXPGn3OVeuJSjax+MKV
         heRmfhYHRg5Th/ozT8jv5/lgJLpxhj6v+Fsv4boWFVw8TSQf44OOiRaZS3zrXSsxfXUY
         bgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953719; x=1795558519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
        b=rV+/wGyDBhSJyoCIMiZBn/+izf4wmgx9lT/XGdOMpAbEvkaPRPKYAIYznEQ9L6ozfe
         nUZovRT8IacG9Rju/dg8UyIfz7DFgkqTsTAD+lUdvOkFCMLmszxNM6mZUfJ/oFU6m7j8
         V1I/IbSs+QvbOP7iqtVR/xfLH1sfnTJHou3xlukNQPFUyLiGUvnw9YLq3rMH7F5TtfRR
         FTZgmwMHe5W2O4zW1ab3aSy/eJF0YIAQScq7I7GEIk/+J3Wm9lb4gvLyeDpCFPGgpWNg
         HnCZrWnF9ilcZrrbolSQYSsFDvrWZjmxmnMYJTRPL7JC5cOv44TPhO/7TJo7F000fZaw
         PS9g==
X-Forwarded-Encrypted: i=1; AL+hErF472PIld1wyD5Rq2bNWihcxN/ANKAyV8gKMUG1Iz0Cbs4WdT88OfwNYv9wjF938CSlAzhGS+nupI+xhTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R2k0cgVyDAmk8rD5xgXsGJqxn8CpjgfMg8GqOaDWmIalByM8E
	X8R7UGJYjhv2mv6khY/TXnZ0vWaYvT5aFoh43EZcshYHXxbKn3JpBP+ZtLAns5DW4Veio7f0tcG
	gAv+YHVXJiwRPtpnMM8EBEGUxdwX18SEnlz2siMOrp20aWwMiwqJuUaGw
X-Gm-Gg: AYBFou21FtyVRmo/zjPiiuAwMVMu5Saokyl6BLRPv0NC6BA9yV0BpT/40ZgfYPqqU+J
	cb612ZuptZMLXzecsN8cUYtRPhdEuyXZSsxIF7lMpF6a+TXgdu8UCB9eW/anGJUAdj7YYKxfvEO
	7KykkTNXb7XWV7s7PqlR63bffCTQjx9JLawUwln8n4pkuJTfDN/Rv6+KVQ0R7Uux7tpU1iqnJHl
	tZbXAM/+yPYJOi0NfJ6RCttQVd9byg3gR1csKwFutgE+c0GjZOTOe/43O7je6Au7HQPK5kHpfaK
	vre4JCacESxknZvvSxpRC5WQw5vCX//NwYa55pGe/z1UHdSfVNNNoHYxnOSBR0PbkDq2RN9jzZH
	V4IijkypfNya4QY3w9mAfBUF3y7Z8entGeSK88QUArj7hhm7r3KTu5Lft9em2KRpOPjA=
X-Received: by 2002:a05:622a:53ca:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-55d5c2e1ce1mr2587961cf.14.1794953718547; Tue, 17 Nov 2026
 14:15:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-3-irogers@google.com> <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
 <CAP-5=fWKo4QwAc2Ozp4ScvDdF4eKj_J3Ba06Sd2af=TwyHJO4A@mail.gmail.com> <20261117-spry-slug-of-completion-0e6548-mkl@pengutronix.de>
In-Reply-To: <20261117-spry-slug-of-completion-0e6548-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 14:15:06 -0800
X-Gm-Features: Aa3M54rWEWrF4lFk0Gw_f3TPKgDTR2wu8ktRfyd89kx5Bm7ak4LAwpvUZRae5VA
Message-ID: <CAP-5=fUKf7631fhmRLjVJXgKG1mm79vC5xSE3ZHm0XZMXo4=4g@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:27=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>
> On 17.11.2026 09:46:55, Ian Rogers wrote:
> > > There was discussion and I learned a lot about the nitty gritty detai=
ls
> > > of compilers, optimization and UB. But the problem is still in the
> > > mainline tree. What can we do about it? Is reverting an option?
> >
> > I see the config option was picked up here:
> > https://lore.kernel.org/lkml/179423891136.2093942.13129678709622655290.=
tip-bot2@tip-bot2/
>
> Doh! Thanks for the pointer.

No worries, sorry for the regression. Have bugs been filed against GCC
and LLVM regarding this?

Thanks,
Ian

> Sorry for the noise,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
