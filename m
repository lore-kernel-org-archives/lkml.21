Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403627;
	b=fMdKoRTNW1vsyRpwhrTs5TQ9WBzAOkfj3L38Onj56bf8wpqFLJHEVcm/uQhWcyzVJJCa
	 YVkyNWYgJjopltA4s014gm1dO74V805nwEje4wlte28Fy5r2SGYcovViKNk/XI33g8ymV
	 sfeE6CEkd1fCv5k8dro4sz08c6NjQWRkT0wzJwmFPgklwE182a0k5EDsAUA4UPP4cHBC2
	 84A+Do9Ob9flITG0FfKuG1fB3W38nh9OwmMPvebbS50czXK+UaiOU3YDDXR62C/M9geiZ
	 9LML3B4uXzgEHLbFH3RsU0utXf749AbdTQ8SU6JJ9u7j/qHiojP1ETZlT05iIdMzapg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403627;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=U18C2QTlD6mJ2V8xCyohK38ZhFleFWE9EQ0CHhe9nr0=;
	b=hA8TSYqYW7W/B01TI2512CnAPZzPSFuyNq1R2moGRnISuqZlAEezjvkykofUOFVuAT0S
	 s/mQKKi7YEq6XY+VPaaZaxQLTpP234V/wShAJ2clSFbCkEG5/a1RFeM9SiwAeAJvCzS5A
	 jqGZnToicb2Nd5DZVTXjX4AYy6FsVSsYONBiaPi8BN2/zfAFjnZSG6bghcMziNO/X9uqm
	 XyCEGyehmp//TKrnPe7hnXxVBtXCIx2rPaGxWfxUxi1oZZfY+S0+/1qhUwtOwR6Znmol4
	 Fpa+848XmVw8iKdjLgPte5zDdsWQ4dceMDcBU3swe2S2bZDjRnBnZarRkEtOxLDGOug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XvrhYRAE;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C3C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XvrhYRAE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DC+Hvmg4wtHuuxLSzB6tnYTd241eZJs+uGq5EvrA63A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795403625; v=1; x=1796008425;
 b=XvrhYRAEn1py/XepGUc6Cj5P0xtD4dPnh1JRrauOGsOXq40oOojQzMG0a/LIKTNzdp2TcCxE
 MVN9+8ieyBXXNwwSwaiXz6nRF8kWGjYvbaweZ2rIEn5+Kr9l5ECqy62cRtnp6WZtIlMLB4qz11A
 59xeU5LeXhUWxPKgUdvlMJgQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8cfdf9be3d9a39e9;
	Mon, 23 Nov 2026 03:13:45 +0000
X-Mizu-Trace-ID: 8cfdf9be3d9a39e9
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 07/19] hugetlb_vmemmap: Allow architectures to make HVO
 enablement boot-time only
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-8-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:13:27 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: 7bit
Message-Id: <FF5ED811-50D1-4B90-A72C-4606E51C9FD5@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-8-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote:
> 
> Architectures may need to configure the system at boot depending on
> whether HVO is enabled. For example, arm64 needs all CPUs to support
> hardware updates of the access flag to safely update the vmemmap in
> place, and may want to refuse to online CPUs that lack it, but only if
> HVO may be used.
> 
> Such configuration is only valid if HVO cannot be enabled later at
> runtime through the vm.hugetlb_optimize_vmemmap sysctl.
> 
> Add CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO for architectures
> to select. When selected, the vm.hugetlb_optimize_vmemmap sysctl is
> read-only, so HVO can only be enabled or disabled with the
> hugetlb_free_vmemmap= kernel command line parameter.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.

