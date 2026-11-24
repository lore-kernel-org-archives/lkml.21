Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542044;
	b=Y3rqPGcBwT+KunsB6c+OBhGrgxTY2QWFAJ4ZZHXnqYgVz3eSPg2Ai5d0fxeksZn6GSBK
	 AGV2KZKUyHJg/S2HYzil0RNRQv5NZdVhFJ8ka2Ff2oKbttfUAjk97CP87z6MMkRNif9Jl
	 sYD8LiyZq1GBYTVPsNZgYeWYKUXgKXCWc2V4/Gs1sTQnr4Om2Zd6uYu2cuvkhwkBkspX2
	 oKtjlBinhqbNRqfVhzAXr+khCIqIot386/HTx4ULYGEzyIHPdT4nlEwHAD3NlTFkQP6fS
	 AzQmRkN1tPVwe4QsT67iEHg0ZiGOFAHOyUwIp555O+uE+i1FJ48S+GW3vjlYQwbV/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=A0tfxpWQZksA+4DUx2Ik9FwTneKF6Ex273j07+ppekk=;
	b=MJZ6xZecMCLN+D5K4AwbXlWOj80lk7jln1g0zTsjTdEfHOR/UxBpvJ8MJ89bbwqo+8Ue
	 wwoSDyXIYy/l12qFFoJK7oruN+bsGoQZv92/LwjFCnR+K9mdyS97fPqn9DP4OZZQl71wF
	 GDXAvk2B2aW7X1p/gWdQPDomk9o/7BFBJjvWdoetJh1WnTUY83rLdjdM8NYaWct+BUJ/t
	 dhc3pJZUVTuHSHdP1xV5AqSc62UuvRAdIN0CXysltBTAEDOGzkaJjfQsWIRRRgE5H95hl
	 RVtCvUQwCVNrhl92qTV5kiiw7TW9qmPaFHxkBav2dO3r42ddTk2QHICJOdMFU9lPWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibfncsFs;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A4606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60A4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibfncsFs
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f048bc09d7so212715ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795542043; x=1796146843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0tfxpWQZksA+4DUx2Ik9FwTneKF6Ex273j07+ppekk=;
        b=ibfncsFsjl1Kz3hR43C3tu9vI7/bGZJ4y47qDoBAzmeCjj7Q2eB5yQnqXcdYAB/A6S
         9MQUQESFogPtukQykuwQ4MWoiZnW/gGvxdV31AOPHeJF6Li2p1i1BYmoWJ3/tbJxTr7k
         asclk4tB6yMBGKTDK5l0s2rVK6eSEQxitDpFq0jeRJHB9Uyu6IvDUZBxdImblVfcomeO
         aSFzlG4OOn6fo+7hwyzWT9Mjcs6/dZzUla3Rl1zIrrZF5BF5YHwlMne5VcxPAZdYbdG1
         GNphGUw/Le1AN2DBtd8pbLFWdT3P2aANprxyEUwHDdk6inM7u4WtaVh/bNmRKFKcgBK6
         nLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542043; x=1796146843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0tfxpWQZksA+4DUx2Ik9FwTneKF6Ex273j07+ppekk=;
        b=rvWvnV21fo2TS5ZfuPuGJA8nIMqz9BMJ+O1F0SpuIgvmaTSzKH/aHah7GRT5Csu9XB
         IHzil0sTR/7pf2nGhtaIqvDVhN8GNuDfIgZpKQsWfbxEGyTz3N5xYHkBJa+mDt7UScOM
         cbQQqhh+3l1hOXAcyITyu/9Qrv8LRFYJz+RZn+JLbzNsWbwUAf1NmfVMwXGsEzKa77mN
         tzxkB/Vb7higDiN+ypFvxahFDwE6RvZngBB63k9NyF2bTg7p9KI1LYbmQsW9uwaMb1sS
         vbg57M9dEMG8U9IaR2ZkuOsIDXurXma30BUqwznvqeUx6E4nY+Qw7QqL46UDHgtfGgDB
         NxMw==
