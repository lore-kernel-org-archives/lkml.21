Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403830;
	b=tFsXImO/f1R80wVvF5JbGgesZW/y6AI8PPXqfh8y5XjRmPC3Ud0NkVtz2aASTaRG7PNz
	 HZjbxNiay29QIPEp/Qq2/NNZAjv5q73n8nFwXuX1ufYbPX344V5CGWhboX1jIpMHFCyck
	 g9xdtdzxw+FDqpa5CoSW1nxLRLk6BfJX+lrrCOCq5zO9HMDvaFRet5Vaz9C4E9Lo7ghN6
	 SyxcaYe8sTCYIGcDsvxbiswNmn0HYDq21IJO7pbAQuLspuN3KxQGfB/HbxdEOmEQ0cDq0
	 zAHX16+1gjSx1MLIWISUz2GRPLdnDEKB+VjRCj6FkC3owZskJlZtsS5mx5vGNfISe2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pWFmMqdiUBIDsbICVgq5W2a/9yFA/N2NGvzbuzJhY5g=;
	b=qhf0TLbi63oAe0LsrG9ZzE79JbtT0p1OiRghTavg6jBnrrALPbdiZnvvXFSn1h1kh0Rs
	 mHYvGgpMz8VfFHWd2RAK0ygLrYfF51GiShAWm3v7xWG56QUNmzAadLWjFfqyAPZ6BijZw
	 Hqckfvm7I5DY92sz4pTvbIhc38aiO5ZRIbjzxb3BSEXQubKDP0SRYAK3WbbW+TNBWG2Xa
	 NIxQ0NY23wCk1nsVw5eBsui5XVIfNTrO3WbJbHNBlkV+kL3lA+srrtxVhg5dQx9oO1OKU
	 20IaV1NQuViiha5brjSxrEHFbyj7+zKHZ5HYTPFsdesYcpvLJhGcSkknMUCUmcqF2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMmbiF6Z;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DA7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMmbiF6Z
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1102766a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795403829; x=1796008629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWFmMqdiUBIDsbICVgq5W2a/9yFA/N2NGvzbuzJhY5g=;
        b=eMmbiF6ZxgPuFDAR4rlJBb8nL1IkFTIG+dWHkPERXKufQxZAwXVwd/UTn3yWR2jef9
         Cjt5IC8KHU8BoFGmSvhQTBU0PYqiWEwy7ahy5Kk7ieOGSeaQjk7e5fwBDHoBsZPwuvNN
         BTDSDUlmsa/MS89hkSpKYnXEg8jT0obKDJ6kAnRGJuxn92/4l+6iD5o0ljTshq1WWhGV
         HV670sCkbQxUHyGU+dLLzwZ6GiUDmJYBFXUj3WcZQd+GwfeE7TBrjLqZwmdTl2kr0uOv
         Gax3ngbZNhP60Y2XRqwHDsYiNqfFAc+lhjGuQ0bt58HVOk0L0dmwaj+X8/JEhOmA1a61
         Gh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403829; x=1796008629;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWFmMqdiUBIDsbICVgq5W2a/9yFA/N2NGvzbuzJhY5g=;
        b=bNNHKybJ3N/aEtSs6Gkvhj1WDc9H91q4wH9P584wDS12/2kXzt47TzZOMKPOUHZs26
         xAo12FUvFQy+v5F98EfrYuhPf2mlr9AzVTbONfH3bgfBlLo1BEO1au669WlW/eVwzjQw
         kghj1XnZwgglCYZUVOStxtFQ4Jkb13wIxVhLPAZ5r0+mQ+SdsgkKBah5ASrJoi0xHayB
         fbstAeiTCExulQeqqSu1LvyHpm/2sYCHYYGevcM9pMnYxZOzijndbHLpv7ZqFDmx4adb
         aWlL2plNBYcLReQc11ekWD1ktI4nnuCHcnbqwd7XZSfewuaDgIC7mhdmFoKt8VzicnpO
         +9Ow==
X-Forwarded-Encrypted: i=1; AL+hErF1zi39nrzRkgGQDVujkH9Rrwrs2TSpspfQwVPZPGVRvLPV4yq3WqG4V6/KFQ15AZ42lujZH5KDqYj1pUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jJvvxb8sUEqVFGLcvJZjf3zlKLLfzmuBklJk168NeWfBLMqO1
	eqLRCjSfGKunwXz3+cpDA7DjDvxNYDKw3tC3SZDpawg3g0l0vloPl8iuHa7IAk56z5o=
