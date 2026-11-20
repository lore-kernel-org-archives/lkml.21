Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795182778;
	b=XySekJi+yDZREiUph/Fn5bR70iXGrqoEc4VRFE6p8ADhd2PJ7rbAS0++3KuNCU75kRg4
	 wsM3Y7H2+Qs5gb3mtpO3IVv0TemsVUnyNVLKS0nVnZ9w7hh+KQSa2ZfTeLvPNNf1Rbayg
	 yaJODm7aDF9h1TD5zzaXvTx4uRLvz6kzM2/ycCojqLZMn9q8f9tLCqh7C9OXJjfoNADfh
	 j8QYRtK31aGByyVaxOud8UOXEyyZYcLBkXYBWTLo0SHNyncWlZtyll3lCbujuKPltpIaK
	 IOOxyfmGl0OM4+XUZGLl54oHO+CHqVbfHZnVihv/0g5jLdf2xBenUXZUEBJOHPuVKzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
	b=OKvdPJT0JGUE7cE4gLGy/B7Hqklo66BehjZ++SP9qTu0ISwnk4/8TkPpcHo9+95H83+M
	 3GP6tCdEXtTzgOV8PS7Skk4OYMWeoxFkjtwE9mZBPBdr8m3zTDvvYsJMXTSclvFIWjwoI
	 HG/K+PtOhUIGmIJIW7wswdAqADOT39+UpcT6iGM9oRzY6bFFDtsNMQVrkz1pKR6a/6Hsi
	 9NCqrOGP8fcvk2GXyJ/EeGxkMgirRJRN4ETFzFARr666av+9f2Chh2UDWPlaUL4KyyJjP
	 XP0/T+DP3nuTpCtNTEeDQf/mtsQsm0ctGJLVCS+p7+tSZXJ43VIycqNodYS6DH6LgOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=nC40FRtx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C3606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0C3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=nC40FRtx
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50e26763a4so174119466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795182776; cv=none;
        d=google.com; s=arc-20260327;
        b=PHv+vETDYVXfBfZ+3lvRu3BQQ4CHvLDV4W+zGqsMrt21y5BMxnIEuAqaxPmWJ+mgZl
         piUoaQWLkHuNjZwAbD1i/j/vYGUfblj8V1mFfXA4t02dnRfrUlDG3VAeC2uhqRehyCpw
         Y0lK4oEKyHABErjXEGBiPeRVMoXYPgBt2r5vtOgYNi4qcNPOOey7yjYeMEuUVyrfTTUO
         LSrYydWM8LypO5nXfUIkiS2HoO1rWSuUl5mZiXNOOtJj2D2gJcZXFz0lHODpAXvrSfw1
         lv5mC9YXsv1lEnrgcbuNTphoLyDMFpjWcFGk9YqwzubVvNCMDh3hIKUlCYLsUnTE+QKU
         hbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
        fh=GJOV7jyiRN3Nqrq6QVrJc+EM6in8nsctTPPypoOUjno=;
        b=IWIKqVQmWUyIBqqA1r0X9k1YqGcKwItoiKBrFy+qzu2PSi6HFzPUdEU4XRYKb3FiYv
         cLoOA3nU2Ck+lBizZmeuCMuKMRH5oFShZbbCJ+jV+CrJ99VFaV6Ru7UNPXCiecnDECIK
         m/cjsB7FBYB1XD7WPbbGoYNXyGL+W/P7MPRNFiR5aq5dystqhpCDxxmSUsuqEvW3E6Fn
         K5qVji/dFdE5Ohy1bPpJ3P1l8Yf2LLN7AcbqWrvmZvC+HvPBZ2yEqJmRrgrBuqaZcDnr
         DgKyHIJYNwPeUkIx+z9pZvQ8mmffEV60HwuFT9nC1j/uCd86Gbs/+oe+Ig7mzDAs19g8
         ZQXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795182776; x=1795787576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
        b=nC40FRtxYgk0BbJCLn8b5EroXSKSJ88MrRs7GFxMehO5WBFc96o9b5xiz1XPNhoANF
         pedO+USxC/ZagEErtEaHcSHj463uI3tJ8cCxXL9SLlXmgz/ldvT6doBc/vt8UMnzbO9D
         WyOQ6t8Mq+IJUgLmPefOAQPdsZ0d1WuXyzEZqLQW9BXFGtj9zZoArzNo4ikuT3i8oEn8
         pcZpHGrqwTd+J+Jh9ByGpXsco2YQCc6vE5M6jQKsiuE9oMnU+L5DoD39XGstKyhS2uFG
         KHemC8OpP+hkCkOmj7K8Mpj3yJtXnVF9sN5njOkBC0b+jRK21iManY5gJK4BiFCXq04h
         ssug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182776; x=1795787576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
        b=sNS+tlBArwVPuep3Qg4HTO8zjTV9snqz/9kXBqCxPb1nF01jLbZCWTrlqKo/FRRmH7
         gevsXWeytKcUpfFK02Bit1AkAfjPIoTEMQdK5vhYnxJaJn+HOAMf3Uqfpdjn7V/iXtIW
         ZtEXU/8sdIVWmiNL42oxKATnTEIaX34M3upJdWVmhYhi0BC/TbJJdFP9A8dULkCYas/y
         vKMZEvnHt57qbm8NV3b9Y0Ssfm3ErFkARjmk0h5/YHpZc4Xh16/fwHrJa7pVZ05569eJ
         EkCpOC6ve46zyUSw3BgS3glmfkyd5vaZ5+wmktbwd7PS+a8WrzsFJVO6sO2DAeTiZiOW
         c/lw==
