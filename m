Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515581;
	b=fc3qnrjQ9QZeFoouhJmSZDfeAPNE2NFcnHa6IgBI8v5bdLsrvAC2WO5dKAgxrc9bHt7L
	 nGnjAJ2yg+a1q23ctOzsxQ8p2E+CDQM9qEdbqzfYDs7qZMENL9aKJhvnriUSicoFE9roo
	 +6m7Bk9TJhm1WXz9c5FPgNfGrF68MwUNJAZDTt9X+e3FKQU7Qsvwn4R4AYSjQgDJ8ua5k
	 SGbqjuSKR6Yk7OV11JkUrG79w/qesU6ff3rRnxvRoPsfxVr7HW0CDsf80F1kbZn6nB820
	 07UDIxy1+5BOMcxKVBYNV2iPC7rHJ9D2Fq7rcCPE7qjTGcD3N+JfFezzRWVAL1XE1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vH6drgK9ot5njBsE/YZMMEhVCDG/kWSIdnxHYLHlo8o=;
	b=a+Tj0x94wl7SLxl2nh0c6qRGWF9M0wudwnQtDdpBoHPdZa1Pukyt2dh81Auo3txs3ojI
	 otbLYYZntRCb/xkF97EevAaSSnkijFaop7ti5Lr/vZ/WsEDHYdZK8abwtFFScK2i5qePo
	 uoFfCGBquUrOHYChwZveW52WBGMdhS3na+mWu9fYL2IjCXAPyeuJHf9CJrPxpDntHsmXv
	 rjaQmaPEKaDEmD9nuL5LIo3l6FPG6O446kdzmbLGu1NHwG/kP+i9qv6vIFhxPuHZei4g7
	 FKhykGCOXr9f6vfxYc5JgqP8UMLZ8YAy85InD7aWcu5QXrBWuy10obTHOURDd3otirQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CCBzgWcz;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737C5606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 737C5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CCBzgWcz
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so14169035e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795515579; x=1796120379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vH6drgK9ot5njBsE/YZMMEhVCDG/kWSIdnxHYLHlo8o=;
        b=CCBzgWczWBb1kZ3TuM4Dp29a38K2U2kDAwWI496ao/dWSmJEtRHKA13urE7B3rBpWV
         sves6Cc7iY44Ex0aeoR4LqIsTJEuHLI4I9Y+UAdazwNa5EkZY/nOag8DfjjrwT0/B6FD
         qYkBEfdkov2AWijcBuMpGixvl39TLsNd0pHfuFrTDYFT5thqopMtdRc1BK/7Fu75HxRA
         tvvaWNpzZwxbNlBzQLPxAot5OR3tEsQOIhZtsK/dngf+JMKBO11E9im1iTN1KKxaCF6H
         tAXnEFQJ1FQJ+mfl8dCl9PDiW7KZcE1sRoeeOLRXDrrVOobcELDw0D1rh4ozCyJZ8eRZ
         5/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515579; x=1796120379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vH6drgK9ot5njBsE/YZMMEhVCDG/kWSIdnxHYLHlo8o=;
        b=q3be1WkSsXhA2bDD4LL/wxiOnCAHJ0Uv9Jyh3YVNSsLE207PvIIe2E2/y9B2NxC+PX
         gxSQVKurnu87Pm3oKt3g69bkxXoqMzauQaXCLCuJKyBqQO94Hsli9tsKV5u6V1BnKg0u
         Goz3oBz3CzobqghO8CxPKY2NSc3bAG75cmJGJZs+5txAQ8tnZBfJaRgy7ZYaZKm/HR85
         68NkNOIs0Qogi+w7Q/HFL5dmkATnfDNgbRVb8KMpqb2XRtDC7Lr/uVVx1nSGGQxndunn
         0ExZOLPxwaEau8mvvmKN7Zs5eSRuarhlNr47o6mYYCc/mQD/zQSHio+IeqVcxynCObhD
         OelA==
