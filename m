Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096357;
	b=d1pI9QYKAyQisBMHmonMf6q7SaoitoJt213/4IlfoOKEgEpxQAnGezCnvJYVS3NQQpkh
	 vlHHT2ZyvUl8t71HL30PFnAp8hcByO7bS/IMIbJFNjAPHrpbBC838b+dyaZIcy+PnstMD
	 MVJtoH9+R0oHEsh6gC+s3UlrUYwPcbFkPfg2xGHS9An2Vdk5mf7vwDvZ/binMmgimVOjd
	 fKTeY9Bk3321gc26F+xKetw6HIDsLtMlkzHp8w3ZZX5Vkjp4DuOIhL512RgPuGhR+nCyo
	 KGocowjOaOIJLNxUjc3sZ33S0u8zXA7NOFLTkgui/YcJeqrDk5KPDnvSAnZDk5jdrrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096357;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=H3giZ1HYF1OcJ1XjNTKZ+B+MBp99vdaKlXFDCF5Fp3w=;
	b=QBA4C+qDQacegXSQuoAA07LiqsZgwPeoBEN81d5nNWb01ZBJEt9TyvzY57bH8eIspEZe
	 siL8NqXXXhq2hhu49sjmj3GndFLdElPAehjuqOQjWZYEfZt4WavbYuOsJ957yz6b96rAI
	 lzkQOUmEofuB1bXbANGL6b6JLTY1ZocAcxNj1VCR082zoJVzZWIUtng5a8kG3G1ulGMoN
	 cCMQwLtn92AaHrN9/rkVcTXEZYrR3D7UcqjgD06RjdUR6HEI+DOPFpJvK4gzQQ+wG0yf1
	 Nk+dk2oT6i67eBMXDGnZKDPwiYj3mbiZ6fhrl501WHdq3h8W6aWXVMJa/HsuRVsGYDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E045uqEM;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE0606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0CE0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E045uqEM
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795096352; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=H3giZ1HYF1OcJ1XjNTKZ+B+MBp99vdaKlXFDCF5Fp3w=;
	b=E045uqEMps4TARFM9nLeOUNIOS677uB0UKq4ABZ0JQqb63QT1rtPLzD53QYzXoLhQwk5yOPH1rLXqZPnGjJQwz26z4697u5ol9UhP6/ZW/IQ9Qobpnqr0yKoKdvzjXZkPu1NNW0bdL3cYXVMyG97oLbRYWcD0ZQ/fYBv0+PhaG4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XF3fKam_1795096347;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XF3fKam_1795096347 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Nov 2026 21:52:29 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Thu, 19 Nov 2026 21:52:22 +0800
Message-Id: <20261119135222.55990-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261118061848.184844-1-gong.shuai@sanechips.com.cn>
References: <20261118061848.184844-1-gong.shuai@sanechips.com.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>Hi Fangyu,
>
>We should add "select IOMMUFD_DRIVER if IOMMUFD" in
>drivers/iommu/riscv/Kconfig to enable IOMMU_HWPT_GET_DIRTY_BITMAP,
>otherwise it always returns -EOPNOTSUPP. I guess it belongs in the dirty
>tracking patch.


Hi Shuai,

Thanks for the catch — good point. I'll fold this fix into
the next version.

Thanks,
Fangyu

>Thanks,
>Shuai
