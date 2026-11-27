Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794578;
	b=GqT0OQ7n3Z3cIv0Or2DP4V+CKW+AUm4K+gp5jC9R1UrPZFswWaTmcOVIaOeI/+ZoVMiR
	 Oju4W2WPwxxVkTEMB6wZl8IAYbb56cKhV/5eYJTnKA2rO18yS6QRk3q4V4Euw8RsPiCX2
	 4PRN274OsxGWPlAr11rTJeGhX/lRQsFWQlolEO2nAgKSzd/g+XGjWRUxW7N1LUQ2jfUsR
	 qpIuV/JM3WaIKff4UhPWpfXzSwzHE4mXkyVCF7pngmEVdvW8npR8662ymA6+IH91TaYAD
	 in4TZPHBrAQqPU6JAuUvKO/Rh+N6BebQESq5XkdcwLJH+pUAdt5YByMu2+tnIvwhAMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794578;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yeHQQxEc7Gou5vCe9VVvBgjTfw4hsENbh9TrVOeRMog=;
	b=eJpPfkzaj388EO6AGIBnjOIg721BVadCi18zUeMYL5HCdhIdXFYr5Cljfm2FcZCQjoy+
	 3ClbRn5FlDBTYo9PtC2Cd7w8cyGPsTnLo+q9xTrQo05ldSuGxNVSQU4PC/E2HIPlwS2Ho
	 yzrNoAoonmU+Er1RCPUzqqMRzxGEFkhFmvQrPoKym0KgVGEsRLhbrVTSA1jctUJyHqdSz
	 ubYS8zTsabIdcW0DLldgANc4XubaW7EvjZ8fSYUkrePCvU5BqIaFVayECvVh5DXNLwm/J
	 0AoJzjashADwqhDEeaLTrE4rKq15DmuV3wyyYAekjVJ4TZ2oshociNE7DskTW2dSyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DQfwROO0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04327606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04327606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DQfwROO0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CB832F;
	Fri, 27 Nov 2026 07:49:34 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37253F632;
	Fri, 27 Nov 2026 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795794577; bh=yeHQQxEc7Gou5vCe9VVvBgjTfw4hsENbh9TrVOeRMog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQfwROO0omm1UYPhtG5c4yjZkdDi+/kBc+g37J6HAPe5FOXS/v0t7sbwvDnKpcVOC
	 kM1MVV5qbqdxFbx4S73wNJp3AJ1e7fIJPc2SoSnU30R4xQ1mYqDQius1EY/1oFw4O2
	 S2rJ+WO1Sqe4D+fju3x01cHiLI22oK96kYihZdbc=
Date: Fri, 27 Nov 2026 15:49:34 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 08/23] coresight: trbe: Clear stale external abort
 status
Message-ID: <20261127154934.GG861809@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
 <718f6c8c-71cd-414b-9ac1-11528dc35f24@arm.com>
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
In-Reply-To: <718f6c8c-71cd-414b-9ac1-11528dc35f24@arm.com>

On Thu, Nov 26, 2026 at 11:19:17AM +0000, Suzuki K Poulose wrote:

> minor nit: In the future, please keep all the "stable" fixes at the
> beginning of a series. That allows people to apply them without the
> other dependencies (even though this one doesn't) and allows maintainers
> to pick up the patches from a series (without applying the entire
> series).

Sure, I'll move the fix patches to the front of the series.

Thanks,
Leo
