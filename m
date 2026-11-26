Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669860;
	b=aHzvb/M+8jvi2vAnJmFoqPDjXhC+AzGZJno/Nzk5X3XHFtM/eZfpUio6yOGLob9qJu/T
	 8MAe+HctKVKu1a76GVjvke7A3aQdx/PbCmeEv/952JhL2/OSgMsYa6JME2u3xuSD4799q
	 mN2GV5aIroZYCrWkF/ieUrzaaaUdn2HSidFvTKy366roIstcNvM2r3UpwgYyI0WqKiMor
	 Mmhe5lWFJWVgQrrjkw/bGPRM0Sll4nWD4esVZ8vsxBLSSmdnS8g27JloH21NH8SfLB1Gv
	 Cc8u/sK2D6Pw+cWjh4HjRmPtjr//tyZ9W8XaEK+ZnMGpVhj1/RmCutR7oJ7u5Erlmeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
	b=mJvI3QOHZUCWgZp2jwSP8l3M8smHYWJLZoVurrn/5jdz+ztltmhmKRafhAa9yMoHirZ0
	 hwy+m1x8CDV3bVSjREt1x5NpS/uMM72vMxzQkjwPe651Vi70JWNSGRqvRuh4fkSp/j7sv
	 eKS1N5u0K0DPuqwrvhdUFLpEZRfF5mgN4Fjv6YR+TE5OHVTWfrjrc3lfSf4np+gRFgjeM
	 1dnQDfGNxNFNeuVtXecT14slYNlzkSll/a3VjHNrLdNcmirnJX35HDgFWzqzSG36VZikb
	 1hx1crihwy6RFyUzifQ6Utlkh1ETqkZEqjgzlJ9AMLblCxTaUN4a5SygP/tgPyS3jTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=koo80xtt;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1B1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=koo80xtt
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5005863c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795669854; x=1796274654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=koo80xttp8geMgFWEU8bag5Cp8NMbqNHiK7kwUEroiZTZ29SdBiyGGotzYoiu33bTa
         UwY/ptC145WUKHWBA3x8fQXypO5iGoJWBzrQa2siyDjf6QleJy3SlzLiFSjtpNBjWe/Z
         5w6olFcNx37XXa94u4v/C9gbqIJS10mENTxBmCudh2SAB1iuNImFNr1XQSZ8dLWcLzo5
         s7l605ESWnqrRYxZNVLgRDqQsYxX2Cxxat93m6kGhcp/Uy8bb/OB3gMKYEi5VufiL8S4
         cFavEYRuNUHr2c943YG3QEsDfSPrMUyN8QHZKiCv+91BrB/EXTtqOaUvAomAAoKij+mg
         cwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669854; x=1796274654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=SiT+lIon1GRhFmMG44vvG35BKm+6a3YbjwEg5+RdEFGbOBMKGLOQJSb5VcHidqBpba
         YSn54NDq73E4iPi/SyCsmKkQUkTID6YSQpQ7g1hp07D9iv9ssATot8aglWLH3AwlVg+k
         W4x8lDMy/twS2olmlo9z59u47kLqDrGvHha7i1s18Wd87NKHAgWVVpIGHgQEwhyWb7d/
         6P0VEqPsN3apdMPXYddH1r2l2XcQoBNXvBmgJnXFStJDCRLfaP/4aDVNGMm+p/l1RoCQ
         m/JbQWhRxfjftZoxD1zyxK4JCqAk5yL4COA64zkErcHr1xJ1jHOR6gJBOPXTUDSK6aEk
         BTMg==
X-Forwarded-Encrypted: i=1; AL+hErGCRTnqGpuXFcrZbn20RlvmUjyP05JGWRT1XBXfxIYwboLkx2zTCUs9XBw7VXWLTCPQ6803Pe8bknpWfiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LN9bu9KDJ17gmMo/AdHksRwVpot5DiCaB3NKKTqi4+eWXGaxR
	H/WR7y7rGpREV/z5HcvGBM1jzIXMa6gyZqL9B6+QLBHQddb46GF66q/JHAgdGVcFBF8=
X-Gm-Gg: AZFdTZcEBoMqN/zVam+dhKkTsvEVkV9wgoXq2xILygat/BfVQdnFyr8slWVTZX6anY+
	7B+LUm1d1UfPQLFI/So3Obn9ZcNIDTFtp1PAez+wVZENlXL4FcV9kqW7EY+c9XtW3pdLRyhUZ5U
	Le+Vk6za6TjRetjiZ0h7hmYkNZTJ/bG8Gl/Le1JiiqEDlmEB4Ku4NuK7tFtmtSTsCh8HEuyZ1TB
	3xaPpd4Z+eWIogLljZosBYhvlaPKVqUZSX9/yvzRXOXEr1EUHqdURFWcZWOvNpUldOj2SHadefy
	ZwZ75mVpWivOp1v7NiJzB0rHV+RebRCG5xJ5rTPelmgCqo16xLD7xWQF8BEh9r7LqMQCkH5BbFA
	8ZdWP9NG7mCHdioFKqVzdPgBPNGg8ciD3DJGXynoBVdcOqQebdY6FDdFdq0dJk6v4OLGRfo6vEp
	BDPfsz9ulnmrasa4tKCYRJ5eowMLixwE0RoJJNN54QMWXLHlQJMJqJjr7Ky02umIQvJ+4nWgHQx
	Qm3prYTZ5vEg6xxoBSK0zEJpekg9DgrpW0sYmiZ9lQp1W+s4IssKBKh6hdnSHKAUXcVn4qu6Ijq
	4JXxyb8Vzj4/uKoaKZHXWlB/h50vlg==
X-Received: by 2002:a05:7022:3f07:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b5567b5685mr22918571c88.3.1795669853936;
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm38643650c88.11.2026.11.25.21.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Date: Thu, 26 Nov 2026 10:40:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	christian.koever-draxl@student.uibk.ac.at,
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
References: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
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
In-Reply-To: <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>

On 23-11-26, 20:23, Chuan Liu wrote:
> I have already completed the support on A9, but cpufreq-dt currently only
> supports the single-clock case, for example:
> dt_cpufreq_early_init()
>   ->dev_pm_opp_init_cpufreq_table()
>     ->dev_pm_opp_find_freq_ceil()
>       ->_find_key_ceil()
>         ->assert_single_clk()
> 
> set_target()
>   ->dev_pm_opp_set_rate()
>     ->_find_freq_ceil()
>       ->assert_single_clk()
> 
> Both of the interfaces above are limited to "single_clk", so SoCs that need
> to adjust the DSU clock in coordination with the CPU clock (such as SM1, S7,
> A9, etc. mentioned above) cannot directly work on top of cpufreq-dt.

Have you tried something like this ?

drivers/ufs/core/ufshcd.c:int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,

Finding the right OPP should be done based on the primary clock only (right ?),
but configuring multiple clocks is possible via the OPP core.

-- 
viresh
