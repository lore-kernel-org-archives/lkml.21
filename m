Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460053;
	b=vai1+8qBM1w0Cu4Toz9flgpweWUq3ZDwngFEnvZUTTXQoM4ffjb9ef1mybQ8PjK2dz4o
	 J3f5/6VdeotNaozu+Q2JbehGD39ii7qGVgma9+oM+7XqAVi4XVnQujb/1lAZfUtBA3DRi
	 kdmjCI3oyCLwbo5wFVPeboXn9Qoa7afbuiGkJuYTgw21GmFJjZghh1rm4P4/sGEjKmOjv
	 llDz8JQYGQesHIDfRFYcRx46wbKTaNUitbJ9EfWhw3Nlz0jUaKIvbm4ciDWU8m95gEpnn
	 /qchRaLxu5nZCKFQULA+FMdz9s7LIDh8L0X7WlaHkjHIxnpD11ZqEq3aAmBe7Fe8TfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=Un0k2zq/NBWK8TpOG7W4o6jrkmU6EU/STMy7oHRK2yo=;
	b=I6zxEpBE+FQZNTBMMcVtUEsYbxMkl+jbl/vUKYNxVRpHivjVJLwioMyXMCp79LEQbcQp
	 sUXkUUL7FHtXWxJqCUVkARq9m6nrywOKJbrIuEi6NN7pRne6eJMHnbne/fpfX3TgojEKq
	 A4hxZcVCLUUiSiA68i3Sj4rdBxaMTAsKg2F9C7EL3DYZ6TDn6STNwicSny5Onb+u2lJ6i
	 COb2gAbffVUtNPq5ZVYTt1aeTwi98F0jRLgOenzS/kPUwA1OfFUzP7kd9kdCi8F77kCvL
	 8jr5QljHMDtaTHS3z8QqB3wg7r4IePEeJ7e/eoxLzemyCyCHPM4L12Nvcs3GeocUNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIpW11g2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1ED606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1ED606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIpW11g2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38699cf08dfso3650493eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795460052; x=1796064852; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un0k2zq/NBWK8TpOG7W4o6jrkmU6EU/STMy7oHRK2yo=;
        b=OIpW11g2gVzbasg136CCV/9dpq6CgBph+I2MQdPv4F2/U18tMPOXDpzI1VvMXYhx3e
         J6e9yGfIHO44UVaB0+NpVZ/A5Xd43MoKbGyvRA2zHncMw0PDdz1iEXjrT8TLCrUAr8yb
         j2NUHT2PcgPvZ2pYu+oXu7wizkHr8cq9dOQSenVNCzvFyMHr6ksUz43v1s7w1IwRVzI9
         JNVAVyZePccb8JKjgRLnP9yIo8zeM7YocIwJ1GX/q05OybH2sq9lIflcq1gHcma4V1c9
         gHVlx/x+u2+DKpJfupkcfAa07gE1Jo4IHLqpSuqWFG47SfMC3k3+tTvh2WgstdTXADeV
         yOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460052; x=1796064852;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Un0k2zq/NBWK8TpOG7W4o6jrkmU6EU/STMy7oHRK2yo=;
        b=zQV2Nl03gPvXLWBZeQPIiCsyQXKDVSMz1V4co9WW9pOoVLJ2qB/xv54+3CEezWhw7L
         V/EPplYQNdbSZvjfoKpIGfqJV8rPqQHLhmHnJAJUO5bpKQ3yTj/hs6wiCWrPs+cxPF9Q
         OCmcyzhfPPJVnV/KWI0plOddd66WxVKywFJ8+L6TmbsiYV8gLxKWS7GJFDlNMQYLXtJG
         n9+AmKD7A0aauBrlU+1UuMhyOC3OSTB0GYGn9zhgOUIMgtV2WFBv/fpHnnRD9pgVCFi4
         t9uQk98YEgjW2/soLZ4/JAF/YQNbLPc9kUm5wPWncNe8Q0GT9mODEJzMj8wsTdRoznlk
         anFg==
X-Forwarded-Encrypted: i=1; AL+hErF8zfo+fvONGkOwxkCIlNQSuKRrh4TxGUepAjiBraV51LGO2EXY/IbiKrjIQ0wB1GcMUqz3MDHK8LwLZvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o3MBeBLVvzQObdmT13ajwBiED2/zRqhBkOLQFgF3r3ZtAXAIn
	2Lep/QkESE8HY6Asd7CtenjHW6LsnaZI2Tf6oZedLPB/R0/QeNkSsmNJ
