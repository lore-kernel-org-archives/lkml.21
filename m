Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534578;
	b=wxWPKbisx6czld0g/HRcKjzARdqeHqRXoITeBGafVJXBsS+zMHdO1s61+Lt/9yq6FYme
	 KGzhjMiHKlMjK27PMATYqpEok+Xz6GQy5bGYzO7D7aBieUfpQmmkUO4U9Xx82xotoQIw/
	 mY27sIbzfdezV0ShNyMLDpSwXb2ipMR5mEnD3rPRZA9pYnbSdZBJQyNlrIT9ZiaA7TMTY
	 vM0c3YYoY8nBZEuSe34QNQRhDUM/zYmfb3gDQwULPkDDa+KKTVGxJKsgcqt3jEsT56c37
	 K7TRElT+f3GJ60KJBa86Jgl1sVkDuH+Cee2t4UiEMT6tLoZIXpcoGii6l0ZPzPh4Dfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pztq+Cm1+ZAP57GA6CuWEqPVZxEOeq25+Hlck3k+Nv8=;
	b=AH1BxibNIupkYu1Hj6UTQvTxItXHkbK1+8m2y+0d9p9p9AA/St6kG84sBgE/MywZbtv/
	 +qycjtiloL3HeK0aIxIImC3IlSy1rTShaVFWf9djGuEP2uiSpNpPH6AI4cm07nNE354jN
	 Yl5rTbwthzN+SR8xL0GWwQQ2LBM13OJ/73O4HsDh7WXhS+wxKMPLnEI1mC/6c6OW8EzPs
	 4UaSRdnAdfW83WqQamlf3rNrCWpe9vcHd+IgKqe1i3RqNuf6MYG4g+uhuk+o52ayTo7Gc
	 MNaZlSA7TiMUysWpFKu+IDHbNOeCirnYJLHAzELZPsgDeEjN8K2sEDpJzKf6+2mfYwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bVPOFHhq;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F1606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84F1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bVPOFHhq
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-921342fae7eso50591526d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795534577; x=1796139377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pztq+Cm1+ZAP57GA6CuWEqPVZxEOeq25+Hlck3k+Nv8=;
        b=bVPOFHhq10ik9Bk7ROYmgO/NqxnMIXFTolb4IWLCiLnI45QyF+aI22nc4dKApDRJ33
         fkOzWBPwR58km9K00ANe8Xd4L8ZoXuSdk9770GP841FM2prZb3EU4rL+8Bh8FitCLtG5
         3UHMrqz0Tbx+t5Gi4YedcGBlfVoqK4HZfab9MjqST3leBqRmEeuGT9HJxM6n6W3QQsKg
         2vWlhjRt4Ro/Hf0jILpiY545i6lEJPrjbIS7UcxZUIbfPkN8ikOEA/f62gfAM322RA+X
         MNgvdwFKnGfrPzNEWtq3KGXj5Pn6pOyqW6EdH8ro2wvFheUQQaS2Ea7f3BOViCUF7fAg
         M+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534577; x=1796139377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pztq+Cm1+ZAP57GA6CuWEqPVZxEOeq25+Hlck3k+Nv8=;
        b=O9K05k0deVKbHuvNK6BUWMPggE8zdn3aqlAgXWzJWwJK2gtqBpo6DHhWhiufkIbWny
         poUV+shQ1nJKWJzxSrAXQU82N1GC1Qwr1aw18KvvhBLBx0UoY0ur+OZzXZKpgHlcWkgu
         eJnhErOQPJ48i5D4sjsfppE9WG3OM2JUrsbRA2kKzwWl7gprLToyT7ipm4zULAMlpzrg
         JX9YiS9wHghCfOzqrTUDBIH1X85HsLzkAtWOI2msdbjI/GZ5KMQVQ9YZ/SN+8sh78hEm
         4OR3kgT7l2JmEwFAGlXO99Z7UBbbwdNVLflnMBXS62RY3tcnGQMKlkVpHNP1lvU+3Ybt
         OK7Q==
X-Forwarded-Encrypted: i=1; AL+hErFiCztSd18UeI9b43ZdqFVvLA1K5FOmdD+3FDYvVgY6dFiSnmrm3hmbXYMWO14opAYHfZFWoyeDvjV0R7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vXAlKWxH6CIeaRXnO8CfUndFPXuEPVfNjHTqO1Xy4HLOAN9X+
	4Pni2u9+jablmafxzO63Gd8sxihoOyePxDs/qgGECbl+7TeF4GOsuuMSNyGf7xtMouM=
