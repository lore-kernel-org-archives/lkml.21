Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657720;
	b=E51K7Xp/DhZPS32qMDsSnvZsMT1WtPiqa5JGV69+eanP/UZp3yW1IXsGp0IVtIf9OVgM
	 Uaf/1nnepXjG686KWUGarZ5vWPoxVwYbdOQAqlw3Z1sOQCZ97zjc0rNSFu9KZHNRdeUFH
	 2DUQEXBYaxSmRvgM7gF0zDLGQvAI3f5NLl9w8b3hDg8Pth1rYUpVAQgFkGA18P5sgcZL6
	 uwyd7PDteDHepeYI4j0SUWen0GwpUWGsSpSS6We1YH7o68hqgWuTTV3xKb8Ju+ziNshvI
	 U1qSasd2h9aR2glDWMb2YvzdieOkouDalk8CxypU3uutVsWba9y7RtT79OynzSyRtOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
	b=P/7yPG6tRbOunvw8K3Hq+L8CvNIqzY4ioGJSniAHa2eRahP9HBUziBwnx0/abGSrMKFg
	 PfQ+4g8UrfIXUtrSGwxPRl8tQLVyimF9CJECcxRhmDJnWNp+df7hBkU4vO4YjHyNeAFsi
	 UW4Iqf51zeGtr4TWb1cC06MakiJgR3llV8X/HJPb2ZY5IWUemJESP2173z5/DFn755O3A
	 yD3EYLNCPATF31c4GNnbfvox3vzw/LubbCFeBKRLJ4MhdLAJw5raaf7sJRmUs50MJKCis
	 IJf/+qWKtOlQK/rSDImcK+trVXIMabIyAndl+w9+CsgZguJAnF0Twn+m4+/RWK/WcKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQSzxchW;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF2D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF2D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQSzxchW
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91e7af9a67fso39270966d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657719; x=1796262519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
        b=hQSzxchWLCNm4jB8simRGB8bDBAlY0D9Vh/YLFVYubFLqvvbO5kQsiKwyECCuUcXUh
         OT5CfaXyHJVzxBIEv3CHuZcLcUYu6EbR3hwY4vD0U3mK5jd4FsXR71vidJIRF6FETUgj
         pZO85ubHxTG5dNZtimvzlxV6JFEOoRUctUhcsJnE2p3wkZV5RQ0VzIogJPIuvsOJHSXx
         5cmQh40zbSQXBHJA1Wp3qFYp4fOxIJFfVkm510sE0fsIKh8Y1zLt5cUeS4xjfpD5IChD
         O+3aZmS/IQwM8kpfPQ+Rs2iIIGISCo0A695Awspu82ujSfzWMjm1XeTeewLZapku/tRN
         hbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657719; x=1796262519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
        b=B7YBE2pWVeBe05tSUcrWu4F9Cg+vpXMG1YKAEIKU96/iShFIxUJzAzA7ebmad7PH5i
         6f92wMrEnVfyCzdIjEm8JeqCVGg6Yki/Uj6pW8xrvvozj7E3yJtJ0xbWQI+2YnRj3v/w
         D1QOkZ4VnGroa71xaNH9SkemFyFZdeCk5zeP3UzfnOQ1NX/ARf4cDUUypqSpKZP65fva
         FsOBMqPNN40l0XDyVL8zRCRfCuifrFD7JfmQNHM/vrTEEoBZqlIaUR840n15U8otHhL6
         6RSUe4iIo4TmNBBAPXALtfFtGl66xoLKTHaf68N7YzZXpSTVBcebSRPsXUoju0BUnhet
         ml/w==
X-Forwarded-Encrypted: i=1; AL+hErEMRQPZNTE+22LQsHNXyc98TJ7L9Dbr0hhKWAtJnmX7nZeib0PE10sil6Wqu2Ftch2Wk45V75VlY202jr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wFRLMZ5zaHE095K9lJHSFjwNXNFTADabKGkOQLRSwdJ31hhiP
	AA+cDkhPfYiGt62tw6zFPrzPW86ndwrDYSDTI10/nU5olHKk2tIianKK
