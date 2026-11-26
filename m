Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700954;
	b=Qb1tQTPgshxcvSg8cPbIYK4OwAceTelLqmivY72W8PY3/F2JsaCQhKe/0kXxFCAqYz9f
	 OssURlgrCzyK+5dw5Cy0iaiC754OXxShUfmMB+oRbJjBCPiWsjIyCL7Pul3W6a0D3CV8X
	 u9bD0YWREmMQ66Beli05EzeZ4CB43Py6BUMnFiQe3pYYXIZfa9WJffB2wV/GgxBfghuNV
	 VqllX9Bhv4FAdC7U4vqeIDnJsB2UfEpX9yCoC/7WpXLXcYolreAKgOTFgaHvj9Lg3ARaT
	 VfoB1EzPrOYnhJn4WPU/Ca2lxasoOmbQf5R1K5dQRdtT1ja0g99+NDqWzGTzbn0RlcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=abQVRWaWyiTm6hUoXCzZ1KjvGKpnnRPAgTgJRVUoJB8=;
	b=sist8Y6J0jN50svcM7mepn+gOlp4eT8rsSXkUwoEG93rTEhM8W2gaqfD4wPdTwaq6jVW
	 hrF4GjGTKbY1WtFxHx0tLBswonmP/wCysgQcn5sscw0I+yQ175gKOs5izl/7MDbt0Gp9Y
	 aTvHEp5I9GBIFFbtf9pub7WgADQ+LyNsq/aR6B0INHs3AjXq3y+X4yg/zTQzlrMsKIPl3
	 Atx/kG6gLRNvnoNiod6RwqMZ/e7ekOPbXvWDvA+kAq1WosuUpLhMQt5WlQlxbblA0deZg
	 Etgl2lMTSKgOBAJqKMfEYmsdsTYeE1q8880SHNq+St1d5Bh8uvvvONT6QgnHuXpnU+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wy74fzNf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BAA606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BAA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wy74fzNf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so13644058eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700953; x=1796305753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abQVRWaWyiTm6hUoXCzZ1KjvGKpnnRPAgTgJRVUoJB8=;
        b=Wy74fzNfYiiW/ZD4Ae02UZl4OkxY7noXb+FIksDvlC8uepBGgoECpni3coEXewvBoG
         Ykyn5fkHj0u1sdpAiRVTBGfJB5qlpTmuleoEwUNliIzgJxznnnnjgPkI3WURudl3ahI9
         2vtNF6qSxzdYn7E1A0/q+CsHSEk+uagEsNm8ORCsHEtGk9dBxsyOQrVkglBiTr0UHPXm
         M/ohxrRe1K5zCfmmf+cpLiNU/RRcBt39EjBS4AbeT35D2KYvnqBx4vf7jGdpCf0kDqlM
         ar9FgO1SDUzel0JoopDrG+HMvRC0Vy6BJ1UshUBySKqzfyE5kT7/4L83M2k7uq2piVLS
         bpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700953; x=1796305753;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abQVRWaWyiTm6hUoXCzZ1KjvGKpnnRPAgTgJRVUoJB8=;
        b=pTBaZxBVSL0gc6/qZFowaqKZHGDK+LSPAp8FxYn+mu/kXIZ1XYdIwVKD6aKRQ415t/
         kRe+Zg/fSCHMbgwt/2w1ZbxW1avBfCl+ClCVg5DTaDloZqNeOvRuSAfSkuq7vyUDxiYs
         gaENt2rYNq6C9H2P8UE+GfxXeDFx86j/ZQLMC51lqZqo9VcJsW0ufuvAWzIOPPckpifJ
         /WEt0nn1r7ba9lHQod6f5C6K/0zUawUwu1lKkixxIRg/3P2s5Ty8zLm3ARpnfAHF3V/z
         4e4hvQNC/hHNJS1YFOxNcSE4dEycxCl1K/bUu2CY+DGRZBJfSqLEfU1raKDzRAfm0F73
         pX6w==
X-Forwarded-Encrypted: i=1; AL+hErExfYAqjalteyYvbl+d+hW+botCs9QUMgldvtR+l+NkM9+Ets/aWQZyit8dTysCIdU0EB0sg0wf/k30F6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u4/eu4jj6U/E5nfmMJaAPUl9ou9lELuc8juMEjzxzKbNeCbDP
	A9xIMQMFEDoILrjjzv2drGHo/wKY81iNjUJg7F6SfcdMz1YLu4oD2JSD
