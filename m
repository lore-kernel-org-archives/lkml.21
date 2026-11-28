Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795852111;
	b=Eqetu8Ut3PNe8Kt8KrfcCJr5+kwrvdCGjgnEGUpSOxNILynqBCZVeey9LFVNUfgvhZIr
	 mPQcEgIaEdiHGHmHbnXeLsqbUG5qgzSUnZ/rolPt6RkHXMvjRiu0WmDajRt00pxucfrp1
	 FqgqdCW2KjLKnHaPSkxVatR8QF6UGGs8ANZOQhTLjqgQ0iOks65lOpCte5weLkwSE3Ddd
	 UJUN1n4hlmBYyi5WRW6DdhC5u5rG0pxdaJXp3+fN3A61VJNIdKElv2FLv6OIX4ZcuvoJh
	 M70ZLKMpPkIQ8sUoBC7ub0Hwu2EIQQVIyRs/D68755a43fEp9OJuqB71hDlJHN8XPCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
	b=MYxXWlDVNlPcJo8Pp1v6lC+U8Q08X9p1cLVegjgpSMegYe1tF7UWdvj+T/48lIQ7TBHQ
	 9M6m9utMx2GiD9uTecU3QUCiBI5xHeeRZ561xReS229B7UZPJ1T6iLHuJ2EUsIxaH25lj
	 REhQpnB3GmyNNeHoOQ5TTJFp9enc8b820zWpmmIX0hKdIHdJNYkSf2A61JbyPI2JuW8fn
	 JYzGEpM8aa10L2gC6irYrasyonuBcsZGGLT/zOVPkim/9m88HW9OKRX2c3UFxfuyaw8w+
	 STASBujSVWHP2MsvoNJvNlIS2mcOnMw5fYpsQuoDBz74bET9Nb398w8tVBsfm9C/dAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XolEnbUp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29EF60A2618
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29EF60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XolEnbUp
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so3314030a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795852109; cv=none;
        d=google.com; s=arc-20260327;
        b=BpoTycvcTP7ZJzl0jxiya9kUi80M3lcdkPaCy4Cfoy9xyfzuZJz975464tM96xb0Je
         YAR4PPij30ut55f6ZWLAuhdHQwSvNmfFI+E7U2Wqcl8L5ZXQS8Q76V3nEf8vgfQoTkQo
         w+P1WMLH7MZH6F8B9Vmmvybux4bDkdsW5nehYgT1w0mSnLG4BT3WDtc+BsVbVSwTXOb0
         A0z3osHs/B+EutfiGDhzMkb+U2ogUCld5pL5M3rC9Du/mOZKht4LFstwMnuHhD7PsLFc
         wAGJKaw0IAKx+dAKQKJTS3UN/D52RdWOlLCoT7H/g82rJm7C9hTn0f5gQ1N9mekPbxAp
         NZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
        fh=xqXByQQiSIWUcM/dAh3T/Yn4O3a/0dxFLU9CbhGg+SU=;
        b=ZwC5FmMSq0TQqMmygPoE5VaYOnzFzrf305em3IZQmkZr38L3B80BH+/4lUaNbrn+49
         qv/F4LivEjCHKqFWhSC8DX6LOuANSNJDRPPyu3rjiXRhFdySl/VHVoL388ziUChE/jbu
         KnhRmGycS2mEfuPptKBVKjI7eNqVOAOMTbHf0cxqEeBVuN3P//mBb3Dy/pSPM5GWm0p7
         kK6w73PbZOUznvi3ZY3mFgxJqw8jcslsEuZb3CmMPJjsZs0R4Kqdnzn7qRxd6pzEdCIk
         5rDtetAFS35cI7tto6fvfrR9u2OAnhIykT2i7KceOEFHQu0QJl7J0AQNRNRqjODUD4iP
         AjLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852109; x=1796456909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
        b=XolEnbUpEGDNGhRQ0i5jttJVEZ0eyY9lGlgEEjeVgvHuiQWIoK+p7SgKs2icH8vyZ7
         8bUWiyX+8jr6JwUqXcPTs04wo8usD/yW9DrhmChrL97U03LFOwiAj5S7+Eo+UykKnIkM
         RT5vQd2kbukx2uO6cGfeupz6ss3qpAVZa/1sx6Nqz+dHLTiPbPqrWvJ1Fmm+NaWcCLmh
         9zDQkUjWKkUdZsYBrg3P1PvMoWERmMFEhBxs7su3ngogXEqapN6qoRA7SRxbtE0JcqL9
         /JBaQZ1LL3g/nDqDSjf0CPSeOyE3HSQrne/r1twWkawputdrimTMC+1QnAm7kWSXbMue
         gOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852109; x=1796456909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yos7E3GoK2avnR25JKtwuLq94RaI70zJbunfln5iV8s=;
        b=iEyyPzZxx0pCiVZ1yRBl+II0xKFxjk9lPXlnZveYmJ2wg2IJREhiKli4w3vpQLk9jZ
         9u7zjmqL4Wd5/4SrcL8c5kZ1p8A4OK/Pf9884wf8VejtxRxIRjpjih0wRtWdiUNnTaUm
         Wzk5oK/CNANnT9ZaZmd5rpe8tAiYXZqcNuktMzGd9uWFU56EXeKraik+Nx9S5AzWHVs5
         hEICgjJ2pgBZ6YVqxum84Rb/Y33H55c87Jv6LFB9JeJTHZMIA4kBejk/7W7RniY6oiyi
         kgrEURT2sEUG50A7ltHpCB46Uiu1OsSMBMKmB0tZWjJEBh8qOq2hbNRHj6clVeC7FicB
         7i1w==
