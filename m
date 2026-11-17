Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952431;
	b=5kbsHlIVk0/Of1SplLqfNq4WWrzaU48vS7oiLeVwuxt/AzYktZ8LFt8VwrJEsOwt/agU
	 CP1w/kILO7zoFWQvIK6nWTn8F3RYsjLj2q3s9HxprPWAbjzQyB84f5qpW1bgvbYbytsEN
	 HPCVrLjvCVRW4jjzXcL++Rqd89T/E3wyZT50fPNpzwkDtb1nXq+Nl8svLCJ+WdmCeN25b
	 1lvYHAAExDPxLiPWbX/TupwjGrqpeocGQtznqrbfuHB1u91v0GXUmP2t6jYHEjEnRTNM8
	 tPKVOnQKNrM2o+1l5/s1++NTwm96PUmj5jWEsVxlatYhtrhT4QI5IN+8Q4O+bo1RRsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KA67CSPKfAaW50KrAR7ZlRBvAWHajM3WvHASRWCft94=;
	b=k9craxt4R4Z4PHYfdmpd2oad6t9OS/uCNs307A1x/ib+e5m4uCow17CvcnVriF65Cq4j
	 fy6ZVUzB3B3xRiF27970W08Z3mMjCVx4wbQ7wVdj1/UswmWO89OwAXzL6PWnm2Iq4g3JZ
	 Q2rFtfXoUS5GuTy5LD+B0Lb8wNj7TU0qAiP4qRrnmdF9rvMKwgLWV+aftNrw1XL7WhR7x
	 d5oErFIbkNnuy7leR2tMjVIHt2KSnmeuREUFtT2gEETOxwKyX4fjGShtJ1r/NE5Y5BBU/
	 mz3CkoYYkZcz+aEleOj1R4h0QoDXtO9LRVKg2H+E/2j7+W60MpYZcdVKvvWcw/GkKPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oASUNEw5;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E7A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E7A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oASUNEw5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so3018165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952429; x=1795557229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA67CSPKfAaW50KrAR7ZlRBvAWHajM3WvHASRWCft94=;
        b=oASUNEw5KdMbMH8EFpX9G0hPIJ6d2qhKd8wNcKaGE/1JKxHVYAAADbGpUKJFnT9gTF
         /S1a8Ebrkr6WgqySoDT9YHGqfotJwZkX5zaVyd25bDZD1jJqRlGGR9pD9995NoplNbAX
         cfPUijm9FSUw6J5zRg5kEzL/nI9DTQZx05cVveDWYU+BoehD0UodQmPdkbFG5SVtAJod
         1fieqRXUd5h2dX14f5CB9yT2UQvk/u311LNoED/vkkYjNzs4S0Fa4aS81YOvBy9NH0p1
         4JuW4uqAaiRWD5WyDfHdKwDyh1UNY7moGaB9MdDUMHrbYMyweb+xKCyAP5nKU35ef3QI
         ej8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952429; x=1795557229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KA67CSPKfAaW50KrAR7ZlRBvAWHajM3WvHASRWCft94=;
        b=rZLSWFRDs9y5bQBTSHsO4ylA52dNkIniyMCRF+aD+gkqBsnzuzL97NXMTvPlSIDDsm
         RXx1WG+EM/i9SnwrZLEL9J6RZVfdE0qHkHw080KLdtHY37Kg6VJ/8IYdOCUPD3yLmfnA
         quyxX1Yi8CzdWRd4Xm4Tp7OYAgAbCWb7VoumfXc02QmB/wMFRaRfCu9de4UZua5BjLxH
         7du/rVnzYPVCGg9/477GkZJXzwEUrzKuC2mAqxtUX2Ha8pMO2zmTqTs8gknD8Hip5Wbr
         Eov/ZADCaKNm56K/o6TZ6yFSBG8M7dOQtF04cbvZbPyEUWrs0iX3b183TQE+qDyHlB2z
         Z69Q==
X-Forwarded-Encrypted: i=1; AL+hErE0+yC5DWgdaKjwsk5f2mDd2Q4uXCLehvy0Hg2B10W36kCt+1iUf1BuZ8axfOWb9k/HbM+P1D+tEZvrgcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DOCHkKDxSM3pd83jvmY/yX/OqsuKWIqbbGmBmQ6EhrvT8pQza
	1kzBUIiQoSh8A6YAx+djPnm9jitAyerOuWd/DVGam1H6U3Lghqy9TUjC
X-Gm-Gg: AYBFou0UmoIa2vTVQxvVsDekNUly1gCVoW2yhUGxkB4e7a8MxoFEkjVOmolRLJ0dY8w
	8eDOKd/SuDzflB4bVqNxcAKfy8qS+traiNQaP1KOK60GCt+z85aazvvb5NyKCpQafWdT7Rbc1AG
	p9YDkhGdgk/sV1iywr5qXtm56GI7QXsUUXTf/OuFodBlxvmEnBg5nYU3dXlmtorq6CQrSmp8mco
	mZ8+S3o+pvyef12oNoqjg8n1lYBUJsUfdMFpaBvTVFHPcS6j4FOpbBUmmw5e7BE9uuQelwovOaU
	h39aev4zcmPpUVjsSx6PmxM4bUSQA1nfAloo6b3EdaRl4Z+Hd9FgsOFiGjUGgAdton5ccNJ508m
	ev6Mmk9BVN3sqRKF8EfHolrlQat7HDHhxOlrdmVv9ramRkp15CrDUuCcoSbGcbzB3kmi0w6jJdd
	ai7fBrBch655avWorMnJFxy+2gMtmp80YMcaZz2i/0Bw5buQ7N0G/O5Nksd6w3Lo+xpT0lzW2J0
	3/+uAkTkH2zagrsfZ2scN/0e/mA/l/YyBSw13nBZpFsun+iYSdbKrKzvRxzxBcZO1o1gWxOu9bs
	Ch8Br0xQZrvdZgUDx8AqG4Kk
X-Received: by 2002:a05:600c:4e04:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb7da18a01mr8456775e9.15.1794952428596;
        Tue, 17 Nov 2026 13:53:48 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d256f64sm14712755e9.1.2026.11.17.13.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:53:48 -0800 (PST)
Message-ID: <71e860ac-3a79-4ac3-b8a2-09a115f5e97b@gmail.com>
Date: Tue, 17 Nov 2026 22:53:46 +0100
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
Subject: Re: [PATCH v2 1/4] mm: update walk_to_pmd() to explicitly return an
 error
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Roman Kisel <romank@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 Naman Jain <namjain@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org>
 <20261117-huge-pfnmap-fault-races-v2-1-276007e73bcb@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261117-huge-pfnmap-fault-races-v2-1-276007e73bcb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 7:31 PM, Lorenzo Stoakes (ARM) wrote:
> Rather than callers inferring an error from a NULL pmd return, explicitly
> return error codes.
> 
> This allows different error codes to be returned for different failure
> conditions.
> 
> No functional change intended.
> 
> This is a prerequisite for the fix to insert_pfn() which follows, as that
> needs to be able to tell a failure to allocate a page table apart from a
> race with a huge fault, so mark it for stable alongside that fix.
> 
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