X-Gm-Gg: AZFdTZddCwegnuqTXBkBFsSOvZfrzxbriyhEih4rrDBl1eR47BwGwOw0IYy9lW22GEg
	mdhs4gzoYyZKOK2e5+Q/tz72/yr1vYeGZ/TY1nMJm4r2bHqoEUTrdnXUGti3fch8uiHA816fGxN
	55DEtXRIspgDJhoQEEL/hGHz+89zx5k3JaMW5ahpO/J23MbQDy9tR5wdrkwRqJt7cJMDZ4SBfMU
	mw/+PCztRcH794pNFJj79ZO/ME2FqyANkOqcrSDaH7zlO5Oeg9qNU59Efg6yj3pq3UgV/Z2ezDH
	CHqNPeQek0f/+3zllJHX6y+V8JZlHLZnz/oZc7O0SmN5yXUE4GI3W0fOgb8vFrqNQqModoPru+K
	m5TPlQutK0VWtHSYzsK+ZfC3Pj86jj6CGb1f2kMVY11wyG0CuVTwOb59yfpJXrjh/Rjq3UkOVkE
	y8qsAXZ/jQrsHKD7jG++LWABYxhV1q3vK1toirfwqivewzOh5sQh5TDdnntkfxhtPDx/3RJiOcM
	roGUfrrp9kEZsN+Oal/7Aco3uw2rIhbiDvae49WTOADVyzYmCmlwDVaj+yg2cBkGyjNGehnmG5K
	db1tNk0KTjLE2UdndtUPVRZ01+FTSsmldLUaykUd/PkyDoPEy/+FR7sh677buSU2M1SY
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr30927525eec.1.1795700952814;
        Thu, 26 Nov 2026 05:49:12 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm63023504eec.23.2026.11.26.05.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:49:11 -0800 (PST)
Message-ID: <b9eba3d4-c3c7-495a-ba45-34f993ccac1c@gmail.com>
Date: Thu, 26 Nov 2026 22:49:08 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v3 1/2] PM / devfreq: Resume at the frequency from before
 suspend
Content-Language: ko
To: aiyengar1990@gmail.com, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dong Aisheng <aisheng.dong@nxp.com>
References: <20261119-devfreq-suspend-sync-v3-0-ef19fbf94d83@gmail.com>
 <20261119-devfreq-suspend-sync-v3-1-ef19fbf94d83@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261119-devfreq-suspend-sync-v3-1-ef19fbf94d83@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 6:16 AM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Since commit 62453f1ba5d5 ("PM / devfreq: Use more accurate returned
> new_freq as resume_freq"), devfreq_set_target() records the frequency it
> sets as resume_freq, so the suspend transition in
> devfreq_suspend_device() overwrites it with the suspend frequency. The
> device then resumes at its suspend frequency and stays there until the
> governor's next update; with runtime PM (e.g. lima on RK3528) that is
> after every idle period.
> 
> Keep the frequency from before the suspend transition as resume_freq.
> 
> Fixes: 62453f1ba5d5 ("PM / devfreq: Use more accurate returned new_freq as resume_freq")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/devfreq/devfreq.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index f25304bca37f..795a01d012ec 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -1144,6 +1144,7 @@ EXPORT_SYMBOL(devm_devfreq_remove_device);
>   */
>  int devfreq_suspend_device(struct devfreq *devfreq)
>  {
> +	unsigned long resume_freq;
>  	int ret;
>  
>  	if (!devfreq)
> @@ -1161,7 +1162,10 @@ int devfreq_suspend_device(struct devfreq *devfreq)
>  
>  	if (devfreq->suspend_freq) {
>  		mutex_lock(&devfreq->lock);
> +		/* devfreq_set_target() overwrites resume_freq; keep the pre-suspend one */
> +		resume_freq = devfreq->previous_freq;
>  		ret = devfreq_set_target(devfreq, devfreq->suspend_freq, 0);
> +		devfreq->resume_freq = resume_freq;
>  		mutex_unlock(&devfreq->lock);
>  		if (ret)
>  			return ret;
> 

Looks good to me. 
I'll add Cc: stable@vger.kernel.org and wrap the comment line when applying.

Applied it. Thanks.
-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