X-Gm-Gg: AZFdTZd1nzU8mt9y+Hp3ib7SJTRwRoq4cbV1Mf1/fjEmMDeFCUk2bX32/mSHbjdLDE2
	kbdx+4q/fup7o/ZrapurefHNXy7r0IoSuEm/MqzdOJZTTsFCS8JjXMYfAWoCo4vcNHlsKLNPm7C
	AJRWgHH+GAk3CHP1f8ndsS+9Wfvmtn0O1tcleSlJzTGJPtse2pv8/fE7t/ctAbGg0N3LyRAOKb3
	YZwUZ7RKmLtvqxB7b5pGQnJV65VER2i2jBVD/QOWxkfpMwXlTKb1vpZZpuuGV2HCPxJaWddCtu7
	B8W35/IQg+LWNJTm8gVhgbfcDeqe2JoSpkjwDwrOo8cHUnWAUtNbT92K91rokIo5Dds96dGYqHg
	yhzK639oCJo/0mxOL03xtJ1FELE/XRUgaG3ZGR9cajgHEmBMaUmUhZ6WEZvHYS27Z8PJ4gogEGS
	+vhWSgvsBg+b6A3rjP9mU7BxPV0Q1gyorjlyUhj10URjrztESR/I0MsstcekiBu1enakYWRdocw
	Vmkwc7jrtkjt2ZRT9SXlpdft3hPhPv8XJPHyZbNWtZIpLqWmqiSpLaNqOxMihPPPvcRkQdvQ7qU
	2jx3cw==
X-Received: by 2002:a05:620a:6892:b0:947:7691:7316 with SMTP id af79cd13be357-949bab3d3bemr2564224485a.81.1795534576594;
        Tue, 24 Nov 2026 07:36:16 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4219c4sm1073980385a.41.2026.11.24.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:36:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVsZ5-00000000WyP-1TgI;
	Tue, 24 Nov 2026 11:36:15 -0400
Date: Tue, 24 Nov 2026 11:36:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Shukai Ni <shukai.ni@kuleuven.be>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	linux-coco@lists.linux.dev, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] swiotlb: clear read bounce buffers on confidential guests
Message-ID: <20261124153615.GA114530@ziepe.ca>
References: <CGME20261123205317eucas1p2f96032281e0f5e9f17acc7ec343acced@eucas1p2.samsung.com>
 <20261123205302.1034348-1-shukai.ni@kuleuven.be>
 <42415609-c784-45d4-a79d-ef3cc5e6c3ef@samsung.com>
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
In-Reply-To: <42415609-c784-45d4-a79d-ef3cc5e6c3ef@samsung.com>

On Tue, Nov 24, 2026 at 04:17:20PM +0100, Marek Szyprowski wrote:
> Hi!
> 
> CCed Jason and Aneesh.
> 
> On 23.11.2026 21:53, Shukai Ni wrote:
> > On confidential guests (AMD SEV, Intel TDX) all device DMA is bounced
> > through swiotlb, whose pool is shared with and readable by the untrusted
> > host. swiotlb_tbl_map_single() copies the destination buffer's current
> > contents into the bounce buffer at map time even for DMA_FROM_DEVICE. For
> > a reused read buffer that still holds private data, the host can read
> > that data from the bounce buffer before the device overwrites it.
> >
> > For DMA_FROM_DEVICE into a host-shared pool, zero the bounce buffer
> > instead. Zeroing rather than skipping the copy keeps a short read from
> > returning a previous transfer's data.
> >
> > Fixes: ddbd89deb7d3 ("swiotlb: fix info leak with DMA_FROM_DEVICE")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> > Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> > Signed-off-by: Shukai Ni <shukai.ni@kuleuven.be>
> 
> 
> I'm not sure if DMA-mapping or SWIOTLB is the right place for such fixups.
> 
> Drivers should be aware that doing DMA from unsecure device to the given
> secure page might reveal its content to the host or other parties and
> prepare for that (like zeroing that page).

I think given the semantics we have to support partial write we don't
have a choice but to continue them as it is the DMA API.

The driver would have to opt out of partial write support somehow to
trigger this, and in that case it is more of an optimization and
shouldn't be linked to CC.

I'm curious if there is a real issue here with a definitive issue on a
driver or it is just speculation?

Jason
