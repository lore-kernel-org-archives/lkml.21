Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968400;
	b=P9mKMDj6bgRF7zoBapL+b1Xi2xBkFx4bqjkjaocvfi0vsyYcnZGVnVNKU1zjaFXm2c5o
	 dEBDEY8+H0WW29+RbPNhbmOpfwDRo5iAP0OnPMCCJDdK9OwALZrrKZ3l/5av0Eb10NBBz
	 R86o2LF2T9YLCCdwhJnC0tzqDOlhy7+ibDWeoaklc2xxir+lzsao98Wh26E3qJ6PQOkGu
	 JcG2Ay+NoAWiEFm3Y3FVsjEZRgfAEVf5mdL3WPbGBASvspo7Or5YzFsQIjOPXaWl0GGZF
	 pGSYr9Wh6tlJDVoFB8H/jXjPTrAsmPekq+ZPYyz7NereI5BlSDeROTUzeMmVLTt6rJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968400;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QH7WQFtjw+b1ZB9MFgRt6yEqYhXg0aU89YQL9+GV2K4=;
	b=U1LMhGz4nDetQEOMMmwKosL/gB4WNSo7kwMZLUGZqZNuImE8bzlnikuPJi6tFFoXQpNl
	 cRN1KflXDIzS9lLHojjCzeDk8swCqKMM/8MwsQqJ4EuH7ET2bJPHcFSpoiuptbPWCL+DA
	 o3V9hdZqPUZrMsHBARnNTeEEULiTeseKvJkBrNmMzb/LRjy/je6VPkPmVEVtgIL+usbXr
	 b/XA/XZ2RhRero7tWOu8QaUa3dFVnJaLOBjjZLtluybj6reCnHWwfDZM6T1/b09GeDp/d
	 70xidNvso5F5Mb0AGgr2KH6gyPb6BpYrQL19TOwve9YFpRbfm8hoxWalHdDd2d98K2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Robc4epS;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658F6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Robc4epS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794968398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QH7WQFtjw+b1ZB9MFgRt6yEqYhXg0aU89YQL9+GV2K4=;
	b=Robc4epSxWM9AUgYMo0wJ+lWRJ5e3aXVSY3mwzEh5Ghjj9JQS9ubDJJDSNeSQ+VAzOazrR
	0LGLdbcuwARapTFCQqDNq061DL8ztIRvz3jr1jg6Elkns0dATCX9ADWzSI0+Ue5Hx/bAgC
	hq06Ka7pK1kI/FYuLVnNW+RV8uoPSo0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-7-OGfyn-Ns2yNsKlKVLRSQ-1; Tue, 17 Nov 2026 21:19:57 -0500
X-MC-Unique: 7-OGfyn-Ns2yNsKlKVLRSQ-1
X-Mimecast-MFC-AGG-ID: 7-OGfyn-Ns2yNsKlKVLRSQ_1794968396
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53661e036a2so8443501cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968396; x=1795573196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QH7WQFtjw+b1ZB9MFgRt6yEqYhXg0aU89YQL9+GV2K4=;
        b=E8TRCCLqBQWXqJgKKy2fMJDZNnWsj/poXLZRlBSLo0Blf4NKjIABn3s7fKuARCyUSZ
         Cqz5hdf/wqJsjjL8D3ngDh2aH5t7HzY9FsqoVwQi7IRfASTXTSyGIBRRWBiALWRCagE3
         bqlGlcI34VOI40vyXObnOq44RGwGGO/0VZlJbWd7gbOT0lPg3Pu1vaiOeefmR/HMih+I
         yKXrlS/uPc96oLX41PYGH9L8xrhRwtd1seIHeWdQdaV75cBIFuQeSj5NOoY+jMBKXnhs
         azpkfidVHuxwawC2WavMLPTTn9fR8F+AFcA3A45FchDlKCgE6fg6LZoumJoMKqZp4AGU
         AEfA==
