Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201965;
	b=Klq7xsJnSHcD18hX4DoTvthdyrEHgJlIghV4q8Pwv4GU/N4UiVg+XkuH8mHCvOAqGyqo
	 xY8i/C5/4+zklRV0cjBGGHuY8ppNvKEhQbfA5BSOHG9iomr7ZqIbRmBDBcaodpcDNb35z
	 z3fTdObfCUxRVNkc5K09luL+iadYhH20LXsgqiFXauXQ5LIHqzR1S+2/GK1Y7EWssczyh
	 8Dto3lOeTLtQx0yIWutwokpPbCXYuj/nmKlYalr+qwm2mhqg56HUj2xDiM+l/mHN7ZRr2
	 eLtG/rgq5VjbMzmgqfhAicpwmu+OQMYXYJa4qkDNbRLd4hbB32cp4QNGH3AyKL0fnCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=H9RQqwSYuKH6BmFXT3u1NJ8tFtpyybE8Xg+Th6P/DFk=;
	b=YWsK4dU0wTUH51aB+DTWtzDin6SewDHJIbEURIWoQdeGomE1ThskTYpu3mfZ8EQILS6D
	 xxUYXFyx2KeZMaId8Luq9mcKI1FTIDILnVYKS76QXFP5k3GW+Ax+1jl7MyHnbwMMAW7gg
	 OVbwQkMKWfUG+P5ayIw/vz6o0nA6WyXE1AooHkL/fb/1aIkW7pDT47j148ZXRfqAqRMgg
	 SEpPpwQXuOS/yFCfJCuuFrmdnzJWakDvYNPZyNnxPH8y7VsC8iGfsZd3pa/PkL/0sMN9W
	 waPF10mfMwKuzvDJmFJVQKzuiL1hYoKlx7dtGjc8cSmEnaiENgWTEVDoamlH/m9g68g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LK+t711n;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B760A2631
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6B760A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LK+t711n
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-536717a4d83so10207671cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795201963; x=1795806763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9RQqwSYuKH6BmFXT3u1NJ8tFtpyybE8Xg+Th6P/DFk=;
        b=LK+t711n+DSL9VuH/eBv9gZzpPFvxG0ySi0PS8xdVK8Njz0x8D+6unhDfaJkdPY9XK
         vh83xQYbYXNMCn7fzKdD/N4zl9lvgzq073r+45Qe2oX17wr1yCznvmrdvWJ7bP+weHO4
         m87IAj+msmMXOrfRUlEuYN7hTBlAjeBbOTfk8G6sI1nvjyLVby4oubGlkMSogGQxAg4W
         7cnUmvN0dOhgU68pr8xyuvP4f4CLtcsFJjfmQInl4CGb/uStxOzwWJiuX/tJxkaJJdj7
         OcliXwp83KiFJnYu3uI72zunacdurHet/2ZIfy97kncqN8jGTjsZ27Mc26+6OESRD8g0
         Mzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201963; x=1795806763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9RQqwSYuKH6BmFXT3u1NJ8tFtpyybE8Xg+Th6P/DFk=;
        b=CEkr0emKcQSDKDw0+GuTdGvUUgJ5fUiixOQVcbzXgAO7CxYt/XJvkKQIX3Zt8ZU2qo
         0Ob0lZxLLAmfmrsd3rOecikgIUukHepA6ql/4jBAcs2Zadfp/70jHLsaYiy0xPgq2WTN
         Vo2GieR60yyfjlGkMHmg65zLTWPdtaDEqsQ5+PNXnVWKHClaZdgckIl8ZhxNkFVAmdfq
         aczM4exRYBB1U/c43M3Sr1VSdyhiOmZItNxDL1yuKXHdh+AEjDMfu6xVmKt43DD4iFLx
         A1wQFNuwCuTyqXCLtlgoTk5KNQErQKvKFOV0+9i3RLOiJVkh5HvKem+Z1l0+LpcjpgoI
         DbNw==
