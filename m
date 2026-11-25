Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795647527;
	b=vW2rQY18XSzAUS7tVSs6jsLnYH9VECC4fAs3GbqWB5dsyY2vvkhrGfeY/XVnrpN1YrJS
	 B0LJaKD8pSR3P5ZdnfjsDdRYHakqC0E0coxrkj53gwzoyHitzIfjf90KJ8VTjxrXKBkv+
	 ETqGX9x/SKjk8Yhb37idw4Y3JHZvGpfjK6FbeRIN2KSWpXk0I1PfS8rZXsszLMdB7OHyK
	 HKMCPpgx6oqVW6PlA6074slfrAGZIpWhCFpleJGHAYt5A5WGN6sEHYgj71/N3cQjvnYRZ
	 LxUr2ojbDc+4zN9LvgrCuW/BhwxcGfeTnk25W3RRPOafcSSUsE4EOBiDY5o4JjuntMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
	b=DD9Az30w4gHv4/gqKJWrN1+FvwFwKVeDBYRk2mmjjzIUbCnb+FvHraKeQLPOwg60Zkoz
	 RIs1BH4RQXc0ReLAmXKZ5Q3jzynljyY+uSsRZZE5SDMJo5QXNgNey6rBM+6PgOtb6hqBl
	 O2qHVALKcLgtpVA+B0xpFKP9Qw+Rm6VXau7uYyJfcAsA5maqigGX7LqLGHySljdX/YSuB
	 sQsIhjFmSN9b7fW3LQgWZUGD6I/uTiOaWv46DeLi0/o2VSi7tdreVh7ELWQwadIvcLRB/
	 J+Si7qrGoDWJ4FK/jBFSKepmBDwnmSKHU+6FwGCnMxx+xV7Q87IbRXM/mESgrApXgtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k4eu7cVD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C23606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C23606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k4eu7cVD
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-99e0082c434so1659039241.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:58:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795647526; cv=none;
        d=google.com; s=arc-20260327;
        b=nbDgTVLOHE1ks+8A5CINg7sQ3GxAm9L1IDgmZRLDzdSiE1WrUPwYedcAznLNy+TB1H
         BUqm+Axu7ljVEt2kv1M0o2CsICLJ1D7PaerYwnrwfahbNAiBYN5Y7IbcnkpWXjnFqBpk
         Ais+n1akuy8lqLiW/gQVugXv43WzvFDTxJcqSeqJZBdTRsk/xw0eT3MHNdzNUAb2edw2
         PDfRitd4Ij3nyIDxh1m1mii+M1gOTDpDQrKYezV1IfcxLFqx86IWjTqTE/VF1LDufUHt
         YQ7U9gb5KBzy6d/GbeqDw2/RN9NMXruKWGO6tbh/BJVrjUNuDz5RizaeaRCKFQgtnxQe
         Bnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
        fh=3PcT6c0oZ0UeKs9oFVCWF1xg+DrjTUEbnmxuO8f5eIU=;
        b=ECZ6P1kNxNPHHm3a9/tYTKx67A/FX+NqMTjX2elFnvJpR+etCRE9lYYmKOF5Z5CLzQ
         mTMI9vj/bmoaZpcclpXes3W55wqKQcZxkr7ES+gSPFR7YaLyM8NjBVdqYLbIohdijsUI
         wbRVSyX5DgLhYJeEwMJSFe4wMWyq8sjvyZEd64NkWpqkogfEeQbZXvV4sN7/IQIk3Pkn
         531eBdbDMbAmFcLpXuRBXyldhKzs9o3lMO/d9AJsUC645S624u51cPQ1/++AxiGAL01p
         gXUf2G1tld8ys2w2Oj6VSuyz3hT0Wsr+N8UWGHeRAGkTwV6+qriBZ9BAtgn16yrX9es7
         Us3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795647526; x=1796252326; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
        b=k4eu7cVDKPuTDA5873q5wq2f0EvT7ngxFl0uH3lBtrrRUvLbnueSHzMjPYkUH4T8U5
         XD/T6b94JD/2sTUSXsJRqREI5Mj4dNhQrxuw/AZTv4f1vQx99uCF2CrvdHFUARqWWb3O
         mZIDbStDBCi2l9ZvoUaWCVQylgiisSr8xsWocpGSND9+Dr4ddIR8aKKfR9yjH5Ub3148
         7dxUI/taty5stf0aS+x1j0IM1heL0WrdYEv+EThg7uE77JuwRDCooJNbZrLtCAut9ON4
         SNcbzsy+OfvwmEaIsDZm5A8Eu+PdySwbqLSlynFFmkLTmFgpUjXDGvbWHzzafHd9IwkC
         +//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647526; x=1796252326;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
        b=G2Ih3XSM1aNllAn+p74omrvks6MUF6IEpMUJNuArsdncDdUbQj8sGW6QHrwfDUJ+r7
         biWBbyKsSUV+AXJexj2HOpTWD1BBPSjwf2huZ66YscLwEq13JlyfmOoVoyNcCdCBgTvt
         kKGq6ieY2hAYCw1D+eUdsYiYnpo0LIK708yo/PqiF486AW1anIvCIx6wvxoy4PjjN+bY
         dEeUFlW5S9Ju/UwIwvkITso8A7Z/sObIAM9icLor0L6hvAk5y0+rwJ14PijqFyDwOwtc
         mGcvvHa3NM6+lSl6wXhuV8MFqEtmUygG2XtgTu5mHhD7Efx8yOOyrJW5FFqWjFXsHtwl
         iUwA==