X-Forwarded-Encrypted: i=1; AL+hErEhi95vc0VypaqqtTEvNlCG+Pqi8vwIm6BMZjdvJpczkvc6+E0zSQ9MPOrMrfz4GIM6auUhiAr1nb/1VBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7qcxTy3k5GY2LWD8SjZDacCExDxPQycOzFJFVn3duMBGwwGSU
	/E5k685FiZh7ikbuk2hfvAcY0NqmsgAijm9cAuRP9CsaZA6y/oA6/oCdHyRhyEX1m7w=
X-Gm-Gg: AZFdTZcvdmxgi3FTR9SDPpI9a1jJaHRbu5Ew/JOdye5NT4ckjI0G5TlHufobto4kY/z
	9a8/ypYF9Nw+0DvDuf6fxFaAz9ObySKBr5sZwcAgOtRZu8XGM1F4vxdHJRv1a4rNyc7HkE60w8H
	Fy993OcFCOraKMKbMgmAjnfJBLStbuM/KXNszs2r1PXk27KEshUlFBqFyF81tCOn5mlSXDZsUrk
	PJvE1vSnGX/XjOFJjXNg91dNU12m8R/9DvCUNEPkegY7VcGr2qD2ZDeS8Ygc6u6KRryrMmHuDAn
	QSe7lDIAjwwFYwuSAIis8KKm5v9ibvong96h3ZD3s7nhuwXo5dT+syFdbFpBExao+ln1h6I9ivN
	AkVund6VJsli5IATHU+0rI3ruZIZ8KdQCjNZkCSsy479/Otzuu9fDrHr9U3NK8a0/NvX4/pOnZv
	eC3/ULd8WDgm6QN/WTCHULBW2UhOot3IRcXsbW6OtnVD54ESJqdkmDVPqLsvitW8MOzcIqvXp6K
	Pa/FGAs1OyL4QbHhocSSl4salNkOASc4V/Gz55KneuCcLlQ8uNT5xhuSGe5JhlbYKICbmP8RoxB
	uT79IjxmBPtChJzVZc/iB8iDD6JDyKQ=
X-Received: by 2002:a05:600c:4f50:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4bb888063f3mr353813745e9.16.1795515578920;
        Tue, 24 Nov 2026 02:19:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm437410945e9.2.2026.11.24.02.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:19:38 -0800 (PST)
Date: Tue, 24 Nov 2026 11:19:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Chris Down <chris@chrisdown.name>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Fix skipped entries after index iterator restart
Message-ID: <awVkuPWD6DHnuV98@pathway.suse.cz>
References: <20261116085609.476250-2-thnkslprpt@gmail.com>
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
In-Reply-To: <20261116085609.476250-2-thnkslprpt@gmail.com>

On Mon 2026-11-16 10:56:10, Avi Weiss wrote:
> seq_read_iter() can advance the iterator before the next record
> fits in the read buffer. When iteration resumes, pi_start() calls
> pi_next() at the saved position and advances past the pending printk
> index entry. As a result, index reads can silently omit formats.
>
> Return the entry corresponding to the saved position without
> advancing the iterator.

Great catch!

But honestly, I was a bit confused by the description. I think that
it is not easy to describe it a reasonable way. Well, I wonder
if the following is more clear:

<proposal>
seq_read_iter() calls pi_next() until it reads the last entry or until
the given read buffer gets full. The it calls pi_stop() in both
situations.

The next seq_read_iter() calls pi_start() to (re)start the session.
pi_start() is supposed to either start from the the beginning or
return the last entry which did not fit into the read buffer.

By other words, pi_start() should not call pi_next() which would return
the next entry. Instead it should return the entry which did not fit
into the buffer last time. Otherwise, the entry would get skipped.

Note that *pos is off-by-one because "0" position is used for the
title string (struct seq_operations). So that pr_start() should
return the *pos - 1 entry.
</proposal>

> Fixes: 337015573718 ("printk: Userspace format indexing support")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Otherwise the patch looks good to me. With the updated commit
message:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to wait few days for potential feedback. Then I will
    commit the patch with the updated commit messages unless anyone
    complains in the meantime.

