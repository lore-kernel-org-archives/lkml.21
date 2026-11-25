Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602862;
	b=5KWWUTi+Fqwy5dLHsp7T4ff+2Z2IGSHewiq7WKl+//6IqH8hr//avzocGZrphMuaBCad
	 Cn7GmxSqWKI2RSEa2ZR1sRy4+wswCNogUcb82o7Rh1zQAHwN0Uakv5OSOrePD6L2rDCSc
	 E/hk5ugQGx9gyICFlC9V7z8Dkeswm5lJf0yExrreS6y6fR6AQQGCXbm4j+oPAiX6LLTm2
	 7YCVPcdfprh+xXEZPbgkF6kcbZ2fQKoSZcqr5CTVdg30QguP4mBD1+Kkos2B3Qlc3tFCR
	 kHJHQEjaVRhFD0NR/8xSeAz5/uusuXVW90L15ugbKa3oS2DvbpuNEvQlR+pniM81ekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x31Cn92Vg77F6imWAfZybXJjBGrGrkLdCuHHEheoTWk=;
	b=feCPnqTVh5dBLt3mfNPcYUuxER9YgtFgovo0MvuXSQ7pGYF7th55PQ/gcDz1xIpXmV+d
	 SDPJexW23zpRsuZ/yXcjSctIId7JF5vPRCYTf8FZyP7a2oPxs5bMoNEP1XR46hIFz0fsY
	 58ZpqptbEP0190WTSTErm12SPUQ2ybcOZ4LEwQza7+FMe+Qnq7gjaJbVZVZ3gcrJ2AQvB
	 ZT/pJ2MCYYZ7H2KxZ3LBEMdEbtYbNLELQBJiiHsfwWhk1t2t3EyLEfmqUoqqf4WbBG/oC
	 KtxKVXKIx9okt1hJ23MHfccJvB3SMaQi8jUMIV2Ckn37C8+x2FGQCOeEi/7gVVPTKyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m0/pdZWQ";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63E606A697
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B63E606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0/pdZWQ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so48398275e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795602860; x=1796207660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x31Cn92Vg77F6imWAfZybXJjBGrGrkLdCuHHEheoTWk=;
        b=m0/pdZWQd/akZd684MHofbJLikXBgQmJGzt851v1VkMCEsxnQAEYZiG3CXXCZ4wc0V
         eR8J6vxWTLKpF3BjK6Z8cNGnoWTsuXBb5DJM10EKkbwJtdl97+RPBc4fPf92b1YV5eBy
         QiNoo6HixxMNKGjHkzmlwJMPZTuecaoG9IL+lMfmJm1kyCkPCMGzsZusnRYOsgTQ0xge
         KIR8hk40Ibg2V0sXoeqQU1Kz351RQtQXnH3Mo21gajG80yS3V3QyLtLELn2JfIZF0jwS
         L38MkUlv+QGZVkNe1GsOCJAEjABe3nlSC72+TPg3FwsskfBhARS2CzPww2okMG24xDYY
         mESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602860; x=1796207660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x31Cn92Vg77F6imWAfZybXJjBGrGrkLdCuHHEheoTWk=;
        b=JsVHeATOTHZK2zJm8pihtdYHepkVi9t9of4iN+AReIe4c/StK9ISohLal4fOB9mIN2
         vssM5EoCciCEXHWQVbo6LzB7m3U1hpi+HvbkL97Dua2FMyFGXZjvRHcPlGezTstEVtDq
         OjZNBPjdg6GPg0vS7NRt6fTurnvzrQ04XrGzksBUOho3td7dYhh/rgCVd0Tn5VhAllIG
         41RqJ5DJxiYq5nLc0UlT0Y/MK7kWKQsMa35YOwSiUhLdMY1gu9HN9n3kAq0tXxMJPGaZ
         kRIzjGw6uL5rLmtsDWR5bN9zFoF/zfh5YWPEIX05D6FOqawRcTJhVFOZDbhwlmSDaxCy
         4drg==
X-Forwarded-Encrypted: i=1; AL+hErEKRh8MlxZ1rrsjncN3EnRMNGtJ/Em+OFN5xBojEVcYZXJirvYwjYlruf0KisCWoIYkizAQ7Y5MZ8a3zvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ti5ayzXzzBmtTbJ78M3xSmO3bLfMU93HaoSIfkaqGx+tOwcO
	03EiECf8TYVh8YAzybSyw00Rw83POxtGwtP02ZDao1aU4vtZUJXy0WynUlagSg==
X-Gm-Gg: AZFdTZfTBaOizmsO/WsIA6tMKOR9j7nYnL/V4nAhdmCDgTurtI/9Goe91+Txlr45WuY
	7W/Xk1wBrLXRn+SrASxvIwj3UlIhUaTEsiBhW2vacQWWxGmdFv2p0yr5IIkJsyR87ji6LBGarkC
	cc1Ftni4nByWNffnO+3bMoACB/F2EYcfospP9V0ORNa3MeSTysLtLnz1U5XRctHC+20tE+MpSGL
	/GghkNkPrKflA6+3MfbmQ3Jl+3Z75TAMEbrVo7rRoOExjQ924BwZERWJw22XkLcjJdc4MPdmztw
	IetARfcEgdJI65dxe3zvjrRj3dHFkvQyrs0l74Pm4K22cbzPmjw82taGp7pCbsU6h5Sx1F3xJpJ
	sC5f3wetA3s5WQbJVJdi1Mqnmolto4dPAgqw+UeM2SrWU1ASLhbCYTxZRparAiCYdv5O9R9vWu+
	1liUfUy4uNBdXFFNROVClBLlIjrY6BiNiIb3kyyBULOQXELCJ//5L8o6ltm7uox/B8orX0Cqwyx
	2qRpt4APsaqHpmPYCsYBZcxk9foad+yZB383KzHHf2kwR8bbJwXX9C9x5lLDeWS8m0BnlkrwJjG
	ar4Y6uvFYUJa54xMHfOnpI7iAuKLttq4FrkZUqHLCBNK4Jvj3+cPB6trJZgoKjC1
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr368507105e9.5.1795602859819;
        Wed, 25 Nov 2026 02:34:19 -0800 (PST)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm577084885e9.14.2026.11.25.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:34:19 -0800 (PST)
Date: Wed, 25 Nov 2026 12:34:18 +0200
From: Michail Tatas <michail.tatas@gmail.com>
To: Jiaming Fan <fan.jiaming@hotmail.com>
Cc: amit@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_console: Put device on failure
Message-ID: <awa5qh-waK2uVwSv@michalis-linux>
References: <aoWK_qpSBeO6Bw0M@michalis-linux>
 <OS3PR01MB10251DDB055D1679B1EDE974FE7442@OS3PR01MB10251.jpnprd01.prod.outlook.com>
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
In-Reply-To: <OS3PR01MB10251DDB055D1679B1EDE974FE7442@OS3PR01MB10251.jpnprd01.prod.outlook.com>

On Tue, Nov 24, 2026 at 07:18:34AM +0000, Jiaming Fan wrote:
> I ran into this patch while reviewing another fix for the same leak. That one was dropped as a duplicate, but the leak is still there in mainline.
> 
> Any chance you could resend this?
>

Yes sure thing, I will resend this

Best regards,
Michail 
