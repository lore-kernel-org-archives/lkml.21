Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180189;
	b=Vdhh0zxWJKNgEvt46Z4GWgUw7fCJff4HR1G0kW3thHGim9i148gTKa6pncHAwoM3CnWq
	 lnsbZUrsRcvIq1LIEQ/SNCXI3hj5jqgkVeYX2Mhn48SEXsFHkU3fvHDcZKkUYJyVqwG5z
	 u2toAT3NRVm/FZ6fGBIbKYVg4+2cbiF0mHq6tC0NLp9oCgChJY1Jwbe7mqwLl+aoiljv/
	 K5TKtSM6vB1bSKwH0moT+QwwwXPqexB5fcP9Vi58c+2ALvIa6kfaLknfV6pY+4x2bN+tC
	 +j52zZsnWoEK34gZwRTvhm5eLgjxC9QHXMKnoA1ADTzkdDArAcGVmOv0VbKrBNuG+Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PCl9o2L0h4hjzIUzxQ9Hw7xDucu8RfGeY02waG4S6Mk=;
	b=DzZQMFCMMD4OXBbKqdguGBHrlTC3Db2QHilAdHtoklvmBgbpCCS0P/PTaXJWa95VpO0n
	 TKtkSvP/e6iqOLAfuWXYIMdbuml4CE5IdmTMOxCpA/c9ZdLMlIAuMvLfDBLpIPeMTzCNO
	 hB9s+2JRPooqTqr2hh3bOTLa+Shru4OCAoA864CQ07h/iNTLggRJt6i10ZPyVbuOlRDMq
	 d+DYMdmSwgirpEagIQ3w71xbI82osY260ptnU4P0YYgN6ifka2NzAmtrYnmKQ2Rert04G
	 h1HxtCxm36XolcwNQ2PkF5Mf0H2OIaXDtjr/bY8OSplVXZwXHWJMwrB8IhxAnlo773Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=drzTDjW4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD386606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD386606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=drzTDjW4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb606491faso4484575e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795180187; x=1795784987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PCl9o2L0h4hjzIUzxQ9Hw7xDucu8RfGeY02waG4S6Mk=;
        b=drzTDjW4/nNLRZEdJoCJx1omj6WL1lebcgmuj0Eb0nlFTRlwDk9qfHsmxL8nwMbx3I
         Qs3y7WVIrAnMyxeNL1T7t69ozdoDb/cnDLgNuYO3KG6uypPDlyVPmmTtaYnY23orgGON
         t0i/LO8MlcEdq/i4LW8F/29zpR/hwoN8jJEc7dkEpZoDxywH3XARYRK/lzwRr9trqjXN
         9/E/AzRi/pjJ/dFia5u8N7nCSHbUlCPaeVifslbZVyrpCjPh4JNg8khdZIiFzfHVocs9
         QPEyCnoeO/MgAYT/VKiPogIE51kSCM5BJm16sYfyZx6PG4+4HcvB68zRb/Qcs2yHMDqo
         9fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180187; x=1795784987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCl9o2L0h4hjzIUzxQ9Hw7xDucu8RfGeY02waG4S6Mk=;
        b=iLmb3USfoegO1suJc/wMKVqiUI7widJ43FCKyn9fyC//MDh9GAmaRxf/TrWCDnCsGU
         9DW4uoT8WVV3P0mZX4NBVXMSclbmIMQvoMOPpYt7gqVqnnExYd1fIZr7j+4Z91FRp6C+
         b31XeaWL0SxPzUuQAlzFIwOPJHabDwHBXFFey/vvB/neGFkeNpw4M7QWR60XP6z2NEe1
         /3b9BT2i1LDPwU6dGSSp8KNCQ6zVgw4mdCdlh/UB9VWTwSo1F1R9N/Frp8anTynao8ul
         OigWI5khjCch2gJM8D4tiy7cjvNCFp+QlRxr2y1PNpw5PikrkfApExlj2sFzXn8jhFI1
         nqdA==
X-Forwarded-Encrypted: i=1; AL+hErFi60e7Uj3GKD9e2vHjVsYXz/aknlhOFPTC5qeR1uh9myO3FxCksK9h5WP9rEfni3AWOP5GmUhDet6r6ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MD8Eggx0FCGgPKL17ATGsyyfeV7JlZ1WK8ZtlU9LZbKnXc5HD
	wJXzYu5JTxuvZdK/N7ybq1xX+lbCu9wmBpPmuHKiEdlZKgxv4+zsh1IUzXNF4yv+Nf4Q2Pnil+Y
	XlpqNnds=
X-Gm-Gg: AYBFou24ryfUlkEe6HCMa95majQkVmq427XcVhWYZquC5HnjSAX9J6g0d4vfXcVlfCd
	E2koDvhBQ5CbvJeqVRwFfYluZKVrfkjLDlcRiXYJEmxaUqwNW9hwDG+gY1ir7GtfupgyS99XpyU
	pgd2cZXewAIb3EnQwH7HHnc5u/4nf1t8e8pT0a0PCeaQTFluxQ0MFYtzVxxi8uhBSGpr4KF1u9n
	YOV2ksF8C1J76TH2xY9wZlIcRHm015zIzyyiysNwNk5iim4o0bdPjwelUCytpB+1REWW+reuhx0
	y1aByYHAm1FVqAV/dvFBqZtQEire6Db8d8MPyWGjWU9o+DkCi9jWLE8UYZgqB7SMupnWGC2Hatr
	ePck6+dI+YNnmnbVmAulJwietOFy6iM+gH8Y4JGzJgYG0FhGD7yG8nxptUxjobTvegZykd4ZBTd
	w/jIRTsj6pSHhwRuPiEsFFjBSiz7JhyxhAbOK4BVAqXGMIJaOheOQXAzCtpOdgCg4VIS50S2X58
	bZ9Kf9a+bSKBb7FszoDC9bvYynMHn7larFejNMKrbAKBXYeuDq3VBriSmH8BvgSRl0bmIZXGEnL
	oBM7KUD46kF687GU/Es2RFCXtgTC7/w=
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr70450305e9.2.1795180187116;
        Fri, 20 Nov 2026 05:09:47 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm129169365e9.14.2026.11.20.05.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:09:46 -0800 (PST)
Date: Fri, 20 Nov 2026 14:09:43 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: john.ogness@linutronix.de, rostedt@goodmis.org,
	senozhatsky@chromium.org, paulmck@kernel.org,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: ringbuffer: Annotate speculative record reads
Message-ID: <awBGl4wZKT6tmgqG@pathway.suse.cz>
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

JFYI, the patch has been committed into printk/linux.git,
branch for-7.5-trivial.

Best Regards,
Petr
