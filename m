Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691044;
	b=c6A3lJFsXbmQ+GX85cPOg7x6fwtStpI8Yk+0vE5qt6XTlqrBDmunLHyrgc431rmbQCWk
	 kdhl2esCZ1L9N+fSg6HWaGm8fDFh1QSOssEpqODNsGK4j0occQzVWk/y018n/80uHga44
	 gSk0BNmn2oryLZB83dIkigCdEK/aDaXOZ9rcPwR7SVZ/uq6AYxJ2xiPDyEUb3ivcA3+IW
	 YZv0ZnaE59vpyhizAWH993ur/ciAIOwrUlG2NgW++sK5lyZWglxe9HWLaV6wA3/aog4tD
	 inVojYkBLRIxR5Kvf7QWVQmVA4Gk22Wy2tvYfCOa4U7dy405Wa6gsl+JFw2cl+YOQeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wbMl1PZXioIhutwHjgEf/QKIJdTG6ISgm88fxtlS6O8=;
	b=SCVJ2xfAR7Bnl4kTx5blrlbz6OWWGqUgiSJHF1oM5+plLlP3LoMhez0gsRcKPXqCl4v9
	 iOxADypZG2XxAveXiAmJddK9rStEVxQ9L6UFpVLcTW1te9iUvXZMuq4WrMPNI0EuP72/q
	 YhkmKkPJPtLkzBZXAzOve4d6Dov76xReezeZ/WogoFRh8qFWiaW3iFp9Qd2+BJns42e8I
	 lxp6+53czWc1RE+MKSEjfUiA+AK4zS1dDH2nBMEFMwiR5Kik+S/NaXU5BY4d4J+KOt4q6
	 YGkpvH9NyvH7jV0SIgJe9bMMbkOLvCOzYvR0zbvLvuCQWdQj1RG1mhxMFxH1JL3O2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L4jYK993;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D80E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L4jYK993
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so68588965e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795691037; x=1796295837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbMl1PZXioIhutwHjgEf/QKIJdTG6ISgm88fxtlS6O8=;
        b=L4jYK993lz2ish9adws/NpZ/TcP6lz8393v5p8wEDlb0hJqFvDYDz7zq51tf/uRk/Z
         hfnSVjRNre5BdqiQXjFeSQ10XnmSqg03I81bLLP4eXRqz9wM3b2CH8ObMgWLiql3sdLK
         uxLWOf9gxnWeIGon1rxiZznEZHE3KDIfPThlK8Hs5dbviLVZJUPm8WA4RmVuVBiriZ0F
         x8V27cRrr9VYVEagZa5EBhBJrwIUCrDbjuDjP4+th4aBcjfzma6wVLaRJMd7Vm6zSpg5
         yz85qvgYT/SJ0GW9BzQgXBhOEiOFh2LuQJicjN0CDKkM3MdGsBdilkzeBiJWmOvWfZBQ
         0inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691037; x=1796295837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbMl1PZXioIhutwHjgEf/QKIJdTG6ISgm88fxtlS6O8=;
        b=bHLWG7XMR0kcco/3TGaX8HhmKSdRH3O+ePu1VTEdvpYOL1XQn58vJtNx4mV+wt6RDg
         j8QM5EU/Xf58a8rMBycTmu9OtUuIp3JSJlivjvf/8DNB60dX8BBZ4JvrW9b2NtgdkCPy
         yb9K/UoRG/e4D6gmocXU7ktlsxG/ufWrDnP+sQuyxqmLPO3Cpt7nqrPcNO4p92NxZt+D
         vywvTiIqwq26pKWbvDEZDeIMZHr5gf7upOptfGL9stRxwgiuVlIM3Di07XTCbZ4nLWeT
         junZWFUBou1w/B7F1drvTfzTwmZrtBZgKPUq40dEuOx6T44Dd6juPcOSwqKkF7pYPHfO
         xcFA==
