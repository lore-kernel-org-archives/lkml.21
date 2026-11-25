Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596135;
	b=VOvJPI/7XcQO/WHfhZhEzMM9QhoDX/arVUYcZRp9TVaIYQEq6AXlPpS88Afa+swPC3I9
	 voTj5X8OrAp45tUADJde7nUzJfQgGaJ0rAycmyeOFEUhd/X2OPVa3FEIfFlX/MorWKO7I
	 IqoeRJF0vDTwM01qzEdcDm0g9Ly0t5Y/pbXDnzEUSomZDBt+iZoSNGb+Upy7LTvqgnfCr
	 ZZDeFKyBRWhEUVPg8xsxCX1Hs06UX8frcaw6iFSqkvrvszRLxtfOOgXNES3hRx/FN7tje
	 Bo75BYEsX4VyGkrQOnsC+yLr9njyrRHJAwEzRwveviSTmdlvWAvcwuCR5HUoJFXYCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596135;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=bfedwSxwQLGGz+Z2vyd2vC4NVHhMFBOOXh9XyPwMEUc=;
	b=DFhEjJRtmY9DB4i04DqKhQPFC/3ztdR0gGjpents3F8tz/jpv6QT8dMQcZ96HubnjKmb
	 DppqNh8Cy9wVCRnwfyBRcFzg+4ObPOrCKJfhvnVTd2eVO4PPtxHtxKOOTQyISB1+d8Q98
	 3RukrXF/ULfp9qT4zC0e7ed1g/3014XqrRVMUT2AL202o8sum2pN18Y4Wdd/RGAc0WNMt
	 fPgj+iUPIZfnPVb1SJ181txDUJw/dXVB37x4A3Yf+g0V8AmxWdlTpXKVf0yV5NGrDedoO
	 nntJdCNRvBholjRWLr9ib5HCwNxJ/gdpyMxhNlJUvZXVVuot39gGzFkOiMLOAaXokbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Px26KOns;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CTaHRziO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC5606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AC5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Px26KOns;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CTaHRziO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795596133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bfedwSxwQLGGz+Z2vyd2vC4NVHhMFBOOXh9XyPwMEUc=;
	b=Px26KOnsf8VzWaT5M4+AXcSNp0xsxvL1F6fNbr7DrhkBSuZfc89DxLbq56hteEnSnsCC1P
	XC0DDlgCO9PWNvFGT8J1/10w32LNQmUSnDexmrqotpmPjGLs2yIpE9PleFJrHiOlcSpJF6
	hVsBNoRC49PsF4OsiUpxpOfl7krYqVU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-RzSHO9_WPMG70O9-iJsfYQ-1; Wed, 25 Nov 2026 08:42:11 +0000
X-MC-Unique: RzSHO9_WPMG70O9-iJsfYQ-1
X-Mimecast-MFC-AGG-ID: RzSHO9_WPMG70O9-iJsfYQ_1795596130
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb8ae35aeaso45981275e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795596130; x=1796200930; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfedwSxwQLGGz+Z2vyd2vC4NVHhMFBOOXh9XyPwMEUc=;
        b=CTaHRziOWhRLfDiA8sCcG27lxyX/1F5a4BlJiDD4p+Dl3MZv4mIP2LFQIu9P+CC/Q0
         7GeWfauPuuGzzBVopwUkXMjSdY0IeQb6VqWY1ZKXhwZQTxtvcneY3ow1rnl2sLbQSe6+
         q2sC4CvyAyDXmFRUdQA44PynRRUPZ+VnLXSPdGCabB+g/AbHVMcNXZAtypRJ9OEPz3jc
         fRIxNfxVZ7Lqsd+SUDSsbqsYM5tbCg6me929qizqtdiA/G0xcdNj1/6+oh0VdN1GqYSn
         3IdJ780DHdDGICVzxUquB8k+nL3wERpQMTCD2mK6DmirW9i5ILUZDA40nIT3g1djYNZN
         oxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596130; x=1796200930;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfedwSxwQLGGz+Z2vyd2vC4NVHhMFBOOXh9XyPwMEUc=;
        b=V0S2jSAqsRS6BBDG4Pz38oXhoRY1Jp3CjRVBphv93EYS9NLl7bD2XHmiP/4+kb+fIM
         /WC52fSUESw0srPkrul7ovmyPkmFAxX/v7L1mTYstpIMoGOFJpm7hEBSdDtTJWKE+Puw
         QitBBLV7XOGSCiEixj6ln4TqVsajdW7AgRWqpTzkqA4xD28fnl5/MBXfm0klRSp5BFBE
         qsEMNYWej2+cyysXTzMoWiXX031YRdPQmLbRFVuckSdWzuTqEl1B2zO/TJ1AznbZIslu
         xmRVkZUhBtNoz2C9/e/JpNQ3qVOuZG0+WXQpiHok2iVb28RqySC5W9SJnXG5bGjGAUFA
         rb/g==
