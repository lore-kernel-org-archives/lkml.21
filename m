Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206883;
	b=PpZ+hWexX1a/0CAwJ7UWg1pF4ECYzhr54Q/Ya141udHDQm2fwCXP7uoXTrQ/ezos0/w1
	 u2tHNG2ugECy9FuWk50tRMGmL5lwaOnka9UjFhLpkNJ+jZrqnkhHh+ipH7QwC8wBbVOAt
	 tcGoKJ1Q5+Wguo7Blu2bzfUxvIwGwlxdbMLa/OZpEDlEJSfk2ILf+Zt5nxhS2zbGacryU
	 YlYsCTxVZ+8DpfTM/hPGziKjBCPxobhQMqZFnX8guUGXiB3eKp1W3BECrTb5NePIUsUDI
	 6HB2t96NrjB5IwKxlvb2YmdLv7gw9vcWgzCJe+0SZiEtxW8dACTzyRRYpcJgWh1vohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=qtEU8b+Rw7oaJsWf+sYIPuoXL8GdHMocWcBYKlWujUQ=;
	b=1C88QrRSLB/XrC1KDB/6pFH45tCJL4k/ksZYDKHr2t4pPgxlbtpAXROW8dbNptSovObw
	 X7SlOMt8qze0P1WSe6jrd8x02WFNCHRhSCx9SjsieCg5p9Nc84h/FY5uUheetr5Qrr116
	 WdyixycPIHZIkK4AfopCFddE40ynrdU0rkszRBt8QtxrXjf+hIxCJwhxwWFnGYiozAE0w
	 LXCcklhvSK3ebzDkKlRq6LHzSeRPru5GNoymDqOzLqdQZu74FmPpsy3VEVq9eMM3ikRVo
	 uNTRMEUleq3hHcxc7hF8NEcbm5qgoGYx3z1dcnbyrvxff1qDL8WmbSoLX/PUBuzOs8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5yeIS2J;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B68606A6D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B68606A6D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5yeIS2J
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55d2f5f1e26so14772871cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795206882; x=1795811682; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qtEU8b+Rw7oaJsWf+sYIPuoXL8GdHMocWcBYKlWujUQ=;
        b=q5yeIS2JOBZN8SyUZivBafXJ5weCfBqketjq0eLDKLrN7YZ2N6gR0MhBibsYavzWKn
         Xe9K3kyC6GDMe4ASXmusLzO6cObMlo7JgOQb0MTVxP7sB0Xk9qz4THLnTU1Atze6HCLu
         ckY6hAPQXY62JFVKV81+brWd3wGIQQZ1nCHZofTLRe4aHHo5WvHvIAbo5mzkZ1XJrv9E
         X5KqaS+8FI65FlF9mm48fUb9Ks1ShjexokRsIq+aSICvVEdu7Sti8Ha/yFb3H7ZALz/R
         a+eEJUcPqupQcPO4y9CawPOhtI0i1T/as35JX8fDYOsjurYeArNxBQKygKvO0eCRlc1o
         9+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206882; x=1795811682;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtEU8b+Rw7oaJsWf+sYIPuoXL8GdHMocWcBYKlWujUQ=;
        b=OaLJDDPuxEncaDzFHsP4ZcPc5lMTsXvgGJoTNtE6bFz7hScKDnNAV9t26dbegKUrpR
         De3+SP3rwB85hyLrGFHyq2ftYQvNv02V+LOzaOIejcJSV7NzPXuCmzHNBivCUBszVuV2
         FYvKqxjMCTePfy8eJ99LZI16lAIgog5z5NHTK9B7wWninoeWujVmgjAeO7QJidz99N1C
         waxfAzcNs6E7rgdt6HRc3HtfPytiXJk4Yf214IWJ2Cbi1oWf3TM4R5WLIjckyR3Y8qZK
         kmcSVOF/V65Kh9wLW0hilUL/EXf/VuTo1zw1YvczKTzsH20gXL3caLe2A/qMxm1ASAkV
         U53w==
X-Forwarded-Encrypted: i=1; AL+hErGbqmMgRE7mtau3q6ReJlQpnGpnun/31x7WFDTWXjXqrBtPfLFqU7vzaXJRpewiI6Fgda7CvrF29DHc3BA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n8vtekCAIo2ph6+iGum/lqLTifw4rGR9sUQ8ZQWK/gnwPW0wM
	BfkquTyyd4Yyc5ezbRX/QOegFAiuKgGomyS+AteL/1I3NaitQYByvgap
X-Gm-Gg: AYBFou0QDT49nU6V+DLAqVemPzPiBl2nw2CUH2Ug3AGNRKyOchYu5Y7DeGHhNX6CW6u
	WaTKwFttL78Q+k5TkpkL4CqC3hQg7mGvfbeW1wRMRw80n7suaAtyUwWh+r8AGiM/9LfOdoCZoyS
	q1+knAfAJxuU0WXez7YxwZpaNm1Eg3rkwKV3vQpAIulM7OKrYMKuhQRzGQrtH0NojEP84atui/F
	sNOzq6WK8co3h/h20GZB/m6o8hgpr/rbefzHM5KzNPiyVqXW9wSMaD1MwDnWVp+9Z5pBxxRnhK0
	213qSDKfTGBuQjXUeVqhiQD5oGBznS62DdyAKCYkoZqyGDbben9H8Ksl4AaoXvzBzgJZFCV5oE7
	JqOaK063bFVTI2FHFaS9LRFbE3CqiXvzNt/aIoVUcz4rVoWD+35019iaosLfJwYseJyiCYv9MXe
	hMW3IpBnT3ALHvGxTMh3w1lt9AqyXqfVKmTWXCJD+6U5tvLGGSawWqS7sK1JL9AJkCFvs1FjP0m
	x+vqMmFQ6phAgl9vXH1N2CMKTe1+v4OwioEUhZdM8+rksf3CoBcoVOV+oAh7VM7QlH3BbI9u9sF
	//Z3bnhe8TW/OAWngOAIjnWCdv0B86ch3BDiTkeyVrAifTG9bHeFYvlkTmra
X-Received: by 2002:a05:622a:1901:b0:536:6856:f590 with SMTP id d75a77b69052e-55d76a269dfmr80867651cf.18.1795206882285;
        Fri, 20 Nov 2026 12:34:42 -0800 (PST)
Received: from smtpclient.apple ([199.30.143.73])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7844f9bcsm32619781cf.1.2026.11.20.12.34.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:34:42 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free in ffs_func_unbind
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <2026112053-skating-swimsuit-9c33@gregkh>
Date: Fri, 20 Nov 2026 15:34:39 -0500
Cc: viro@zeniv.linux.org.uk,
 r.baldyga@samsung.com,
 balbi@ti.com,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C24E320A-EF6F-413E-A618-FB7FAF023F79@gmail.com>
References: <20260815013818.39466-1-shuangpeng.kernel@gmail.com>
 <2026112053-skating-swimsuit-9c33@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Nov 20, 2026, at 05:21, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Fri, Aug 14, 2026 at 09:38:18PM -0400, Shuangpeng Bai wrote:
> 
> Are you sure this is ok?  This means you now have a double reference.

The get is paired with a put at the end of the function, but taking and
dropping an extra reference isn't the cleanest way to fix this. The real
problem is the ordering: ffs_func_unbind() keeps using ffs after
functionfs_unbind() drops the reference. I'll send a v2 that moves
functionfs_unbind() to the end of ffs_func_unbind() instead, so no extra
reference is needed.

Best,
Shuangpeng


> 
> thanks,
> 
> greg k-h