X-Forwarded-Encrypted: i=1; AL+hErEq4gTt7HHsEidFTO6ZyQEleFcAhdiF9uhXOUOtgglmSTwG3h0r9Y8QR7Ik2lRBnONWmcn4m6oR8cxCtlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xcWylNR4EbV3WWzXyU/P9j/GmmDsMeDrWGB+T96kBQPsWMM7Y
	r/hREZXu1y4EMIALje2SX6nGWZVKVT/zja6lH01FxIIO/qKBF/8WPZrldcYJgzGG7ue1D0ch4ym
	RzYkU3q00OHJe+KT8uWyOHGjbMiuWa3o=
X-Gm-Gg: AZFdTZdPQQaEgdfv59zue6NDLkCuxas3cqm1LY01mWBVXVlDOImrsJ6Dc4+hu8S/WNt
	2vctngkbsLU7vAKYreW3jesmoXzfip5c0yt/Y+JqLRo+TXM958y41IIAqBYwMJviOSDFHFa7Tz9
	Fb02y5k6ETLInroT0sAry0XEG1Atg8/3R4wQUUvzDuUmA5QawCrmEM3l1uyGg0GvEqQfsAL76xC
	jlr5NdObNIZpCX9b7TfjQsDXcGmQDvzgOLubTa9XOR75RjLUteGs4zaAo/HO+PSro0nbUPy9C7W
	VRkP8dvaNAgFBV28+RU0nCpiMOLJU1aMKxc6K7F9M8jaU5Qlrt2RzIk0+r1SNXTaaBpnUr+hvg4
	oD2CP5HsUknvi8hGBJ9uvW+Ik6fdotkMmDKESaZC/i6D7JBOk016Tnch+PdjrKmM8pw==
X-Received: by 2002:a05:6402:42c2:b0:6ba:9142:da2a with SMTP id
 4fb4d7f45d1cf-6ba9142db1emr15404788a12.21.1795852108854; Fri, 27 Nov 2026
 23:48:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
 <CA+m4KrDa-5MGYF1c_zAzY-ZKM2oJTdP8p7u1D0AXGi1smKNHPw@mail.gmail.com>