X-Gm-Gg: AZFdTZcsXtDsygDVA4jCvbpedULq4zB0sab21WWpS3rrEj8Gji9lnkYEJAMm/VYB78q
	yI9wlzVCe459IHZbN60NuHvtZKSqVT+Q1To4JGmJ0E0cHFD7FKEC/XmP1cs179dAmWbSEbw1RF4
	h+NeXPrJ/deQ5Sscj6/HS88l8qS/ktkxm3bQWKvUd2xNcJuvs+/49Wba0bIk0S0edFnzZ3Lj2JX
	xAeBvPx0T6fcO+cJ7LvfgUZnZRVyDOVH0bY4sm1ETXQnkwVNPH00oL/yUz0U8fPJghSiZd3FwOA
	FQ8l+NM2WH/x+uTIs99N+8dnYwJ7J7rSm4nSTh5MXA1WrVhhepRBeo/JZ33J7I/G2N3fNVRxjas
	FVrgipHAGETAQ9pomZp+2646nd/uNeyZPghp4fMpULmrVUwmj9c05/8Xn+Pl9Ft88Rcg3fhrEra
	rVPaRvsRuZaUeIfwiLGOcKl+2gdzjHJ6JI3riTkKKN8eq1EynXsgSpg99b/5JgsSVxvrs5zB/3m
	ypXxl9EYMI95xkOtFFXbld822727B899DCc8tKIeh+wjWhRPm4Y61mAiO6OtYadYyPQnGHrGS5I
	+TKWSFri3+HYVPtZP+ewq3ejYsFWRUlEG5HBRtMwZZC28E0jrv8gXhT4h98ng6zY8Hu7rg==
X-Received: by 2002:a05:7301:d813:b0:386:8bd2:da35 with SMTP id 5a478bee46e88-3868bd2dbe9mr10377444eec.5.1795460052262;
        Mon, 23 Nov 2026 10:54:12 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm35609839eec.29.2026.11.23.10.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:54:11 -0800 (PST)
Date: Mon, 23 Nov 2026 10:54:10 -0800
Message-ID: <78d3f2f7715e3b66c06dcc7268966964@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wei Jie Law <98lawweijie@gmail.com>
Cc: andrew.smirnov@gmail.com,
	bentiss@kernel.org,
	e.velds@gmail.com,
	gideonheinz02@gmail.com,
	hadess@hadess.net,
	hansg@kernel.org,
	jikos@kernel.org,
	lains@riseup.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stuart.a.hayhurst@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 22/33] HID: logitech-hidpp: shut down G920 force feedback on input unregister
In-Reply-To: <20261119064303.274901-1-98lawweijie@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-22-30743e91d83b@gmail.com> <20261119064303.274901-1-98lawweijie@gmail.com>
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

Hi Wei Jie,

On Thu, Nov 19, 2026 at 02:43:02PM +0800, Wei Jie Law wrote:
...
> I was auditing some HID drivers and found this exact same use-after-free.
> My analysis agrees with yours, but I am replying as I think there is
> a stable-tree gap -- this patch does not have Cc: stable and your cover
> letter also only explicitly mentions the "first 14 patches". This UAF is
> worse than a crash and can lead to LPE if exploited.
...
> If you'd like, I already have a patch for stable trees that I can
> contribute. Let me know your thoughts, thanks!

I actually dropped this patch in v3 in favor of fixing the lifetime in
input core across all force-feedback drivers: see commit 2ae35f090d02
("Input: destroy force-feedback device on input unregistration") in
v7.4-rc4, which is marked for stable.

With input_ff_destroy() called from __input_unregister_device(),
hidpp_ff_destroy() runs synchronously during hidinput_disconnect() while
the driver and HID device state are still alive, so no G920-specific
stable workaround is needed.

2ae35f090d02 will apply cleanly to 7.3.y, and for 6.18.y and older LTS
trees (which do not have ef166ce08801 and ff->stop) it will just need a
trivial backport dropping the ff->stop removal hunks.

Thanks.

-- 
Dmitry