X-Forwarded-Encrypted: i=1; AL+hErFx4hMUuEuVqZIWU7J5fwJOtDeVgg7bK/qx0IM6bsUQuJjh12Kf1s2R530RkMaKhXf576HQnsiUZV6tJWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s7sBcHyYSWu2hfxV8gNh/0weZHUGWoL+59PFPz25WAklgNuiE
	gZIa8+Bi/qfkGlt0zEu+ElzhJAgxx56CLjxw/0RFQjbn/EzaGJvGPik9ZzUnv6Q8wCkJdLZeRIX
	eBPkbrg+WcfQZ6OS2uSZA1YC2tpq6aKZWffgK/YsMzg==
X-Gm-Gg: AYBFou0dXd0mo6642eGPS4jXeP1aasL8Hzj0qkaRhoJ8LMvnJ1Dr2RwW6QmzDZbwc24
	GCnObnm39SBqGKrBqwJJyDOqxKYrXlvDBJLg6qESYIz2HzRZzvSnQBFLaubxe5NDNgdFi7OzrWN
	XfGoCMjEDo5tNIwWbIhTv7ssva5oJ2+3nh2+4sALCUFEA0PAZ/9kvPEQkW2pvJNWm3FIt9sBWBJ
	D4CXf9FN8RQMZREyzyPcYnzwkCow1JE19jfVSC0eUA09dQPAXSfdFI1GeawYnzTU8kLeEO8CMeZ
	ZCuJbnhWu8m7aDDydDolTSdDiCbWEz8aLAdeAicfMweIA/Ilpvdvkb2jP2WDV7vmJAu6R5GRKXE
	5dltrjWn3EbtvewObZ3nEYzY3IS453Inq8XaN7HKEBa5DS6PcbKCkRi8FDT3KA8CwYx7LzA==
X-Received: by 2002:a17:906:a099:b0:c2e:350b:7220 with SMTP id
 a640c23a62f3a-c513a99a637mr271625966b.9.1795182776578; Fri, 20 Nov 2026
 05:52:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net> <awBFWmpR9hPkcerN@black.igk.intel.com>
In-Reply-To: <awBFWmpR9hPkcerN@black.igk.intel.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 17:52:45 +0400
X-Gm-Features: AclHuK_VIZlrGFHXDuTJlI-KT2ULB_-F_s02FUea_6KmXVP_7WAbNp_FalPVFPw
Message-ID: <CAKTNdwES7sRRDjvgFdGttesY9dppOkfBjNhwsJuwUWN1T9DFvA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Keep interrupt flags across a failed
 register read
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Yueyao Zhu <yueyao@google.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Fri, Nov 20, 2026 at 5:04=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Alexey,
>
> On Tue, Nov 17, 2026 at 12:25:31PM +0400, Alexey Charkov wrote:
> > Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chi=
p,
> > so bailing out on an I2C error in a later read loses the flags already
> > read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
> > lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attach=
ed
> > as a sink and left every Source_Capabilities unanswered.
> >
> > Keep the flags pending until they are handled, and retry the reads a fe=
w
> > times, as such errors pass. Otherwise a flag left pending waits for the
> > next interrupt.
>
> I did not quite understand this. What's the i2c error? Shouldn't the
> i2c adapter driver take care of the retries?

Any I2C transactions can fail - that's why the accessors return status
codes. And they do, e.g. if another device on a shared bus misbehaves
and hogs the bus down, or if there's any intermittent interference,
etc. The I2C controller won't rerun the failed transaction and will
propagate the error code to the caller instead. In my case it was
-ENXIO when another device on the bus interfered with reading the
interrupt status registers midway, causing the irq_work function to
exit early and drop the flags it has already read without acting on
them. The result was a permanently desynchronized TCPM state machine
vs. what the partner saw on the wire.

> > Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip dri=
ver")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> No stable?

Cc: stable would make sense; my oversight. Thanks for spotting that.
Shall I resend with it added?

Best regards,
Alexey
