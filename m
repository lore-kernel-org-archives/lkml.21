Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483706;
	b=xAbtGjPXdeSWvmfhJ2CRPRUlC+BMGFAfZS0+08GpeyrBjdjjTJoIj4o2i6GveJ25t75d
	 ekgY5PnG9XeFohVwX5KzfPpn7Gr7P1d4Qzr2xUmasQpV/7V5tuzDg5qREoTiVZBZIgfdq
	 2lQhQ/z8aaYBEjk8DustguDIyDvm5KgaBuzxWiee2eQDuOyDUrARjJuivMizCt8uprgAX
	 mgG9uJ16f8X5Dq85IXZAaK/9wyzb5v7itUK2gnud1NiMBuz4xOrxJaj8bJ1mqgEsmDykA
	 y5EbPFBy3f870onR3PCeNK16qhSmC9ZY8Oh3zRGS1b+k+s9+rNOuXT8QYH7im3ioYkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=IqUna2kjFHvMrIO1OLa0ykP6eHWf+y9XmdVhagHZuFA=;
	b=RFtictGEICXIQnB4ifeNzvyd9/I5v0KO06ECIxPry56lO7AZX4KRWAu9b9AAejiPS21Q
	 vua+UFglLPK1DJRWYV4szYZoHgYMY7BtgDzt5aFcd9Bqx4y8M0aXS6OLEE5h1hzX4j6Fr
	 ochCLAHLz+syFnhQIFol1JyW9mCyGld/F8nImzQI8uYPA/YR0ReBFsf46DYTMNWLMJ3V+
	 Qj9Yg8sTYDfD0Y8H8FmmqXN1vs7D91rxaZ5OqlBQekhHfn45a42dq4rLqd+MW/0yi5lIM
	 +EEjikLDTYDaHmG8Aej4h2QFZMrJSqu/kT04pB/KlSekew5hrf/fyVydhy3Obal6urg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muDl+jhc;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FDC606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FDC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muDl+jhc
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so4566811c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483706; x=1796088506; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqUna2kjFHvMrIO1OLa0ykP6eHWf+y9XmdVhagHZuFA=;
        b=muDl+jhcQiYfn6XCWnNAla5FGzr50gZWXWL0cAb2YlZP3RtU+V7fpngMFhyrAdvs3X
         /si1j1peUcZf/Q4j1Ky1wqmRsNN/6Ge/pGnDuB0Wb9xN7Wl6d+JFaQKMNoLRbdFrdeTi
         dOIKXzyvkRsPNZDfjBstBqczObYyj0j4syH7MokVEJwpQphJZQByJVR/pwMuBnsTcnL5
         6TXWhnKg6Ri9sZ8+orR0ozhAE//kcOdJIcxi98EqUfqQqngYg6/YAtO2gL9xr+mzIh4R
         BqadFhFMoGKnijJF8XoPNP8r8/RmtVMhPztG7I2boitz2LxnIRskqUqcw5CbacNWElaD
         Z8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483706; x=1796088506;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IqUna2kjFHvMrIO1OLa0ykP6eHWf+y9XmdVhagHZuFA=;
        b=eWHanGNk0YgZr+5XLc6Q8AK2ZSNjKA5l7cc7GWl37W3qybq3wGKT8AdIJ+NHQRoEBR
         uWqqNc3nZTUFvLlBgv8CaZxwRlD696/Rh+XS/oYWQBSWqU0kOoKx1owEQJ8M725iobkD
         oTpWvmB98+NhFmcTONogZLsDV6EYAa8vZIQfkHsBiNVJZBqRoLU6d55CqU1/rfWQM32p
         Ns/1DFHLzWkKKr6lqRTZ3c/DkK1VJWByyXLenS+dF9BqhqRzGnQ0fMurxDkpIvLhbv+w
         fnUpGO/fiHKHcZH6cJIrG1f0h4wS3JjMCGChYG2+twD7rAiU0gwd/F1UrdwtsPTG/3yT
         wM+Q==
X-Forwarded-Encrypted: i=1; AL+hErHu3Qcd70jN3GBEQJhus2OgjXMASRr3P7taX7O9EGx/eR6NnVpcEIT6cLiPTvhuVdjtxXsWWJugquCLfao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VlDktFCFrVqGjvY5kDOP4pePS1W8gL3RjTYwLoeIAcxIuTO76
	scKqF61ZCot1PY4vg4+WEIuHDQQ5aHiRSU2b1btTYy1it27oERc8DUPg