X-Forwarded-Encrypted: i=1; AL+hErHQS9ea2e1BJH72PMoldj3/DKP+EmE3i8IuiDSTLEBseSJY2s91t47rnKq05Rdxoh7q3LxOFOT+SwMWhKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TTBcjGaTrogzfdJCh6/HDprtafmqw6tN84pJOa71pILANS8OE
	wiqu/ZB4cKkHvtuLOZbpAovE6rpzqZHR2m0Of3j6Tj5wIxKObPGX3bDe0gUpRfN/sz6swFydhCd
	Z+9HcRkXgNrNGBaPq1MN08qCEDp1Lcn4+u4q5vWQIHPGqG425UtSAEGTJLDcMiW1rOQ==
X-Gm-Gg: AZFdTZce0JTP25cc69DNeKgRbYgiFu+hWHd7yWvd6FiJMC2centd7hlY/j7KNnFJh3T
	xjRf7RjBUSyxx9WLRYs7XMCQwnHO0skxziZmCOqWjZkJErAJ3Zh3J3m5nSVBzNdynWnHeyKSA4i
	aCwh/UULkDP7SyJaROwkRZfrntJqg/p/oHqn0LeX+dP98ofnEWbqRGSP6q49GA9QRF51l1yYsXI
	fGcbxIqsolXUrgJiXIPCpkTdTRUiky1V2bDYDby7Zp/+5sDk891eFLmLqb2aM9c2Aga+CGELe+a
	W3noze+HSninSAttqjnVpNcx6nvgx/dTex6yJ6lrMjjPaZ8Cu0j2c0KWSKMS/NzP1RmytuuDcDz
	NGbl1P6ULCYS1Byo7ozihZPBBblMBvxTgZ7vjGHPWOi5ONHP64FitFSPIE1nvjh9TKD6geCE08Q
	foJnuq0+UH4yL7rjbVou4JqubwD9ADBGwOlkIiong=
X-Received: by 2002:a05:600c:4584:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4bb88817aa2mr346072985e9.22.1795596130193;
        Wed, 25 Nov 2026 00:42:10 -0800 (PST)
X-Received: by 2002:a05:600c:4584:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4bb88817aa2mr346072345e9.22.1795596129635;
        Wed, 25 Nov 2026 00:42:09 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm32983935f8f.5.2026.11.25.00.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:42:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yige Jiang <yigejiang86@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yige Jiang <yigejiang86@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] firmware: sysfb: Clear the device pointer on
 registration failure
In-Reply-To: <confirmed-20261105-25-a16124b5ff57@gmail.com>
References: <confirmed-20261105-25-a16124b5ff57@gmail.com>
Date: Wed, 25 Nov 2026 09:42:07 +0100
Message-ID: <xlv1mrqxl2u8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Yige Jiang <yigejiang86@gmail.com> writes:

Hello,

> sysfb_init() stores the legacy framebuffer device in the file-scope pd
> pointer before adding its data and registering it. If either operation
> fails, the error path drops the allocation reference but leaves pd set.
> A later sysfb_disable() then passes this stale pointer to
> platform_device_unregister().
>
> Clear pd after releasing the failed device, while disable_lock is still
> held. This makes sysfb_unregister() skip it just as it skips an absent
> or already unregistered framebuffer.
>
> Fixes: bde376e9de3c ("firmware: sysfb: Add sysfb_disable() helper function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---

Thanks for the fix.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

