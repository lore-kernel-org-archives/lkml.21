Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382390;
	b=fpI4SYYvCF/kNr07E3Rs7dmC4rIQ/bJf6CsY8UgyRDTehN7aFQY5hdgo8wBXTJspnIVj
	 /OzUyZqejqUFyCY+40nTgfaVO87DdeiGeyHxrSajbiJ+EOS7b6Se0Y0IwJ6pjVehc+pPc
	 0DkvppuRjmMElJM9+621/+qxdpdxPoJw81pqxCt+IFtKGV03CH9dKE5qhJ+Yh00yLAFTY
	 npD7iW5J3z+zkXqIU+2mf921SgfhHM3HgxrJiP94o9/81fK1INQfxjTEELi0TtUtb75Zz
	 uVnvxcrlXFx7dlH8J3j+n+GERoE/sdoL7zofSkHi2D871Pmjt+A5jhugB9bgd7nNjVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
	b=t+Cu7HxtKq1dWMF67Xe4hXORwAY0sONmqoqMkMEU9StOiA+g348h83GkkdxNFheahC53
	 eS6307zX54xHWKq5iEFD6pfxK8ho/adQ0r0f1zhP9kls0vKvoa1h42U+NNMPVxtMeGGKM
	 banNI7VUd1NdCXI28saQJzRnadSDEpeFGd9l5A4xUSR5xDfHtxGD/z6oTgzJk8lXYdVhi
	 0N/xVTAkkeFfrRlM3wqgacbqsdFDg3cKYkxkvdipTJiZC6KDgdoknh33ZM7fUSNqhZZxH
	 GPolZZYWpP5l8BmfQbQRRQL0K6siM9ixOEMVCsM+8Z2uXCN1Slo47i1SSZfjoXYG58A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6YuWc3T;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB745606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB745606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6YuWc3T
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f048bc09d7so61435ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795382389; x=1795987189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
        b=Q6YuWc3T3SalsZoSZ7nZACQHkeGNao4ybVKhTt0wRTBMWq/STNikHYxymoVlbxJKwt
         ObO7f6LqOfkLa0ZWQsDUJxcoIFT1R7RX+ch+NcX9HjC1fUkz2lVXWap2Fhk6d1BNQ0/q
         ou34OmAd2JjIq4liY6+XTlyVs7lAo8j7mMJNCn4UbXdO1PySd7WVB7CcG5aY5NFk6zeK
         MTPQ2mPRuN0yBX2byMj04WfBHffJTGoEmJVbEpdFlNNAdwmn3w7R5fnIWHJ14+7KZJBj
         9JP319l80gUmvzuJ9ttWm+kYAoDSsisjSAMPzJOAjU3H2qQMyoaLkA8b4AIwL0EJiVEx
         8BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795382389; x=1795987189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
        b=ro1xnxmwy0PtD/AvKZfNx2uha27GqZh+xwfKNgNdMJgZLBFuzewDCjZTRO0DiRrvDL
         ELYF1NMQDi1ibmGRttOyY6E6ada//1xJDZlMl4FMCW87hkMQcjWLA4WMsdcjahuoYR6w
         UEgxsyWDdJmABuZWig12/DoAY1klUXh3AWqpGpKKhmvPw3Q6J6XsV7/q8Y8rWrSQu/Zj
         ZUzY5HP+DFiHp5YQt5XQ+1Q8+xFgD97bEjYTHtp7g0s6rdf1fmw0Unh/EXzst1na4tXG
         mfeX8qa3cY0y+UXg/sCK97m1tX53/79iLMdeo+Nd20w/wTmSFMATXO54EFPdxERROxRH
         fqJQ==
X-Forwarded-Encrypted: i=1; AL+hErGElr5l4q/90ZwmDcB96XPf9D8Qde6GTTQ9DKzGCWKnK5RfG5MKOxtFLXJsS5CkqUkgy4PmxVmoRH+odOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qbCpJ/kdBK+fAGpEWz6olDQ07YfJhn8Rb7oXve5zaj5f5q/k4
	UPTnn79wTTkQYv5/E3PpzEyynL7DgdIB/jQEDyQKdyz6uplowkrBVeS+matszUmI5Q==
X-Gm-Gg: AZFdTZc+0+E0T5HP3qLhqD2siQSmbnDwxaLmEDOyVq0vy2kW+M/G02JkRVHGVjA+6RS
	pAv028p1EFvXngJBTZlWRPW67liz3tkkoufuYE/6pcwYngbtfRNZo/DNdphCfYZEUc2vpv2sl1J
	MuED8sFnC+d2AYF1Y8UgmL2TPlBthQDvfNnSNfO6EvmV87gWv38UdSaKa2WIXtwzgi23rrzJaGg
	uG+CYOWzNg/gL93C9e3tlxUKhGqhq5nlDEsJJ+zaRPRE7ZA8YM/x9ZYuNMoSqgdcyRu2A6HU5q/
	9cpF+vs1QFw+Gq/N+cs8vccR2bJj8P1eRsiOZE41YNsaMbfz8pZPFxijRxG6SiekIx08GxXzIUh
	Vg4r0fEhX5AmayC34wql/moP+79nYX/YdqjvapQJL/X2zSDEwplz6mPpGVgdmFZWGuOhW0ppZwD
	ZnlZ/VpMkwq2MPcZeP1pT6RsTAn1WJWBB2AWLe4l0VaBMMF68dwfdKLob7DUOlCXAvNnRa9Rpc9
	L3Hcx0J8DA6GOAtxPHChg9cWwVRpgw/utUROKZmwCFmePnp7ejemMETLP4VhLBxGNEZ8EShx/Fo
	sQE/4U/21kGNoM+MhhQBRjLTzU7Fe+JKks0JkirPIFoTZEdH78VxBYuuf++mCT7io86YhGQClcx
	yiP1Az+GZrelhMtuYjZSb7w==
X-Received: by 2002:a17:903:19e3:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2f066708a17mr4257845ad.15.1795382388397;
        Sun, 22 Nov 2026 13:19:48 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm18461423a91.8.2026.11.22.13.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:19:47 -0800 (PST)
Date: Sun, 22 Nov 2026 21:19:42 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 03/27] liveupdate: Export symbols needed by modules
Message-ID: <awNVk3q6Q6sAHn6U@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-4-vipinsh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261102153656.1431701-4-vipinsh@google.com>

On Mon, Nov 02, 2026 at 07:36:32AM -0800, Vipin Sharma wrote:
>Export liveupdate_register_file_handler() and
>liveupdate_unregister_file_handler(). All of these will be used by
>vfio-pci in a subsequent commit, which can be built as a module.
>
>Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>Signed-off-by: Vipin Sharma <vipinsh@google.com>
>---
> kernel/liveupdate/luo_file.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
>index dbae0715220b..6aaa9a531428 100644
>--- a/kernel/liveupdate/luo_file.c
>+++ b/kernel/liveupdate/luo_file.c
>@@ -916,6 +916,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> 	up_write(&luo_register_rwlock);
> 	return err;
> }
>+EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
>
> /**
>  * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
>@@ -933,6 +934,7 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
> 	luo_flb_unregister_all(fh);
> 	list_del(&ACCESS_PRIVATE(fh, list));
> }
>+EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
>
> /**
>  * liveupdate_get_token_outgoing - Get the token for a preserved file.
>-- 
>2.56.0.317.g454f8302e1-goog
>

Can you please send this separately, it can probably go in without rest
of the vfio changes? This is required by iommufd and guest_memfd also I
think.

Thanks,
Sami
