Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451163;
	b=3hhMSy34lRS9kahquNc8GJquonF0gmva3JFsxxbPPXcEA+iBa0mbI44V2yIISuEbXPkm
	 II7rjTJYqdznWj2L0JGUUH3Igk+MiJupwuyuHYOWVNoijXCEbbSjUogw8zoSsUsrnq6D0
	 6oi0XY3Oe2+eCRSdTe2yDkjRKUxW9eX79n/o3jgPOO/1dmnrD5Z2ASGk3fZSPDZl81Y42
	 u3BkXU+tiNJj2CD4sIsO4r7eP89Dy0IYtjZGuWgI4pPBVEmgekE8fjkaLAp+P0sQbbUPK
	 BZ8WtV5VvhSut7ZOcV+pmbXi5ORmbl70+LRytoJoeTWLSBI0qB1AwvhWlJyWstgIyvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NXMlsxyqdad5mAbbeiuLC7iCnHn5yFgQtBLitgMhw+s=;
	b=C0+D2Gh0gmjyIeKwzaSu/bPA5131OrFox9fRFtoB0v3LduAZtQhMDACv4smLBY5Hg3fs
	 lnXtnb0Fj8/qI4yGFPQxmL59/6TMeUFwWh0ZY43xr9a9XotvSAqD6sLOpJjtQs9f+3a0+
	 aOccCtrhMBQiyEg99ql+yjIT1SAqkTFPl37VdagXpnrroy0DTjMUmyPDRgYuGmQpsP19b
	 oJUAY80LX2oFyJRfSp0zCywkA/QyLlzUGdPZ7g21Dwb5nsGJ3BiI6Eqw9YkyJnfJQKT15
	 8qF9VIPGmLLFkJ7FYuc2SDUMasKVMlNSuXNhJ+YPLHObDl/xuTA7U+790EUjvE4mrlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZfFpkS7;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568EE606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568EE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZfFpkS7
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-5641f26ce05so1784527b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451162; x=1796055962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXMlsxyqdad5mAbbeiuLC7iCnHn5yFgQtBLitgMhw+s=;
        b=tZfFpkS7Eccxr7VOaHCj/zgf0fhIMjX7r85XuBpjySNtHAu0maJrFrsFfMvHNdJeIB
         qRBUiqGLJkGjAsg/+JE1XuEC8X1T24W6juikaGcVdo2SpRUgAMBhE7+E2DIHNHFf3bC2
         9MK2pTSSv2xDCNz4G1WwALC0Bz0uBTsNI1Okmhkv2MPiTjkPI5tlK0G64O8nI2z1yfK6
         tp5B3UYk9k6dHE/gBAHwMoFepfn3q6AjFpSkwhO6itJRSxUcxXZgPH1ATmkR8/I38+M6
         RcmnE7PcvLiNDWByVMiEIwlFxbSpsGsCw2p5VhuvegfEsfuporsoofjqZfPQwb/6xmir
         NXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451162; x=1796055962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NXMlsxyqdad5mAbbeiuLC7iCnHn5yFgQtBLitgMhw+s=;
        b=lxZ13gCAaZBQ5FZFy/HdqKIKTvG5CNCJRYaHPMh/5JUPn7Iz7llVU0jVMY9teGgPe7
         AVfAUZZ/EvhePSOaTxk3Ha8QNevdElXKKP2VOr5EDIA/rek3Xn5g0WXEmWOcGk+eg6Wo
         WVJPvfb1rOrQek/ZMF7SXyT3wf3fMLZw/p49MbeOQ+r+E9Ug1nvcqAaS1dwsFCBAW+KC
         weEPGSziRl/9lTHLYpJiGc0prS8ykkecSQfLnF45ukVmallsN5wADW9byzJAw3RJIQEc
         YcN4ljAxDzdCEnYy4GUrTfMm3YeyFMlq4UftUtaoKTXUHBEjd2VJHvS4Kn5hzAy3uerz
         hq8A==
