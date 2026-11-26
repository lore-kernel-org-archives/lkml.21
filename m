Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657633;
	b=Uo3JPDf8eIeyDZz99UDm681i5rTLSkMQSz7L52ntT9X2xYm+gtY2Ux5lRJsydxD/6mQN
	 UQnif//351k+slo7m9mpYODRo7zb+WWRmksWE9CtG68n0tl0ZzVDeHba8M4G22dZ2XSJq
	 UeHOQ1Gd4vnHCWwPZHRNJZLXRb5NPVka9VdwW3mOC+x+13Ap9TC1C/nN4t1x8C+kznVpf
	 A5d/QhHF5qM/zjwmtTI8IJ5nTDNoI012zN3saLXMuGAd5Tk1gSQ2N0f7nHTIMnogQXpLj
	 bGFLEZGdmWLTxnW3WLAk62Kc18+zPM1fFJ6rsnGtpzymTsipPRVN/q1+Ti+fu4vU1zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C90z5eRMPRz7rm9tSvRsEhi09vVmUDZ/4/9fcRwxuPA=;
	b=fV6Oi84Kv0r9HTjn08IQ5gv/iHqvKzkWk230b+v09VosXJVBF/YzgEJ7filJbaWlNfm5
	 eWZORXzJ42IJRkz/JMfkweI/WldnnrokaBsVnAmHZKq7d10RLUtVK/eQf5mZ6RA6aseFk
	 UKlAT/dfRotn5PPjt+HliAc02qmHk3mOcGTB7JkuE94/oXibOKMNnzl5u+1DE7GeRpD1x
	 kFRwcQrBOuIf0Sa7G3f+RcVJLb5ylWG69yeTQBB7ZSxWWh24YvuNf3NT/yaRekRbgpNDw
	 lUArj+mjuAUkPwvLDBcx6V7iE9+JT3qCQ4bm+zZyf9ryXIqrU38UkIhozsUI8Lh08DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiiwp6KB;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125BB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 125BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiiwp6KB
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so4573888a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657632; x=1796262432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C90z5eRMPRz7rm9tSvRsEhi09vVmUDZ/4/9fcRwxuPA=;
        b=oiiwp6KB2jn07gDx/FeG7aU1f+cY9kbOBZNdBq5aYpcBYZ78xSSKR/mxWqZO/r73hw
         yq7Kdk7Dg/qQoOJ+jqaJdo0XtVvNtAqdDsOMvoGExjRRMGcuuPZXMTME17hBDF1dOoXl
         dEg3TW4UL83EdVZNI6v8h+XR6Rld0UB2hE51BmauDmP0myrykmjoFLeUScN7xKnqV+jA
         RfLak4V+WPIlZt7qyeNJM4zAsOj9RUl611Jr0Wz/Z3Ezp8VcTbxMLcWTIKFJdoHw9uep
         mWYnJ1RKv4MmMB7hX60Sms/d/Sh+w+K5aJJwGzdU2OIKxyt6x5V6XkrJcGilmJKrFzhE
         kSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657632; x=1796262432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C90z5eRMPRz7rm9tSvRsEhi09vVmUDZ/4/9fcRwxuPA=;
        b=Qt26vjL25zXFTM4g/aiEU7FMexvDCVguGQEVS5qSJ+VUx+OdIfDn+bMRQI4VPcre1X
         Doi9tokCvmUEg0uGnX07ElrdVpOaATgFCpQeo7occSkqMLIGrirv1jjxhGFcQi9w3Sf+
         hPriNrEglEutZlzBs/vA80sfomCmY1PP3xd4tNUs28ncAYIha0P2SMNRNGfFId1l5v1X
         pPM1M0dP39pYTDY/wB1o7GeUYRsXijI98Edc7CAt+Nkvxo8jml/HZ2ckBlRS2Ovnbqz8
         o519g5Vrpc2c63uF7N9sRDNef6RpgVN5yL51J0gm70vshqEqoQc2dAgU/e3lOetr8WCp
         XkIw==
X-Forwarded-Encrypted: i=1; AL+hErEPjaETGJ7n4FWXmJHuj3FSR3WQNtu8um8/FL7budkrd6maO7W6HH4css5VSvfloskge3gDDfQ8WPnDnxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8laU2L+bufHWeqfPG9P+n8cEMu01ccv2mod3lG168tZUgvJBFK
	1BxK4Xg3T/yCCZU/iH4baUDC2TOFJ2DvcZaRKq56eiOxmJ/jl8Mmydsa
X-Gm-Gg: AZFdTZeuJoJexi0d0CTaENgbUPzfwCe8ruu8noSdEQn5IAdI/+rlUhZ0qTLS6MObu+u
	ZoLYFHXS92GD9VUpQzp+jEt2FK4r2GpOahb7AQnGa7J8YmzyLYmyYL9M4vLcNI4Jwrjmin6B4q2
	V0PRa3d0CI/LPn9QkznkTWJTWFahE7tC0STaLT31KNEpHs0cC5FNGmWMJQ7RkLYjX4cO8u6hsTI
	lCBHFYZLOfpHfSlppA4l/OwxORXptLqtxMwTvyvHsZsC/sh5uEmKcvsSFNsVRIxLrfQspFqvjtA
	Fa30Biy3PL2LSOstyPJIvLKlz3o6Q0Sv2NLkGyw5S2wRlWhdisoX7QaHUItfDRH15QWFyT+lcsn
	o/JUb5J9nH10+wmiWggJRT9nBfylLAB0+pOjy7l7M1vWrg8wbYeV5WxGShcF8C+FIj0aDGyr95V
	7zYZpuN1P++oSVupxsq5ft9nU7wyTpdmQLcAA43cDQROO4muqdBZLOBBva/Wbj+hQa6fm6tOPHZ
	DR4tAx6hocv/auOB7iOtwEzXzvYjIduQ3xwUEd+Oqy4IQgNvNKkIOpBhgbH/8whgztyJffGAGI/
	fnoxbY6Zf2ggI8LXrh0s/D/DJ9irT/NOdbTchQh0
X-Received: by 2002:a17:90b:2c86:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b41c8d9179mr18731494a91.12.1795657632334;
        Wed, 25 Nov 2026 17:47:12 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm10007818a12.7.2026.11.25.17.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:47:11 -0800 (PST)
Date: Thu, 26 Nov 2026 10:47:09 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Showta Ishizaki <zakinko@snowrabbit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: keep i_size of a directory equal to its index root
Message-ID: <awePnaRhBQLahPpz@hyunchul-PC02>
References: <20261125-ntfs-01-v1@snowrabbit.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125-ntfs-01-v1@snowrabbit.org>

On Wed, Nov 25, 2026 at 11:18:20PM +0900, Showta Ishizaki wrote:
> After mkdir, stat() gives a size of 0 for the directory until it is read
> back from disk, where it gives the length of $INDEX_ROOT.
> __ntfs_create() opens the index root but does not set i_size from it.
> 
> When the index root is moved out to an index block,
> ntfs_ir_reparent() updates data_size but not i_size, which keeps the
> length the root had before.
> 
> Set i_size in both, as ntfs_ir_truncate() does.
> 
> Without the patch a new directory was 0 bytes and became 48 after a
> remount, and one with 300 files was 248 and became 56.  With it the sizes
> are the same before and after.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
