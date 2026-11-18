Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969049;
	b=IhdGCotFc+eymiphmuYLgavw8UYCJbge78GqsVZMXTX6a5Ei8w37AHO6RufetqDQmYu9
	 HXSg2PJ91ZlFjl3r7ntg6oJAp6W14P0Mznias+1sVdEv1OdoOJITDBuZjbUI96+tbHDO1
	 e7tRlmPn+Z/CgYaatl+2WRz57dAj+MkwXsg7pG6du4GBLw+dMXceWIEyPKIh8i1CxwxSq
	 HFR7Qsxb3MDCA24H0u9ugTHcR3LV8jZ9JI15sl8g5q2SWmQqwlnP45iaPl+nZRkpeWd3q
	 sP6K9VsgF8dI6fuderKh8CzdzJ5Dkpy6Fv/ggC281Drx8+cwTK4tfch8zub5NSnVADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969049;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CPr3svibvd1U4dcTkD14lyr1VGsTvkn2BSMaTJqGAD8=;
	b=TNndxk3Ne77Ejlbu1XvIsdIMhGMU1GSLatSfc3WFnXe99xo1UJ7XyIsFlF4ZFT4EB9QC
	 Uo25a0iUxB6/HSCmHlGDNn7Nx7x3tA1SgT0QN005FvLYqZ3Kn3OsFETgpIz+96F61NmgE
	 HZ4N+v2ePFuHJfmKLEM3zraSEZla7I5iyfbRrF1wgXybL4PnvOjQjLib7UF5WRCpG9AS1
	 eHF6zyQb68pV71LgYPuY33TiytEMASgZk/zubU007pfEC43DqiRYyMVczCTgkVgsgo7hp
	 44PtX2Lqk1XuIXpmm6KNaXny4uRuliv0KAawbNXbrF/wvql9xsfuMiaCxVgU/zv+12Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXYk8RVi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E95606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXYk8RVi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1588E1F000C4;
	Wed, 18 Nov 2026 02:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969049;
	bh=CPr3svibvd1U4dcTkD14lyr1VGsTvkn2BSMaTJqGAD8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=MXYk8RViH8fua0hsxtSnRRLBCccNLckeoap1Koo3tJ84rjwecP6dTZQgJKarK5B6C
	 Bc4NOYFkKmZNDPdz6Mz++WzoVGFLpvvUqvx4eQC9WfHQx/Bgh1Y59rlaQogpZ5x7To
	 olBuoiz2lCvpiJVj4g6yFwRO0j9jP5CufFKhSeEjaSnZmhohUB/drebJ0BjtxYpBfa
	 LBeA+gInSR9XooFl25riEbKJMbqF98LOdIhwWzCqkJKyZINBCdY7xFEraU4PqdiiZ7
	 NXbSg9wNnGKYfJVhxwZdNBVAbtHGEieHc/rFOqxtTYPuTNbWKYFU54US8J2dBPJnmv
	 tskARrmjUOkgg==
Message-ID: <2cbd40e4-40ba-47f2-affe-2bee44bddcc2@kernel.org>
Date: Wed, 18 Nov 2026 10:30:46 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 20/20] f2fs: enable subpage block size
 support
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-21-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-21-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> All paths now handle filesystem blocks smaller than PAGE_SIZE, so stop
> rejecting a superblock whose log_blocksize is below PAGE_SHIFT.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
