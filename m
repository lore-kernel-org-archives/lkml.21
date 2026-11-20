Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148367;
	b=gxKLGovqtIw/qifgBQMfwvdGanOjexEpuYIN2iuziGTpXcCrWCfRTc19ay1j5qApxJf2
	 vNT+h7JPZ3/0gLLY42USTIOb8QLL0XqkdXG/oZzo6MZu180o1/+BDwZB7LamgHMclZCZL
	 GACncsZ3D3gSn0zbceQKuLVZDwRaGQFxRrEUciV339o76KFOEsUr6g0QoJIWxT+KlgNre
	 rAmhkohOX2QsJqXdu85bFOzvyO2Ht+AhOW/EMgfcmUxBHr9kNy3Ewu0SHNYCskMATEq/h
	 gm5gBoQW+kp8fb4wUh1DaAjSxDCvnttU2GXHtgmH+vhd4hR2aZSm62Lz3FbYUDH9gvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MU5DDe8WPNLGbF0itjuTQ81vCKFzjS+1XQz059WZL8I=;
	b=Zm+8RHOixa16KSVny1S3i0EL7Uy9SltXL6itJHl5/qp5tfRPEbM3IDm5E0to6MeB3Tpx
	 M2SywbVN1JEIqkcu/BtEk2EM3Qd1OdtGJ5KKvUl2JpKVZ9uLNhVKKar3aT5UD5oh7TUVf
	 JhDGkMxTp7PZG08gkuS0zCDAe0LYVqlUEGetLcgXEm81NPrTYCiohQijKIL/nr/e9X9Nq
	 fNojNBRzpJK82E3jM3dPYYA7tyX9ONiI6vEtOBEzGx3Y3dGZ200CobpDxD7640owfF8QQ
	 5r8sXkQMRemaXPH7tzOFCG+a208RTR3BCMJjmDVAHe3v0WjUr+e0ZlevmPn5z2XUxJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=aZXTfAqU;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709060A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C709060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=aZXTfAqU
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so682382eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795148366; x=1795753166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MU5DDe8WPNLGbF0itjuTQ81vCKFzjS+1XQz059WZL8I=;
        b=aZXTfAqU0L8p0w00l2jFW19n66QNVhWySfhA0SY7bf3a6UZRLlN68vzHGzolYo95cG
         HLIvYxsN8du7bkAAMWKrlwb/eYZ1IRjHQ8laCDLtwacn3CBOaTA5ahJP1q+Yv6UVeKQA
         rrtYcUHLXdSlhG+5v2fzUxjfXZjQ5GU1ceCQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148366; x=1795753166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MU5DDe8WPNLGbF0itjuTQ81vCKFzjS+1XQz059WZL8I=;
        b=VRV5WK/68kmNFWW4l4AmGLImTQoZTo4ckcWMyHBUCg2BMK7pSJuz0ugzWNwrRS07iQ
         9GmDBPLOmVZ2dauzpZPcNKRjhDVw9eBjoxHui6v8zLYPkfu5Y08BE6EqxLIUxrPKCqig
         NwuPIqDCHjpuZoHep9OoRVbXyZehYAJpNiFfRnsDQfY6EhqlZMJxQB143/MfFYEHw5PR
         n5GGUdU3D7tlyby2yp+FUeeRHoAWpbXcQmK4NeKijbvKCNENPWm0FkNWkDLzhCR9q1We
         4vb5Nbz82jwwQoug7SMLGKigG61RIKSB0x/ik9Cl1+D7W8ATeOF5dKIbTx2+WQZwFDLl
         /sfg==
X-Forwarded-Encrypted: i=1; AL+hErHROPJzqzSGqEw0Wc22uo4M4o4kqOoMDiqBlxcKGLxJJFyWqbdwsIRxZ8WkiOS99RbbkLBmaMgVROsYhTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yNdkYKZxIHyHD/aL8cv/eN//1v+hmG1V0crksSxqY3IjAk3Iz
	qwaF0jf8cU4BFDYpiihbCdLSzeioV53hl/wOThbhUt1S66EJU1vC429dykedOVziepk=
X-Gm-Gg: AZFdTZdsS4BrsYojKu/sZngsUdRssgbVJ5Rs4YCnagK8+vchWPNoF0Wd3dQ6r26DWZL
	4lyignpOIQV2qtRmRQy/ITUBo9E3dNd9fFNVnwmtL/VA9bzKcMBXHbsOoaPB6so0CIJYfIcOslw
	9jCGOCCtDuJESmJ/YuYNWrNj4OLKCgiduSGnIFnxZnhpT63yWdYz9cSb0g36DKjYhKcLROdeu3w
	BC6HUcyifzY+wA49v5x+x+XJYkIWeYCbzZkyqePhIgbbiJB/j+VXJDACDQ7ke1Q/j4x9JRR9yR2
	41qslzkOITEDUhty7PmxWIfmOVRVyzAw02TobmzIF15yTZTzVyB8RZZX9+gJ8XZdC6+Bu3Fv9Nv
	hYjl0W9Eyet5y9GdKJ2xZUoHL5SrxEy65cuEaf0MZUrew6znvdWqdSvZGUzhA/7zhKi57Db5CeP
	BUY8AfFSMH5eGweCKy4VPXu+bqxO2GAhSSz16I0bi8yrSSDhhZYkFUksD/kubF7CwBr0nZ+Os+/
	Jnmxh8uMCDhorni+M1G3+wP6tQCE4nPg/aTNZ67YXqUPvjc0jukWPAh2t+LNiIesNasVq4A1UrI
	jyzlDgLd5H0vcRSSpDNn1xkhfJ9om2+xy1/ne8ZHX/m9T5A8epe/1RYoJNKEg4VCCEOSvrYfcoi
	2uYgNhpq4kSEe
X-Received: by 2002:a05:7300:50fa:b0:384:6487:b155 with SMTP id 5a478bee46e88-38570c359d3mr1744166eec.29.1795148365941;
        Thu, 19 Nov 2026 20:19:25 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm4107967eec.5.2026.11.19.20.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:19:25 -0800 (PST)
Date: Fri, 20 Nov 2026 13:19:07 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Heiko Stuebner <heiko@sntech.de>, Gyeyoung Baek <gye976@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] accel/rocket: Report NPU usage through fdinfo
Message-ID: <av_KNIsnvL4GXCGu@rock-5b-plus>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-3-sidong.yang@furiosa.ai>
 <3c5f7694-e6fe-477d-bfeb-a130c363f431@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c5f7694-e6fe-477d-bfeb-a130c363f431@igalia.com>

On Thu, Nov 19, 2026 at 09:31:54AM -0300, Maíra Canal wrote:
> > + drm_printf(p, "drm-engine-capacity-npu:\t%u\n", rdev->max_cores);
>
> Does it make sense to expose the capacity of a core that it's not
> actually initialized and in use?

Thanks, you're right. I'll report rdev->num_cores, the cores that are
actually bound, in v6.

Thanks,
Sidong
