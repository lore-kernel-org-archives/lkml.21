Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681848;
	b=YM4UaVwAya+qRq9ybYOvnRcSNMGUgO+9CMy3jzZvy5+NcIPZnYVB/2EBa5iXc5gvBDo7
	 iSt2DWbkDUQFpt0H424qs8778oHmF1Djxc1OaYTVekhGbhU0z4cSLXoKYlvZpFSGSsnOc
	 nvTDC9BS9Hml7/9qZ60V8uIrEvsxwpEFtK8xzYEdeeYj3yWU8GyvqKrHTsy4mCsUyttvI
	 vq35GVAhxMbfbauR9azWF85rZxW/MCSkG7K5agcBfYwM2m5Be1t43vDGJKnWzaJVGndfq
	 i8q7QXTUXk4Xi6axkMkDyQdYTGpxO1O4fXnD/z4aisb4Z7h1hpPtvR/sic59XCEhE9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FyyIgAo1e3KK4/AdbdpOK9l3019Yj2VAw+xdIQTmPhE=;
	b=GnaLMbcejjz4tdjPbc0TGT3r37ycvsmP4E9lRMUKDM+8rrEvP9g38Hmj4FkJ1jMfmaDh
	 e/XnIrMSs9ZgY29qNQYNISQUfJQXWM9orH8W/sd+O8BaKLYTBrFYyXoJsn7I+s2TiCZHc
	 xZTGljQE8CWiprpyeVghhW6ghCvORMDiX5klReBpYIWMfUrAhJ2XcOda8FgI3SeZCshXb
	 Oa/aZPNw74J8AmqMTtYSO4cUHKAViHbjFG8xI2LlwIVDSKtaKfwDFDHwyyKihfmHzLEDY
	 ufUiaqN1Ej1A5XaWJuG9peXKwnF9sZbw5QTfW+gPqlMEab88sRFI4Qx+3U4I30xqy7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="eCg/fjps";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB5D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eCg/fjps
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5586586f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795681845; x=1796286645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FyyIgAo1e3KK4/AdbdpOK9l3019Yj2VAw+xdIQTmPhE=;
        b=eCg/fjpswoW70jdAY+mfyk+zh8A7sPtwN0ZOj8XcsYLfY+IxN4rBvfAZo9jTNIV4yZ
         huKQSVldcKpLTjcvTpaEWhW6eYIR50k6YD72+/5ObME9AznGZVEzvoBsnXkrVaJPSLni
         lL2L6HInflOQoLQaYcb5QKVNWEqDcJ0hbeRYjhMjRajEg1SidC2tG2rn9PBzBZGNIY5r
         6vIobqG0eHeYJ8rWh59B5yxLh48EecZeZ+1rDwojXF5y07/F8vhZnh3YOFOvefR99QNr
         lfwo/rFhAH019qI9tydDvcnnbqT6JqLmm00sBYhgsldbCxjW5CYrx6Ah3BaRm4NTptol
         52tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681845; x=1796286645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyyIgAo1e3KK4/AdbdpOK9l3019Yj2VAw+xdIQTmPhE=;
        b=VKFuHzlIDU2Rto4NzakWKcXVImXPedmUeaccF799RFdpwJUg5rxm2CFN2Hm6QgueaK
         9gqMfARxxuTip5s4IZRpzjV0dbL0M1aazXeqxmf3R+02apYrHigX8ZNFFRxtIExaFgzE
         mlfdtmp92UH8VUfrwCvg1k96wZJUjcM8ll4CXh/L6NzAbTaVBbJaYk1NT7OerQvqGFte
         rUlmsZRDrW1I70GzuCEGZRT/5jd0B/4Fgq0hRdDexTfCQZG0+KtGGbCURsBKJu9SNyCt
         Yt3/GnXkmqhfnw9JDYWo+t73v8/k2h9RLUCQNykegPifdOeicIrM1mOBwKWw7rdT6kTG
         IBLQ==
X-Forwarded-Encrypted: i=1; AL+hErEYS8z40KboV87nM5Z1Al0SpMoSi769yzgy521pZdZxrgIv0Jns1a9WRb8LntdQmz7+D9hdjbrcji6rRIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A8kAVr/eyVjAJs+lca1b6IN7Z3NZ///AnS7Gcg1rTtfLOBH8o
	senhgX2YLCF4HLHz9tMpJ2bY+0tQ4w8oNFlEuiCvMpPQqPicjiltPvwlKikofYnvIdc=
X-Gm-Gg: AZFdTZfZuWHAUkcrmEZG6axMJYeki/K6LXgipJn758PFU+KWQl+XC6got/7FT0X9yVG
	c+vJQ1Omir+cqs3Y5nOV74SMJ6xDRqO2VMWB49BK6WQyP6hEJyp6fsvPS43oicBRAoSA2x78nR9
	mW0PPrA/gxa1vM0bHo5FVhy5o1VcEsJ7xYhNZuTsvm98gPZkR+YsR0LaMQ5b5l5zcozA2O4PTh1
	IuiRd40oHirXodm5DPo3dtb2GAE1M5Vr/czInyr0piqBBGJyXGcWh6Komf8iIaD1bVRKGFmkxdl
	U5e4MIlkb7wxoenIuwFEtuJVDSp67amcBAmzp9ZY2Ym4QgE+eWIwwZI1Ys/P3WZxUWaYNUKT9du
	zxPVyw0Xgzw1/hWuOY9XyjgVuoY+H/ixTLoaSNMZJSWrRBdG+jpBS2bfkV2O24s1zFEzB6Yy/oW
	0DjUSDrHByLBORb7REXPcD/5F8dfxfbWn2ca3c1hxYvfGgZflE+ss23/StkvWsXLRTrOWNYhlkW
	igmMPtra4ARQSSrvGta9k1ss7Rs7khvStWV3/ickNaGdVPZg3v2NLEVS0b4rH1sxBgNFd/e/E4S
	WUkIfz4ESB2zjnwlRLBj2rsAyKPYogkiyI3HdQPt
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr388991925e9.18.1795681845543;
        Thu, 26 Nov 2026 00:30:45 -0800 (PST)
