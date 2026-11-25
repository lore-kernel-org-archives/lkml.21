Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795649245;
	b=hnm1CVH1FXBFw+lVWHkeIIZJx8sBkG/0pYdIu92x3sQTbIy/fPtQ810Im+96Ic2ZB2NL
	 f2H2sePm8dc4Wxe6k/4wf+HFALbqj5rLM68cA4QdV2I3MFwywfbJ0FN7nTNGz7O5tbubj
	 mpOa6VFPJXeLVT4ZeJR/W5zt7ik7X6HR6rMNNZn2p/738OqWbbv4eYZqMfmYrPUGppOWI
	 SS1zflZ6LjYSZQt3VTddMeCYsYZikaM4TBU3CQ2c5vj1I69nrpV82D/+oYCnR7SNO2Zel
	 d86LVMl6qFJF/Mea9jJdOWtOcjBZmJSX+ZudnsBVOzq92jh4V8EBAuz2sT6PzGjrXvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sp9Gu/ag0sWDcDK/oXTqpJzOnSAhjMt/opO5ZXrPuXU=;
	b=Hp3HlKelpZNNZ7baNSIXDTYmpq/bwjRTNEef6C9d+SyIdyEE21PHM9hqZOVh6wqdCSbh
	 QJIs8E0KzHYsIN3NsRuWxMDlNiYCk0SgZy/YuMEuaw4p+tAZmHK9G5KXKUb3AfcpmStBb
	 H2z1yk0uaep8gaeGxAH53jkDZVwTT3qXcwlBAWLgxdual8Jcvby56ioUJ1tdbOSiFVdqB
	 TFwhf8ibMgfa6xhfs633Llrxl52zi5p3/HTiN9VGlnygMlTYnBiAojzFMooe/H54/n4e3
	 ocJlXXKvXIdn4zAsOHNJ5EndjD9H1Jd7Ftsvr5aJNjZ5EuTBHtohTFgN0zGlyFhRtyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIZMZwqW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5878C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5878C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIZMZwqW
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so10606114c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795649243; cv=none;
        d=google.com; s=arc-20260327;
        b=PgHjLVNHWGo8agU/APFWowkvA4cNecAGeMpclEA6ZA8mKJQoeWSxfJO1caJWz8CosS
         11VvmmQuCCKj8OQT1Gg4eZunKCemQW19aUYMQ9LDXSKLh5sX9VMDdFFMz1FsGiHWJ48X
         2CHsJvqUYDcPtncMCoB2sgnz+6mbeosfade7l24lMFKzerP2CL60w2qsJ2961kdrm+CY
         h4r7qv6lrWlorQAqE3vdGOBppTAXr/h76/nbsafQcQwepZqd0Evpx9+cbwUR25xAnMSW
         W8PEe3/VcHp3JCEadX6EbcihtGe1sJIMqi6HNwyvYO6bAyM17DFOEVRU0ysBKWvIG1QX
         z4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sp9Gu/ag0sWDcDK/oXTqpJzOnSAhjMt/opO5ZXrPuXU=;
        fh=4eXS0IQrmqXnlFa8MR4zj7MNtFnZwCLsgXzmlzCNeyE=;
        b=I/mD9R9mUZ12h/02VRWdR/kfj39brYH4xJ2rKS1xrTlgM+vSOxCgSmAxVXJZpFvbBB
         Vecs+OhLjcXpa3azsijFbr+sFHI4o52xMNx4WTooKsJFhpSXzUZvUsRQ3TJvn7sQ+vM8
         oOZhNukz+ndVV8PMStPNk8WPStn7fSGo2C6Xm7LFFXT6Lt0h7ZvYLAEtui8FZVMrLWiR
         I/b4o2QrUSXw90UW/0hXgNaAD+vMsUUws5aW30pmI4hg1abjTv7cXqJrhadrFnDuO70s
         6GnTHwTWLOeO9p8cypTN3+kLZPtmMnCVgyUeii78Sx3Klf4F8UkMbnyrbiq++4lT9tvG
         ycUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649243; x=1796254043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sp9Gu/ag0sWDcDK/oXTqpJzOnSAhjMt/opO5ZXrPuXU=;
        b=NIZMZwqWfa/J5ul+qbcnkdRDZQuRIZOA9hBsJp/Ok5ad0bKzCAbStgOUKqZ3BlePug
         s+QBF0y5ERsSSKHSbJj2P93EEJybf2lkwaabtHEbV8PtMiJROMZKnAfjpgXmTDhb6PYL
         vmMKrLgDnlNPIy/8/Md21f5K3kAMEQfd4AtxJ4BgUhkZxWxCF76M3/BXwo/30dVr/2W8
         U1WMSAgTouOobAUuou7QSQWQyUsrDD6LbstC2L4jqAVSmm4OPnvo7pww1muvkP9gbN8G
         TfODmn9VF04xuoJBQBvpsX0BKQDv1bIxicJYr1vDm+voed8uD2YWZg/g7DbCEJAAysW6
         inOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649243; x=1796254043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sp9Gu/ag0sWDcDK/oXTqpJzOnSAhjMt/opO5ZXrPuXU=;
        b=fNgMVfJd1iY9tco+ZBus6aKsx1QiquvJ09dIVDuyftZZGJfnXSknWc3aVVWQAXpvlA
         4HYNqtx+YNWcWXYMjLDNVLEG6hEtWed9ZrxJ7vU5x5h2f0Yr4b2gz9amCzFy9SKT2GQg
         WYxDPlWSzj1IwLCaIhKnL0ZgOY+o6S7Nu7a7hNEQ0Xcp8QMvngFcpcxQrXkJ+dQ0Bina
         UKxDxbP+rlz0/iyd/OfEJcBqvHto+0RHQ4jWrG2rccF3mumv2QFt2/z79ruN2YkmQiZS
         EXS3LaybYztF5DkAZ+d7cL194543YnKjbTSVUNeLv7Vq8ENaWQ/X51ip7aV4CFN3rP4r
         IWSg==
