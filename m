Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414399;
	b=e7hnL9ERSA8oLirpbaITmjZwaFCVTSVPj5/7QP55cDdzgfZp+HvemZhszpBsDkCkWADh
	 ZNRdfZb3E3/2HzC1HkQmm4BBJsg9sbbT2RyTQX31fdtw5Jf/kGTm/pdZp6zmXfrVJRmHq
	 1+RBoZon0xkIo3mT/eLCqNRgTB5Lh1gzeeaL5jGMiz5RFUHjEWycpPhNkAufnreJSvdDp
	 NHiTAivXrzIkbaOwYYK8QmNhC8t/H6+ArW2qdgJGqegD/nh1YHCqsE7MUDXbDbRInWpzn
	 2gwfky3a/J0niBI01EVbuXhXgADsIPA83w3xmhL4WOrGZEPqnucKKM+pfjXp9CmjrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0N7YienSVgGQFxcgNWuK1q2ts4qQJpa04K9gom3nhoA=;
	b=vw4zV91SVvUerK+XanhI9p5MA4VqFbg2UUKs43g4PVAjUm/jZtIbZrsLqeqrsbn5vRIG
	 Bb/I+6KNH01vxpivK+YYJteVsMiQDNYdJ5KwgpZDZvHxtMuNKixRaeDM71zNW9n0E1laE
	 3U9QYsODcEo/3Ic8bJIae+DW5gtbnQ4Ix8BpMeq3NXKW1jT0QK1QGxmj2GWVfe78nCHJS
	 8a1EbnVX3Ea9NEuATaThJC8+Y7VOJb6ki+O5PhBSogktdx0mnsti0/eYddwyqcr5cbKS5
	 MF5onb0owf5b2Q9O6HzfsuzEZ/qwdSwS5F9h875tR71JncwZ0+QsXIzIOCuoMCWxn3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LFRV01aJ;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CF7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LFRV01aJ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so8872010eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795414398; x=1796019198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0N7YienSVgGQFxcgNWuK1q2ts4qQJpa04K9gom3nhoA=;
        b=LFRV01aJZ928UOLxtn3AwpeoQyM7QlLD+7FOoyteQ1ImcG8cp0kL6t5Gz/pxFC1j1Q
         3mOu+DHuYYifyjLaIEz5gsPajo53med11ulGky4DEt0YeMqXH/JEos3L3D+c4oPRL015
         sCQh2Ba9EwLNu3CYyLkRGZngiBegROhZZPqYkRzO5o9BqxBtgOIZXl+BKyUNZpOYB+7C
         5x+BBkrBHbutaNdF2bRZapnU2964h1pbx8Ciu/W6CDBoF/1uxFa+62uc6zBxnzOGS8BJ
         s64EqiXX+ANTjOYZYuA9ExCcw+3pDgbv6c1vKdNo35TLcTysA7xAhwaWqLNGeQS56wV6
         2b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414398; x=1796019198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0N7YienSVgGQFxcgNWuK1q2ts4qQJpa04K9gom3nhoA=;
        b=fRDNoqQfddmzsmGYqDDUMqx9IENw/o8mI40DDhN3FfHG9WuzC8nS2CSsXc0/bYb5QN
         UZ0P9+JXicP9+9lO/TucSG3BMSmmHT5AoBt6YyU3B/IOCmdT6AzU4GEDyCxHy1BcQYN0
         xVusoZN1TUjsZ+lqfxeA+QyK0N5hRn4chN0f8OkODo5Pq9kcqrvc2dE3Of0m/xDhMY8N
         YxHbGa892JI8oFLlyj3HXKE0jizuQkp+6HtCufH1CmaRef0cRZNQ5NBFOSmFn/7WzR1y
         kkwTIOd9Vy+rzzs5s40BXEDe+c1hwsVF33tpWScSuagftRdP0y8RSpbgSgJdK4T9V/H9
         K4ZA==
X-Forwarded-Encrypted: i=1; AL+hErFjlS45OFoQL3GyTXZ/B2/y5lv29DVahkSNWh+UA2aCflNqX41ZvcbGvSRoO5ZT+6XUr28EHNYUCqvYkI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ElKsMNRlKm/JXxJ8pOldbkIELbfe2xmzJzgq4qwJrtUP2t8qm
	QZZuX7sO1nFuYnfslF5Llk9tOdpJcSFgK3syERO7yHzygVkHbg2gU5ko
X-Gm-Gg: AZFdTZclfrWtkzpUkjgShcrLEMR0iiBzKfuXswTxPfKu9ea+UInsmlWrT/7j5KOllWl
	iqPSdjvUkzWAJ0ipMdpTsKrOXhfZKTReUJudgPsczjyjek7BTaGbKcoWfqCrCjFtYVrRBCD4UHr
	IS9NnWnGqUuGfm3l22E0Dnm7yj/VVw2dDHkt+TdsQ5TVZpyhHjn/sPNNebje0+fVFzlk5A6hs8k
	3Y6el+/TxDMrm8Noc0VHV95A0tzsg99/zPjseYP7/EV767VbwG2pFxuOPxPYsV5L+dOzEY09RtU
	k6thbfriWujReJO3X/S32ygtDaV2T0JZVN3UUTl0+YtTj+lmQY3MpCSREeDCx/AnrJhQe3EyrXp
	x9FQfeaA+iOQcWfMDAISLA+CvT194b9JbFOq/akW0ugVM/d4QdlCP8ld1mVMYKGgHnJXH7aMRto
	/CPKTLC3Bcxj/jQad25yT43loUx8mPKQ+ZIl96WPfNhA6MI6JxLDvOPHIJBHg2ZmqdNX/tyvaT0
	me+S7VhdmDn1pRdODRN6fxEKINCLFIqMt/P9OVu5YSQR4gLlhQOYc0wr8JU++a8tsEavd0X8qBj
	EQDzyn2tfZhg/h7RUOxEhhy7ef8gtiIL1CpdljyJCKvIjexZ8Bm8iI/JdPE+MFqkn2GhbYw=
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr5716537eec.25.1795414397956;
        Sun, 22 Nov 2026 22:13:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm38645290eec.11.2026.11.22.22.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:13:17 -0800 (PST)
Date: Sun, 22 Nov 2026 22:13:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kim Kyuwon <q1.kim@samsung.com>, Evgeniy Dushistov <dushistov@mail.ru>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: max7359_keypad - drop platform data support
 and style fixes
Message-ID: <awPZcfJPvdseLBsE@google.com>
References: <20261112065059.1802480-1-dmitry.torokhov@gmail.com>
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
In-Reply-To: <20261112065059.1802480-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 10:50:56PM -0800, Dmitry Torokhov wrote:
> This short series drops unused platform data support from the
> max7359_keypad driver so it relies exclusively on device properties via
> matrix_keypad_build_keymap(), and cleans up register bit definitions and
> argument alignment.
> 
> Thanks.
> 
> Dmitry Torokhov (2):
>   Input: max7359_keypad - drop platform data support
>   Input: max7359_keypad - fix coding style issues

Applied the lot.

-- 
Dmitry