X-Forwarded-Encrypted: i=1; AL+hErGD5hO9fEjZfkYQ4wAubW+wWwrNhNeNMZtp15zkGd0QHn8YmExkWcYvr6SUQJzbZW5EXkTnzgnAAFfJD2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NBXrINCQQz1XSvyhcNKXuGFk7ni5k+zhkhYfW008MoS+Y0qx4
	0T8jd6bvBo1L6UzsL/DlA1+W4MrsmL4kW3ALScd9guvy6Vv98nQtMiDjwhK5+KiOTx8=
X-Gm-Gg: AYBFou0CAAy74xoF6uMGdTQxc40k8dYoZd961DzS9KE3jW7P9mr1B2WZIv+jKe1VoG2
	ySdvQziu8ru3r6tj0i52kxFlnlTFwODaGiokXzb7W3d9mNlk3iY3o6IEVpemSmwc/2myLMRdLEf
	ehl2YPh3Dv9k1Lzt/XLbaxQB1/g5Zig81k4n+VhWB3aEn/mm0JpYPIhvGxntxgObMb8W+9PhCZr
	6TZQSnRaSorok0AWkzswZvTS3h0W0ipOlq4bU+fnK4OPaxscwHoNbsGOQtJg024t5ZWDFSXKGWl
	0yNrhhQ1Du3JyRdqQUPgoRnnqpiQeBmjrSHc0+0OJ0hT/GNgT5D6CVvwHsx0Q0LypYfaZqZdPnh
	ZG9DLizfS1eEHNC++bmZSfTWAJy+qgF/gsyjWmxVQWiBPns0tFiJtnDD088fsCZUiJ618ze6NNX
	Uc81nkVn3MgksuboxncGsKpQiPi8aQWWBAlHn5oFP0zMPH7w6EFl4p5AC2JaXOiELDoBcIHR13u
	JzWXTo4Xg0aqAu2w9tRMN3XlZX8pTuSDoV8N/6Cfudt+2SHxD7XUH/BAr5hE2adgJwQ1x+0WSPQ
	JRAH5SGSAnZLjAYdwMmfozZsDnc=
X-Received: by 2002:a05:622a:598d:b0:55d:3540:5da1 with SMTP id d75a77b69052e-55d76a2799fmr67233091cf.19.1795201963342;
        Fri, 20 Nov 2026 11:12:43 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788548a2sm29714901cf.19.2026.11.20.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:12:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUU2L-00000004oEv-3NN7;
	Fri, 20 Nov 2026 15:12:41 -0400
Date: Fri, 20 Nov 2026 15:12:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Graf (AWS), Alexander" <graf@amazon.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	"nh-open-source@amazon.com" <nh-open-source@amazon.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>
Subject: Re: [PATCH v2] dma-contiguous: support percentage sizes in
 cma_pernuma= and numa_cma=
Message-ID: <20261120191241.GD1133597@ziepe.ca>
References: <CGME20261114145340eucas1p2f7699b88eae34f7904cf68109dc3eb4f@eucas1p2.samsung.com>
 <20261114145328.1307-1-graf@amazon.com>
 <fa38a878-1735-4682-b208-5de1616f7e4f@samsung.com>
 <28a0f946-af4e-497f-a923-f11b79d94930@amazon.com>
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
In-Reply-To: <28a0f946-af4e-497f-a923-f11b79d94930@amazon.com>

On Thu, Nov 19, 2026 at 12:27:08PM +0000, Graf (AWS), Alexander wrote:

> Ideally all of this would be policy that only takes effect later at 
> boot, so that we don't require pre-boot logic or a reboot. For this to 
> work, we would need to have Linux restrict its memory allocations to a 
> small'ish region instead of spreading them, maybe to the KHO scratch 
> region, or maybe by favoring allocations in phys addr order. At least 
> until the boot is at a point where you could perform the allocation. And 
> then we would also have large physically contiguous blocks available to 
> allocate from and potentially change the tag to CMA.

That actually seems like a sort of reasonable idea...

What about the reverse, you boot with a huge CMA and then shrink it in
the initrd to what you really want? For this you'd just want some
command line indicating how much non-CMA memory to have, which should
be fairly predictable to get into the initrd?

Jason
