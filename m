Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017377;
	b=pIpydki/GEU+dHR6t9ljl2yfWmklAUbnzXXIOY5u0uC3SXw19CB9MXAakwjiRPQqBAzA
	 V9mekmXgoqEe7HyKJGO3OMIq3yH7L79cDTuxW8KbCh3OML4KXFcQpLZ2paOs2T//8lA6Z
	 gznK6W4/tPJwtDzF55ZBpxHwbKXR3VlW5QLpK7FLmMMGnnTZzZr+28uNvIrQ8Fxx2LLM7
	 l1668L16fGPlhNshIgytvLwtJWmHetYInrsauancnl2DzPtDz4I4HzC+aade9XtCTm379
	 kBAR4uaL7QLH36nbqSWSk/yNS6tdPyavLWoGPiWaKpGeE9uzq69nKyjb6fINdh2GgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
	b=rbU/3e6Nx6XSLuVtmYDQeZCwQyey7aUAQcqxErS1QfNVMqNm7rYCGOTmoJoCfjmV1R+e
	 JrvZiIrA4QlUirMOUq20E5O7FlkwcmJatdAN0bE6hsgEPEdJGTQYMb839duxOQ03rfkPn
	 Faxbwbgcf02Kfw2064qhRIwK7NXuOf22Ks5ltZjQg+q9QfcGEDTtZ9BdQt7Um9PPlugPa
	 YsRDA7d+lboFQXLF3LjY6SCZp9bEisF2/rEScd8vQmORU7IK5lk3GBfFsPjKrTUvLndoK
	 mt99Dz0E4bzDHhVOh1ZZDGtzytewTk0xvXtPtdBz5nU/FZ72mrW8e2ou9z0HqitWBEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=gFIxxdDt;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F4606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC9F4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=gFIxxdDt
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ebf4cd218so4361886d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795017376; x=1795622176; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
        b=gFIxxdDtcqDrBFkqgwEzkN+bVHfcVbrm/mKFYHBw/aX+aK3i6yXT3iOHNNcy/dVpjR
         beX1ypC799ntnSOEXoyuWI9KAiYigmUzM2ktWAUGq14UH6bdfs19Po3EeuhNmuPBICwQ
         4fygV7vNlH+8kA4gHVrwCXXCMRXtK3og0Bhew+zJDF8jtO9O5fvmBFacfYtyQB0ZICfH
         uto7MDRpcWiyf9+vJZQn3ZyabRKAjiAEnbjmVD+LqH03jEVrnsuMJqNm4PPeRi2PD0kM
         0m9hgfLivrz1Z3dH1OiBWSOIUeexNiv0u7ws6tg5Gw4PB2Xal1+xCiI4FGHOyO/4c+dY
         QURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017376; x=1795622176;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
        b=lg9LmerURIxX5X8uQA/zmnGpNyxuSaqIRq6cvEVu447JskjFjBI9PEGEmEIlqMqjoh
         iHHRhQAMafIB/Gwpg7Exc+uZw9iWZaRDA8wYt3Ak1Jv8qaeRlxSYxom2ce5J08X6tRH7
         1YfIomYSzCHsf8PjiwVc9/SUrtO/n4R1lZDVg1EgfDphdzKpQ060A0xXFQQ68lOsIIEB
         f0Lub80+FKrgC6pnD3beSMdkkoxMfaIez+IuJ0Nj43kVJyqualpK1sBLQqBsu5qS8XsJ
         LJQKEU3cAZy68aaYKZyw6xtqCb/1/NW8dtaO5U7j+fTlgymjYcdL1Ph4t/BSkIqVZufy
         bGpg==
X-Forwarded-Encrypted: i=1; AL+hErHqIDR9fOGo/VJB1mTB1UISPd0ECEuq8A8mUO+zegwEuS435l53CgBNw15ZyUpxc//1qY94QPhYKeliCYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ICyfnbsPVd3GfkvmdxUaIvHXUYpo8WSq1FEoY1jydJ0gB6IjX
	YINOdc3VsUlsoBLq1nvcTmqjiO+7/PY5ZuGZrJU0Aj01qouQk0hoBLcJ6ZQh2jmLHoM=
X-Gm-Gg: AZFdTZd6mqarB9X3qgm2JS+qcSx20fQ71BIwpafrMEpwNhziWBDYVV1urXsPJtGbfEU
	lpu04BHTG605Ajo797KUE6SWyY3dFZQQCWcT9J8xqnVc2F1IxcZlLWWQD+y48BpTeEUrRAp+9hu
	pd9sxhQt+wZl8IxTkIYhSTM/ISn/1AH39q22Sxl+edIHGl38+JCHSkye/MpLtEQYh1i5WNGFaZ2
	DjMWFCD93wiXw2T3J9BT74jQjVQaOZmAwj5yn5hfh8MhCQfDqcBKp+qfvGaNegRbRZFqBQZgokV
	n4lHYEBrt0xdqG7JlrSk7tnIbsD6vCDFJuqnhY94j436Gq7OqvQhP7CpYld+GD4oOHX+o+wSr4D
	tqsDzhxIVAgFpmfA4+rrZVTQIJHML08e5/Iyk2/lLquy2DmO6OrOX60L9KjRfw97cH8LacaSGGO
	pjYz/Ik8iHZWVle0gBnMGHThMD3DQeG82PrbCFscWifkByLAPuFPKmCuNMVki+OW5bKTnXAnvKA
	tvWo0kleO+7XLhDVPKeUBeIphBd+5mvdHR33RsJAyVMhYf77tHW0mvovKFO/9oJpCUDwtkrVjI8
	tXbckAeV/4HPjG5ObhiST1yeTUR1UlIpb2KX8z4+kXtXzW1RpfZD79uFP6U5WbUdZaH1RvM9hta
	yiq+GMSZu4pT+oGq62v7v+6kgMtGv
X-Received: by 2002:a05:6214:8013:b0:921:1890:b77f with SMTP id 6a1803df08f44-9211890b87emr29798426d6.47.1795017375668;
        Wed, 18 Nov 2026 07:56:15 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d28215sm24719106d6.16.2026.11.18.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:56:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/22] mm/mempolicy: keep interleave and tmpfs mount
 policies on common memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av3EGWuHX2JDdlrx@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-6-gourry@gourry.net> <av3EGWuHX2JDdlrx@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:56:13 -0500
Message-Id: <179501737390.1206716.11014097946405277594.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 23:30 +0800, Richard Cheng wrote:
> On Sat, Nov 14, 2026 at 02:09:42AM +0800, Gregory Price (Meta) wrote:
> > -	for_each_online_node(nid) {
> > -		if (!node_state(nid, N_MEMORY))
> > -			continue;
> > -
> > +	for_each_node_state(nid, N_MEMORY_COMMON) {
> 
> Maybe I overlooked or somehow, but when do we have the assumption
> that common memory is definitely onlined ?
> 

For this particular case it's not particularly relevant.

This code only runs at init time, so it's either got memory or it
doesn't.  If the memory is present but offline, it still wants weights.

There isn't really a bug here, but the existing code could also just
check N_MEMORY and end up with the same result.  If the memory is
hotplugged later, it still gets weights accordingly.

-- 
~Gregory

