Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265992;
	b=4cAzITfdn/vsjq8DVvispq0MTSeChQRjjEMJcp1HlHbycs+6Ls59hMNbGWWOrMK5EzO8
	 A5IuPEJtMN1I0VJUqjH9T57MtsSltSx+gvSm1RgnJARItSp3Z23Rf2WssJjuikbYmFvVi
	 MbvjKrOwhXsfbFbQ7o+kp5e1SCbyg7uaCkJseM+ZmF43kpuHYeWqVjQgL6URf+V8U0jf4
	 n2jvsMhsrW2AmwXk8nC6HxHNGiRMf+a+Ys17SkjJb+4IVbep27rDx7MZIkFW/NHbh5kFC
	 xzF5jcwGGTNmKq+TI5dv1VQJbPEBSV+WKOwUrYM/CQiGyWJzEtzzufHDtxxRL3GcUuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=l0rq1ItTuRnDpDVQFC1R3KiJZ46dFQkVrOX5zDg+dEg=;
	b=hDFkmUm6cBUHVmg6P4jMAENMcyG0Y7VJkkCp73ZjpYProX4fFElOUyjSUPkSbWtPaAp9
	 LkcyEVO5jJudnWyeF1kVepv/eqEnpcLK1+hMI5G5SIPpvxIz+Oeb8OauSbhkGgvhaUyZb
	 DohUZNhUYVgvlCldR+7lwE3Y5eiUe+93RKyexIVRK/xqj9QeY1YsE013agWUi39/S38Q3
	 mUHWg3d7pO9CkkL5v9KdJWji3OTKtkVQP15viayqNVyqAb/AGW1dxibq7Sb2zweXvReLU
	 zPHx4q8krokbOe+7MxsYBVxlTZDOdKOY1OjGkTYvsYYulEzuG9+EvwPN7zjOfD/x5Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=poOSKrHy;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF4606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AF4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=poOSKrHy
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-92107df3f13so18792666d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795265990; x=1795870790; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0rq1ItTuRnDpDVQFC1R3KiJZ46dFQkVrOX5zDg+dEg=;
        b=poOSKrHyKivLtJ3/d16yviwg+Bw769QmYrD9eaPgjK1oGk/iadPSH3buG0GwhRABUf
         hWVUxHHmLE+1Sc2m/Pb03zbeivkWta78uNs9HMCB+JCUyqaNSc4aMAVuskV+IJrWGjJN
         qg65kGQJHPqAI0WxIvruO6NaxIKjVeWrojiWESEFv+JhnOKHOAWMOJZ1EAn2XF5FW6Pv
         bpJmG9iVfk7FPKBE0uTObLXNdjwo/dlZKe2+vR0RBh3h4Pq0a6qdiE3IqVYFzXUTd2tj
         8OIwF7m1HyYC2uW2huUxxgdCLeO3HmunPDqBoi9gfghO+/0xrpz+tnWo2KC2LYFCXUqr
         5Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795265990; x=1795870790;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0rq1ItTuRnDpDVQFC1R3KiJZ46dFQkVrOX5zDg+dEg=;
        b=MqKT+CNG9TqbCx5kUNMSfTxV+0iHoHPwqUt/7bzdTAdJDazZ30Yix87CE7IyGlFTMy
         06tXizjbQyDeT9zYKmosOULhzwsHg7qJL+HSgmCGLogh6qwZyLYlgsgj8TW+RHXojj6e
         gUr66LWRT+nsYCu9kRtTxqWAxwviYYWnvaW6Nh4ijUcb5+Lu8xoNdMueGjgvmJZW49Nq
         QtYJjyMuw52e/AzkJ+5F4VXfnkqG7/lZz4WYUJG8n4lt4Sv79pP6bSnpFG/AZDdZLUu0
         P1SLz6OpTRc9OZw1FOYQk8kIUB1TbXh7GVKVrJeoHZHTAxs2pX2SBvfO62f2shZb+HZY
         RtQw==
X-Forwarded-Encrypted: i=1; AL+hErEmtxTYRAvLs8twn037yZWPtMG3oD8J+u7mSE72ktBFpBEFOp7MMg3vlCGk9UcvgcuICKFQO93HaSDhCWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xb6X5zwJMBc70nHuZIIR3kl3KLoAu/Dk+tVqnhDKg560cCwTe
	KIqxyM6tfQeOmc/ygKWiWQL4PaqKMx0K2WbpYmbSx3HBZCD5GPtuSUoxTol+InyQsGA=