X-Forwarded-Encrypted: i=1; AL+hErHSulbRBssp4bpHk2pYkpFqRiYArd6o+jn4rZQdRJvC5J4fx3y8dHSDxnNA93gb4KyT3ufjnIyShfdpsNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p7ouBL+fjUh8h5ExJDUpFTBhQukNYtkJFOYiau1GCkhml2nwg
	OoY3TZDLdP1p0Pa/FhL1VEoMHGdHYpjt6SiyVX54jnJhut1P55chscLrYum+jDrjqw==
X-Gm-Gg: AZFdTZd5qeUrYB3axtMlUV9WlMmVNITTpKiRQu0fNWOUaX46jOBXvI6Ex7S51hwqhTY
	rxgHEU7+IO+q1vzVAzF4ecFaIiInqZLQ5VZqrVirJKsndFaRteDfWksCJYx4kiHLlA34GQxF00n
	jHlgrDHitFEFO19J/JhQq1bLAu/PEKXqIqA0kekRowS01o2vVPzL58ofkNnB0Lj1oFj1xQg4QLS
	53dmaIBU3m4HgzQ9c4Kn89DRgBr/mRkVeO62PhebNTV0pS+8+xZyAOasLXssPPzzX6jvr10JNU1
	Q6EnqgR6JDwbXSWucBDS6hOTa4lPUEfmuXdVUj/Vt+KQloHgVzomUqDOd1G3gpUZ9CWdyd56cqe
	5hZdp7uH8+sIUttapYSY2t6HG+ffBcwIAPc4NovuH5y2HBsZbV9IkSdYl7kw9O4qdHh3oBfBOlH
	ulQScorT+fOhpmLVFGSkRd6apjvyWCLYpX+f84yA3uY92TjMFkqy4kTRgXpZEKwVdh6VXNUa50o
	Z+5PXxv904DvFSVo7VACp7YkqA0BCPf8ocKQfCy299goxxrz4o4wViOEyihp5TNyHaoQRq4Vt/a
	Rc8AFNGACvSBxOYWxH3wOyx2Haoc7VS68essSWMHI3jx29PVkK+O71CkBR8FZzUL0cOKzFvoM9t
	pPGVBZxOFW9uaHPN3Iwg/zQEho2fZgQ0gyt/pbaNrlg0=
X-Received: by 2002:a17:902:da4f:b0:2e5:9bdf:6b65 with SMTP id d9443c01a7336-2f0bce40277mr4837775ad.0.1795542042658;
        Tue, 24 Nov 2026 09:40:42 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm7514061a12.7.2026.11.24.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:40:41 -0800 (PST)
Date: Tue, 24 Nov 2026 17:40:38 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Ankit Soni <Ankit.Soni@amd.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	John Starks <dev@jstarks.net>
Subject: Re: [PATCH v8 06/18] iommu: Implement device and IOMMU HW
 preservation
Message-ID: <awXMB5GaBlcv845A@google.com>
References: <20261123044949.3610702-1-skhawaja@google.com>
 <20261123044949.3610702-7-skhawaja@google.com>
 <i7i7msbox2idxet5xfzkf5zg2hoznnjpaivbpsjrpeoko445ys@trkpzp6zceqz>
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
In-Reply-To: <i7i7msbox2idxet5xfzkf5zg2hoznnjpaivbpsjrpeoko445ys@trkpzp6zceqz>

On Tue, Nov 24, 2026 at 04:29:25AM +0000, Ankit Soni wrote:
>On Mon, Nov 23, 2026 at 04:49:37AM +0000, Samiullah Khawaja wrote:
>> Add IOMMU ops to preserve/unpreserve the device state handled by the
>> IOMMU driver. This is IOMMU specific state of the device that needs to
>> be preserved for liveupdate. These ops can be implemented by the IOMMU
>> drivers that support preservation of devices that have their IOMMU
>> domains preserved. During device preservation the state of the
>> associated IOMMU is also preserved as dependency.
>>
>> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>
>Reviewed-by: Ankit Soni <Ankit.Soni@amd.com>

Thanks,
Sami