X-Gm-Gg: AZFdTZcOP660mOR6vbnHdgN3g5n6ap/xenkMRVkRb8HUyJYFNecZzhJWkCLEjrbBCWm
	ghyvxw4W7/dCm3389uBrfrXKV24maywK8pwfr5NXQmP8c8wXmFUHBA7SJQiwg2YecYEzWqr8Nn/
	odlaCSQspEFBRdwoXTmhUgYmjXs2VN9ccRS65aLiAwPgX9mWkDzXZngf3hVNvAP+a4s6gOpHqlr
	YgV1l9ZDgcXJWvZ0UxbkwpAHeJZ86mFhsByWYY/lZ17FB+HVLEi7KyAEi4VrHxzODkxrDCbmi9j
	lw1nyxorr6BHy0CvTfX+Y7G3O+80q7YxCxRFJUhS4KPVYX3aWxckC2cRQTyybj8HC86izWjoch1
	qOdidtE2j4c6Mtu7YjjgGA+u9wY4Ijt5Yw7qGtlwV0tRGXSd/wSkhw3EwtwnRkjeqp6ETuM6Y3a
	ZQlLyKMqTOMcfNOEH51uwzq7VpXDbXNtDA54Jh3EqCu+PrpUCFYG6PIRogR+xCQe5GeDkyR475O
	2PCm7REma770UTZMFfmFfD+ZSsO+ZMPIf6rL1dmk7Da3wklmNVosVUFsTpOU5ng0++7YIsDKSqC
	WtcoTMIK+AtGZqRQLemBGH2wHFC1OwW/A0TYQuaog/x+COlst3xTtfknfhRwaMwAV62SAQ==
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr12621491c88.4.1795483705400;
        Mon, 23 Nov 2026 17:28:25 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm31126403c88.1.2026.11.23.17.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:24 -0800 (PST)
Date: Mon, 23 Nov 2026 17:28:23 -0800
Message-ID: <84b917b9feb4a934e67d0e8f25707cc1@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ahmad baghereslami <ahmad.b1995@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: synaptics - support the touchpad LED on RMI function $30
In-Reply-To: <20261116071906.30110-1-ahmad.b1995@gmail.com>
References: <7f9d0adf1f49c5a2b3919130caf0acb7@gmail.com> <20261116071906.30110-1-ahmad.b1995@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ahmad,

On Mon, Nov 16, 2026 at 10:49:06AM +0330, ahmad baghereslami wrote:
...
> The reason I kept it on PS/2 is a side effect on this laptop: the
> embedded controller turns the keyboard backlight back on when it sees
> PS/2 input after the backlight has timed out. Over SMBus the touchpad's
> traffic no longer passes through the EC, so touching the touchpad no
> longer wakes the keyboard backlight; only typing does. Nothing else
> differed in daily use.
>
> If you still prefer the RMI4 route, I can send a series that adds
> "SYN3040" to smbus_pnp_ids[] and implements LED class support in
> rmi_f30.c, and drop the PS/2 backdoor. Or, if the backlight behaviour
> is a reason to keep this touchpad on PS/2, I would keep the current
> approach. Which would you prefer?

I would definitely prefer the RMI4 route: adding "SYN3040" to
smbus_pnp_ids[] and implementing LED class support in rmi_f30.c.

We already enable InterTouch on several other HP laptops in
smbus_pnp_ids[], and implementing F30 LED support in rmi_f30.c benefits
all RMI4 touchpads (over SMBus, I2C, SPI, or HID) without duplicating
RMI4 PDT scanning and register access over the PS/2 command backdoor or
having to deactivate the PS/2 stream and export psmouse_mutex on every
LED update.

Keyboard backlight management should be handled separately from the
touchpad transport: relying on the EC snooping legacy PS/2 traffic is
just an incidental side effect (an external USB/Bluetooth mouse or an
I2C-HID touchpad already bypasses the EC in the same way). Ideally the
keyboard backlight is exposed as a standard LED class device by the HP
platform driver (hp-wmi) and managed by userspace policy monitoring
input activity, or (if an in-kernel mechanism is desired) driven by
ledtrig-input-events (the "input-events" LED trigger) or an input
observer in the platform driver.

Thanks.

-- 
Dmitry
