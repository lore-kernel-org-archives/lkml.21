Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412095;
	b=cRkLCaCt0a3LSDjZ6ownv9qIY1xNkR0iTOzMrFLt0ASpoMxM1nQgeL79B87Q5nE4/Uah
	 cAPHqBjtquwt53MKybIiy1BjobqZ4Poh9p7zb+TCI9eeN3/JxfO64hyj0cIJBe9wLxnbl
	 v1q2sMpFHOW7EEGej9VUXGQk/UQOJpTR4KY6ad1miUTjQXD7/W7dkR1dAAFIPqWhF0+Q7
	 V/Ijt5ewLatSy0vCMimEv3ngARWkj1ehNONTSl5SO2X/hwRa9yo2HVjGoWqAH8N1xUUSK
	 t0TJRpyaE+ZTPG1J8FCmsAHqdrWoNIGtcTrW6/2KnJeAo7dMOPON0VrSMGst5Ii8QOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
	b=D11tF7Y72xSQOMgleW0jKJx5utjpApIgwq45FRVHWIkhgh7xwuLo+dz4M0KRFkIMDNWt
	 a2O5xzPedd484m+vFZ0vfWWlr1zDF9JlYtmdUnpYGknfam1Pye+j+p/dfQAkMGboBnd4h
	 tKz2Ro1U65JjUDRLwlqyWDBE2mQvGPtlZB7nIB9+v23fz/Ykrjer+mO0C5dW1Q9SKWSN2
	 rJclPVsUYreP7dNQWM0p8pwht42F2PjT5bslZW0+AeAsfBIm8bIEyEH8aOUWLIWLkryEc
	 igN74vOAFsSqTKXxr/evz3vKVIBYohpBSwCMPvDygz2nC04CTIHMtDtWo9Y9OhQ+TWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zRhWVqwP;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21DF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zRhWVqwP
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so6584478c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795412094; x=1796016894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
        b=zRhWVqwPzRdS/S3SNWc6pwEH2rZiRiN1XxRt0Y7KM5Q6Fi710yUMjd4YtxarNqt3OS
         ktE28kOUcVycRnFnsqYdBhW3ccFDE1wODV3eL2dtbGGTHezxLtT2mi7jCscT+eRY0PxI
         x39GN01oGijKwbCMqk7V5ytBwIuYGuF5Q+mleloxdbRncsb6FVZXYcIFIS+ldK3FiJ9q
         5xrT4mwHcTPMx8s7k8COAd4eEHRNDdgFl7Hr35FkJfeH5vElDmse0ofxLKthcp+r6qVe
         Vc1kU/gWiYRu3zVYp0PRZC6n63bq1EVi76ixJhkMxZ1tRdvtpV89u9DsHRRSFKuk2qS3
         TpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412094; x=1796016894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
        b=cS5GWp7lFAJ/gZBQ/EfJjDJzofXnY6OFbxLwvYT6nrWhzHvKBu6iiaiTBBBJMxb5hE
         B20yka2HRsQcx3HKrBacH3E7Tdl1MLOxcQw9njR1tWnIH9iiFB6PS2KZdSyizdQT84Ab
         x8KGjcPkdFBtfbehB7e2WqCrW5X+qEyBm9OBDj2YMe0yrr7eX1PWSmWwVFG3ZlJGpmkR
         pbo+Ipi/kWRNTYxM7yyn8bXs6j5BOatXHWCGPcTvltBrn4hLKPSYx12qd0PBQvx6mpW1
         FP/OxLyPTXd0/RzL68D8QzFDOlhO1ToCnJnfxdPXx5O1an38ROfv8y1VxLp474/Zlm6Z
         oFSw==
X-Forwarded-Encrypted: i=1; AL+hErFEcfgSK64q3/HtS/SZKmEhw/nMXnEnAk0TXQTv34nMVOH+4iGWzOGkZ6lS9Xy/dPJz3XtK3Qu8PMPTne8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HiFizwZHEkykVNOpelcdXj2rIga+9/Cz7yPYEJd/tKM2a/+bW
	c7oCo0EEsy6QOopLr5Qyg+zBE+4YrUQ/d+EMg6v/2zN/MWEbv67FDWwNrVLFvR96/Q8=
