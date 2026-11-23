Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469995;
	b=nC5LUvaUPqS42e6bj95j6IH0RVEok+xkIMbyNoaT6lsMOVbps41125XVUdJYvSChPnrJ
	 mYIxaECD3QspTohpNK9gzj/db2oapVW1EysSvpweK9hprU4MdLlniKBIkeArus8JCEQYP
	 Z6lmli57sOxAtc7IuTG+V3sB6yK8cbhR1gSjqiCWFpKJEPulhqa9W8QVl565uxu2V2yAO
	 Rzn9kcFYG+OMlvQveSDU35T+RFxVGeIyKWQ2sOedLqxfd5kpFUEvrPmqNmO6x36SKDxKH
	 i9ZyFjh21jEtYTYFkwc6gBFvjhmeOp9TKR3PIGry3CXv58Q5C46T0Q/BgY5QBlojRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=c+PDPXDESs/b1ufFkIbKI7h6YPsn4ue61XHoi6R8yv0=;
	b=2r7k6Nf2k5BAvtlhavAMALPAaM3Af3ylAi3xvpt32pTKeQ65RMsP/c8Gr8Tlfn7Jj6CH
	 90YcQ/5EuH4N08/cTZ4H7TjfAOl/3F8ocZIOGKaFuxHmUVVwEuBRewLj4sJSJ+Kx3Tlip
	 NpUJVvURgsY9hDegtoEK3pykYOqFHav/olsbYMvG3jIXa0RamfIDPxvUrwEDo3w2juSNx
	 2rYiPoxti3WFQo5MW/ZPb7W+O3jkxczxiDyF/zYnICIOw5leXYfbpiIVcsbxkUo3Rdhf9
	 ntHEqsOl1vr/PghcKdCM4AdGu2iKqIzyZjogsLDoMoMazfOEw40aFk3Gx/h1LdI2kUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fXBFAZ+S;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F788606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F788606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fXBFAZ+S
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71ad2c6491fso2588367eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795469993; x=1796074793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+PDPXDESs/b1ufFkIbKI7h6YPsn4ue61XHoi6R8yv0=;
        b=fXBFAZ+SVNzrG0yNXlS5/astelhy8/7yExaD1VmjcQ/XUyvNUu1eVWiJcwCBEkZXil
         pvfTo2USrfgCS1UKDAE0ulZz3mWt8/qptFeyhQ08FcVGBGrZ/NwO5ZAVXUJBjdy1JIup
         8CVMKQdD9cu/v+EUCIDLEhTu4uMFB6gAtRCFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469993; x=1796074793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+PDPXDESs/b1ufFkIbKI7h6YPsn4ue61XHoi6R8yv0=;
        b=oFFRyifHrU2grk7Qg+EZsgOpEgSGYdflyfj8ct6BUB1x4GAtEZsQ/pR/mdHMfE1gU1
         hbCKiebGimTgxlnEdbvY7ryJoS9GV1m5FuQ71sKO6A5Owf7OMyw0tUSQRBWch0A45XI9
         LHfNwe5JUn7eaayTy+uGGEM6fFr+qMMUhJSvQ7rNCQUPbqdvENAMX35pYKOXw1rgXMM4
         lQGjMcWdYca6BsI2349aNjvwU7WAac50ZHGtKuTg2X+4E8Pp44rNByGqLlGkRBwYZM4S
         1yqQ2SbRyRrN09jcO3zw7Lp+T4YVLQyN16l+ehhIBvWxNixkFVfTdDkRFwra/fVoI0SV
         rnwA==
X-Forwarded-Encrypted: i=1; AL+hErH6rl+fBVy9uwd4mqpjkXgiY3szjQoawHmDRoNZ3bmVrUVHoXGaJZcoAdXYznAoPezkZmjp8qIC9IKnhAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CpPDi9B8ktNao/3PZm6GJZ6tANmR5y/aYYfC/yjlbuOVmGkds
	w8NSosoNaNPWAEVNvVexXLSbz2w2/mVED9yAqUttj3zKqA5nKOs39zw6qOn3kjDUXsA=
X-Gm-Gg: AZFdTZcETTJ/kowzwSVj9t0jFoZvRQra3xp0kcxFO4Anu6r16tVED2uML0I+U0aOJCx
	wMvy4gU1JPQ5oTkVrit58IrDUtiqYLQZA6Ni+7Y/sUzfXKAaT8H/6x5PlS0rjpKW8+mpEUcL9Ky
	R3LtPq9cuUVdZsrcnODpCTR/cbRRtgqLnc5kNCSbhFxIjx6YkC9qu5ayoWmpGH5sjV9nVc+AW1s
	LmnMYj9q8qxuCS8cKDdLGZ6Y0hCns/7uc5VDRgm3RvA9pz1rY1dMVlC5zuJ2Iy/lQzCQg93K5LB
	SjvQcdC0YfSpfPbn04+04I/HYEBF99R2nWR0iMd6uHyhapuIIJVn+W2OhDrG6stxXXI0vwAOAr+
	nMf6w9t99thlp8yiACrbUX0yPi5Jro3eo+DHllgLEtjRZDKqaWwVeId51CwxulBA1ugThLsZmNF
	IhGHxektJzGwZdeoqGCaEOlinbYlJjCiDJl711ujKsAhcPbdvv9Z82o2l7+4KtYrlmKj/vu9Un8
	/RToPCJr5iVeScOsSzizQKc5ehDQ2MCFBCceMp+OV3k+6QRxJ2XEYZxwbftmpbUdzIgt78AIcrs
	ZeJ0mRkkDQDP8BRVOvJGQyCZV5plJXxp/mb28Q==
X-Received: by 2002:a05:6820:4515:b0:716:bf4e:4558 with SMTP id 006d021491bc7-71b394f4d53mr7216089eaf.20.1795469992803;
        Mon, 23 Nov 2026 13:39:52 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm8213426eaf.11.2026.11.23.13.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:39:51 -0800 (PST)
Message-ID: <b4e4fa4a-2763-42da-ae9f-3ae65132f678@linuxfoundation.org>
Date: Mon, 23 Nov 2026 14:39:48 -0700
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
Subject: Re: [PATCH v4] cpupower: fix use-after-free and stale limits in
 frequency-set
To: Lukas Beckmann <lbckmnn@mailbox.org>, Thomas Renninger <trenn@suse.com>,
 Shuah Khan <shuah@kernel.org>, "John B. Wyatt IV" <jwyatt@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261120-cpupower-freq-set-use-after-free-v4-1-928675d53a23@mailbox.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261120-cpupower-freq-set-use-after-free-v4-1-928675d53a23@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 15:17, Lukas Beckmann wrote:
> do_new_policy() directly fills the unset fields of new_pol from the
> current CPU's policy. This is problematic because do_new_policy() is
> called with the same new_pol for multiple CPUs by do_one_cpu() in the
> slow path. This results in stale values in new_pol being applied
> (starting from the second CPU that should be changed), and even a
> use-after-free (for the governor string).
> 
> Fix this by building the target policy from new_pol and the current
> policy in do_new_policy() instead of filling the missing values into
> new_pol.
> 
> Fixes: 7fe2f6399a84 ("cpupowerutils - cpufrequtils extended with quite some features")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lukas Beckmann <lbckmnn@mailbox.org>
> ---
Applied to my cpupower branch for next PR to PM maintainer.

https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=cpupower

thanks,
-- Shuah