X-Forwarded-Encrypted: i=1; AL+hErGoyHVrGxOQN+HDW9zIe5kSbUt5H33P/H3O1+Wo73egxXc7bSKabAyfkItFrKv89KaMu0TsovJmDRBPSdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kNNnWcq0nvFoDkO65WKKq98xufREXQeGgtS49zbdNWeJ1KR6N
	XcLYtEauwBcJK8oIkO8lSvugF2WijC2UDl20QVLSzQeAO9HhDtqUyBcf/6L5s4uwzEzceGcaDME
	R+TjecB44DiNUC7o0oRt2cn0FjpBO/7Yxv+x2p6Sw9KwIsmOUB7aaQ/+6TgQ38LqZMw==
X-Gm-Gg: AYBFou1WRE6JKjPHjdADiLf6WgPPEUxq9Bc60U501kVgNe0xDxC20+YIoyJIA+5hXYK
	9MIFuuDwN/BROGaskvPrpLP53c5/cA23GsEnN0yoKHXPNLyN6S0qjGSVcvSD+CxlUxKgSljtsaO
	gYpTIJBiIgQBnLtEcb9dPPKEtP/xN9iihMI9QIkI1nSVqvz77b9SG/gl+1c6tr5IlROr8H0RZZd
	f1i0OI+x2T/Gj7L3DAA3x0Wuf/febcbrHFYRD7f8P/4drOyq8ip00upfyYzjRWMc/ZfzXv/9/3Z
	U14VGFwOVNjiGTzg7hNIvlhE3dvvqireHoyr9Mp0/qatMmFbT+Ta4vv0dmTg3S3FF67XdUyfovE
	J1LrwlzysySMC7a+hxo/55N86eUJAFARObTJHYDWLH/blJM/km6pz
X-Received: by 2002:a05:622a:13c9:b0:55d:3219:352f with SMTP id d75a77b69052e-55d5a34dcb4mr21965921cf.9.1794968396426;
        Tue, 17 Nov 2026 18:19:56 -0800 (PST)
X-Received: by 2002:a05:622a:13c9:b0:55d:3219:352f with SMTP id d75a77b69052e-55d5a34dcb4mr21965521cf.9.1794968395922;
        Tue, 17 Nov 2026 18:19:55 -0800 (PST)
Received: from [192.168.2.110] ([174.93.165.160])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58fea489sm11141401cf.6.2026.11.17.18.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 18:19:55 -0800 (PST)
Message-ID: <23c9ac27-cd26-4995-b301-f2efe13ccf18@redhat.com>
Date: Tue, 17 Nov 2026 21:19:44 -0500
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
Subject: Re: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
To: Shivank Garg <shivankg@amd.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/26 11:26 AM, Shivank Garg wrote:
> It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
> for page extensions") but has never had a caller.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Reviewed-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>

> ---
> I found this with the kunused scripts [1], which I wrote with LLM's
> help. The v1 cover letter [2] has more details on the scripts and
> how LLM was used.
> 
> Changes in v2:
> - Split out of v1 [1], as David suggested, and based on
>    page_alloc/for-next. No changes to the patch itself.
> 
> [1] https://github.com/AMDESE/linux-mm/tree/shivank/kunused
> [2] https://lore.kernel.org/r/20261026-unused-sym-v1-0-82ca2dceabe1@amd.com
> ---
>   include/linux/page_ext.h | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
> index 79c53ec45dfa..52a8b70c525a 100644
> --- a/include/linux/page_ext.h
> +++ b/include/linux/page_ext.h
> @@ -167,17 +167,6 @@ static inline struct page_ext *page_ext_iter_next(struct page_ext_iter *iter,
>   	return iter->page_ext;
>   }
>   
> -/**
> - * page_ext_iter_get() - Get current page extension
> - * @iter: page extension iterator.
> - *
> - * Return: NULL if no page_ext exists for this iterator.
> - */
> -static inline struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter)
> -{
> -	return iter->page_ext;
> -}
> -
>   /**
>    * for_each_page_ext(): iterate through page_ext objects.
>    * @__page: the page we're interested in
> 
> ---
> base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
> change-id: 20261109-unused-sym-page-ext-3fb8316ac777
> 
> Best regards,