Received: from localhost (109-81-21-11.rct.o2.cz. [109.81.21.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba3d3679bsm61507665e9.2.2026.11.26.00.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:30:44 -0800 (PST)
Date: Thu, 26 Nov 2026 09:30:43 +0100
From: Michal Hocko <mhocko@suse.com>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memcontrol: expose anon and file reclaim statistics
 in memory.stat
Message-ID: <awfuM7vj5Vyb6Fjb@tiehlicka>
References: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>
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
In-Reply-To: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>

On Tue 24-11-26 15:51:27, Xueyuan Chen wrote:
> The aggregate reclaim counters in memory.stat do not show how reclaim
> is split between the anonymous and file LRUs of a cgroup.
> 
> Expose the existing per-memcg scan and steal counters by LRU type so
> userspace can measure reclaim balance and efficiency when evaluating
> reclaim policy. Report the same counters per node in memory.numa_stat.
> Both files report the counters in base pages.

We have found these stats quite useful when debugging issues at the
global level many times. So I think this is a useful addition to memcg
stats as well. Especially when we already collect the data so this is
purely a change to show the already available information.

> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  Documentation/admin-guide/cgroup-v2.rst | 20 ++++++++++++++++++--
>  mm/memcontrol.c                         |  8 ++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 9e3c67b02ae2..eeeaf635754c 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1726,6 +1726,22 @@ The following nested keys are defined.
>  	  pgsteal_proactive (npn)
>  		Amount of reclaimed pages proactively
>  
> +	  pgscan_anon
> +		Number of base pages scanned for reclaim from the anonymous
> +		LRU. With the multi-gen LRU, counts pages isolated for reclaim.
> +
> +	  pgscan_file
> +		Number of base pages scanned for reclaim from the file LRU.
> +		With the multi-gen LRU, counts pages isolated for reclaim.
> +
> +	  pgsteal_anon
> +		Number of base pages reclaimed from the anonymous LRU,
> +		including pages demoted to another node.
> +
> +	  pgsteal_file
> +		Number of base pages reclaimed from the file LRU,
> +		including pages demoted to another node.
> +
>  	  pgfault (npn)
>  		Total number of page faults incurred
>  
> @@ -1829,11 +1845,11 @@ The following nested keys are defined.
>  	application performance by combining this information with the
>  	application's CPU allocation.
>  
> -	All memory amounts are in bytes.
> +	All memory amounts are in bytes. Reclaim counters are in base pages.
>  
>  	The output format of memory.numa_stat is::
>  
> -	  type N0=<bytes in node 0> N1=<bytes in node 1> ...
> +	  type N0=<value for node 0> N1=<value for node 1> ...
>  
>  	The entries are ordered to be human readable, and new entries
>  	can show up in the middle. Don't rely on items remaining in a
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 1ebc9330aeae..ac12ff69a633 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1647,10 +1647,14 @@ static const struct memory_stat memory_stats[] = {
>  	{ "pgsteal_direct",		PGSTEAL_DIRECT		},
>  	{ "pgsteal_khugepaged",		PGSTEAL_KHUGEPAGED	},
>  	{ "pgsteal_proactive",		PGSTEAL_PROACTIVE	},
> +	{ "pgsteal_anon",		PGSTEAL_ANON		},
> +	{ "pgsteal_file",		PGSTEAL_FILE		},
>  	{ "pgscan_kswapd",		PGSCAN_KSWAPD		},
>  	{ "pgscan_direct",		PGSCAN_DIRECT		},
>  	{ "pgscan_khugepaged",		PGSCAN_KHUGEPAGED	},
>  	{ "pgscan_proactive",		PGSCAN_PROACTIVE	},
> +	{ "pgscan_anon",		PGSCAN_ANON		},
> +	{ "pgscan_file",		PGSCAN_FILE		},
>  	{ "pgrefill",			PGREFILL		},
>  #ifdef CONFIG_NUMA_BALANCING
>  	{ "pgpromote_success",		PGPROMOTE_SUCCESS	},
> @@ -1699,10 +1703,14 @@ static int memcg_page_state_output_unit(int item)
>  	case PGSTEAL_DIRECT:
>  	case PGSTEAL_KHUGEPAGED:
>  	case PGSTEAL_PROACTIVE:
> +	case PGSTEAL_ANON:
> +	case PGSTEAL_FILE:
>  	case PGSCAN_KSWAPD:
>  	case PGSCAN_DIRECT:
>  	case PGSCAN_KHUGEPAGED:
>  	case PGSCAN_PROACTIVE:
> +	case PGSCAN_ANON:
> +	case PGSCAN_FILE:
>  	case PGREFILL:
>  #ifdef CONFIG_NUMA_BALANCING
>  	case PGPROMOTE_SUCCESS:
> 
> ---
> base-commit: b024a51b0184b1efb6f55b11aaf7b15a490a6307
> 
> --  
> Best regards,
> Xueyuan
> 

-- 
Michal Hocko
SUSE Labs
