Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461017;
	b=A+N0pgK+ZcmHDs2XdiT33y+ypm/dpEl9h/iDe4py+CX8B+X583PbaWeuZWLWQCEjl1yc
	 bzYOen1O8AXvFLKL+tjro0JCHCMZ904gcau2BwD0ainVfChitBGggbRPSyu8ltRXdPOuK
	 eP9bwE4diE5cH6+8bZ9HHLxgTp0Zl3mc/nsE7GpnfqaCILsxaqI8C0+e0Zw7fDfWDuBpT
	 Dipn9ZDqNUMeR+61rpuM+O2euhhhxxSfrzEuEKNLIWrw9aKgtxcRcLtuPH6557OMYeCn/
	 t+WFogpdL6uZzMFsWCfyVuikN0wzHCkC8e6F2A2gTX2HwkKOMxaao2S3jzT2+81hbGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
	b=0RZ/JVYMnsldDcw4m/yn9B4IPMCFd3Pcev6iBzr0qP5/1bmTzeP/wVG+ivTIQj7v56c5
	 Sviq/Ni9WEdSOezjapYAzu20a+oAVIyt2HzozC+nD/gAXskIPVFX3MF3Q/wo/x+hLChtI
	 nbFN3DDZnfs4bNLP4VSLXJ4jF3obIo4y0IMnFXVQReEutVEKhIDAAkHrxHd4299k1Mv1X
	 iLvMhBAjAnBrLFeQl31GLfVaiKfeo1DChcM1wYMIiZ+pNbp4c5UEKb2hJtZhP63USE2DC
	 Ziu6+WaC+9Ogt7p4zpCFBsX40mwHqNjAJpSqCdX7LV9rnTuMZlzF8HB3IXuWCWcyEzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWTS1+VW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E233606A687
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E233606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWTS1+VW
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38699cf08dfso3674822eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461017; cv=none;
        d=google.com; s=arc-20260327;
        b=MvRbMqZwPWP8ExheP1ZK08R9V5FYb0M/lIYG7+nSeqGHQxs3gyT8vI3F4ljliK0OAC
         7eIqTB2NOZeytSMv5JTYD5VE5TgtCHYp9xOu0QdmOa5eHCYoPAUTVaXjOH2yudvOCyTE
         sI1iItTeSsSmgScAlW+hyYnJt6yMr52Xx1BzHXTCqt6iX7RrQT9pV3n/cOtpCtQcuada
         1fZC416L+nldmZU8TxdCa68g8WHfz2qwEsvZm32ucZRCytItpUEdX6l8I5mK76XTvdmf
         ye1Sa/VtkPqEygtKOK0HUUZZX9tid6TL4PI2O3M4WBqWnSBokP5cKF1Y1qJBQcukuvLb
         Rw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        fh=SEreq2ILsTsSNrZ5u+HRIAQ9MDc4AX3ZL6FGHlv97ng=;
        b=CT0VstlR5PiU6LeLziYJSO7Pq/IEOsjN0EKZu3DLCGl+ZiZageFDt1qrXtZ5UgOZQk
         8UQj/4E0s+c2+glvsg/3t85Ik55pkUhvvnfxoWSE5dY1b7ygF/WhTcc6L6jE4xVoEfq0
         nEJsOeUNRdoqNbbOz+9EBn7qv47F45r/Ot26hysxco3tCJ7OQj5oQBh8N+H9ZjqzhBKf
         HkWgSWK7V8qxaMsLB+QRpEftbqqkiCs4PlVsbp3qru5sheZ+IzgRlAh1i5vuTQOeGD59
         aJGUJTroJx02bysrNJDcKypduyW2nNUc2H6MeG/Zx30tX1xYpmPzaguSOaD9lXU67VN7
         q7ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461017; x=1796065817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        b=yWTS1+VW13YQiOdVGn2wgkHpFAUg8JSGdhvTtlD+DgoE+alp7IpJ6yviD3nXb91Nu5
         zZmJemLSIqG2T+4MQ2/8a3OQ1OR5Sk2uVGd8tHEwtwj5d0X4ECJlF0TA01POoV04S/7M
         U4ivK+O9QOj7KSw7WrGMLFFLo28HH8ooW7x3kaknn6v0w11R+gSygJQ1O78B/+FvY7W5
         zv5RLQYyGQ4RCHk7W6E7D2M/ybGfu6Z3fDNeXF1j/iBEcMEpaIY7A6flr/ZvE2caZ5uj
         8f7mA1m1z6qujahQU38JbwSdlQ/o+hagayRazYLH9SDjYuSHYCmQ056Qzs+U8e2MYwIW
         e6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461017; x=1796065817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        b=qnh1mFt7rKgf1YHj580clYiy4qpa3zIa3po6GrmLcamrDWA27LReF6IKlQ/TO/YHic
         dvir1BBhAwE5g8vb+388XkJaum1cPPgCun9R4W1Hmq4MSUhNVueyQHniu70r+qvcdAOi
         KwIaSN8pKds8gy29+jOhZiViAGRMVN4VXYl/Z5IKmw0BCMUTUCWNnMS4itYzq0pW+mck
         GWzMvYvBUqyZsPt9zKeedDElTvZDMHyyMtYOEMN+YijWDLMeTK8stPscjh/TgtfFE0Ss
         YU/QlcJKr4k561prqBIUyk4MnMC7cPktj04BMFEm7xhXg9ZrDMvQzIJZGMKoqdsB8BYF
         LMqQ==
