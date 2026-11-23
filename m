Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445306;
	b=taccr2xKKDrO2/r+b4s6e9UJ2Cq3eAxN/uZtt8Yxd8Ayh7CHerwbx/msrzN0taUG5Ni6
	 pzGXiMGwMHu3p2KursqgaG5cFEcHEqPG66BoijhRwNsMt9vLvPL6fvQ9mcjMKCS/6twU6
	 RhIyVq5w9opAMawOe5SlbcLVtwWWzgRLRv0fy1zfqFotoQu0/P8D0VlQn+ps0IlFD1SdD
	 SwdS1Waxr9LOTfsH2MXbL+f5WTaYDXhsituNbqkeQ7gbgsYf3RLvdtamFI24EjmkPFG5c
	 sADA6/YJZZO+IEuiut1IXxJCCFIlBd3rfF7uaXmN1d5pn3TA7qC04tZ/hFtphAeVzaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445306;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WJ3P4mBUVy41qNcxI7plDsGfTdz3BhWQQIugrNMcZRc=;
	b=2oIQ5OJDzKP9FSwZUFIubM91EBUFsCC2hs56uVPVBLXV+D9f3Pl9qCG1aAGBJrq4l1fW
	 B77L8WUwnhTOToJkJ+vnS5KRXqKySqOP4EU10B5I0DesW2CaSCtowfV4hZ+9gSKW1ySK5
	 RPluOz6mp07tlnequNChZs6LFAk3wzOV8voP66CCmCzy2USCCroHtBLaRAchRFyoYz9qT
	 /wjM/jeR8nR6we06ByunR7EN52m+GojPD/H5qnu9pnAgp/rbBMB8YR94usuR+Iazq/fhE
	 wz3d9SRfg4uDRAyxtNCmSyQcZwLAYjw6KUuBL8lfT33Uv028mhb0sHlzZ71tfDLqyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQzoRCH4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23386606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQzoRCH4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1FC1F000C0;
	Mon, 23 Nov 2026 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445305;
	bh=WJ3P4mBUVy41qNcxI7plDsGfTdz3BhWQQIugrNMcZRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HQzoRCH4BdAdPYRHQXArv/qj4IGGIGykWokCNRMIgp/SdNn+qeMBjgOoRVJkLCgvC
	 pv2f9XCF/58/29WtKNsTwKNpSPdpn51eazUR1G4blpwTaWVgSR/ByKkVBxfWZyqeMq
	 tV1QWZ/fJ133l/Josnqmd9h9iB4/lISzgZpQ72alvT3h0NjBXhV0yoJWtU+prVWxBR
	 8tsqjBIOzsGPKtybB2stL854tYpi2f+Ircge5iHHSqilfMxrWyGIctT6GKipeEMRaL
	 rx1IWsdyAYI3UaZX/FGclvu0K8Hlnujn3GhLFvDnBsdJb6QJwryfnAIG1Tz94/ePAj
	 0oPosEg2bVnLA==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: vbabka@kernel.org,
	akpm@linux-foundation.org,
	Hao Li <hao.li@linux.dev>
Cc: kernel-team@meta.com,
	cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slab: don't set SLAB_MAY_ACCOUNT for KMALLOC_PARTITION_CACHES
Date: Mon, 23 Nov 2026 14:48:19 +0000
Message-ID: <179544526759.3606123.1000047458494853310.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111125628.375624-1-hao.li@linux.dev>
References: <20261111125628.375624-1-hao.li@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Nov 2026 20:49:10 +0800, Hao Li wrote:
> An allocation with __GFP_ACCOUNT set (without __GFP_DMA or
> __GFP_RECLAIMABLE) is redirected to KMALLOC_CGROUP and will never hit
> KMALLOC_NORMAL or KMALLOC_PARTITION_CACHES. Consequently, neither of
> these caches requires objcg slots in obj_exts.
> 
> While KMALLOC_NORMAL already skips setting SLAB_MAY_ACCOUNT,
> KMALLOC_PARTITION_CACHES still carries it unnecessarily.
> 
> [...]

Applied to mm/slab.git for-next, thanks!

[1/1] mm/slab: don't set SLAB_MAY_ACCOUNT for KMALLOC_PARTITION_CACHES
      commit: ec81fa8f7dbcf89d9b4112544f76f47c8eb5c725

-- 
Cheers,
Harry / Hyeonggon

