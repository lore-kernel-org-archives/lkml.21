Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476777;
	b=vpHGzQRlq8pmPdPce/V6zC6yXTnWXKSEv2HaK1WcYyGX28M9pm3Os8P5UoUbGBjMu0K5
	 P1dmGdgKRxGOADLTrhJkhdkepn4p+Bzav7JtM4aU7ztvmBo3jmI273cUHSzlVKi2gp8MV
	 wPxSe0H+iXsWsF28X1nBwNWR4svI2GIZjcXnvnTpR4LJzNcxu2t2rK17A7l9CCIvvny4O
	 +5j4cn5r4ZsdCoZONCTSX6J9/IDCS83EcREFz59MnbaTqVmRnDZ5ouPtK/fWCLNbuJfrF
	 o8xvp6Jq3FCU23k16/2l5yStLog6G9nd4a42yqIcC0nYWCH0h1SYccHC+4YMkxuVm/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=802wGgTxL2BIh8nOcoiI7tpdgM6GQQCOpaJq5fEymOY=;
	b=pJtuQVe8u21c7im33X8q61AGMRwihN46+9VzdMFW1DSA1sNHx4lj1dv36g1tyPY/qpOC
	 WrTW9n6Ny66ZOhB5RTaUOUvRnKqL78suA7iOFmGIT77DP1rrkSAD91ep3QoD8n+Y87cwW
	 YtRl3PoMkfEodtSO9kc2w0fyI1841q0m3fjFMU5XJsYzu+3lw+DKA06QiqwPmA0NhFvEG
	 7/vTP6nd9zBrm/QEw3vu9lZ5cwjJfmsiNJL3ve3ddfd1VDOMbICoFw6vbKqWvoiPZgk6C
	 +y22NK6NCURt1CrfVGMID5qlofvN8cgDt1BUCrvCARyC8bNVuYym3v2sflw7HoJlJ+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CBHapCTG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9532D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9532D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CBHapCTG
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ba2a448540so25754a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795476775; cv=none;
        d=google.com; s=arc-20260327;
        b=IJY4pG32z07USActl+rS8yL1N/UwzGKd0sCGN0L4HxKIDPJGMKTHUNsd9ZkOgTC5e0
         7mtNTu1HeA6LxyOORbWHE+yuDPvcF0nAxLWxeVnWshmr3vAheDGXidvVBhiJgL5RXZZu
         slEbr9slbttMgICS2VkMKq6K5WOigyr61S0qb3D3Ea33F3GclvSL7wjASru92u/sgglg
         nKS8hHI99pRE200Dq5hG9j3V8rD8FmFJy+0kIXwsWOjeT5VpDaMgqlj36v1CFl0xDxY/
         21pQ4jAiZrZyO2TddL799Ko+t4i1wZp93QI4otYxltfpdPT2lbdJ/APXRJ69IrY9uQ2n
         Wx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=802wGgTxL2BIh8nOcoiI7tpdgM6GQQCOpaJq5fEymOY=;
        fh=7peGqc66gTBgUoBsDgYY0M0FPRzttmcAYeAvUQkQOek=;
        b=Hugdyyd4yUWVe0WxzcVJvD2lb0He3ERKCfoM2Cp4YnbVwgzeyTxNHC/MHfrvjt1k3P
         rz9S4WrVm/DQ6rQtnwQITezf+iTuaUu5fPNM5aQOUZ6okTSImkvA8KNqL0uDDFjM5924
         /fQtZaUV0SGAaB+UqYJkKG8xXZW4JGz1AxovIrLQBLxMqdi7u2ZMDxhnd/Pwaz/qiCj+
         wbPyOSpTj1EkWD8k8mnf+ZHwkHvMjtTNYZAZ7IauzimdRJei+ssI43vXljKaW4ZzwInC
         rnZPQaoOgucVa/ErG0q9DXqO0W9mI5giP3FKUb3/4CmXYq7gMjBbCItZiBCOqZwaus56
         0h7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795476775; x=1796081575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=802wGgTxL2BIh8nOcoiI7tpdgM6GQQCOpaJq5fEymOY=;
        b=CBHapCTG2hX3533WtKNnFa8FMkGnpuTJ22q43wLteW2fcuRI/dJrp81dblwjFwHfCi
         NEbWfrcyFntI9xrPwhac1SMAe0cQJosjIrcEvwsWeLuaRSctds/0OpeKSvacWr3PXtEb
         uQc2RuDX5dIkJ8EgIVqmJ/z+rQx2L2CyCzWfHsDjuZy1h1zZClhaVNOS596hvUZ1/PXF
         kbzcEh8IWpftxsChdVr3yb0gjN+nTUCAjx9kCpMcmlvnA2t51TZi76e57zOWxfM73kkG
         DRq895f8Q0mpu1TcahnzupaWoOu6nKVOOpESOfleDYkAQpab7YytpDiTcVHKHbfJPS21
         CiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476775; x=1796081575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=802wGgTxL2BIh8nOcoiI7tpdgM6GQQCOpaJq5fEymOY=;
        b=Si3GdNuZjsxFsdSAm6Uttc3WdnueIQcQAkDnlgsZrvv4/ymGcnk+Edsh3imgq+0+py
         w/m8u70UqFo3Q2JtGqtRxLYNYC8/N+Lpcjtj9cHNwxjwgiIgGNh64eHuS/o2qdhtj7xE
         TVWnsYknQJn3erNWYTEbO64JgtAFl71Mpe/fDO3HhB3/hbxaXhRywsSbRMjPal5cZzmG
         iDfro8YSaO9yNHlFCO5jTY035cq6Vd+6BmaJtTKk/7uwXbzdIHPaZbEUwonelOvxN5ON
         VMezE1MTKjYKoZp+dXM5MPtf1nIEKezlyEBB15gdHnF4lLYNHsUIcc0V2kCoB4DA2tBQ
         e+qw==
