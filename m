Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960389;
	b=FyaV+e6SBOBduh1+BYv8meaS/8MLOTE0l1NkqPILHgsYy63rFytU0RqkjD+DPRrR0T9E
	 xarJjCCDvpeZXdMwAQ3zOTtxBEmdO1L06pX+D6/j7o6LnG+Yag9A/h/Zse1AXC3YiO+lg
	 PDexVOgQb8YABts+D8zW9V1UJC1rLJ7FgCcySUxUobnOr7Vjv7I6z6K3p1XhwH8FqauoI
	 ROVHwl4ZUgN8b8FxBkemEQAx2jrNuSKWbjyc2+vrYbR4zsAA+7JR2p3pZV4XsgrI+fk+a
	 cvcLi2nAwWUBEL35hSNr+O/Zu+QDJr0ECRWqwprgyQtep5zcr3hOr7Pfa7cyw52Fu0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+xymGBMHB+69JfGsfO7yJc2L/tC6s5DquTHBRYW2RuM=;
	b=4shkW0cG0drdHNwzduvmOIiSF+xWSq64IUJbTOXtVkHTQqMTImKobgJLgB2ujmzforef
	 0LIJqQWT6Mny8SYW/cP+0QMIYwCkXxLgMmsnTHdL+EkZi9EoVCqYnFFuDNsEYTo9cwFfZ
	 4eMfcEzoWxv9qX+R8oYgw9JJI1iQY+o3OtmAhqVFi1myAq+x/3gCYTn0Cz/ZmKN8X2GEh
	 7nkoNzqKn1hBsMuK4S3c+s3WdKhkbZdbA2UN2LHy3fjSAKmL6ezd93lO40ZO4eOpIldD+
	 83Y+s0H8TQubdLf2mvAwPko8rjddunm3dN2Imf3pUgGUkRxDFcyh1seK+x8RTe+9gvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UEquQA1G;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UEquQA1G
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9f6a16afcso12425ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794960388; x=1795565188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xymGBMHB+69JfGsfO7yJc2L/tC6s5DquTHBRYW2RuM=;
        b=UEquQA1GKaFVZK88VYdviZy0Zd0/BVA+h4rqojd8tzowKo622JYGb5eLgoDDju4ge+
         N0SzNcmvvbwRPejifezn4wO+yOUAMLdZXzGH2bN7sr46DEvDrXw9qrshLLxfWJSm1sAd
         j+fZ8m3hY5qaFDFJL88f9O0WKh9D8xuBCC7y2b/+eJJ8LYmfZUPu8UiAZjhqBIcLvAOx
         5UGuieDAVUezp94H3qKjJjJM2ouD/lUopTUEfHZHEtZSL4xvkz4MRxtqWzp44wZTarye
         XZzpMKW8+DH2Bz8U4OFX44AhEqXhDbASX72T4QpN1eKMoNQmbacBi2pOkCk9zyg1h1Xh
         kZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960388; x=1795565188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xymGBMHB+69JfGsfO7yJc2L/tC6s5DquTHBRYW2RuM=;
        b=AgrxkhaUQzRDtEYsAuDJT+Qaw9O4RnMGiWzXqhZRwfy5SHgJdJ+8N36sqoKzbeopx6
         Dn5f50+EQaK/YdLhi+ksut8nl98yRHMaP4v+fEvAg6M8r6mrzE76g5t3Q8AkjfwhR5fn
         6Y9RHQ71U4zWAf9Dr1t3QBq9o4ydJhZdqANvWKEBRmV5TcmZ64zyGGx9H05qP4f7czGZ
         39ZS9g8UEM2vBR/kZHdmfu4x6/W95RpigxW68kvEUH3PvsSTYUjccimOO4cAntCwuPFR
         yLNn/mg2mE2vuGfZdiBVd1RYRD2XnVIZBvUHZlc4huJllV4j1zu5JckraoV3Rbdz0xOJ
         SukA==
X-Forwarded-Encrypted: i=1; AL+hErHy9RqyiBubqH4H6e6epGAoZDJ/lpbN51fNRNtdBHlEoL8WXyXKxztEtYduBxajp/w6PBTXZEbHu9ea4hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HGLAFkou+EachgOXxB6NtoTZM65OPF1QdnA9yim2HY7Rrr0La
	XX2yquJDDrRxt6ckAlrObCy4lp5pZZwzeMOwfJEaLhyD6RbcgD2Wkel6iZCyYZ+sXA==
