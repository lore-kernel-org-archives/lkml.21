Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795852541;
	b=PRRqPRyz4W9BmnnlmCG7/lelQFJzX8qlXTfCAzpEVGWJqyBmKUTQTJoGhyOZyJ3raSkS
	 R99y2eOwrbq9jBlX71fT2FXO1IghP+t+NBobK8byL3kXDcySSoO0yzrgSaKqpYbsaqXfN
	 NFBaPsRsa4VJsXcipO37+NNMdfADP/qlcVmpeis1l9Lp5N4phOQJaDzM96SahcKgKn0GG
	 fAhOn3N9A2pX6DPlgScASZKMNlnVa7G0dbVTnZ6KqTDWtwwUfc1vPyaSVkciOpIZfGoY0
	 qNPVEGWYUEpYQBosLbjCGhBv7/OEUsBEx4yk5Vhq9fhbc1nM7wqAyByQg9Dm+4js/oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
	b=CUI0uQPa9h/rBXMZYJTK/Tl9WrvI36BjbMi997bXZ8nz5DSmMyilXQMwbpdqhH89UVo9
	 xSeaYFdE2B4n/irv3XqYAcjvS0jcPbIKpjeUYUG1IeaJ7LxYieruayR5G0Zv9TaPdn5Qc
	 0lZSLH6j7VTNG7D2vsHcL01sv+wr8uDda1Fpxhkmk3U81qq1Tdes7A/3Oa/lOyGIxl3Q9
	 2ktuqgkAMPxPx10mc1I5nJnIiSKzfrQAqqB963dJgNXplyVYBHMpNQ+wVS/i+9bLR9Cjh
	 w717U3fl0eHUC8iYCcnrxg1u8iNGIruKOMkXArZmGS8VvUZUsIYqQVNwrFizumcb7FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6yIzSZs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72D606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A72D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6yIzSZs
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386bd881d39so10719299eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795852540; cv=none;
        d=google.com; s=arc-20260327;
        b=qqXXWr2kUWyshOE/XUndrmdT8tjWQH5AM5gv9d159jYyoJY7mQdjxpa0RpudrhrdS0
         t3MRKxh/JbLTaOLjWoIvT85I9H3fZPH3Tw/wvWGktG66G2WBGiV3WcTVo5XQ3SZfdU2u
         RYugDtRzihcsIzYilMrBhBCNy080ae9Yjml0CKR1NENnoHoMESCoVCxRHVEC/eOP4Y6T
         6eJ5at5/UIpcLWU0hZCGDy4wPZaCKCciI+NRoaUs78YVXXk4Nq+nYFpryfGZWbyLkfEu
         xxhlnaC+oQ9XDZFFeFce0EYQUPD2nAfS1bNi2RfIDWJASTIRczBZXQ21Gv7YiRb1Dfcr
         XDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        fh=gc5Ac4k4qcKHVcu78hmnVWQVVlVAoom8gnYdNF1mV00=;
        b=PZeRkTVHvBxCAmtbKxlumIswp139jmaXCP9ziSJX2QC9JtjbkfQ9ln1F4T4b65Pq8O
         1XXNKmt6KTAyCiKOhG9ubZVMWy1cPGlQ2Gjbu1KQM6dUeuQDreYBMbeh4mpHdBQ5rW0d
         YSSOUVo66e8stXeggt8EUaiXzYipT5NRadoTqhYEcwo+LHkIaW23wNvs8C6I32SsudSG
         rs5FsriJlWDeQI8khSaaVJqp+flVg+snt3rkptf0ypgtiWSs9SUrYpVnnX7n15OcKN2R
         EyMxHEUAIFrVeM8VQuRzcTvCpfTu1tGNpzvIlVgAPCtcvYrzbjFu2DOKVxvMMrnA39jU
         zJpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852540; x=1796457340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        b=k6yIzSZs5j871Tsu5ramhiBI44Cs9MQpJNNP/7T39kC7FHeV4ALzXTvmxPLe2094IS
         gSqrGZ0StYjayUUhLEIdrbivQXsIXuZwwDpBpvAAZbyeCrhoy31Krv9sCFHQU1XFvrNP
         YllgAeW9zRDGHhDUw8ZzH7690ziZrOT6m6z9lP7NlaNkqZJEZw8au3ItXPqF04A5TL93
         TjZ2t9qA8+d++ma1/RMqzi1CZvqeHIKvMqmbmsKE9Gxu5oXan58VoDrgjZs8aznrjrMD
         iT1m+65866llFivUiI7RuN+RVp/gaHIxt5ydA0QOmIQXPF0HJhmVpy9m13GYKUAGJEwl
         x2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852540; x=1796457340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        b=tgdv8Jfz5Wkm3xvxO+Qdpt2mpd+zgghbCcDFULdTHwfD3tGNKAx5KEobgMYJZg1CPF
         X76JbXhLcNZXC3QhLLSiDVRWEcbaG9Rn07Rm72Z9rByxf7Z9uaGAYC6kpOMLAtWbUZC8
         fO+yDBWCI0p1r+w6QfDUoeVjhT/oN3iFR9eggesrCZ3PCaPOaYqYg0ShNr5FE3pgspZQ
         QzWSrqYg9r+fYqcJK4HBb0spyyrkuVollIBLiFlDU22VUeVZJXREbqiIAnbZTXG77053
         dHM+9iarCwU2PNahEmtlmPWacG65kwexffpDCS3dUVMX+PxSRLkFdEWPXznkyIRUHLYV
         sDrg==
