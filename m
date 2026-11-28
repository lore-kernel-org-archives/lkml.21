Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827602;
	b=Nuks0WKxvJTCpTPHbUASRo02yjpctMtO/OpsgFcC10P1QA8oFv0H53rcIaWYtPVc0uxq
	 +FdQEJYJhCPrBEbJI/KvRFtmc1XtjI628oKcV7rsLrd706Z2O/k/pGerGFrYrsYLDNj/X
	 J5mJkBFykRKcVlSWbti2lABwnH6nRzO+l+xhFMpR59lK1cCouKfYQcDttganmCHeTqEDU
	 ALXQCfi5kiOR4LdlQhGsA1CO8GZaxVl/8NEo/OKmUORmFIaY5ANAwzMYek+1wq5kW4tgV
	 Oy9MM6Yr8Xx7KRTBJko6uQFliai+9bZfb8qwTWU88r2rQ+5m/8iF3lgjaaxsoNE5Nlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=r4Hzxb3NGCSSYFn+Gm/a38nZ3OBSGBwiKOcgfEfvzmI=;
	b=RkpF691kcXDInRJe+O6wSKly8Hng3ykJ/j2PYv4sJn4tOyH5Hy6drDc5+NDzvqaC7zwU
	 m2bljg7vbnHy8HhFNk2mZouZzVTJSzJWpuVk0DduM3HjymATLjki/R4Uq2CBXREakx6GL
	 kmqwU9JYxQLLcCiGS5t8XOD/MzpScp1lOxFFxyAXMW5LohgxWI5xEPgf3jMN451t6B1wA
	 dQIgCVm1QyyMd921pHZwQT+eXHP/Z8pti68LWiLKuiKKPZJa/+P+N1KYga8h9j5Gdhfmv
	 qfx0j+PxvHfJ9X2/rx0EESEFrMPQLtK4yW7YYGQd1JLgCr6Xg3GlueIjUsCXK3Zlr8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NP1xbr9a;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306A6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NP1xbr9a
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b10d24345dso78727467b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795827601; x=1796432401; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r4Hzxb3NGCSSYFn+Gm/a38nZ3OBSGBwiKOcgfEfvzmI=;
        b=NP1xbr9aYchSjWccz1YTXtcUDfu6Kfw7+2E32BWhvFBJmtxKt3JqsAbSmWtkpkCxvJ
         /n9tD+yjbaBtMGWG+AOAC1Lc4BDVGli5hZj1dVoJsB/Nz7WwUmsK0vXUaXNixMLnjPnF
         /zr1HcO28b2gmxi28F0WybfMWXJ+PgYtDJlek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827601; x=1796432401;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4Hzxb3NGCSSYFn+Gm/a38nZ3OBSGBwiKOcgfEfvzmI=;
        b=UAD0wUVE0mmyn8QUrZaCJCh5NIiTlBj2UBiaU2hbcxTTP3rurIP6ZyBkOU3Pldyf/W
         DiTGBORvt+TfSUXGKGHb6jWLGHzQu0fOPL57QQhgCukjq4VxzPlVoAze8p/gTUMMrn74
         HB2cv3zgpIfLxjIhDMQ75gee2I27pgCl3Z1NnW78Rwigxt1ig7MB2ltnc+zFNPRP1Ek9
         eeZwIRfibeFjCuhNjdolCI+0IWwI8qbkPRcM3dg+RqF+3ziKJ4NpV9K8hqi7i/DiatXb
         l5zb4LJi7+7u0awxgrKrjhQP3l3uoZWUmZnlqcGxnEb9maV81QdNNfLV39pt9XQ2DsV6
         2vHA==
X-Forwarded-Encrypted: i=1; AL+hErHTHaNF6AJgoeDSR1nFId978Ji92QU5ISSyVhQew3fc5HpYX81KnuYoR6JVL2zF9W8QbEkmOA2dlBs6RNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GuOak6xOJAEP6TSWh7KaQgb45Dsa1pne/93poN6RjBW6Ry71H
	FuDTdd94Rbm0UJZoaLE733Ozcb/3xBReY7k08vJRPWgS72SvO4G7MGswjnByAYmx7go=
X-Gm-Gg: AZFdTZfE2G25/t+FukKuiw6AuGT3wjfLsTPQh1NkH7bYspXKZhaDDZYqW7vRVDmpJk9
	trOUhBbKHdn6dVIFvbmImWLFbUQkQDunZ7DJfRBHiq1dA/TNk8Bcur8DLcK8KTsZa9gtyw/O362
	HMXF5cFsWLNCXqOEeJ2lkzgdlJCNunGVv5TuRs4Xv1uqN9fmvk174QH+KOxzuBXs5z1O6U4uIsE
	nTm0yPr/ZeszgySGXlqYloK19BC+q9DsguwBxxQFdyFioose+3gRSQwsfvKyFOnyt0CYf3mgzMD
	USMEFV36QUs3B/3JtTNUci3GVu6Vi86ht3s94t2m3It3IdQDbJK6SxZsl4d7Ima9fkPgpS53KBq
	amDaceOIIcMP/ICUzgraMOdHLzPCOyasJD69ldmSemrS3HPFUjGiKIUSNBdQ4ZYchcWWKtRrZsx
	MRvIiJ7oKspjucOiq9cPLr2NAUnCNKOU40Uvcs97+Yy9ospfPceGDujY/P4nT+S6vmcXSmqokfg
	Rz2cfsmJuAYiItCxmb6v8K+H0l1JSRaQhh2JJytRXvZTkCIBvbJwLxNdt3drzw/6kPKosnACGVf
	GE25wa5gVqMMLttCHnjBHXi/DCPbgJXBzLPzArhmQJzZsQjbh47jZMphw9vJVw5GbezlBVFJr2v
	Tz7lDtskhoe0QnLzuhwaQ1lkP5u7cJIMud537jvtU/XIT7WaLpF5ia6kid/80A1OYAbTg/qohar
	OMY9rai/ze5k8dd5GaCA/yHxfsNfMWBw0V7miAp7a3wuni7jU34Js0o14rN1ZXYodo5CNwKHvwg
	EllU72PJiEkaJubZ/830CU=
X-Received: by 2002:a05:690c:b86:b0:8b3:4911:2dc1 with SMTP id 00721157ae682-8b5204ae0e7mr116512127b3.39.1795827601141;
        Fri, 27 Nov 2026 17:00:01 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm101002207b3.21.2026.11.27.16.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 17:00:00 -0800 (PST)
Date: Fri, 27 Nov 2026 16:59:58 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, David Matlack <dmatlack@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 6/6] kho: don't reference subtree blobs as FDTs
In-Reply-To: <20261127122536.3708770-7-pratyush@kernel.org>
References: <20261127122536.3708770-1-pratyush@kernel.org>
	<20261127122536.3708770-7-pratyush@kernel.org>
Message-ID: <awonjgkHO4wSeAGO@chrisdown.name>
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Pratyush Yadav writes:
>The only functional change is the rename of the debugfs subdirectory
>from "sub_fdts" to "sub_blobs". Everything else is a pure rename.

It looks like two places still refer to the old directory name:

    Documentation/admin-guide/mm/kho.rst:110:``/sys/kernel/debug/kho/out/sub_fdts/``
    kernel/liveupdate/kho_core.c:1099:``/sys/kernel/debug/kho/out/sub_fdts/@name`` when kernel is configured with