X-Forwarded-Encrypted: i=1; AL+hErFu+fbvsLaFVIJl2eduABePq/9EIQxspiuNHHqYCWgpkOivZLS/DJ2n9lJC7ARBs+1tfwlE9VN7KJRFdhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rgpRyVpGTrGG8mHy9JAR/qDwdZVZs7A+HbVZY+L8pc3a12+ee
	npgRaynenTYd4RpRaRyQ+JMU1uxI9De3MfBi6ogaIOFDAxzVHjzsnYWX
X-Gm-Gg: AZFdTZdfmVIydudRqP862MRnRT0HUbEfziUqc4P2dHKJhyUWnyMu6vr23oDQCOl1oZO
	NCfrhgI3Kqr9SL5aIEfcGszuukmcCqL0KM0V+OHQWbXhDv4U18uDB5yOZoWbPi3XQPH5aVUi0CP
	USf6B3jPEhJ4gxROmnTN3ovxnMdNrnBG7/Fn0YUIY2jDu5dO+qnBF+iyoaG9NMfC2CGgn77Z6g4
	Zthq7zpznptXwYibFByEJNrldXEfhEegP74wK7WtLfQhF5DWoEzcz+hvKprnLZ5uhUkwlAuyqy6
	cgsydLXN8QwUE/za06iLuAq4ePKfT7VobAR8Mg8yCc82eIf1bj32ymK38DmlQ4cxQ+uB2HMU61O
	4DhBtpSKN5pfkvvhh5MQIb37VL6XrIjL7L6zFrQNGfsA/D59NxhAzqMtnu09GXrZlBueTODnTzy
	rHv7MIVLzg/rMjeW1nFAEcv+pjlINQar+fKEj4qnKj3QtGnBvDn6m36g9dd0toUVUA+45y3AQ2t
	tKT2YMBie54CXEwk36d7p7duBr2lY5vzKcKwvzMy2v2F22KzYWcbl3UsTu273py1JJKqnkyAIMH
	ltdD9mbdFeey9VzIRS10ijjdyohKjQm68lfCWziVsSOeWNVuAL6pvtXA6rOsK9CiigSFDyZtmw5
	xTK64EQ==
X-Received: by 2002:a05:6808:1814:b0:4cb:f21c:a79f with SMTP id 5614622812f47-57a0b946d49mr13307390b6e.39.1795451162238;
        Mon, 23 Nov 2026 08:26:02 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:15::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm8872729b6e.12.2026.11.23.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:26:01 -0800 (PST)
Date: Mon, 23 Nov 2026 08:26:00 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: chengming.zhou@linux.dev, yosry@kernel.org, hannes@cmpxchg.org, 
	nphamcs@gmail.com, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: zswap: remove dead length check in zswap_store_page()
Message-ID: <awRoyv7oqW3e3DG3@devbig011.atn3.facebook.com>
Mail-Followup-To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>, 
	chengming.zhou@linux.dev, yosry@kernel.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>
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
In-Reply-To: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>

On Mon, Nov 23, 2026 at 08:55:12AM +0530, Mohamad Raizudeen wrote:
> zswap_compress() never succeeds with entry->length == 0, so the
> condition is always true. Remove it.

Hi Mohamad, nice catch! Looks right to me:
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  mm/zswap.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/zswap.c b/mm/zswap.c
> index ae19e301fced..9590f333d83f 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1509,10 +1509,8 @@ static bool zswap_store_page(struct folio *folio, long index,
>  	entry->swpentry = page_swpentry;
>  	entry->objcg = objcg;
>  	entry->referenced = true;
> -	if (entry->length) {
> -		INIT_LIST_HEAD(&entry->lru);
> -		zswap_lru_add(entry);
> -	}
> +	INIT_LIST_HEAD(&entry->lru);
> +	zswap_lru_add(entry);
>  
>  	return true;
>  
> -- 
> 2.53.0
> 
> 