X-Gm-Gg: AZFdTZfpef7xbCRNP0xKiTS8dcbRiQkzyCgP1a1QBFyejlFycIoJ32oCFh0qnXhrcjJ
	a+WNfqMQiUdopqY1/JQUVlRRhCt4jIYs+ZXTDRMANOtMJR65dGqfF69iKJLDyYYeaRucNptnSGU
	XiIQ++AqmxdD2R6kDS9BsYSWIRI1SvUFzWDDMCoXK1zTWOMo3vNFmUk9c9mlXNo5K7TbvzOus6h
	JDOq1cwsky+ojB9WN1dBfc/oJrATOIjPXktf+PRk1N1nRizn8rRnYKJgA7d3TenYQ4/5Pg9iyh3
	l5gI2avD6tambtQ+9qkkAq2A+w2fZKknpblBYWgK7m8SfqM0Rg68wxPXS6ZCpXfnI19t+xH8IGB
	hkKHWEcQLFKsXB7pnH9qFBjlZS/BvCXgnomXB11sGhzWI/nNE5iAywktfx/uHontz857Ozkc4ZB
	LMmKDtybjt02dvHj4RAGLzPTA46+LXH3J6vUxS5wgMB+X6iV+53QTkHyVcM8/dak1+X8EMuAJwh
	xSy0wNyO2Mk1W+DnGQftukki79Nv1dIf4vwFQFkfHCrQd59aqqW0b382nO38yzJzSV1meXdh9o3
	IEVIui52IakI5P8+D2XdA7WKp9oKBRfsO1+nxiYI/ei/vtP1TU1Q82nuh/RwrUxcin/0IjKIL18
	yqdwBB8NiOJDxgvMSC6lK5DZjSp1vmZ5FgBDQ3L6jyfxa1u0+uncP
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr3259261585a.73.1795657719106;
        Wed, 25 Nov 2026 17:48:39 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm1476099385a.39.2026.11.25.17.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:48:38 -0800 (PST)
Message-ID: <3167e5ef-920a-4e1d-ba03-bc928687577c@gmail.com>
Date: Wed, 25 Nov 2026 20:48:37 -0500
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
Subject: Re: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
To: Dale Whinham <daleyo@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>,
 Charlie Garner <charlie@akao.au>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
 <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
 <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 8:04 PM, Dale Whinham wrote:
> On Mon, 23 Nov 2026 at 10:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
[...]
> 
>> I worked out something very similar as a solution. Anyways does it work
>> if we also add the check for non-zero dom->sustained_perf_level ?
> 
> Haipeng Lin has an X1P machine so hopefully he will be able to confirm
> soon if adding a check for non-zero sustained_perf_level into the
> chain still works.
[...]

Confirmed it works. Tested on Surface Pro 11 (X1P64100) on v7.3.4 tree
with this check

	data.turbo = dom->sustained_freq_khz &&
		     dom->sustained_perf_level &&
		     freq > dom->sustained_freq_khz * 1000UL;

Firmware reports both values as 0 for the two 3-core domains (not just
the frequency). I took a debug print of PERFORMANCE_DOMAIN_ATTRIBUTES

  domain 0: sustained_freq_khz=3417600 sustained_perf_level=12
  domain 1: sustained_freq_khz=0       sustained_perf_level=0
  domain 2: sustained_freq_khz=0       sustained_perf_level=0

With the patch all three cpufreq policies are created (cpus 0-3, 4-6,
7-9), each has the full 710400-3417600 kHz table, no boost freq, boost
disabled. Under load every cluster scaled up to 3417600 and drops back
when idle.

Please feel free to carry the Tested-by in the fixup commit.

Thanks,
Haipeng
