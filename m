Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787403;
	b=VhAo3eMDS+IzWEmEf57q/vtlPU/thKvplXPz1zjepvZYG6OYOsvMoRLaGoPnUTP6oQD4
	 BTbFW2KWd7Pes7s3bIwXoYGmg+T8691r7lAaz6zBnt3HxGqiXdoVQO28EZ2/r0LWmoSq7
	 CvoV33GI0G8quj+guozv2A8ifJB7e1PcgVSDUEVWN1i73CYrxKxWl2N6SKRxaF6Uj/fIf
	 wCg9Wy7HyUO+ZOVCVbPT9VjpF9BGDURPns7d9ymO5BO/81HocFzTiTHWlXqmtVXk9HTTp
	 wYP/S61bpDyDvT4gGII+2EZ1KwjYZUlsh9EWmdqQhbZyIkA1NA7u8i+l4uTDSHHiE6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
	b=m1ESiIWiwXtqD2h/U9HFQgQHzLHlM2IJtjaOTEosQ2aeL40Dh4v1fFk3CtsGTWrG6/7B
	 edNZsj+nRz1IeXij5xTNG3VjnU/I9xu0+j/Crj9Q0GUcyFVwmWZ5VuBiLkEyIxvGpJP2O
	 Cl3mhz4RFQDZECNq7Ej3n4m+E4AVzQ9J/6PD1izKBxMxOZGa3l/PeVSfRAaeVB7dMRH8h
	 VOFTbgUkLUaBfT0tM/3YX798IC0lqY9MXk7AXfK4PODO6/Zatn+OmDwcuSLfy9UntvpHn
	 kt4NdM/J5/U+XAnw4jVtaR/JQvVE63+Zl7IkfvZaS6Mlwcv85QmtK9BbiEMIsKmfHyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEeJGHVH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3AB606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3AB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEeJGHVH
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso58438371fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795787401; cv=none;
        d=google.com; s=arc-20260327;
        b=bz6sw7M8zQi5fpByCnftn+8gRZ3SfR2qXHp/x0iziGDsp83Z3a4k83FnnGWuoiebzn
         0t46ZRUWndA4nyJRRfwfNBdn02ombD1U26U0X+pNcgQexgEBcF4s02UD6kjytfDQR4ih
         Fwod4TfMQZioJ7Z4k4FYXkIUGRwclwzHnm5M58jiXzpUIJs18n65JxT3Wx5zhaErjkMT
         eCsy5eg+SxKF3Pgn6sxAfz33ngtlHMER0RmeVYIGOE0W6Rqmqty+MQDueMHa6ygW/qXY
         Q1cXhMSD0Dk03Yxc5GoH3LnnzE4z6qMoeH6rpyiWFJyscpeRkUFY9UXcqP4ihOrAqwc2
         kEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        fh=IOQTFywAYscz8YnjmAYWJSuEghmBcUkKtrG6m6BrhKc=;
        b=Mn6PFeajfVfcDI0AFz/MGvQP57xzlimbw7CTPvTleMxawCxDCoonvscDS1kOOHY7yK
         qE+3WnUdHhy3QhuF4DP50jO6yy9Qb/V1hzKYTrBh33NAHvDSNDX83hhQ/Fa+KHdMwaf0
         bTDH0naPLGBF5M8oxK9FWFFXnvpo5ATcjQE3THIuZ3KAZnVkn9QEFwS2fx8ysKAbrDOZ
         RnRqdF0H8yt76V4kunq5BUu0XyUDnwgIwwYs3n2Y6wyVh7+mBVvnjuYjFexr1djT7I4z
         sL5cd0rpB+fk4oRJx7FcXZXrpzlxNVKYAqmwJFMce3NoVXsErTV5KwPGTA+Te1mIkfKf
         K6Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787401; x=1796392201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        b=lEeJGHVHehQkDw5MC7zJtSUaXXPlVVQ2pYqVaXLag6CFCjgoqsgWiajg7qoDprouuv
         ODxiHNZjov+QcD1i/SGwCsTIxdsB1pV85HyqTcT3/Cm5fuI9IbMS4CDowk0CR0ie6P/e
         3o6TYFXF/WxXOHFfhpdd0gpMwY3WzTKjdBldo+0MSMWILg8M8eacgE9VS/aP2PohV2nC
         nvZPtvxwJFJKhC3qwc9+jRpLIK7Pewm/CQuLVOuDnRIaOVZCGPodFmjgmF4JIYGj7M97
         B7iX1bSflHUJIRzingrPKi0HoGU1njcl+wD5A1uSISgQhcizlrpUcFWRZpohuEDyEryG
         hzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787401; x=1796392201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        b=VPT7ag+a1GpO9FBvn72F+vr0QR5GKlx0mbFtKn/e8zalvJSQNWWQzL9AXy0jEKEeyu
         toHFQxLx/r0b4c5jQQlI15V/0UWUXPH866mhV6OnbMVyN4tnqfdfZ464AV28E+Oiz+OB
         UponXjO4ZH9upSdkT6Wqpx8mlmYrg6G4/n0X+PLUnfMtcbwdZzA3gLvEqvQBY3cFFegW
         S0o5GKMwcgqxj9tIuefmXSYswsE5vH6g+8k8TVgwLUFHytsUv8gJy48pVd2UUKu04A3V
         b6EL1gNrhrFuVB3lq2XEWeSLObysN0s01W/teEpMrpdIgzTv+I6fVJWfjq7GhAuzvTRc
         RhGg==