X-Gm-Gg: AZFdTZcC1Ia+fx8s1xOnP9UPwgxBiSGfDOoZHwQS7RcA4zmEmbX6hhE5Jl9yZugyvd1
	6+chn1p/+LV75OQiLTToyWH5U6y6I840qALppJweZ0BviU6nZnGlmTO1qIH8smd7JxjVqiZzrT6
	lMiCU0sUetvAkuN2rUNyQuG88g5zbhvOf9KMfe7NpsSSJ5JNCqL0AAJh1vSISbRjom5Qaba37m+
	S0E6TMaL106RbWkSV4Yg2sB4XDsKMn0fpTBpaq/BJrgsOll7XFP/18SACI5QCK5U7EEFoW+19Um
	IAAsOoUVQJZE5iFY1ezzoi7GIJ4+GZGhPQkfvj+atqxKNSconpw7C8SuBC3dL7NgzJNvM7CIBPj
	rcNE9lyrT1Pef5agEo1ZccjV62CfwCWtpCtmoHoXulD7BySG8Fp84eMoe4LwQoqu1AzQDIMCii4
	nDoE55RBeLaBISaTGc9t4yrN8k7itir3AT9Ystg7N6KVzPUFsJznp0igD9V6xz8SHuN1m4iG7ju
	4FOVR/i1l5EcP4JBc8xd4BnypKUuAbi32rMOO7WkYHdJBsIDNvv9EQV03CSNtgZd1vC4yXg0b1Q
	iJnDAyhow7EWJ5HHr2p7Ccq5EYW7xo2xzW3wCtH/xRCC36zVi8cdsi29VacFwJREoE3uD8WdAgl
	FMn01DEE=
X-Received: by 2002:a05:622a:5791:b0:535:1f73:8d9e with SMTP id d75a77b69052e-55d76a6e8e3mr104266351cf.17.1795265982936;
        Sat, 21 Nov 2026 04:59:42 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78852bafsm49113591cf.20.2026.11.21.04.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:59:42 -0800 (PST)
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
Subject: Re: [PATCH v2 1/1] mm/shmem: don't use the memcg of an uncharged
 folio
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Chris Mason <mason@kernel.org>
Cc: hughd@google.com, david@kernel.org, baolin.wang@linux.alibaba.com, 
 akpm@linux-foundation.org, qi.zheng@linux.dev, qinyuntan@linux.alibaba.com, 
 shakeel.butt@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261120195057.50031-2-mason@kernel.org>
References: <20261120195057.50031-1-mason@kernel.org>
 <20261120195057.50031-2-mason@kernel.org>
Date: Sat, 21 Nov 2026 07:59:41 -0500
Message-Id: <179526598180.412063.14973682472309530978.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 14:50 -0500, Chris Mason wrote:
> The shrinker for unused huge tmpfs folios can dereference a NULL memcg
> if it races with the migration of the folio at the end of a file.
> 
> folio_memcg_list_lru_alloc() assumes that folio_memcg() is never NULL.
> But it is NULL until the folio is charged, and a migration target can be
> in the page cache before charging.
> 
> shmem_unused_huge_shrink() looks the folio up without the folio lock,
> so we can race with migration:
> 
>     __migrate_folio()               shmem_unused_huge_shrink()
>     =================               ==========================
>     __folio_migrate_mapping()
>       xas_store(newfolio)
>                                     filemap_get_entry()
>                                       returns newfolio
>                                     folio_trylock() fails
>                                     shmem_unused_huge_requeue()
>                                       folio_memcg_list_lru_alloc()
>                                         folio_memcg() is NULL
>                                         memcg->kmemcg_id
>     folio_migrate_flags()
>       mem_cgroup_migrate()
>         commit_charge(newfolio)
> 
> Fix it by keeping the original objcg around while the inode is isolated.
> 
> Fixes: 743e7d025d2f ("mm: shmem: make unused huge shrinker memcg aware")
> Suggested-by: Qi Zheng <qi.zheng@linux.dev>
> Signed-off-by: Chris Mason <mason@kernel.org>

Reproduced and validated the fix. Changes look ok.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