X-Forwarded-Encrypted: i=1; AL+hErF8UWWn5evMUvXppgnF40RdEEyYO04D6W9UBssdQ0/1RjY45SLKIED04ExwkGBaaFD45HaBQ0r/52rCBjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0UAZCpgWKhMxElbWT/m20AylkCXuG48KGUdApPa57Bp+f1tbQ
	uRiZCscEIVCtozdddbB6GAWY8NRXIx8O13xvessTQ60Zlb6Vba6oMLOvPFToDnVB0ndrddqAwvd
	6rZ+XvztuU6r7t1XuFVUwoxj7zkawckwgvQ==
X-Gm-Gg: AZFdTZcmwI/3Fw61xen3qzY2R8FYX2lamlxYqGDH0Q2urX8XaDl19ufBqmr9YG+rUVT
	eOwrEd2Bq7iyOxp8cH8b8ZeyZhSA6MKp9OhdrTS4XOxyifoD8h2xBDR1XrKzjfgDDEy2N8NCcxf
	aHsXDs9VKeTt7pqBkEP75jfCufhD1Z03LNil95qACRo7PkZuGsRC2QuqTP6cH0uATBn+GILZZhD
	XjHiW2eJm2LkuNjsVjB8xRtTet9hi4hirV8OF6XOaROOMwYpfaUxs6QXEF/DBCUyfMTqeOrHcM3
	wOHkDRA07TZYlN07qmA110FyXtDpFHwGBri9V+CsUsrME6k9bSZscbG0k+NZO8Hopj/dW4bBtPd
	h/AGhqZV6K4tD5+w3h/MH4yHgV/862EhuPM+6cKTYTF2hrRnZIY+vu/q0
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id
 5a478bee46e88-3857762e729mr18890931eec.24.1795649243401; Wed, 25 Nov 2026
 15:27:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125074331.25190-1-zhangyu1@linux.microsoft.com>
In-Reply-To: <20261125074331.25190-1-zhangyu1@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Thu, 26 Nov 2026 07:27:07 +0800
X-Gm-Features: Aa3M54r4mxIQgvryDnL-qX8IuFUHHV-JKb0OjIRrToyrlQrT6deJuQHPpw72yiw
Message-ID: <CAMvTesDUqyoayJwGVRT93cF=mC876n+8fwvpPK9TVTH=8AjkyA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add dedicated entry for Hyper-V IOMMU
To: Yu Zhang <zhangyu1@linux.microsoft.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>, 
	Tianyu Lan <Tianyu.Lan@microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>, 
	Thara Gopinath <tgopinath@linux.microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>, 
	Michael Kelley <mhklinux@outlook.com>, iommu@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 3:43=E2=80=AFPM Yu Zhang <zhangyu1@linux.microsoft.=
com> wrote:
>
> Changes under drivers/iommu/hyperv/ are merged through the IOMMU
> subsystem tree, while MAINTAINERS currently lists the directory under
> "Hyper-V/Azure CORE AND DRIVERS" pointing to the Hyper-V tree.
>
> Move drivers/iommu/hyperv/ into a dedicated "HYPER-V IOMMU DRIVER"
> entry pointing to the IOMMU tree, with Yu Zhang as maintainer and Jacob
> Pan, Easwar Hariharan, and Tianyu Lan as reviewers. Keep
> linux-hyperv@vger.kernel.org on the mailing list entries so the Hyper-V
> community stays copied on patches.
>
> Suggested-by: Jacob Pan <jacob.pan@linux.microsoft.com>
> Signed-off-by: Yu Zhang <zhangyu1@linux.microsoft.com>
> ---
> Easwar, Tianyu: please let me know if you have any other thoughts or
> suggestions.

Please keep Hyper-V maintainers also in the Hyper-V
IOMMU driver maintainer list. The Hyper-V IOMMU driver
patch also needs their review and approval.

--
Thanks
Tianyu Lan