In-Reply-To: <CA+m4KrDa-5MGYF1c_zAzY-ZKM2oJTdP8p7u1D0AXGi1smKNHPw@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Nov 2026 15:47:40 +0800
X-Gm-Features: Aa3M54r6lKClANqidOrNI6R44bh0oBv1RuBHpbZYK3mQkRLkMIUiWIncX0Lcey0
Message-ID: <CAH2e8h7mt1MOKWk=oRskBZMBjt9TNx-JOwVv=inK8sTPrdL1xg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] platform: arm64: huawei-gaokun-ec: Reject short
 I2C transfers
To: Lee Youngjoon <getfeus@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:06=E2=80=AFPM Lee Youngjoon <getfeus@gmail.com> w=
rote:
>
> gaokun_ec_request() issues a write followed by a read. If
> i2c_transfer() completes zero messages, the helper logs a transfer
> error but returns zero to its caller. If it completes just the write,
> the helper returns one without having received a firmware status byte.
>
> Return -EIO for a non-negative short count. Preserve the adapter's
> negative errno, the EC status on a complete transfer, and the delay
> before releasing the transaction lock.
>
> Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver=
")
> Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
> ---
>  drivers/platform/arm64/huawei-gaokun-ec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
> b/drivers/platform/arm64/huawei-gaokun-ec.c
> index ac21f732d..abf05e7ec 100644
> --- a/drivers/platform/arm64/huawei-gaokun-ec.c
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -145,6 +145,8 @@ static int gaokun_ec_request(struct gaokun_ec *ec,
> const u8 *req,
>         ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>         if (ret !=3D ARRAY_SIZE(msgs)) {
>                 dev_err(&client->dev, "I2C transfer error %d\n", ret);
> +               if (ret >=3D 0)
> +                       ret =3D -EIO;
>                 goto out_after_break;
>         }
>
>

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

BTW. You don't need to quote the first message, i.e. the cover letter.

Best wishes,
Pengyu


>
> On Thu, 26 Nov 2026 02:06:16 -0500, Lee Youngjoon <getfeus@gmail.com> wro=
te:
> > Hi,
> >
> > These two independent fixes address the host side of the Huawei MateBoo=
k
> > E Go EC protocol. A short I2C transfer can be reported as success, and
> > the normal no-port-update case evaluates a negative shift before sendin=
g
> > its acknowledgement. Both issues are present in the pdx86 fixes tree.
> >
> > For patch 1, a host-side test fed the actual request helper adapter
> > returns of 0, 1, -EREMOTEIO and 2. The first two now return -EIO.
> > A complete transfer still returns the EC status byte, including a
> > nonzero status. For patch 2, UBSan reproduced the negative shift on
> > the base commit. With the fix, -1 sends a zero mask; ports 0 through 7
> > set their respective bits, and out-of-range indices return -EINVAL
> > without a transfer. Both patches were built individually and together
> > as an arm64 Image and EC module.
> >
> > For reviewers interested in firmware inputs, the PAN write can also be
> > checked with a fixed cable configuration on a Gaokun. In an earlier
> > instrumented run, the left charger was online and the right port empty.
> > After a normal left ACK, D3 still reported update mask 01 and port
> > records 05/00 and 02/00. A test-only driver hook rechecked D3 and pendi=
ng
> > work, then issued one empty PAN ACK while both ports were left untouche=
d.
> > The I2C trace captured the following exchange:
> >
> >     host -> EC    03 d2 01 00
> >     EC -> host    00 44
> >     D3 payload    02 01 05 00 02 00 40  (before, after, +2 s, +5 s)
> >
> > This observation documents the existing empty ACK encoding. The EC
> > accepted the command and the update mask stayed set. The series preserv=
es
> > that input and makes no change to firmware recovery or hotplug policy.
> > The host-side cases above can be exercised without a board by stubbing
> > i2c_transfer() and recording the request bytes and return code.
> >
> > OpenAI Codex assisted with source inspection, the fixes, regression
> > tests and drafting this series.
> >
> > Thanks,
> > Lee Youngjoon
> >
> > Lee Youngjoon (2):
> >   platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
> >   platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index
> >
> >  drivers/platform/arm64/huawei-gaokun-ec.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