X-Gm-Gg: AZFdTZeggCsJOvhKYVyOL2tce+yPRbqCnLew6XctvLu0HOXpNZ/i+HjBvliY6NDZajZ
	kHGL7FRY5ha6HjgZ0Cg3ri9MGTPxZdoxWITHiprBlWeZ3qb+I7JWJUTxh121ArCfXwRsq9buFVW
	Kv7MX24ZkWkLE5EjmIzIfsKCsH/liegFw16OZHriem8pyAkpYQtKfSCVNsff/yEfWiVbW7SJHsn
	9d8ZiogJvDfiktSlYa6Rs5gh+DWSebppVuxlhEB1YaoWYxNC1m00FMBj9C23PikGIECDhgQWYbm
	VlFyknoxz6DGdeAskvE6NYkXb3I2oPn9meQTKRaCuySrqLzm0L1400OInPcSfVEFHgN1e9Y1SFI
	0RfCbRL7KB73qHu5TZYx01+wX4W6sKHHUn3wXxYuU4KfCKEn3ppSpIVe2EZZZsrjRNxkaBtTxD2
	Ci+VCEXVkj6XsoFUOeR26LqzFb48VHmkFkAC/i3GXJAbbK6QIayY5Zdb+KzVx4ZsEYs9IXzjzWf
	iL4QejDkw97OlSpb7q3RCXWNAAb+TujfMtIW+sDhJepDixBFVZz6UC1w38PXNO7nkwP0CKjYENV
	2qF+wKQHigSSMiLQBRPtHs5xgudQipZgAsImvBq/1m5nff25aflWmVWWIW3zatAAYeI=
X-Received: by 2002:a17:903:3510:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2eff77a8714mr2438805ad.1.1794960388076;
        Tue, 17 Nov 2026 16:06:28 -0800 (PST)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm1142449a91.8.2026.11.17.16.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:27 -0800 (PST)
Date: Tue, 17 Nov 2026 16:06:23 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Alex Williamson <alex.williamson@nvidia.com>, 
	kvm <kvm@vger.kernel.org>, Alex Williamson <alex@shazbot.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, praan@google.com
Subject: Re: [RFC PATCH 0/5] PCI/vfio-pci: Guard resets against active SR-IOV
 VFs
Message-ID: <20261118000511.GC2250529.vipinsh@google.com>
References: <20260812045325.2733631-1-alex.williamson@nvidia.com>
 <an0BOyexLcOjFJw9@google.com>
 <20261117225559.GB2250529.vipinsh@google.com>
 <avzfBjBZiOnJUH4W@google.com>
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
In-Reply-To: <avzfBjBZiOnJUH4W@google.com>

On Tue, Nov 17, 2026 at 11:31:08PM +0000, Samiullah Khawaja wrote:
> On Tue, Nov 17, 2026 at 03:02:00PM -0800, Vipin Sharma wrote:
> > On Thu, Aug 13, 2026 at 10:30:45PM +0000, Samiullah Khawaja wrote:
> > > On Tue, Aug 11, 2026 at 10:53:18PM -0600, Alex Williamson wrote:
> > > > It's recently been found[1] that vfio-pci doesn't restrict resets on PFs
> > > > while SR-IOV is enabled.  This can not only result in an uncoordinated
> > > > disruption of the use of the associated VFs, but the ongoing use of and
> > > > access to the VF has the potential to result in machine checks.
> > > >
> > > > This series proposes that this gap is largely an oversight of
> > > > pci_reset_function() to recognize that a PF reset affecting SR-IOV VFs
> > > > violates the scope boundary of the pci_reset_function() API.
> > > 
> > > Hi Alex,
> > > 
> > > Thanks for sending out the RFC to fix this issue. I cherry-picked it
> > > into my environment to verify that whether it fixes the issue I was
> > > experiencing and it does fix it. I will continue to do more testing, but
> > > when you send this as a formal v1, you can add:
> > > 
> > > Tested-by: Samiullah Khawaja <skhawaja@google.com>
> > > Reported-by: Samiullah Khawaja <skhawaja@google.com>
> > > 
> > 
> > Hi Alex,
> > 
> > Is this series still on your radar for formal v1?
> > 
> > If this is the direction we are going in I can use it for liveupdate work
> >  https://lore.kernel.org/all/auzftbPFO_6XBYVw%40google.com/
> > 
> > Thanks
> > Vipin
> 
> Hi Vipin,
> 
> Alex asked me whether I or someone on our team could pick up this
> series. Pranjal is working on it and will send out a new version. There
> is some extra work needed on the IOMMU side to make sure that the device
> is moved to a blocking domain when the reset is skipped.
> 
> But I think the patch you need is fairly independent and can be sent out
> separately from this series:
> https://lore.kernel.org/kvm/20260812045325.2733631-6-alex.williamson@nvidia.com/
> 

That works for me. I can send this patch separately.

Thanks,
Vipin
