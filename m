Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542011;
	b=KWTIVsyQoVKHDWDtD2Vd5TkWUiiyLlbg1rwiyxEwXqDjw9X2vg+WLOfeXO21CJ2+B+UK
	 XZL9x82ZNRuKrMCpwAmm4hHDQDN5Z1pEIv4qdASu92EuZGOmnhwN9fzeCIEkMrHjgbHsl
	 oRCQx2d0zmi6xlUZdrZKbzyrl7zKqBhF8sQ1JhC/UdQtqzkfx+BlAQYKgM7mJ7KqbZZcr
	 NlKXU3BW0l7Nx9UJoYKDHWdWXhrL/wgANcnVsvTlaPvlRPVrRVc3qJ66Bwcau7BV9MTWL
	 /yj0sKcJzZx4Q6KqS8WtSXz5sEH40oxJMMjXyz0zUVW7zy+meqpmqAUYL1zayuvp/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=miqMkDmR7uPJ+RMX/Y388NkwoGQvWXSbN62ZuELGneA=;
	b=TmQLozB+rbemt1cfyLrP5cHn3OhLtZ0PsRzqNFWCHe/ipHIwqE57PQdzt8VUG65BHqeI
	 fEcpqIjpIvkEWAydsXWQOjPkyOHTXzJocEKwuk85ARrtdoUnezPLOm5OZK00LTSTxxkxi
	 h9vSf1Yr6+l7Ae1m0qDDOOdPj1goJL6aQxPAZD1KClR8kLmdVwEfBk4nutdNwfmALWe8f
	 GfVqEU3HOI7zjXXk/1MH2lmKCKgy9n3hgxdYdpqiq7ELeKSPJRKG+X+gvcz5UczkXKU2y
	 28in+RPx6GwCeIEyWj7sSiqYQGNJ2C85b56saCype1dtU8WO/7dQTtkkfPa+Vx90eMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i9agZFNs;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706E9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i9agZFNs
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0afdb97abso133475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795542011; x=1796146811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=miqMkDmR7uPJ+RMX/Y388NkwoGQvWXSbN62ZuELGneA=;
        b=i9agZFNsK1q8o3kRmLMu51cr8aBzVAFBOQvV+Eb3VlhLkya/7n0b2TZhXe5L6cadXv
         fLVOh39CNTh2x5Z9gVxbScMubTagGqaHu6VhnhFc2tcbmfkqMD5ZOVeq8J5xHiFxnydQ
         AbE6fnBOJ2dUq7uybYleJnTuzAYM51XiVcTMDMiYrbWlQbX/h/J9kvIjxGT6Tss67ynT
         /H53Ti3mBA8QG0R7p0iefzcKxPLOuPQY/OtxddqjCUTyEDN1NZa9Ci9aHtgAapDgj8iH
         RMdcVVzBJw5vHVWZXl8pfRnnXCkDUGe8YHHpR7R7ZKHK7u4N+khZwzub+DZD8ZKeh/WY
         vHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542011; x=1796146811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miqMkDmR7uPJ+RMX/Y388NkwoGQvWXSbN62ZuELGneA=;
        b=a0TkwMC7P3pYRbSJ9EGfjainGBwBtY7IBNgoJ7/byCOjhtcUpFhDUzcPvdkhB0HoNe
         z5rvpBs5i8zovc/IqrPMFsrgknUuX9kkiAgMeIwtN0OKR9EtK8MLd01yP+envspsPK7U
         y0pYSPXypS8q4Ox3VJvYDT/nGQsxPrlu7+E33NWntG2Le6nZGp/m344ZGanfs18Tl8Hn
         mQKsCwnnqCxNDL/zwJpItQtMkFlKzAg+JcbezsrWvA6KHmu+1mTR9QYvycHmdSaKjpTO
         fyQwmG8MouIxq/TB7c7tDOwzukJoEOr0CxlZGMVO5KK3jn/ZW55IYOfS3tMqr+TsxrYU
         IUlA==
