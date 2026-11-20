Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160660;
	b=oWCyDXP6iT/5Rf6SDIiRo21+FlBEesQRlUw0w27T6AcuL80bzRauyc/g/r31KwtAHEDd
	 bHHQaWuBi1lcLfbn368Bg708+2zqJBwzC74w6AUn+LXz34sFW8Dz8XluiujT2tsXkVMhq
	 SjPEkHXAVqKjbJwxaZuJqHDC93VyqcgLcxjz54mm/YdEO0HNUcwT+yOTiNDPsjJjAYRgh
	 tnBGFb89PmOIXyWY4xFnKHebEMuBGHh0n8Mgs7BRiACh96rwaRvPP80nZZdqtXa2HJsZ/
	 jsmLAasElDdKCz0e4Q9csrxLFQyYDm+HlETM4b+PhpB48vW946Cx8GYrb3XNKVFMCrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
	b=KlVphce/v4Lt7bDLULQdnkZYS9VOyb7UAre0N8AVbAug0bh3ozPqcHxQWMWlE0Ge8RgC
	 cy0+TPym6VjOd6oHzTEr54R+jGe0GjIq9B5XoEBfpbAYvjjYgMT/lc6JjrLBPOuF1OCwz
	 pxo8sZKSjX0q4aeliEquZAkbulZh0VA383ebV2v8AkFx513njpRnPrpq1hlOLWvAvWMYU
	 Uu6CGLIh/h5Dtoj78u3oG1HiHPRVUqc/4bKglbI/iw+zMNAHchzG2Hf/JmScDrOPN0FVI
	 0lDmPgpJizuVSz4kvpySjOp35SCP8KAU49dAvAgAY8blpk4BCSUtvEintzTC605/xqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MVdH0dbZ;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B337B606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B337B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MVdH0dbZ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so876769c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795160659; x=1795765459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
        b=MVdH0dbZECMyRVts4clMgTTtsiSNkQYMFVjvvp2uQ0gO+y1c1szeDBPX/F8uygQrj2
         SbfdAavURbpFr4fbi+sgpKV6Tddic53/AVIVaKgT8cps3fcivdrokWALa1iMft0nh9GS
         zybLQByYLe3b/CeAFZsS3ekpM+tsWIDsSuXTz0AcHjctFr1lue+uApIkOIU/GqeNqyXg
         cfYoslTPciTg5C51zrlXYz+BpV2r9fJPjsQOQ0Av/l6rCUmF1q0SqtRXDkV4d16oFXof
         WGYfZ2nyv126pilNMGwRY66ySZPAo6Dfw/gMG2s5Jfdgiwkeo+j3ZGp70xpYpx4KNoK5
         sP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160659; x=1795765459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
        b=qI8jqVn5FTmUaOMMJmwrmq/61DPMwnSglZlqT3qQ1kygkAANPpEuobt/7NZ7gWkawR
         YAEG4bQa0sBT1zx7DoC7xidHyY8B5HZ1wPqKKrMhq6hLGLwOoZ10hrfQLf/mcGU3EaIq
         9bYaTakT76xTLqqCoQxOYLkoWEVL+dtmkXzjKmB1kDmeq7Hw83fE0E3KKP6r3ZjG9oA1
         nBARyTeguNW3CgNb7ZQdL6vl8ugenTEv2VF9LJUI7jQlutWrBDRM9wv8Oc+UZp1C6tDN
         dV4ll14rh24ar8hCGNBU6ARTB3SLhpB123L89HQnTGiKXuP862G+YLG1x3SCCgenZUCF
         zh2A==
X-Forwarded-Encrypted: i=1; AL+hErG40uO6CiS8gH5mD7ydSq57A63/dCHO71/bmDguWEfZ8Uk1Et8raFr96RYllreaQw0G/u/xxIgC1kL6dEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mK7qDPPjXXpJVVILmQwg69PX76aBXvwnyHiYGXJ+mTPJm+rpn
	NO6YpPl0sZmk3K3wvb+XOZCAAKlCHfgpqQa9us7fPGC6laCbFQ4hBpDttjOONKKQkyw=
X-Gm-Gg: AYBFou0QOwoOGgbz62uTpAA7JaPvJJ+KId1Zk5YmrriF3XuA3J1iWYTxUOqoTHZRiYm
	3a59HimiGLufNmJ+8XvFxYgF8x+TdH2BnKe2gniq/N7Ar0MWaWDorOvl4OAqv6mEQxBcWR7hQtp
	gLzJzlzdKShpAAxbXWyHmEtu8KPuBza6dDhF/JcxzTwLI75bFtQ91yt+CAfqfZhdb5+ns8wmlZB
	cMqJKt7ZuPsCjsjwOl0EwSZRg30CLXqP3jqoIszmdFhnoUJ2ecSSJiVXv31XcmYJ8z7nrbC6HMa
	1/4lSRcr1y+rX6CDaDvnR3kKzTopq5j+bB5W+p01Zc0HuEW5xDNX/6XEcxIo/XjUeDzHiC3wMaB
	psnsOH51z0TaSbu5T1T/ejNZg8PXWGKALq+FhUnluDCw5zWbaQqIEv8JPOUWXfp9v5W98SqlC5T
	5QumWyKMezWE/68vEjcckLCB9ndOjj8I5KdcQOUrXlludSBi0VNWv211DHA1DP7dYm1CSxM82RS
	KXieXV/8peMo3doqabK0DuRMLXEjFBJDe7eRXJpWOpmP0Ri4aGSUmj3H57LNooiH9IsuA/cJLUD
	yb8eDX2T7hMcoOSIsQRH+xcO6xQmMQ==
X-Received: by 2002:a05:7022:f50f:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b5567b2091mr1764911c88.1.1795160658571;
        Thu, 19 Nov 2026 23:44:18 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm6769427c88.11.2026.11.19.23.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:44:17 -0800 (PST)
Date: Fri, 20 Nov 2026 13:14:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	zhongqiu.han@oss.qualcomm.com, conor+dt@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
Message-ID: <av_6T3bqEygaKK3q@vireshk-B250M-D3H>
References: <20261119111217.902071-1-sumitg@nvidia.com>
 <av_R-8aMX7lL83ln@vireshk-B250M-D3H>
 <61d207b2-3155-4613-bc9e-588c68f276fd@nvidia.com>
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
In-Reply-To: <61d207b2-3155-4613-bc9e-588c68f276fd@nvidia.com>

On 20-11-26, 13:06, Sumit Gupta wrote:
> v3 was on linux-next, which has commit 4dd10fbbeb9c ("treewide: Convert
> devm_kmalloc() family to the devm_kmalloc_obj() family") from v7.4-rc2.
> 
> Your branch seems to be on v7.4-rc1, so v4 on it would conflict with
> that commit in mainline. Should I send v4 on your branch, or would you
> prefer to move it to v7.4-rc2 or later first?

I moved to rc2.

Applied. Thanks.

-- 
viresh