X-Gm-Gg: AZFdTZdYxmJEds/BKdh2gEIDpKK5XFEkLzGtFa6iteiFHaZ63l+JrZzdKfOCye49l+y
	L5fM4+CbgBKAOMhOhSbMq6kuEpM4JFxmHKY81EQ5NuNsvQmNfXBcaCLfe5K7r8aXoHMfjoQ9fUe
	qsgsXs/Xm95e9VyO9hpClC8eko1xAM/JAe3HubpIrEEAJe0dUd+YQBTqi2JSJpPoVH3Dca3ThJh
	IawMbbere0qd+gSwJNN2cuiEjgXXPzboKdumxj0oeAxrEYwf4trdc7Jg9Exohugu9f96Y/uMrLr
	qlCL+R/0oIScNYLha+35VBDwFa+jsa0aCMDGx8yNZeL3l+WW7u9Z5h0NViS/U52q6fyaWxnCRT8
	IOXrbs3AegbK9KQwHMEDipZt1HdjIQNSSBEt0b3CxBgweUHQTOyrk6dyH9f2JBjEYSnR/fGFRKc
	7vr+Mcg/LXpL1lgnp+4r0UoRoiDmswnFXKUKPnwTA9u9carRnNfcAoSgBtkJWZaw8EyeXV2zO8v
	bCTvfVazh6OiihnfbXSc2HGOOumdWFWxrZY9051VKlLRC6XQmmUi31pc/p4syOqJibL3gXPMhmQ
	xGCZw28EK9CtkzHmVZQ3fUW004xlxg==
X-Received: by 2002:a05:701a:ccd9:20b0:1b5:7351:955f with SMTP id a92af1059eb24-1b573519624mr2091488c88.27.1795412093505;
        Sun, 22 Nov 2026 21:34:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm23537896c88.0.2026.11.22.21.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:34:52 -0800 (PST)
Date: Mon, 23 Nov 2026 11:04:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: shyckless@gmail.com
Cc: rafael@kernel.org, peter.griffin@linaro.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
Subject: Re: [PATCH v2 0/3] cpufreq: Fix leaks on probe error paths in three
 drivers
Message-ID: <awPQeliuPmaBF8cG@vireshk-B250M-D3H>
References: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
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
In-Reply-To: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>

On 23-11-26, 05:21, Suyuan Wang via B4 Relay wrote:
> Three small fixes for resources that are not released when a cpufreq
> driver fails to probe: the cpu clock in highbank, the three clocks in
> kirkwood (also on unbind), and the regulators and register mappings in
> s5pv210, and its reboot notifier, when cpufreq_register_driver() fails.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> on arm (W=1, multi_v5 for kirkwood); I don't have the hardware.
> 
> Changes in v2:
> - 3/3: fix the Fixes tags. The regulator and reboot notifier leaks come
>   from e8b4c1986efb and fe7f1bcbff91, and e0e5b2b4f427 did not add a
>   leak (Zhongqiu Han). No code change.
> - 1/3, 2/3: unchanged.
> 
> v1: https://lore.kernel.org/all/20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com/
> ---
> Suyuan Wang (3):
>       cpufreq: highbank: Put cpu clock if clk notifier registration fails
>       cpufreq: kirkwood: Put clocks on error and in remove
>       cpufreq: s5pv210: Fix resource leaks on probe error paths
> 
>  drivers/cpufreq/highbank-cpufreq.c |  1 +
>  drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>  drivers/cpufreq/s5pv210-cpufreq.c  | 12 +++++++++---
>  3 files changed, 22 insertions(+), 6 deletions(-)

While sending a new version, you need to add the tags you have
received so far. Please resend with Reviewed by tags you have
received.

-- 
viresh