X-Forwarded-Encrypted: i=1; AL+hErECNPgIYnld6M+/2mZiPhM6/woFYnnB9q4Kx4Vn7m6l2SsUcFFbF4Rp/7oeSDaEeuatTSxHZWV26/uqLzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QGPx1PsBUTJJH8/uijcfe4qKefNYwliqDFsHnxmMr5vuxhRaS
	CoMoQ0DvIf4jQfZCTTSE9FXg7T3SSAzyS/tIGEeFu0XcHD4gVPUx6RHbVq4Ba8pI+Z4=
X-Gm-Gg: AZFdTZdhsUMOfh4RA4gxOivFFq0DYAiTdZL9l+6wwNSCxMRFRn5lMeHO5rYqqSAkE5n
	R4wvNFkZbT4gZa+mdt1TxW9fTMsBlA/Sv+DLoQNPeV0+W4LPjMWfjX2IrZHXe/lGB/GNf/GJ5vb
	nk7bIdQSa/oiMLK07wBuAXhRpVfqOhk9b4sS7Y8gpBylLBCMPmwRnyR+1bhoQ56d73ixm/r9GCh
	A0rv1tyoZgJHivjh02KuKgf84SJiINxDeidF1KNiiA2cGBEXVp3zbciNM7rBX9hkLM4nLW0oD9K
	0mzFYVsgUDpkir0nVXZTy3utzLDZHSSbrm7XiZg+5vcoAQoZPSgylpD70Ai/lwS70iahe+Ckezx
	cqHVZMqhfFA0wFreRSU+Nxwv3Q0Slp9/on/4nL4IQdF+EhRsrF/mfgzbwr8oBjgkmt5XSZW57o4
	3T4/604VBczpKMt/p+QE3k5eUQ1LTIhVvQZ1nCCmMwonJDTuZVLYBnCwLRkfYrPg1QLH2CkX9UD
	9BOEX2ACa22r32Q+3Azj9h6UYbJcQ0O+csMRYDWo4YU7fMP9yDNI3swO3Cq5bWbxsvvljtVW4H8
	8tCzvn4aibFHdHmoTQzMXzjd08WtYu+iAS8ylqWSWXpcllES4KksW6uhbcyl
X-Received: by 2002:a05:600c:848d:b0:4bb:694e:496c with SMTP id 5b1f17b1804b1-4bb88810b39mr439443445e9.22.1795691037195;
        Thu, 26 Nov 2026 03:03:57 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm41934052f8f.29.2026.11.26.03.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:03:56 -0800 (PST)
Message-ID: <1e474131-3013-44eb-b675-db532d9733ec@linaro.org>
Date: Thu, 26 Nov 2026 13:03:46 +0200
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
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
To: Christian Loehle <christian.loehle@arm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org,
 daniel.lezcano@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2162b02c-642a-446c-973e-ca80607da294@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 12:50 PM, Christian Loehle wrote:

>>> Program slot 7 from the lowest active hot trip so hardware throttling can
>>> precede the critical trip's system shutdown. Cache the low/high window and
>>> update the hot limit from set_trip_temp(), because the thermal core skips
>>> set_trips() when that window is unchanged.
>>
>> FWIW, Exynos850 control register for TMU has bits to enabled/disable
>> such behaviour (and it probably works).
>> Maybe gs101 also has it.
>> But it seems that cpufreq scaling feature itself is explicitly enabled.
> 
> Thanks for the hint Alexey!
> THERM_TRIP_EN is bit12 on Exynos850, clearing that on gs101 still stays on 200MHz
> for me. The downstream driver doesn't define it either.
> Clearing bit16, i.e. 0x09003 instead of 0x19003 does indeed remove the throttling
> even with all zeroes in slot7.
> I would probably still go with $SUBJECT, as I'd say the risk of this having unwanted

I prefer current patch. On GS101 the TMU control registers are owned by the
ACPM firmware, which may rewrite CONTROL (e.g. on init, tz_control or resume),
and clearing the bit would also drop the hardware throttling as a backstop,
which downstream keeps enabled.

Cheers,
ta