X-Forwarded-Encrypted: i=1; AL+hErFSdF6zur45FKnR4ASjDU1VwTEFaQROMD6PUAXLtZD54W4GtnTM/THVpBqV/ahRPX9mOlADGwQ+EeSPlM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9prYzyp/KHpZam60eQxDpfG1ohAkN9LmQ7QbFjtTUE+FVZ+z4E
	cTCtDo+v0rJNUw/5NIOmmnMVpbhA0DIyStvWVMNKR6WOZHSH6y7R8igkAnasIVdGPg==
X-Gm-Gg: AZFdTZc6Xi7Z1XNfV6maFE0dW02Ww9yH48cXC9zM6CVTRAXw1z2rczO1RiVItQ5pkOU
	YzPJrfqAkU+49a257jD9grToVPzi6le0MJozWsalG0ti+/F/AYguCiPM6l1KTJdDzBisnCRzZWB
	2vOSuiIarB4x8E+w1So4r03dNJHsdKT0PiPl/8vxqLFftUy6sUuHjcM/C2hpOTBRiTEusqnRzBC
	cVp2YZ0iz/gjhjNd2r+ggfqhIMBWxGqzd5/KzruKtaA9ajb+nMfFJfBmwZyed8ohnpmQtKTCF9b
	9GE1YBepL/1Hr1rS6WNAsDRJte9yhyWAAZYD0kcWvhgUgHzTohyO82zpskCCQz5VcuaGulxEMbb
	vqrnCmOcYWbGFGgfKNhltYe0hPFb1od41ghOzTXucQfpE3Gz2edWhufAIMHt+jhpOqV/lffgESQ
	RYlX5ICGo0w7XaM1UqXEXtYk51tMGNhiqPC24QnijCEGVnICrc59ceGmTGD1ky91XeX4BN9HUQc
	hDtVwVpI+Zsj8PbNl3oaEF91Sp2z44zJbLvzhUIzIIbCY9HmZ0THcplW+mUeS7xhkbCAsT4Y5mv
	kZaqfPTXLbVF5YQGdodApnrxjynTpnTn4O3XdVHLp8/h1KWkj+nFXjguA65RIrKMgibMTgrynRo
	J/xZoWfQgw71zlFGkbRW9bw==
X-Received: by 2002:a17:903:19e3:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2f066708a17mr12958045ad.15.1795542010063;
        Tue, 24 Nov 2026 09:40:10 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f122548sm72700355ad.66.2026.11.24.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:40:09 -0800 (PST)
Date: Tue, 24 Nov 2026 17:40:05 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Ankit Soni <Ankit.Soni@amd.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Subject: Re: [PATCH v8 05/18] iommu: Implement IOMMU domain preservation
Message-ID: <awXL2cLfpbowuO0m@google.com>
References: <20261123044949.3610702-1-skhawaja@google.com>
 <20261123044949.3610702-6-skhawaja@google.com>
 <ngjof224lsvn3aamehaaowcsk6lyrypjw7uidwwbxxpzot53t6@462wqwsp65bw>
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
In-Reply-To: <ngjof224lsvn3aamehaaowcsk6lyrypjw7uidwwbxxpzot53t6@462wqwsp65bw>

On Tue, Nov 24, 2026 at 05:23:18AM +0000, Ankit Soni wrote:
>On Mon, Nov 23, 2026 at 04:49:36AM +0000, Samiullah Khawaja wrote:
>> Add IOMMU domain preserve and unpreserve APIs that can be used to
>> preserve an IOMMU domain across liveupdate. These APIs use the iommupt
>> preserve and unpreserve ops of the domain to perform the respective live
>> update operations.
>>
>> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>> Reviewed-by: Pranjal Shrivastava <praan@google.com>
>> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
>
>Reviewed-by: Ankit Soni <Ankit.Soni@amd.com>

Thanks,
Sami
