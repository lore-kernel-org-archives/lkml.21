Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204970;
	b=eEEOXGAxMtCDxWaNetVCOb/VVCBR7dO7zp776M/8RrpIrO6nzm9V3V1FfIwHIz1b0k5U
	 w5xojjWWxHDWVR7sy9iVRhuqCbVnyxjoaJLzX46ciBvRCZMWTuL6zLFCXJWdP7sURrbn2
	 IR+r+HwL3eLMUEs0F2z+mNg9TY6bAVKHNkYwYplx26jaBSYiFTm4aS0N3Hn0VF7GONBdo
	 WCyeVupZdpk6w46eJyhtLL6yuLGVDCg+c5vkrwYc4wgbEQpVn3bKeKsVo4iBBEAYPCYD7
	 0fTDgziNOZpUzIHiqOD2S3M2e4hITb9wcEVqpKQZsfWo5zlmr2UB+Vg9rfI40ugAAxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
	b=Tjj4lm/0Tv2MT8pLlwEJVOO557OBEdJcEa5wRA4ug5Z6x5iY5l7oVriPwMJZpOAyEmOv
	 QU9yTqnis3B6a82iYU1lrOPRFOKn8VHa9DvSlSDKVXj4eG9iML6Z/BbYi0nYMMAK5QKaG
	 PcjCYJZjBVwiPDNelo9nACuOyH25dYp+T+EIfffH9cUKwdgiPqSUFHg0itIjeVlG6zhV9
	 DMpr8uBX+b0M4udzsJEx2zeL/UpDPa54Z8QqeyYmIxfc1g8AEdUIdpGvqbdvtS81vDmnx
	 f+STyL5cPp+AtSXxsuAr/KbBofQvmr26P1xsUzwFhsrDf70swi2QZM1+ol0a64jvwlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WaMYcHhB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2660A2612
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C2660A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WaMYcHhB
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b2d14968c9so13310627b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795204964; cv=none;
        d=google.com; s=arc-20260327;
        b=PLFNLnMLoVwJ39ynyx3UEPaUHY5m55gfNFE0Rmu9JgSkVfXXe1sJcWcG6x72Hgh+FU
         0B1VbL7yGET05ft6nfCs3S+2Fo7sBvkXnZswi8FWSxx+6zduGbFH4XzoUZ0O49csoQLj
         d9aZu0cO+aatBhozto0CucTI1vUzShkcbjYVeOXXqxfu99V5OLAk3EuX6D/hE7xXaVUp
         RC0hv9Iaq1uJz3xBwtaSSu8n+N5XoM7iCzOyyepstQdjqtwvIyfnWlnI7oR9qCJrO+59
         QEx+jMGehD2it9bi1TIhUbmzP23CtabWQAmO7EFG0Zq3Ssl6c/gaDYN5ufI+gVenVRLm
         A2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        fh=5ltry3WuYEKGs4lNIWEkL0RQiF4aCokAAYBrWfh21oA=;
        b=kfkZxcllQQUaqFW8vlrFKoqR4zOwSQZBO4h/4FSr5hXBuQkfkXBKp9qoQSkoKpEJec
         Pt3uu5RDyV8EH2LpAmz3HM9POMzUU+soh8O9ErfU2rmGPX2XhgSMB5Jss6HkC/IixDeI
         n24Mo9wT4+0LRQHlygc+RkECZEVrl6MZzupo4iXIGPMkjqQMXrEBUUrKLw18NW7Pplkf
         W+ecQvcyv2z5M2yAmtTi3TjycT293Y6AFIZlpTBUgKQRSmYkqj6dhCLbJk4kK1bpoEGB
         e8gwPRwmiqtYB7/1+UN+L2Au8hfnW7kFUMaLzdZS48vH4qg0R0kQZPjyjK9jErwOXHdL
         vi+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795204964; x=1795809764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        b=WaMYcHhBNZ+35v+6wpg2naLtL6eDcZGWsH/op1cQD4c03wrQ8D9MdgfrpovhVdIVdA
         2vQEBszX+L485tw/WsOjNI6nY9CG5gIGG0K7OjZRK2gMC/7bEIPYyrqsu7ZYpm9MYQC0
         3I6OnJRjbJW1M/wIfBUqPj0fZpDXE7cn+bncY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204964; x=1795809764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        b=zWkCl5+spD4VMWyI4oq1+RBNhs2JFM0kAvKmvcss+vtOKKfMeCVpYMWPErjXNh8vuV
         TXZlfaGFtpK9ouYBE5E0GeICwFRUv3RlSyAgNIb8dv9oPzvCrQEr+UWu4cekjxCYpg/p
         t+HpPFTsIiascAFb3EKM/EKawEA3I7hRvX/lqIsUXarO5lQvWn1N/y0HTZtJtrBA2Inr
         qrhO8SxHcyHgWlNFSEctc9lKgvczwTd4qhX95wgxcFDgQMVbt6EwN5EpofXr1jtFjs1i
         ZeHpNxeLUAzIkx5ECTUU3XoaW9F3TQD1mvehZF1U8hOyC9mVDAx2x8ME5S8+hTWIcLN/
         CDtA==
