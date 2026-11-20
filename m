Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177930;
	b=ThnacTy//iFdP15MFJ3/fNTsEVIzeKdOSAjyvZ4Em5JcNzYpD5Weomd7mxasudyZ++nG
	 Quv1VY1Hkrr938qxcfeO+bKvxKTxCKDsUA6ft4GbBE32XCugoa1XFKQHTzEnq/XaGYw+m
	 h0JdDnglRdxZ6ezR+GyW/L1zKXJ/vHpO1LanwYM+ms7h6A84YfoCfTRK5armZwiFh4TkH
	 F7XUVbyAOSCnbAbaHJoYr/YiBmg1eYcnrlfqEtBpxWBqlcb6Jnk92YOjXmExHYOffZJyj
	 x3hDjnpnlrayKy0EJznqcVYPnww419rU3FAf/WMrITK3O9NDUI4hZqi5vXUkNokACTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DHHoC2g4FGQOaFmO9WWGdPe07q737sEuTQ3ZoHdBQAU=;
	b=oT4FGQ2DAY9hmzaN2NRBYLYcCZtyR2VnpO7mKOON0yF6h2kbGaBgdoBNGAPcVeRW9mlk
	 x1jz69M92rsCEkxJ9Dsmtbfav6WVIZyyKnZCI02KduNagcGzmilHtp4HsbkTfU7a6oOZ8
	 5/cHVU+MbO9SvQi6XMJAz//c7EdekJde4yW1FlT0rww2ik9rqsSd0hHY7aNUpD7CFHhB7
	 Fx08nTZrVEzynMYWI08KdxMX53fvPDJvcilwd0b95/fbvO0lVlYr+pQ/I9zbFwsK5RToF
	 AF6klF4AWN2T/GEW63LPjzR3SJgy4/Ctv5Rvg1fqFxQS3abOqHKClSFV6rHjxY99urQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EwaulaKU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317B606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7317B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EwaulaKU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so7303175e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795177927; x=1795782727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DHHoC2g4FGQOaFmO9WWGdPe07q737sEuTQ3ZoHdBQAU=;
        b=EwaulaKU/ihxVGtFGLFWWQgrXrtqtB8wxtNGJ/BTiRId8UfvCjDMiFgGq/P5STLF0y
         vXbuudxH41LM/RIyeH4iZW8go/+5NtwFapXKpClSWAFHwfLvnrNPGseejfvJWmYci7ll
         7yyAxWtkElpXxXD65SEod4OOvjO3bqwoUS/B5Qh+sCvn1hricxS2Uy7lQD9sh0Gg72Xt
         Gst7/xgPnsSoPAXuPUcjxMqCER02RBNsHGH//VpQtQFk3FTm5Puh4mPd7dcWyP/9Ha+8
         phsQHO1NrRvuX7K3Y3fjdMpUFESRrHqOLFdSKFVkApvnVbWs+Q1f4gq7RV7/WgodxHTV
         coeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177927; x=1795782727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHHoC2g4FGQOaFmO9WWGdPe07q737sEuTQ3ZoHdBQAU=;
        b=mlLgSU2UnvjxbmStM9lBlylE5InJyS9DqVXl+NOrgzpHTFC+Plxfrd3l8IRx31hPnw
         yL7kqbNoOhrp2vCFzp4AUSLArCbfL8pJfA9bpP8VQwlu1erlpeWPleNCBWPbr/pOtbNJ
         tb3U/XK1f7Gysl6Nrklq/eVUFR0LwMiC46ytjTPzZCTYNIKtxHMS3ansnjUoQRM75XJ9
         DUF6bR/Xxyaxzeg4nUu9umZ+AaK5RZdPFN9yQlK8qQq/M3cQT8+9mIRyKIO92YiB8ybw
         KjrPvLheeVUAMSwXSErENQtj5HIub7gND6jsvYZu3Vf+gsrn5F8n6njSDAPulBDtFMbE
         znJw==
X-Forwarded-Encrypted: i=1; AL+hErHjmiynhT8ksWRt3d7UWo7Uo8gk9bfX4R6QcMlJvOpZOyguZPfYsToixnBURJt95SonzuJpefSv3zSojIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IbWTKg448FPq4cDW9ky/p6sn53W6HJYz2UurgId4lNkeeEJds
	Qddo9UfxfAjzUGVkGC8YpghVEOHdN1/2QQSv+dXG202aCBChJJX8W/xzqCeld0HpoXE=
X-Gm-Gg: AYBFou11vrQGtWgoyyVTlBUeCahgIDnX72clFnFVT6HwHFO/qHMoBtv4ea9vsC5ahry
	45GErcxTIczEhO+SCyk4qQi8fPQ+XzwFgVvt6c8iKiB84TtYnIetQedkEWyo0+ZzGrNPR32+VQK
	2qUuomK7UGucPs78A1M0Mk6xha1csgFe2r7DMNLt3uZqJDtuUiABhCR0rkjZweijTqDkGcEahbc
	bTvF3DofKOej723/OFQNy6/fkt4v0fCnAFGiTbwjGdh41WLGGBhom+rC0l7dT/BnsCrmSHEdVbZ
	xDbgvgPsRTdUQSsROGzSP0fazREGkwguB9PLXyZKZ/AJ49pfmq3b2fUA9oPUaHNqIWaD1UB3rqQ
	NIHM6eKMaZzs/TNCU/SnQm1mFOctfLNGGKNNUEwsw4/60Nq9q5qgJo0fEJOcRCke7HiqE1oh5EO
	SPhPA56+WRHsi1U7KTs2GX3eUUlvfssLRzC/1frcnTPDhtOXzS/KFVMnnskNcFqF12trZ43bc+Q
	frBLi7uYQuMhstpIgFJQ3SC0bj5kkzcgD5UvASzohzWhARX5J4LnCD0rXhs0Sk8Xcmy3FvrPorS
	PlvGHETFFO/hJESmOkBmGAJ6Dkp4Ii6Myfp4GVjVWw==
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4bb8882375cmr65235245e9.32.1795177927382;
        Fri, 20 Nov 2026 04:32:07 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm179842545e9.4.2026.11.20.04.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:32:06 -0800 (PST)
Date: Fri, 20 Nov 2026 13:32:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: john.ogness@linutronix.de, rostedt@goodmis.org,
	senozhatsky@chromium.org, paulmck@kernel.org,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: ringbuffer: Annotate speculative record reads
Message-ID: <awA9wqUfXuX92d4k@pathway>
References: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>

On Fri 2026-11-13 15:50:38, Zhu Jun wrote:
> Readers may copy a finalized record while a writer recycles its storage.
> prb_read() checks the descriptor again after copying and rejects records
> that have changed, but the plain metadata and text accesses still trigger
> KCSAN reports.
> 
> Annotate the speculative copies, line counting and length read with
> data_race(). The descriptor validation continues to determine whether
> the copied record can be used.
> 
> Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
