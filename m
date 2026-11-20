Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795169907;
	b=YWScfjEwxE0J4MEq/GQWyKpVLCh6wwKIlF31ioBIyEn92Vt7RSdpfRSZvBie/mdSqMCb
	 mulhbdOo/iaIiKodi52cWuVAjdkLvonXgdamRjh6iCS99z1GzHbzYIsrmo5yanyB42N/J
	 lIjCTAaLhpxCutQOGXSxvjCV0pRe5xNA8Hc2R5nL7tyLR2RQrijXsHgvwhSEyYCRPgfFt
	 8u6CzRJUMrGxSYtrX5nux7kxHyNMzrT7PG+fJTTGDv017i7yX+Ur0butS3F99g/fpMRos
	 NUkUHwCJ5oWCPwZkMsUAF/O7jFLMFjoWVZI3TuW/pVHAllQlgL6tX+gRp+iryCmcOyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
	b=2BPgfa6kPkhCZmDcsUjPk66i8Jid16EEkQa+A8QF1bOX9HNcEIqRPqc0rRxSQWFXGo/A
	 vv+sbHC4X3QpsmUOgj7w9sCd0bUU2hIenomX7xlQnWT4qzmzn1GPpwz4lEZlKUtM5SteV
	 V5QKf+BFf5FDrxEyZ6wj2VKmS+eKIGFT1AJcYQYcC4KMJc8zIoR54cXvJDHvELHcx2lKr
	 +cVoA2437LD1f7yMW2zuPqYMwkka5U7JBaFwm4kOm58ofeCqfyAs2t8gBL6w4Z79Vsysr
	 IYbCjUNT3rpM7iX71ErXgwMWHvkf0bMckZKZ6+PCYBYLAkhFjxijF/rsmcK5EMH5yBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xfd/1Xjk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1984606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1984606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xfd/1Xjk
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67db6d4054eso964598d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795169906; cv=none;
        d=google.com; s=arc-20260327;
        b=Z2GzbDvYhVZo+Fu9bo9gQ9HovRK5MzAOm5ylwTNgJOSc8ANV1s4UoTzogU2fekW0+f
         T5k8HKhphgn/ctGJHEUTd9c7hVqfhX1UbmnXE/1kl5Hf7BP9/yhCBsfWNR578mRDSOF6
         yi56x801ZiLQNvrrlgG7sOMOtwjyr8GdIcE2a+adKK6i+iPX+farIBFTHff4MgjGx/pX
         1EVCw7BSxEMWj4MxPQYQuxb4gIe5tAZPCM1iy9yMuqYzOSL8XEeAh5Kabns3TO+u9K3X
         QSQBHt8d3YcmK32CkkFzPfByItj6eZumLbrX+hK0eczg2IWFKcE6HyoGiXFos6Y36wPm
         JS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
        fh=yi3y382LtInVFrAT8m+aVFfUu7pPf7n9PwNvpJY0ihs=;
        b=mlqY577IeslI2bI37PzByWGhTRO02fXUewFHlPt3N0oXoTxBNI1b689NalDD4I/azS
         CBhs2TXUellPo47ZXrrnBZ9Zf8f+B4yXorShrSwI28F8ehELgiFOv2z1Rioq2JPhzNS8
         y8tI7Aab+bAEoJZ/dQWFoGC3WSwpawI+AoWDXgZ8vWToYos1lIGMCD6QAIwoTBySHz/b
         SqLbfryOtLjOG8TmL/XVGWBlAMxUgObVLGQlPXJV2GhEgllhlXL5643xZKfTei9UrcEL
         zJnpVrpeJliRM7HPSIQYx8v5SUWWC4tzmxcFGlEuesYFNPyzRxE+kPz8QkxVV7OnCAYN
         Eu6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169906; x=1795774706; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
        b=Xfd/1XjkL3FqNHUx8kXj5Q+8fv0Tj5lRXHjfiieSXxrU3bXlfPnutreOLGT5WoaE1K
         FkrXS9QNwZaDEOMJMm6YmfWj79VR8K1yNnXK/lXhL7yvm6j/hB3jeaP4fdFI+8gKzHXw
         rvkVn4YgrewrCjuqW6dUBezyiqczKsBR2NP/dk/NBV8mIhuA1BXM5imDPGJrOZEXGAIr
         etWeiRzVw+WcqTpe+EO4mk2DzOtObdWW63xuWHPHgQ/POjgBe/kgnvhxqHx/EV1sHkJj
         OGwQ6QBEHQpKj0SjULOZl14vmkHipWjn9x3StY4Heg6kMGXLDrwRWYTDPw2rQvBAsWqp
         ZoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169906; x=1795774706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SNWLb0L+OWBVvvcB3v+U+hDjyIksqWir4fqKX+sD6Ls=;
        b=sz3uuNEIo1GXTjufoTMffD3MgwyApXxHt2R2PWvHifVYNF2dIi9MBPdZKJyEHGmBpR
         I1MxUQ+sCAeBXy7aXsqT0sty2zClLNgDaGbBbyZsSXAFRG+qeU8eq+Xlyz6B2LqM5imf
         pu9oduAd/FzH3tt7XavTGXPBSM4aIzOnLAQTlrx/LHQo3+F+pNhdOSu7f21ogObAiHqP
         DhJxjDZDLoU1Km7UsDAvTo4qYQ0DMZN2TXsndLlUSupHm7/fUOqK7F8HTfWe4EUjr5yz
         bZB0D7DfBiRK26ScwtaG88X20S4Zjd1jMflrQqHaq1kfxjsdvHUDgVY6SvMQbqhZYXzG
         CLiw==