X-Forwarded-Encrypted: i=1; AL+hErGg0/LwbNy5uaZHRBRfAEdO2iHVSRoTTRQruPr/bSZ7BUzlmeqZnoGmnTgbMNW8THa1xmNB+Q73jZto4jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z96uY43hW/vA5qzXlJSvrcOFJv8DQFASoLNxTX3l3sDREN05eAy
	NgcI104NmefLniZWHNpR1ZtqKYDPClp+oG6n8dunzMYTzPeb5k2PzV/onWoDAke5DPRt41c7oJJ
	gHVZmAyLtC/VGhNrcxJOibZhUva0s240=
X-Gm-Gg: AZFdTZcZbmktCDDYU0qMfqmuEHyxtdp4bkB8vZ/AiiXFYxbsRMUn64pLn+KjzuJczXa
	IObrzAZpBN2vZtUGepSYxNSK4Vj/YUWk9Zvn59tN+LjD7qxt7P0h9YWn8FNEajtAFbY2kPyiYKL
	F+2LKJB0D1vGqIcyO36TYc0PLfIG6vlHgkdSEj1foAal0uWSxDp+31OoNRILI4tDUZd0v9bT7nw
	hP/foX4cRwMVwPucLfLRzeooDc2KdY4KKHHRGXtioGTvYJ7MC7L2q67r/2f0tnQgMjiFUV7d+mm
	37iHkQIOSiXFWNo2oL2VnMxkRQ0u9+ExbNX+qyMP2wMJERx4LtUsE8IeL30XSdqZVgaS+Hf1bZs
	Cm9rmXTyfsUQeKIcJv7+3xohSsh4A7oAHTPF1CAhHr5uDFT5UPdg5UUj1HI2SwjY62JV+h0d0Lh
	EYs0S3mKIAXEzr3OgAtJtv7Z7Ecbq+Rh6J8bpFrA5ChkS+8s64RILb
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id
 5a478bee46e88-386a0c0757fmr23973057eec.20.1795852540349; Fri, 27 Nov 2026
 23:55:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
 <CAPVz0n1xeNP=rv3qDMG06aSWRLTVvCfuo5tFyt9fz7KDTySV0A@mail.gmail.com> <kaWzD58LSXePk8E_XcD28g@nvidia.com>
In-Reply-To: <kaWzD58LSXePk8E_XcD28g@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 28 Nov 2026 09:55:28 +0200
X-Gm-Features: Aa3M54oteGux7ycBFDqaQLj_8yYFVhcMiRkeiuuEM4I0oXp7dJIyrqrkoXPQNzA
Message-ID: <CAPVz0n2S=LVqgXdQsFX-A3q92YNpEu-S_NWm5Sf1uYJexEEkhQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:2=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:41=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:21 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote=
:
> > > > > Parameterize configuration based on bus flags passed from the bri=
dge or
> > > > > panel. The list of supported flags includes now pixel clock polar=
ity,
> > > > > display enable (DE) polarity, and data alignment.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > ...
> > > > > +     /* configure DATA order and alignment */
> > > > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > > > +
> > > > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > > > +     else
> > > > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> > > >
> > > > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to che=
ck
> > > > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB=
/MSB
> > > > bit ordering in a classical way, instead:
> > > >
> > > >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> > > >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> > > >               R[7:2], G[7:2], B[7:2]};
> > > >
> > > >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> > > >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> > > >
> > > > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > > > panels depending on the layout. So the correct value depends on how=
 the
> > > > panel is wired to the SoC on the board. Hence, I think we should
> > > > describe this with a new property in device tree under rgb/dbi or
> > > > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > > > document that this means the above kind of wiring - not all RGB888
> > > > panels use it.
> > > >
> > >
> > > Ugh, why is this so confusing...
> > >
> >
> > Using 'nvidia,rgb888-wiring' may be confusing since as you mentioned
> > not all RGB888 panels use it. I can add 'nvidia,data-alignment' to rgb
> > properties and set 0 to msb (default) and 1 to lsb, or directly set
> > boolean `nvidia,data-alignment-lsb`. Let me know which is preferred.
>
> data-alignment is a very ambiguous name if one isn't deeply familiar
> with the hardware, hence I was thinking something a bit clearer would be
> better.
>
> I agree nvidia,rgb888-wiring isn't the best either, but I'm not sure
> what would be the best choice here, off-hand.
>

'nvidia,disp-data-alignment' to match exact field name it refers to?
'nvidia,rgb888-wiring' is too ambiguous as well.

> >
> > > > > +
> > > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONT=
ROL);
> > > > >
> > > > >       tegra_dc_commit(rgb->dc);
> > > > > --
> > > > > 2.53.0
> > > > >
>
>
>
>
