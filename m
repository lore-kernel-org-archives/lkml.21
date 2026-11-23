Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445513;
	b=uPHmMdJpcKpIqM+KO+IQsf3O7MtbTSGw/sXbYk5mJoaJ5V7yiWDHqXTvqYm940mGRvgz
	 qx8SQa8Fv7/Ip4iX40Z32JHXuiwYLoxoaFVJ7mzzhRpY3S7a21I6QcYMWOiw9YyKfpVO6
	 vw26jqMHyAtnRh8e0NropXyHKiZ0/kSe4JsgAadGtYNeuV5kHMLA0tD26mgD3gHowar4D
	 q8sKHMHHoYkO24sf1saNcUVVdXHGQ013rkpzOWUICjwmo/jGFUA9lJsCxNfdecPO6rFUB
	 CORl/HVunlYH9MOaFGq4/eES2YKg4rbqsEEA+S4Xsm9aLNQzHJnjAR4cvUGbqB77zLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+GN86u7V5KEYiAKLCr5npZj411oise1PYGQMCZVT/c8=;
	b=fPXv0zs2RuL+3TmN/58mvvjBvh8+U6oXa+AsGapAstvisk1U9cxsyLRiDq8F0Ho9FDLN
	 A29vSY4YQp7sGCZtfoN78aAy1qzA/KRDBlZ5DXV81/ffl2RHu4bSIo/knoZHPFqCGxyI9
	 98EEey9MU2ogC4HyQ77voscp3EjRsfhSMysUeFD1gN8Sjl9isy9aW7sNXKyjE4fNeEGwf
	 Z8Nql0eYphIEVO20ClIq+9vSrl/52Oi9VTGKUkZECrsTMpf0QthbT9kJ1YLgu/4ufP36W
	 53kUpQoPT39Um503rQLz1fy6PZYq3ZbZSlJM5d4I0TsVvEKkIUh35edt95TiEsGZUeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MK5nt9JQ;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE739606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE739606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MK5nt9JQ
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55c35262674so26329181cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795445512; x=1796050312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GN86u7V5KEYiAKLCr5npZj411oise1PYGQMCZVT/c8=;
        b=MK5nt9JQDldaUx1OgWLqTt6ipgKsMPwRg1y0eaCX376socIWrhZxd99pJjpsYDaQ44
         dClaw35bRyL/YpTa4u2XCFINCvIkzFab/hec2DWQLQt4GBFWnvbHLJUh6iDFqqySgv7z
         HWdI6h+/cLpUAp20uVRitrJs63U6yTb25HYd0MqmW+WkiMuCKPv+tnt5nsbDjW3ygYqc
         Rm5o+um7AYsSAz7zLfDXc3/1iLsqoKHPxMWH8ZPanmwpWlxIzsp83w6K4368vi7eSvmb
         MjiRtzu7gv4rtZwYG4Wuvt4nYGjOABS+7gwaRrKA9KkdHNLdlQt6WTPjq5lgIZsoNV6q
         2VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445512; x=1796050312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GN86u7V5KEYiAKLCr5npZj411oise1PYGQMCZVT/c8=;
        b=lMLD52S/20MXne2DWV3R7K9SyHH9SKbZE4uyD+0mkh4YF98HQNF08mU2TSWkT+miCf
         bt6VFp3MQEz0hFEne6wZObEWIxIrbg2PJhyYTw4/NqecOSUQw9Vn8iPtpnE0wYawhdWf
         vP6lm/Mb9F4LfkIN73A+bi2VRcOy9hL2k2zjLipod74E4r+uOKm1CEh/oPjqkcpDADVi
         M6tCbESa0+eh1uuSqb7BngxiTcVEFPagaD1XeqOm4xuZLXXAmrC860bhgy8+6LR78/cx
         zQOHFufs/yPmzXI1Xs5lSFKZpw23pl6JNitiSxw8F5bf/r9tUWRtepzcXwEemFWuG5J1
         oDuw==
X-Forwarded-Encrypted: i=1; AL+hErHGoAbtDpuo1MEyioCzEv99ftmm38AZ0r5lCFYar0b+cq4ctcgMNGNVEdtdITD7mcVElfKmgGNSiRx1NpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jAhRD04IBRjvJdMBbw9HcpL7/QAcWEgXHPrmoxyCLYeuw+81i
	g6dsukVNb2R74sCe6ulUordin7Puf7kj67Ph2pGXL7XkK6a1axZpTSEM8mb5R29eEJzBnlcO9Xy
	BJRy3
X-Gm-Gg: AZFdTZeBYrmditUwlf272qqgpUg+TiPXjkrSwBdvSAMpkbSxmjxPSywwCe1M2QJ++qw
	zkxdspARmUtKVDCYSCfZ+fwp1CsNTOXoV8LRKIFSD1n4fpOor835yAU3yPSuiOqi9IoYLwVgkYh
	FEwz1wSH0T8gm7PGfzhb/KNwJq0vi4sZ2v6HTgZVK02INeWpj0XxwJ89aCGhUfBuYRQpwjslV5T
	JufDqUOmJljwp+a/hkB7l6TjUPq2jN8nhwTJbQ6j5gfLWHuyNHlSn+Znb7wr4PN1VB9rjm2wSD8
	UyygrL4mylyy97OMmftJ4Y8x2ADZFRLMM9Yx5r+RMHX5KO8GbovCsjdmTK1uklXYecs0Vrodwqi
	/mtZBsahcdjhYk1rX076AsFEpM837BBC1lBpbDt8JFV5+uvLIbNozWScMXyPd4LlsRc3oK1XwlQ
	TpecNLO8SHrto5+iYHlApEL2uMXKDOelcY4GVN+h9VRsBwtOOcB+6AQFfd1wLMM2BHhHBzOmaMR
	ixeZkMTYn/pH78zAr5LDT43eOkGGgO4TNh72ozYyOR93ktONkN4lpHJvOv5QDrUGEwRVYASJELL
	OyoySZZ1KZY0e2uVHgLQ7xSCEiN1j/8/EWOJ6Ejr29+gbOr/5Maq2dJpJyOBKJiaIrhfkODvz3p
	ZGzU=
X-Received: by 2002:ac8:5fc6:0:b0:55d:13c7:c232 with SMTP id d75a77b69052e-55d76a2daddmr203711001cf.51.1795445511671;
        Mon, 23 Nov 2026 06:51:51 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm100548991cf.3.2026.11.23.06.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:51:51 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVOY-00000000qxm-1NQh;
	Mon, 23 Nov 2026 10:51:50 -0400
Date: Mon, 23 Nov 2026 10:51:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Qing Zhang <diasyzhangqing@gmail.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	Tal Zussman <tz2294@columbia.edu>, linux-kernel@vger.kernel.org,
	syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] iommu: Fix dev_iommu leak on mock fwspec initialization
 failure
Message-ID: <20261123145150.GA179082@ziepe.ca>
References: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
 <20261107140000.1-1-diasyzhangqing@gmail.com>
 <awQGCKf4UGKO1bjw@8bytes.org>
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
In-Reply-To: <awQGCKf4UGKO1bjw@8bytes.org>

On Mon, Nov 23, 2026 at 10:23:32AM +0100, Joerg Roedel (AMD) wrote:
> On Sat, Nov 07, 2026 at 10:00:00PM +0800, Qing Zhang wrote:
> >  drivers/iommu/iommu.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Applied, thanks.

I took the other version of this in the iommufd tree

https://patch.msgid.link/20261106-iommufd-folio-dirty-v2-1-3f0b0be58c4b@columbia.edu

Jason