X-Forwarded-Encrypted: i=1; AL+hErHPsuzUYCdeVAML+piqzbIRB2hF3Rfa1a+0B9HpyNrjQzGKJX4bTZwY7mNoJSqluBBSXLQmfYvgkg0xNZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z99cRAEEuhpdE/QkE1EH0yfU465JHuBpNQKgFi4JrPyHjJwdBx0
	mkYycnsaV9H9FFMvtbjhu4I+xolxJ5W0LyYbozlc0qY+CBhMYo3BBIaYH30Gp9IFwpUt2hE7uWN
	o/AtFrk3NP8G+XVi0L5V3T3w3eR61QGb806cda7Bl
X-Gm-Gg: AZFdTZd2948gE837+tywWNsrMjEpEPbvEgNdHrnSI6jNlooYv/+OvBNndfkE8Tej2Hg
	dPhlic0X0yvDPLulgeXK7BeQq40l9TLUwuiQCS/GbyIsmSSGFl4No67XouRQh44IXy/zeh1crv+
	chWLHY9xixFDAtW+BhwswqBvU4YDtOv4bSJAHp200KrhZYCTQGpSxL6UsOr868bVShWII+ix0Iw
	8r+Qsct084WUXWET00wtgOO1H52rXfqrWcmD9ivq7i3z0+TD9rlMBE2JNTv4Kxp2kwZ6YBy0cPj
	mOWY/wXxQjJRvyTEizG57lf/Q49ofTEUpMdyLeOg6MBAIBAqjkLuiqgrLqzWorf2vYUzz7cn1VH
	HZ+0BRy3aUue5jEObprLNAWgDyIGkEBH47eEnjl9k8aTLymN1GnmJm6C7bNudyaJvqfSq
X-Received: by 2002:a05:690e:4008:b0:67d:e36c:6bc8 with SMTP id
 956f58d0204a3-67df44c1825mr1431647d50.146.1795204963908; Fri, 20 Nov 2026
 12:02:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
 <20261024-send-upstream-v7-8-abad13174b43@chromium.org> <20261027-silicon-unvented-a0c8dc394e87@spud>
In-Reply-To: <20261027-silicon-unvented-a0c8dc394e87@spud>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 12:02:32 -0800
X-Gm-Features: Aa3M54pc-1DTIKZ-A-hc9wj9AlprRrg4PvxeOwd0_HsaV1fm3yOGyT9vmhS6ZyM
Message-ID: <CAEe3GZF+P2hHHAQO_eWq=yv83HYw9ebEdkO_RZ4zPkQ6e_bAeQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/11] dt-bindings: input: Document hid-over-spi DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:17=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sat, Oct 24, 2026 at 12:51:42AM +0000, Jingyuan Liang wrote:
> > From: Dmitry Antipov <dmanti@microsoft.com>
> >
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
>
> Personally I prefer how this is done now, but definitely worth those who
> approved the previous iteration taking a look at this because it has
> changed significantly and no longer contains any of the properties that
> cover the timings etc anymore.
>
> Worth noting that this changed since the previous version after I
> pointed out that the second hid-over-spi device did not make use of them
> at all and needed specific handling in the driver.
>
> > ---
> >  .../devicetree/bindings/input/hid-over-spi.yaml    | 75 ++++++++++++++=
++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml =
b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
>
> Typically this would need to match a compatible, but I think this is okay
> provided other hid-over-spi devices actually get added here - the series
> adding the second hid-over-spi device didn't do so but should be able to
> I think?
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
>

Hi Conor,

Thanks for the review and suggestion. The intent is for this to be the
common binding for HID over SPI devices, and I hope more devices
get added here over time.

Thanks,
Jingyuan

> > new file mode 100644
> > index 000000000000..bed0746f004c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HID over SPI Devices
> > +
> > +maintainers:
> > +  - Benjamin Tissoires <bentiss@kernel.org>
> > +  - Jiri Kosina <jikos@kernel.org>
> > +  - Jingyuan Liang <jingyliang@chromium.org>
> > +
> > +description: |+
> > +  HID over SPI provides support for various Human Interface Devices ov=
er the
> > +  SPI bus. These devices can be for example touchpads, keyboards, touc=
h screens
> > +  or sensors.
> > +
> > +  The specification has been written by Microsoft and is currently ava=
ilable
> > +  here: https://www.microsoft.com/en-us/download/details.aspx?id=3D103=
325
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microsoft,g6-touch-digitizer
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier for the device's reset line. The HID over SPI
> > +      specification requires a dedicated, host-driven, active-low rese=
t
> > +      line. The line must be flagged with GPIO_ACTIVE_LOW.
> > +
> > +  vdd-supply:
> > +    description:
> > +      Regulator for the VDD supply voltage.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reset-gpios
> > +  - vdd-supply
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      hid@0 {
> > +        compatible =3D "microsoft,g6-touch-digitizer";
> > +        reg =3D <0x0>;
> > +        interrupts-extended =3D <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios =3D <&gpio 27 GPIO_ACTIVE_LOW>;
> > +        vdd-supply =3D <&pm8350c_l3>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&ts_d6_int_bias>;
> > +      };
> > +    };
> >
> > --
> > 2.56.0.257.gf7497c7d27-goog
> >