X-Forwarded-Encrypted: i=1; AL+hErFgsEiACXIea7yXDaht1m1cZbP97NcATTI3ThKbHY2w19PzgWMaHri0HJOVxNRay/HCXs13RMq+6sGrT9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HNgEIqZYblh33xr2r7rG8VDIrYC3mNgTk4t+K2oDFRG1EXN/3
	9we4J485ezAC+bWO6/9qpE1kX/y2q6iCV/llz5Mc920GOz/IcE309FafrpVsTM0uNHkywnz5NCP
	y0OnrBvtZCpxzuPbJzpP6ZsU4rghDQJGf/TMoXtKw
X-Gm-Gg: AZFdTZdMqBliIEJHzjRKIoP0pQiWatVkrzX8cTBwnBrzFJCIv8QXQOZSo67YmxxNuSL
	hubEM1G4QKyMF1BuoCoW4mNGyKRG7C8VL8qyq+Pfu15COE5mt7K6n5uVv8/rdB3Cvb/fDlB6yIn
	dQBxFgk1BoP9DLTfAvmFoa1p7CUKiIdpxSG+0puWbD/z4poiJ08A7gpZw1Hc86kc8ApKq45AJ/x
	buvmFpYc4/SsGkPXUV8ElQt3EtqAK+8yzWlzZBWzrjdKupyaDYmX7MbH+HHMYmBwssHUjzJAy+p
	PwvwoibUlsxyJnJTj8T+eOe4bGxJPmpqvkXsLuL3BqI+AzhKdiG6JUeUZeoFrPPr2Ms/glFerBN
	Jdfl4dlMoLmHw/KezMgiFBCipE8MvW3XHts+wcjIizEDMVD4X4E8VIRKBAu+rwsysW9o70ms=
X-Received: by 2002:a05:6402:22ed:b0:6b5:76b2:5e18 with SMTP id
 4fb4d7f45d1cf-6ba65a9f076mr182571a12.2.1795476774480; Mon, 23 Nov 2026
 15:32:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117004729.635562-1-chullee@google.com> <f63d7506b930b710d9a31f082b97a0e43e75dd50.camel@mediatek.com>
In-Reply-To: <f63d7506b930b710d9a31f082b97a0e43e75dd50.camel@mediatek.com>
From: Daniel Lee <chullee@google.com>
Date: Mon, 23 Nov 2026 15:32:42 -0800
X-Gm-Features: Aa3M54pn56r9mXNCvyoeX_4soS_y6FexQolLXrCQ0zk6fXKqY8UPUUoF3DopNSc
Message-ID: <CALBjLoAtLCcQJ2TQD4uuTJR-eiD1Dqr+Q2oV1+8K4pnOKRuOvw@mail.gmail.com>
Subject: Re: [PATCH v4] ufs: sysfs: Add WB partial flush mode support
To: Peter Wang <peter.wang@mediatek.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	alim.akhtar@samsung.com, avri.altman@sandisk.com, bvanassche@acm.org, 
	tanghuan@vivo.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

ufshcd_is_wb_attrs() determines whether a query request sets INDEX via
ufshcd_wb_get_query_index(hba) or leaves it as 0.

Per JESD220G Table 14.28, 0x42, 0x43, and 0x44 (along with 0x3F) are
Type "D" (device-level) attributes and must use INDEX =3D 0, even in
LU-dedicated WB mode. Only 0x1C-0x1F, 0x40-0x41, and 0x45-0x46 are
"A/LU/0 or D" (Note 15) and use ufshcd_wb_get_query_index(hba).

This was updated in v4 per Bart's review [1].

[1] https://lore.kernel.org/linux-scsi/9d58cbf3-e0cc-41b8-8958-df8abd505524=
@acm.org/

Thanks,
Daniel


On Thu, Nov 19, 2026 at 1:59=E2=80=AFAM Peter Wang <peter.wang@mediatek.com=
> wrote:
>
> On Mon, 2026-11-16 at 17:47 -0700, Daniel Lee wrote:
> > @@ -1672,8 +1753,29 @@ static DEVICE_ATTR_RW(max_number_of_rtt);
> >
> >  static inline bool ufshcd_is_wb_attrs(enum attr_idn idn)
> >  {
> > -     return idn >=3D QUERY_ATTR_IDN_WB_FLUSH_STATUS &&
> > -             idn <=3D QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE;
> > +     return (idn >=3D QUERY_ATTR_IDN_WB_FLUSH_STATUS &&
> > +             idn <=3D QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE) ||
> > +            idn =3D=3D QUERY_ATTR_IDN_MAX_FIFO_SIZE_WB_PFM ||
> > +            idn =3D=3D QUERY_ATTR_IDN_CURRENT_FIFO_SIZE_WB_PFM ||
> > +            idn =3D=3D QUERY_ATTR_IDN_PINNED_WB_SIZE ||
> > +            idn =3D=3D QUERY_ATTR_IDN_NON_PINNED_WB_MIN_SIZE;
> > +}
>
> Hi Daniel,
>
> May I know why the ones below are not included?
> QUERY_ATTR_IDN_PINNED_WB_CURRENT_SIZE =3D 0x42
> QUERY_ATTR_IDN_PINNED_WB_AVAIL_PERC =3D 0x43
> QUERY_ATTR_IDN_PINNED_WB_CUMULATIVE_WS =3D 0x44
>
> Thanks
> Peter
>