X-Forwarded-Encrypted: i=1; AL+hErFdrIrR3dgZjCOb68drw81sUhHV4099BKJpsOPGJQMOe71/4LD+oDZpJEsdWLa/vAQ+uVF4LMNLpiuPK3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8viGilosmA+LMIyjIKWKnIRjw3z4ApNs1Vb7Y+NfkOF0VU1dgy
	xtwBeXz3ADyQjPpgrr0gjLM7s1Y3dT86c92SGilCbglAMwG1fm6WRhxC0yKCq0IXkvaYQ15QPI9
	MfLXm81uZ+H053RmtEgVjl1e9QTaT3UFLNeOEDLU=
X-Gm-Gg: AZFdTZciNIdbd7sQQwSlHtEB7u3XGV8e1fUJO/HUvFWtjSPcAOeIk1NExKbzQfE4jWd
	JjDHxebbTvvcJZOIC6KRvtbXbKgvypcKT4DbpDNuYsTVYnuVvV0lP8Z2CXNrv4YMO18dl29NxI4
	Vb5zrcmEKj9AW4t3wCV2JtgnRBeQndjz5rYwb/RFHzEkoUpvq5ppZdXuYZX4DQIAhgKpe4YBbOw
	iHRKtKo/2uuXTVxXmrkXT99iclQzn1xahmXvRekSgSCgBKQLEXkhCXt4JmRU1n+fySToUZtFJ+r
	6rvzRzuVM9kf4TKsx220QDP0e5WmMXNJ7cNljAptg3/NA3X32LsMO37ScLMPS4x35nQchqfLIlf
	/PJXkId/zkRZ2/zZVMUxxJ6bdwDahLStOkNG3
X-Received: by 2002:a05:6512:3093:b0:5c1:595f:b370 with SMTP id
 2adb3069b0e04-5c1bc6d253fmr7284015e87.3.1795787400636; Fri, 27 Nov 2026
 05:50:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
 <20261114020509.632311-3-jeff.roach0@gmail.com> <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
In-Reply-To: <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Fri, 27 Nov 2026 07:49:49 -0600
X-Gm-Features: Aa3M54pHYzzfFU4Xc2un7T9P8fzKCah6MxwtII6nKZyi50ZBPS2sY1vNA4Vb8NA
Message-ID: <CAAnD8Rak9BJ2WTHxz+i3ETm6vJQ7EOy8zSfJa-ejoHqWidM6mQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 6:12=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> > +&usb_2_qmpphy {
> > +     /delete-property/ mode-switch;
> > +     /delete-property/ orientation-switch;
> > +
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             port@0 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     /delete-node/ endpoint;
> > +
> > +                     usb_2_qmpphy_out_usb: endpoint@1 {
> > +                             reg =3D <1>;
> > +
> > +                             data-lanes =3D <1 0>;
> > +                     };
> > +             };
> > +     };
> > +};
>
> Does simply leaving status=3Dokay also work here? I think it should
> simply never enter DP mode since there's no altmode notification

Yes, that works. With just status =3D "okay" on &usb_2_qmpphy, a USB 3
flash drive on the USB-A port comes up at 5000M, and still does after
a replug and after s2idle suspend/resume. No PHY errors.

I'll drop the override in v6.

Thanks,
Jeff