X-Gm-Gg: AZFdTZeSDrTln2+Z6nbexQ2KrNiXCCQwLtra9gRBtVBRyZZhkQYHGS7E2ndx5+maOVG
	xqTsOhVSc24WFVX4m1pdbhO7c/RzU3MWo6aW8vR/T+f3Ar2vKGlT8EG8vthJHTnrkOv4Wx3Qhn2
	6qgSnKwStutgYAgmESt9eMvydw62IC9fhHBJk1I7qW7nWJO1KQtHxeaawilHJL/J/VpZDfpG1BP
	sUbGrjgeEVz5HhOPCWsdrRp0VZHIw5X5KYRWsmgISxHuPETZK2IvPOOOQ+FkzRf69adw0UrZoD5
	MPu2R9B/ptWkW/dOTBFiG7MRligdZxM/Y1QOh+6qDsV3QYWZGfgdq+5/4gsTcyTM4E+sVAl+vT8
	skgSDGj6dEEx/iso9M/Axaf6HO/WG/tUTmHiA/0bl7IENkk0xBsyjTFJtvpwwFMbrNXUujLBqH3
	utMVOl4csyp2ye6w32kDnNQFKtcdquWiapCm4zpRVHzBuIGTpI7E5ems43PoIHBvK/NrEMZaLfl
	cQxC4ZNLSjyaVsWQWvtFYyGM4vsIPq9aFN9LwHW160px1NcUjtCaFaKrluN+mtE1SfSZmEgemkJ
	EFVN+JyONHUwL6DOqi6q9S/ljiRMNj+AI3aXwNvjMOaD
X-Received: by 2002:a17:90b:1dcd:b0:3b4:1bf1:988a with SMTP id 98e67ed59e1d1-3b41c975107mr8883441a91.55.1795403829307;
        Sun, 22 Nov 2026 19:17:09 -0800 (PST)
Received: from ?IPV6:2601:600:a482:7d70::b4f9? ([2601:600:a482:7d70::b4f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b776a14sm5911407a91.2.2026.11.22.19.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:17:09 -0800 (PST)
Message-ID: <e011f909-bc90-45b0-9065-e517ffcbcf2a@gmail.com>
Date: Sun, 22 Nov 2026 19:17:08 -0800
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
Subject: Re: [PATCH net v2 2/2] net: wwan: iosm: fix S3 resume by re-binding
 the driver around it
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, nihaal@cse.iitm.ac.in, stable@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261119042714.505405-1-davidlwesten@gmail.com>
 <20261119042714.505405-2-davidlwesten@gmail.com>
 <5651d569-d291-48e1-b38d-8cbdb2c2f0a8@maciej.szmigiero.name>
Content-Language: en-US
From: David Westen <davidlwesten@gmail.com>
Autocrypt: addr=davidlwesten@gmail.com; keydata=
 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
In-Reply-To: <5651d569-d291-48e1-b38d-8cbdb2c2f0a8@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maciej,

Thanks for the review!

On 11/22/26 12:01 PM, Maciej S. Szmigiero wrote:
> On 19.11.2026 05:27, David Westen wrote:
>> - Entering suspend-to-idle or standby explicitly while the default is
>>    S3 also re-binds the driver.
> 
> I think this re-binding should never happen on s2idle, even though S3
> might be the default mem sleep method.
> 
> It looks to me that the only remaining case here is the "opportunistic
> sleep" code which does not use mem_sleep_current (so won't be covered by
> pm_suspend_default_s2idle()) - but uses autosleep_state instead.

Agreed, that would be better. The problem is that the PM notifier
isn't told the target state, and pm_suspend_target_state is only set
after PM_SUSPEND_PREPARE, so the default was the closest the driver
could get on its own.

Covering both cases would need the PM core to make the target state
available before the notifiers run, like pm_suspend_notify_state in
your earlier S3 patch. Do you think that's needed for this fix, or
would it be acceptable as a follow-up?

>> - A suspend to S3 that calls pm_suspend(PM_SUSPEND_MEM) directly while
>>    the default is suspend-to-idle is not covered and fails as before.
> 
> Are there any such pm_suspend(PM_SUSPEND_MEM) calls in the kernel (outside
> some test code)?
I found a few: APM emulation, pseries, via-pmu, ZynqMP, SCMI power
control and the SPI slave system control driver. None of them seem to
be x86 ones.

David