X-Forwarded-Encrypted: i=1; AL+hErEcCmsGmeLFikIUQQxXojT5B7DAWWgeSeSicuQT+N2IXuc0B/JiuC4zJR0KH6dvZ98gdlMy5cP6gp8KwT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qH9fl9i0KgMbMD8wzhF4NZTGBs31BzElNrc0XB100nLROOoy7
	gFZBCWbLQsnVPRpXX8Cqhbl9juhB70pwJIeAhkcGF4/2RhujoaepZJG4idqb2Suy4wbbRsC8p63
	l9WuUHpfBjJam2A4oOEgl0rSmSa4JN7Q=
X-Gm-Gg: AZFdTZf55PSXtsTYJ3bX+VZGKunOEOy9a7zTmdvJnKJCGYc6qFv298EU2ckNhCsbZOc
	zMi7F8bFFRrmGhTxnpuIpjmq70eIT13FsUSqmsx7decB6Fn6+zp6usz1f75zPFUDNMq8dBIThHX
	9e9Oms8lBGzgRpXJ0UrbaKKKlpoxe9XpPdcAMUruG7qLgtGwIm8WoiOnYdircRthgTWy3LPJIDW
	kSDY5CcUq3/AFD8dHUIU2SS4LMzaa2E85fwkxA3ppJTJ5DFif5gV0vsQfoS+wO1278LvBenqk+m
	0BM1H2jv9n26/9kdTGVxjMWuQ3AWnPtunFKglCZzlBivkX0SIGINhY7PGQdMfTRuDcbRNNDdIof
	ylv+XFiWynaLJo4euU+/rbwvfrP9QRSdbWs0=
X-Received: by 2002:a05:690e:814:20b0:67d:e499:b2ab with SMTP id
 956f58d0204a3-67df4441bd2mr775708d50.71.1795169905776; Fri, 20 Nov 2026
 02:18:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
 <20261105202110.1081296-1-albu.victor.m@gmail.com> <2026112048-dimmer-ravine-ae33@gregkh>
In-Reply-To: <2026112048-dimmer-ravine-ae33@gregkh>
From: Victor-Marian Albu <albu.victor.m@gmail.com>
Date: Fri, 20 Nov 2026 12:18:09 +0200
X-Gm-Features: AclHuK-qOUJSVTytZZc8wfC9XpvLA8OMQ4xXujI6KM1rGr8r-cqUyLmslYf83H4
Message-ID: <CAE5KA-NS5-yJXAHUofgmyCmWyjbjPSNdoQZi5+iPwZKabVbbyQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: most: dim2: add missing Return: documentation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, christian.gromm@microchip.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	parthiban.veerasooran@microchip.com
Content-Type: text/plain; charset="UTF-8"

A few had no Return: at all so I added one, the others already had the
sentence and I moved it into a Return: section, because kernel-doc
-Wall only looks for that. Nothing needs this, drop it if it's not
useful.

thanks,

Albu Victor-Marian
