Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858628;
	b=bJkSmlgp7EAuo3aCT8BE0MWIVUZlQ2eYkZUZ0ETbd0U+0oRibXZpDyXjrqHzRlFueHeD
	 ryS2ocaeMDHmgb9jLMUkF/SRj2z58/iN/4vmROplD2m59KSgzwWDXYFRkIHtUb2wltCzF
	 vYEwcslxM63BhXDGVuKDw4OzCZzv3Z1MNoqBDg2XLXXiYDL03kvA/BI97UdzOYgFifE6c
	 e2F80gcYt1ycqGFSQ9f4Tu/M90b7gFch13SJskylWyNHiIDoaLWO8RF5SkITcNKNxn/Ja
	 SH2HOdi9OFl1lWjt7ckUJr97EUdV2mzJYouXhSzpxSfzWI/4hP/IgmZb2OJkyS05LNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=nNfFTTNka5fIOddFDJ8PGI7qQNrHsISszyTlsbSGy5g=;
	b=HZvWu25kgeIw8hskn7qZK3c4mhK1E42ro+L0mMFRuod+dyAXHO9/iMR1GCDzxqmCyD/u
	 YdBLZexHu+sx4Q0FmYgCrVmFEkpEFRyIZH4/mPbvv4qvdCednHINI+2eEx63PCzHEMFYp
	 fzu4Epjv3Bt/fEt3bdCoKDbrC77POr13vwLMJaHnV2HlOleFQP2Q3ztgDiy2pIVZZBS09
	 yqNC4dc2zF1kKDHcqnXVQJsqYc4gePInU2C5X5rd0ykn1nyqPyYQszDGjn4RjiA+iIQ3v
	 Px/YhrxBHwaMsvYlawCK0OuKZZ2nGY9dT11pBBTSH+N+TSYLQMJ0dzN+nordqtTSyUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Wt5TkJV2;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A490606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A490606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Wt5TkJV2
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4e2fcc300so77132487b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795858627; x=1796463427; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNfFTTNka5fIOddFDJ8PGI7qQNrHsISszyTlsbSGy5g=;
        b=Wt5TkJV2cpQRVDm49rBdjWiR1vSzhgbVbPyjEWPKq2vkAp1CiQcWp96Z5MJpXmyjga
         4zalRErWPBysM3c1roCQUVr5fK5rUXmkkSg0vPo0+IiSqHoQD4lJO4ay4ebww2vpNppy
         dH/WMHHQafMqM5lrOkicyHMs1RrILPL+N/tt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858627; x=1796463427;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNfFTTNka5fIOddFDJ8PGI7qQNrHsISszyTlsbSGy5g=;
        b=cbXOSMFSWxBAyNUAdfHimrLRKzyHe0BfQafM51dbSTqW1U/BTO+Wg9HEbVt3yOeg1o
         fna3xVdbB5o9EJp98Nvpc7OvPp/maZ8rjgXDkiZbKyoJIUG2wV69vLKPVBUcDp1QJ4ZQ
         Go9/oEKPvuA5BxDhYMs7iMCBGW5piBA7tnF1rX67rYj5esCQJPCMmtRuMu7uzdZxm6hG
         Zj7DJVzjtnA7/9qedApjCsB/NUzRDXdQcUBqLiih8QOPKonFFpi2sKCjUB7JgM3MbFyU
         GeOXYAHG/O4mXsZuSWwBv+sldZ5Thga9fkY9luSvlqLEJhBYdCw58vQlSXyQtWPnXoMl
         ZsCw==
X-Forwarded-Encrypted: i=1; AL+hErFSbVMrR2u/fs9GAnIXfowWchN5nau1o63lGfkkd/3OT9msw5EZL1ahy4udqUhvOiYpUcelEFbykCTFwuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hpS0TAFuTZ92SQoEpq0ZLObewpIyBtNYHNp3JD1FOBaLu6X2U
	iZMfWjj1w6Eb7palZAVfSKE8CoYfHhM0njr6dBD65iCUO9u7f/8bYd3PjDN6UwWBiPo=
X-Gm-Gg: AZFdTZdukOg5QMXq+UnnF/pFSW5hODdNybFMNPmuSb21r2lm+h5BeiLzTEdQgqJHPPg
	7ygIoalZWw/MkBKXo2oc+alWI7IpMDJ7fCH3g8dC6vuZzEFHqO+aA/Ti3yeQ5bEEThdo7CtpVcu
	RBVyHiddxRKS0Gz2tAaOZDv7N3qZ9PxQxUXnXdAZcZsOawjTdXfATe/AFSVrJc9ubo+KHD2jjBg
	1ndXSGXOE9jGOoWrwb5QFcpqSS4BI+pAOXNjpaMon7cP90t0Yls6X7XTMp9l4wUr1S9Druj2VuW
	9TY8slmwA3Kru/oNs3LXV8VFY6kw+IvObW0ekttY0avezNwbHroYOBz8thquZdxaxHm07vO2jJ+
	kYeo6wikFtovzNB3wa2RnGYKqBoBhaeHqs2aLjuFwP0Ii8qlZaIFdW4o5mkse5zzFwRSOuSObWy
	XoYfE1NgfXiJPIxqoHO/sJHwhSilDcvk5G6Grl1hAS3z7TfeyHOCLjI89mNHmnx07nho6dbx7lI
	pOK3xf6jWJqslz8jyVR+godzQON+x32GlhvjAL0tWISLBJ5PC0zcifiK9Ag1gMQ+G9UJXNVBZG0
	n7PUzN7KEBaNMrwnheNQhGq1jBVay6Jz7jIAzAS7PdqBIo6LfcaSeXlzKOGVe0M7vWNQY15Iw74
	4n596lkcvLf2CpEV1ioMpQk1tPRewPrbNxmtjWaYL7RFsqhFhn8udIKYZErzxDe1yxUKorTEzVM
	mN4U+2C3AVRHNFNI02i/S/wQs0cbXZds6eVKAxNIs1Z0luco0mmOHbvqtbnCN8C36uT5RmUC/Hk
	ngnK/57xH5oOpQYJAI6UwQ=
X-Received: by 2002:a05:690c:3701:b0:8b4:cc42:9b6e with SMTP id 00721157ae682-8b5204ebe42mr105762417b3.81.1795858627420;
        Sat, 28 Nov 2026 01:37:07 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52036d72csm103270237b3.45.2026.11.28.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:37:06 -0800 (PST)
Date: Sat, 28 Nov 2026 01:37:04 -0800
From: Chris Down <chris@chrisdown.name>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>, kernel-team@meta.com
Subject: Re: [PATCH] timerfd: Support CLOCK_TAI
In-Reply-To: <87tsuaiet1.ffs@tglx>
References: <abuTTv9FC__H_8RC@chrisdown.name>
	<abu8cG7g11DP9nkn@chrisdown.name> <87tsuaiet1.ffs@tglx>
Message-ID: <awqgwKy5zmLqsbyI@chrisdown.name>
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
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Thomas,

Thomas Gleixner writes:
>Q: What's the big change?
>
>A: Nothing. Because TAI changes are already propagated

You're right, I got that wrong, sorry.

v2 will make TFD_TIMER_CANCEL_ON_SET work for CLOCK_TAI timers and add a
selftest for it. They will be cancelled when CLOCK_REALTIME is set and
when ADJ_TAI changes the TAI offset.

Thanks!

Chris
