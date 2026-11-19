Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086167;
	b=0X/hucYEotkA2kBH8zp2Rd0de1pAwNjiVU4uQjX/ZIbjAl2X6CKVdBjYAZG5oRydIPNy
	 o3rkXBem3rhEcLcrl3nxzhIKD6OQbuGiIWW1jGFXjFn6fuJoUu6HVs8iXOQcSjhpSH8ht
	 p8u6VBk94SLVZmVZzZLoADqjDZV8mb4u6/H7bJ0YlH2tDZ80cXuz1COzB+/j1hufjaCSY
	 XVAxc1asvC2Xx11ZrAdqpqrcE02JZw9Lhle3b8aqdLDUA5k4QmoQKkQ/absStqLz9Ywhi
	 HvVx92FGPZXyX4EskxfmSzflI/arMYGTRJgyoSThckXKxrbRWHOQD+vyfQwyS78MeZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=o4GEyz5U9vFXXKUrCPhLjfd8PplmyKlfLDn43zCRhVs=;
	b=WLpSSGsy0/ur8XyRbeo8GEXpC5NGWlrn5elygeQ+do3u7mCxzSlABXcx0+Q477w+GUMN
	 Tb0olWY2a6ozgsbwRInnSBZsIC+X6eeEeBGkhB0ZSsRFEraxVY5wenj7Ez+8oPON+4q3y
	 Xi+YEwYz+Nk1AOzzSamFvvBSYoeWNpIzlAJ9G6CMBcomyYmFmlR+nX73Ic857rId+jVy8
	 Oo3Cdq5AO14DwPdsi0I1XGmQ1MD6QOdbT68uMujeBq0d308d7wyizBQcG+wkvam8qU/ct
	 vH3mZfNJH0HXwl+fd468tYPjNzd7EorGncA71F9RZnkPCXhItXEGBo9lVC2XFi8Dvzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4V05luj;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E030E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4V05luj
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so2776163c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795086166; x=1795690966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4GEyz5U9vFXXKUrCPhLjfd8PplmyKlfLDn43zCRhVs=;
        b=T4V05lujtnDe6T57cMU8UNhsX3e9kw4jQSCMPHIU6BuvzvdDN+3mRW8LMCwIpgnhwm
         /5c4SomZ9d56eAEUvZ3etrxKP99QYBh4IdAiIlDn5kkqfy7CPgYv5g0G0XSXlPyQk4fL
         P4E1jBn1IQp+mgTmSwP8Sb5rfS+wOMNgaiKyoEdVKlBTl2c0QOe8vrxzZfMKQOUl1psY
         xolFmDpsMgWhRgpcEgKzr6WDzIQlkRSmMaDLjne5PYDHbOk+nDUo58SNQuUlj4Ck5Hzi
         +SmZlujklUvR5MYVga1ZuJydRMsbPGV0c5FHgaMDGEUqDQ9xEB8W4n2wK6YRvPgsTzYl
         SWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086166; x=1795690966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4GEyz5U9vFXXKUrCPhLjfd8PplmyKlfLDn43zCRhVs=;
        b=ICezfCfj18AWLuJN5JKYX0YW4Lrdijly62L/2bs/I/44Kuod6WMdQl1WOcJHzuAAq7
         WS088DQBvOUf30DElPOA4IYOxbytQXOh7qfc29VFlSvXJl3JrskWCH9KmBw/WcjC0CV3
         FQwoN4hNE5gejiyN73F9ZVDWJ0+OjaUvH6RupMwCvLiAOc/WL687gl9cvV21HPi2N/vD
         dEEw5W37/aHq9ZjlyqXIF5KJKbhAP25ltYyIemYHcZQuAwKlOnDYQanfyPVpGJ0WgIV1
         /DDHHNa5316KqsTXVHslfkos5U/ogUzFcXkpXVxvGVrUxd28Kx0EfWhp9im/ZwoLi49Z
         Y2Bg==
X-Forwarded-Encrypted: i=1; AL+hErHsyYRDS3ifOfD7358LHguSUnpafV+yx9g5mLxvq4SGHCHe6Dbv3jC22JQPVpUcNCiDmYH8ijBj/iPltQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qw+aDbk5PVCtECH405C74EZwSLJ9Db8iVPQY/eQwLZR3TYpIi
	6COhkPukJF38B2aI2La8r9zaohC7k4elhbKOubOpSicsUF7rXatyVva124x/qWOU7O4=
X-Gm-Gg: AYBFou0LQWKtfBMfwwLM4Dd0hHV1+BpaInpicGpTAc8i5K87ektbRw43WrpvKOkhKN+
	o1rs4nD5QHcg0aGuyIGZqQH5t4rCZEwjM0LB5oekD/KL5PGCJq2OjuCUYFtk9jtYjOL2JiOg679
	99JIWTFXp3FFrnFP4VibZ+VaHzTC+CPPshECwg6mApFrPtzJQesu4ULzmAgL53iP/csoWPAiCY8
	fYvLbij++vLzzKKB7mbqdDMmgRfNnPEKGipUAWvv3eEzdo6JtP5W7nj5XsK+IbVFVlYU6DkgfIH
	cIoXd4nyamaA6MvblXS6XKLKCWP6P9fjg0i2TjcKclJhwBfgRWzTXZ8m5QOjXyC8bIXHQl3Tk8/
	7fS3XPvs37C+2UazZEFDmOLYMt8zDZkXQWWkPxh2Nb1qVB6QnaUvTfIHqPcaas5Y+ay/ajtaTHf
	+ltqsJAycVZ5FTx19pVg+wTlD6HscbTgrlTacOwKBuGLpQNuIMIwwHTYgPUMYztuOy5CjWBXden
	8NcSs2Nm5FnIZcC9ma9tJiOf1sGMO9hSbjWmDsCT2VvAV6LqrBmM8MWsleRTK9sALlDu7Ha7svw
	dgaRCGfRuF0S/tfJFfGGMV1i2cCZIA==
X-Received: by 2002:a05:701b:205b:20b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b543c144c7mr5006926c88.26.1795086165423;
        Thu, 19 Nov 2026 03:02:45 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5ec9sm14665466c88.8.2026.11.19.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:02:44 -0800 (PST)
Date: Thu, 19 Nov 2026 16:32:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: rafael@kernel.org, zhongqiu.han@oss.qualcomm.com,
	hector.yuan@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek-hw: Fix initialization resource
 leaks
Message-ID: <av7XUQCgTkhJB43V@vireshk-B250M-D3H>
References: <20261119052811.2877720-1-haoxiang_li2024@163.com>
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
In-Reply-To: <20261119052811.2877720-1-haoxiang_li2024@163.com>

On 19-11-26, 13:28, Haoxiang Li wrote:
> This series fixes two resource cleanup omissions introduced by commit
> d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case").
> 
> Patch 1 releases the resources when the CPUFreq hardware fails to become
> enabled.
> 
> Following Zhongqiu's suggestion during review, patch 2 handles the
> additional failure path where mtk_cpu_create_freq_table() fails after
> the registers have been mapped and the memory region requested.
> Thanks to Zhongqiu for pointing out this omission and suggesting a
> separate fix.
> 
> Changes in v2:
> - Keep the original hardware enable failure fix unchanged as patch 1.
> - Add patch 2 to clean up on frequency table creation failure, using
>   the same Fixes tag.
> 
> Haoxiang Li (2):
>   cpufreq: mediatek-hw: Release resources when hardware enable fails
>   cpufreq: mediatek-hw: Clean up on frequency table creation failure

Applied. Thanks.

-- 
viresh