X-Forwarded-Encrypted: i=1; AL+hErHNoo4l1SMf0EZFrcAVYQEyzawUOso6mq6wGAC6nXjEzdrPTqFqoul8qmXPIU2bnaEhmPOgyWPexdaUDDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zxSygkEsXGH0v6k47YOWXFMji/p2Agw2Aqp0jeFY1gAO0sQ6n
	Y2qWTVpYyuMDNOGoxhhjWoowam4XxF4ZLDe4TTrb7XsjEOW4mJpua5LVpUBYtxyLjAfU3Sz0m/L
	qUSyE1dK+c0TQ2kRS8vaCb70iSRccwMU=
X-Gm-Gg: AZFdTZfEognv9w6RSCwiscXaiZ6AdLhkEqliJuKXgOySg5nV6/Jr19D8kpOGG7M3sZx
	5/N3m7b/WDDo2HoLRxAawufAumL5734zpio8Mwp1iDaKZF4ELYOIyEbas0k9EDY5cxyu32hRLF6
	WqdcNjal/BAE7+fOLU52w5YkKEt+4NX1UcwtMTvxnf7rNUr175V0Xoix3Z65FiISbrEIJ2ufHY7
	Nnu3ceyuTNYvqt0btgHUFLaCEnFGMSNt336CTJUNXQxYdnKnRpEujyMGEht4/G0agkFSxLMA3ng
	CCBindKgq06KqMU9T+2TCOlkeVxOIXa0HNfq7AljhPNp8EpNea69bPDqgZb1YsjPu7KcAUa/fli
	HNuHZpBsi56fOsBkyvw+Aco3vowe7Mcm8BypeyBRx5JehtHglSESXSVDHcrDXLX3qaVzUopL/xB
	qYGoUDrVUuN9UkCGT2RD0owZ0zzRP+OQ==
X-Received: by 2002:a05:693c:87d1:20b0:386:a816:ca16 with SMTP id
 5a478bee46e88-386a816ce29mr5178321eec.15.1795461016480; Mon, 23 Nov 2026
 11:10:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150725.212836-1-clamor95@gmail.com> <20261123150725.212836-3-clamor95@gmail.com>
 <awSLzG6IxXjKLBCx@ashevche-desk.local>
In-Reply-To: <awSLzG6IxXjKLBCx@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 21:10:05 +0200
X-Gm-Features: Aa3M54qd0Q0FdKFQ-JpohuyS51xXnBrzclr62AhndFD0zExmhfAz7QgWmQX6nVQ
Message-ID: <CAPVz0n3Mm+GdsS_P7Yc98FVKOijXFzWocVCkzUhg+LPJ8dY+4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: max8907: Add ADC client support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:5=
4 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 23, 2026 at 05:07:23PM +0200, Svyatoslav Ryhel wrote:
> > The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
> > support for it along with its regmap and interrupts.
>
> ...
>
> > +static const struct regmap_irq max8907_adc_irqs[] =3D {
> > +     { .reg_offset =3D 0, .mask =3D BIT(0), },
> > +     { .reg_offset =3D 0, .mask =3D BIT(1), },
>
> When {} on the same line, the inner trailing comma is not needed (if we e=
ver
> need to extend this we would need to change a line anyway, so there is no
> benefit of having a trailing comma).
>
> If it's just this, no need to resend. Just a hint for the future.
>

Thank you, I must have overlooked.

> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
