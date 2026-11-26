Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689244;
	b=mJoY1aDDkxZxUz4jgYmCr+RUMA/4wckDTYfQ/l1OZz2+Woh0pT0eg784eu39HUqNOnMT
	 gWYBcocJVSFwEgoigWwkR/E//PsE2Nkn5woDwlhBlfCTG9ncUUBqoo2RBnqya20lyzHnN
	 gxBxswFMPaZjVR0u6X593prvQDvo/wIoFn2JmySt8WE1yt4Lq02eie/6Svj4Ny+k7zhUv
	 ymPZEGGq69H1aGztvHYFENMBUgGdazgzF+05Oma/5MocduTYNuxcfLRnzOzFy2Cs2vtRy
	 W9xcH0Nmsm2orWV64/r8w6qdNJlDM4l6nVfellE370bohxtF3lwWDd5pyTvzNVnddyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
	b=iGtbJTmLoPupcvu32wRd8T5Q2U8YIUGqlwG17Va03VxEQrUwu5KQ4yzkiQCHS0XgWj/t
	 Hg36pUIbayZsjUC+3xuWQbtAfgJHMu3DedPcv5dkcx9NrICfRjz0tLhjimzHl6FsVY+gB
	 uaNKpewNYzP1x80JyP3EY4m7ryYR1DUBUelOywSDz0pHR+iIEREoNYBSqBrFbUCm16Nvl
	 KgUpXCeSWMtwbvxUJiU+Ns2YmhJNjRJy7WBZEsA31Ncqla79Oqy914s5SKCcypZ+o+sHc
	 c/U+qy8Le6oUIEhDTkTmD8SFvIgDx07U+qV8TeqWRo3RTjYoRfSNY1OwIbltLRp23Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5Dm8yJq;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841B6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5Dm8yJq
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so2534271eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795689244; x=1796294044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=F5Dm8yJqZJ/eIFY4KXNhFuQ/PKsgI8ojbyn4Qk/Mv4AzNggmrVvBIXclzBnaw0Ihf3
         TAqc4T9s57gJ7Lq9gix1mZwarusULJYDrwY9qHV0IQhC6ZxMrrPZ0rCKn5ENv7LAIbUk
         Qd94p7yYd/mLJOckfK+3i/vF/51N/1jaVo5XPtSFXmoW/AfxALbT6BzDP7CbsZk+Mdii
         s9Alx9xyBDo8JoWEUTRl+c7vn48WMLXwuOWQH2lrvec3sDhIsL4poAdHPhkEfNY1Fm/G
         Oo3G4H7+tu2Xl5TJzpdBCNcKTBDXxFhHYwOTYsJO9HM0r+7+vNkQngffTDm8PHyhojAe
         EPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689244; x=1796294044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=PJxtyllHD481H9dSgLOY1UM8J3a6NSirz4PNHB6VUbX5T+j72UTb+gUnzRN1HqNxvf
         8XEVRjJRI9UuePGuz70geI+LVIYVXGJyQKH+nVRdvKak54yHoJ2g09BETCWxpB9AnK0X
         vfNyu3xEUphotcg230ttY7wr2Rrc8S+iVUhtzR6lVobzRdmnwmVnSZ9R42j2H4VyaeYH
         VNLRQlJV32Qt+6rp/Vk9WoLGE/qne2sPKXf0ROuoBJgJ/iRSKUKvlnmbKoTCMtsXnO0u
         usYh7Qz8R9NBTXjUQwfSfWE5Z0XpW+gTIu4uU3f7FMvcMIQW1MNu/QwqAuGlvGWsIbBl
         0iGQ==
X-Forwarded-Encrypted: i=1; AL+hErH+7CHxE6aYWeTygPjzIKsZnd5NW7q61ohsNnHgKAmkrlKKmHAOvTdyMSpjV/D22EUNBV3hk2bE4PBBl7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jH5Hp6tCNIZLY772i6Ah7zJsq6S/PSwIcNya5KZcSPKokvGKT
	yeGbDtKPPy48RRJnHJoCZiDXsCXSFHyhbejUKOZxX3tGgViwEmvLX7RG1K5jDqEdEiQ=
X-Gm-Gg: AZFdTZfme/QQ5wGzsKL5p2a0Tfd26ooRw3UrFowFVAWWUTpAyRmopDCjAk1ziCNv72N
	LQT3Z+5XGSYh7ztZwmsxzca/GpkhS3zaVHXcEsvOTZxf/b+KdXKujqfCMbYN3Mg7wzE7TIi9NbP
	SB+cgWcbPp3EZvNvyAd89PAe8z0LnygGt3BwApVfY0dE+w/jQp3hwHGXjJFbyDI2HXE9y1y8jyo
	kXeqs3iPaE6uDOd8noXIGScB6QF+OcXaT1JXEQm20CBkn9myECZrXns94BfPcPkOD0O/NYsGjy2
	40eQ4ObxRrTtrF5CDXhfliGBQDG2Tgqh2m8qkKpf/utdHNk3v0kB1HPff1ioH2XMyW6mkaxBQCF
	5EYshmE4MNk++/nPLbJi1wRGUVE/1LWdZN1RiHg8wxcYl/+j5GmCZAWAYgWi2cpheLchbK1rkRu
	uJVuPUYymIY2o/1cKz+l+Nxewszzdcb7cyxprySvhHl5Y3QnMUOMhUafTC0kvFkU+CSQqnQ+5bh
	HUAPR+hBpWo36ZJkhFkbiLGjRGpLve0CVPxgfuddm2SuwuiAUTNCj7msRBBXuxi9kV9lhNowCsV
	BoWT7lQGXXQOJkpI0iqb18gljy59vA==
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr4653486eec.13.1795689243454;
        Thu, 26 Nov 2026 02:34:03 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm76487652eec.11.2026.11.26.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:34:02 -0800 (PST)
Date: Thu, 26 Nov 2026 16:04:00 +0530
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
Message-ID: <awgLGFpH73_fcnbC@vireshk-B250M-D3H>
References: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
 <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
 <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
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
In-Reply-To: <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>

On 26-11-26, 17:49, Chuan Liu wrote:
> Yes, as shown in this patch [1], I forced the above two
> "assert_single_clk()" to "assert_clk_index()" and it worked.

Maybe this is the right thing to do:

Functions using assert_single_clk(fixed-index-0), can be converted to
assert_clk_index(fixed-index-0). Lets make this change in the OPP core (in a
separate patch).

-- 
viresh