X-Forwarded-Encrypted: i=1; AL+hErFgt9kS8nyXZoZ3te8Dpyw7WlYe9ddBbPOeJS43X6rnRcYI3BymH3W9WBvbjFppgv3NbdcMNn9FyyXqL1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8Kts0fizlNkOMmD5xB5oHt/0e8NA8ySBtjoJmZkBENUUR07n1
	A4OCheEjKqCn4NcwtqzqGLYsFVRUo65aas0vhE7b4167XrEHfqLofxIM8uIT+lYiw4Njkq8oeiV
	j+R04UbpmPf5bIAdk0QS6Pu+a1E8+5nSk/nPKKmU9
X-Gm-Gg: AZFdTZfH8+bl43OUNs7KjEIozWzJrAYRjs8v+L/JTVONUSA11OIpvR27vye2pDdojXc
	AzqYvhKyQwn3HwdspsQ+9BjY0ccG7/O7veJ5nILhVIMPI1qFRocvY6jItE2WVVLoIgb/cz8HGLL
	A1EKsIimyF2mvGgwyJwzx8+g7PMZVnZFyvuSr0U0XZibfaCWaP/rOfwCSLdXiDFDB/wts0k77fL
	vNZxPpXMIjdM2k/ofO9cGsH3zGRbKAkcnPZYh9Xm7rX5H5PCigvENbs3beQSyJLORS6/T/+0GGs
	Ea2dTiOGN/uVTWWWHrSxLU9/OJAu+bsh4wwbgHdvykuWOv7vXmVe0EbitIgokRmd4rgwwQQacRO
	576UGY/37L0PXmt0dipvmtaGudxNyUdjEKhSnY+ER6nf/Ira9IUQrxAK82F5ETvUdG3I=
X-Received: by 2002:a05:6102:c4b:b0:7cc:174b:f7bc with SMTP id
 ada2fe7eead31-7d7397267a8mr10844584137.15.1795647525632; Wed, 25 Nov 2026
 14:58:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125222713.1450385-1-elkin@google.com> <16ad231f-0cba-40a0-992a-a0d430da5a91@kernel.org>
In-Reply-To: <16ad231f-0cba-40a0-992a-a0d430da5a91@kernel.org>
From: Elkin Cruz <elkin@google.com>
Date: Wed, 25 Nov 2026 14:58:34 -0800
X-Gm-Features: Aa3M54rX82vBgzUZ__ab0jzhalBL3zfUm3mwj2OyMozxs06Jy0Mm2mHqwLtG9LM
Message-ID: <CAC_6YktiaVRXr3jbfx1ybhhxzHbO4NyMnseg9CLL5CNJgYbCvw@mail.gmail.com>
Subject: Re: [PATCH] mm/migrate_device: use locked folio in migrate_device_{range,pfns}()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Before you send any more: if you cannot reproduce it in the tree, don't report it.

As with the previous report, this one is just a hardening patch on a
theoretical case.

Please ignore this patch.

Thanks again for the feedback!!
Elkin
