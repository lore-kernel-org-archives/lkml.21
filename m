Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071237;
	b=Eppk/BNaPSa9oelLVeTssgfhJ4o5Pm7SowRxMyCgMiBGSe8BQvnhG0XV+scr1et/M2bR
	 QcCJLJiCarqHBwn3571GBmDAq/S6/62SssCWUIWjLV2mNbnzz3FGdZ/vpXbVVsOUUCXD+
	 +FU/7AIk70o02apCqbtPqyRNOsBomaPTxwB/tU2nCfBHxPHKGg//csndTMCQbCs6GCxWL
	 zg12+Y+uWowcyz0f065EYrPlRhKlPhDXglUCMe/SpSPtvtavzpq7rmTOoQ4+kQldCBMnF
	 Pnzhg+K1jShMTthMt/TNFxlPFz2o1yXFt9Mty/Z/A7pPLHLsQRzc8eDjArD0RWIQ4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GNJE6UZ1rBDrjDiT/mTO/LT/Bdfa8O3VHkLcxkHxptk=;
	b=OU39Z4sw1hwNuLbQ7h7iGPi2kCFzb9nLSpXykpm+14cgzU/lIMWP7wDtxBwOP7AeozgN
	 ti+/lgBs3129qneGK7PCI2ztMifZL72/xaz2GUeL1j1ObSVxeAYBzlx4gbrBtYp+r8pUa
	 prfZuV7if8KulaOUujVM7gOLhrcTkk3/Zc11Nizf411e52+vefhYDKCD49+uCtp/+wbkv
	 smTaLOofr0mtXhwDWgd9AwtRP7jxmMY0j4EJATZWTlQOpDrur7SA8k8ILvxIAvyEaVPSZ
	 q12e6Rk940UbQoT7s4bkwMOkIQ4ljrujN3JyT5rbM2KqrGC1059Z9PPq1nm9ulUOBWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Y0qoLWEj;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C51606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C51606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Y0qoLWEj
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ece6c1d1cbso600361e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795071235; x=1795676035; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GNJE6UZ1rBDrjDiT/mTO/LT/Bdfa8O3VHkLcxkHxptk=;
        b=Y0qoLWEjh83JR2RiA/QkN9X7Bza/6m215iROBPLHo2IkpTTLdbUvdTEU1IFsPjmB1w
         2tA6VG52XjM7z/pfKqvG+CFJIC0zhfwOe3+VEGJN1rpAgI6QBhtMIDjVfxMuC1HhfdU0
         s8QRqSx98vUBJZ1GMoi/0eqk+7cTDbBEuWwG5aUFAvF7KvHRv062dxpMH6Ek6zRI01lb
         y4igS/hLwj9yVnEH0ceJxSihwKhybrd3WVkvNNYag+MzEMAEtDpfQxrJo778EMdzRwyR
         1EvKWtrMQuHW9CO73NhiCHRqRa8lWZxGUhzOw9UnsNTPl7/FW/w/A9Npr3U0b1seNzNp
         0XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071235; x=1795676035;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNJE6UZ1rBDrjDiT/mTO/LT/Bdfa8O3VHkLcxkHxptk=;
        b=DbPxZyb9uS6h/RaQLcpXYJRUoxvn6PRQBni7lb7M834vxsypbQRj0GJOQzuMwg6w3Z
         M6LGFUmJsKsMNXWkoVkZ/iXyTNTvMa0Au2Hts1HJk3YGhYpAn1gUSgum62LXJ1sPrkNG
         C2vLQeGf//RwFEh6+TtVAzSHgXazHtN1Qa5G2PG3rnSVZYDbzHv6ZhMWWGzWVLRnk8UA
         hiYGZow+OCTb1NhtDYVToetRQqNGYbme+7+aqid3xbMhpxG4aH2c1Gp3dFl/O08uKcam
         fe1MYz9stVueAWI3yPI+QVAry0AUcCvdoPKbrmlSlv7+NxVy1PC/URD5nhNBjpydq3C3
         ActQ==
X-Forwarded-Encrypted: i=1; AL+hErGBi/jFOzIZLKS16JlCgXQQXRHVmSpmmRmJ5sLXpIUWFELE7OP4jDi5Ro4t6BfK75g6EMnLYYPBxCX8Flc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E2lYVQfyup2jbvuxVfkQCCoiDFFEtjim10FPePE/jCm4eNLHj
	6Bxq9peoWYgN/cwaLDCxAmvPZL1/sCZ70KS3kGm+CT0eiKlygF6nw5OvjGvB9AjyTrs=
X-Gm-Gg: AYBFou2Od608CNYFscDg/k+EFm0RcZ5GhjE3WfB42MSGFBKW2Y5B7pi6z4EpmUtSjVT
	f2SdvE18HNMR2XordnKK2JwV3yQduNUckXTLOcLZICNeJxp6P7u+PMKGAtW/SHsosIVBv3iO7JE
	6TDtx4giCbaBmN3wtXqDejDBcQYFoizcJiJyfsiDv6gnS5H1rd4V/5krWUegjm0xDs9b7QgW20r
	9Ec6t0KXrA6rwXlq7oKOcgKd3cbfrgWoyiafRrITRi52XdwTDwvUeHxh2r+Xnp4M0V+tJYKWQf0
	GosCEnnQ/TJxRy7npsMYB6eaH59IiJGpc6OFnJ+LuZoq7OEpNJ3wDbL/pc5EaG5pKV5TUJKa/Ou
	BEID/kDiVPEqz2+ixW1AQ74xlbbAJeiufuvDK9igQeXgmtaFfgbp6YjiqAWFgBG6UpoK6AAkRi7
	bIx+CvIkK1nVmRYpxbFrT0DPGcxdn9ftCvutzZxRkPRjEY7DU/Git7avb6y8Ll4Taz3yK68CCPJ
	FXaIepF9RKTHFopDvNM4J3xCtTlJsbnJq0ch+xrP/NiAYPTTynNZfwzfsESO1aHngD0zu8p/Uz/
	PJD6n9omwM5K5PTIjFKWxQEYSbpF0iynFZxDwoJmWLryDrRQfAk6M1hhczORJ/xHWwL9mIE2WR7
	/YTeq1IIvNehv9RLJyise4WaBAUs8kqR9jI8EQZxBWMtlAEA=
X-Received: by 2002:a05:6122:62a6:b0:5ec:c162:d58c with SMTP id 71dfb90a1353d-5ee646c8d94mr2473939e0c.9.1795071235328;
        Wed, 18 Nov 2026 22:53:55 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ed7adesm3423790e0c.15.2026.11.18.22.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:53:54 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/2] kho: drop the incoming sub-blob debugfs view
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Long Wei <longwei27@huawei.com>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 akpm@linux-foundation.org, graf@amazon.com, leitao@debian.org, 
 corbet@lwn.net, rdunlap@infradead.org, linux-mm@kvack.org, 
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hewenliang4@huawei.com
In-Reply-To: <20261119063800.698863-1-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261119063800.698863-1-longwei27@huawei.com>
Date: Thu, 19 Nov 2026 01:53:51 -0500
Message-Id: <179507123198.250261.1844561072152549258.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=yPAAYOBOOObp5DgeME+PxCgH3xqwEnbp1bk4PDjGg1w=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq/p0CnroMuBFG1w6cbj8X59tE5O5lJneO9MDj4
 lpdbHwN/SmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCav6dAgAKCRC7dyhM23N6
 3ueZD/9IfpTbNdfM3QFnBSJ+zx3bm2JxD9dV5H5hWe+Gjsh41ZGlB0WnSHEX20Rmk1d5abeMW84
 YuOO5K7r5GSkJRKMvTTacqC2gsAKNdfqmQNE9Ga0TsIUx6HiAtnkCtLw9uR02oz172xoJc4mvO9
 +ZqbgXBHRsVLRs+xIhbKLtgRupLeYNRefvdLlgfYjdO/EvqrXKsRlsp/0kW3yaffoQAvKCsNdmW
 16aMO3CiHE6yaQAN1D3oUdn/8llK8liHPsRBBs0apFi9EfuYvH8w9AdgiNOldeInZFxG3pQ5lt2
 J68ik5kvSGmYv3otuVVHATIhtPCzpFkefbI6TnzDmHQjsOyfAdoBeT+rr7RokoIs40ggiuZWDxA
 zLnpfdyvxylfTyeKBueMX8Ld3bqo8AIIqtoVhuzYNZty9jqG8zbl7FhUCJoAvQXKPlhHUFnwY6G
 HCYj3jsg8dYK/WsOI2Gu4v5CPjLTrlGW5oUPQtaQSzsnt/zLFKTt7EFH9XVT3Zb1ABU4Tdox8Y+
 suCeKE//fMBGowWddh1UZUiThSoAVyasPp/hW3v3sYoZlglqjIdYx9ky+DoCaGj19wrMNL2nFIF
 mY1HnMljaNI4FLF36QYmGhdJvoHC/SNewPtz4kM6nVlGQZym6+GFPOWHPmDV+ClJcKQUMi5Q2kD
 hQHgp+HNhpEYXww==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 19 Nov 2026 14:37:58 +0800, Long Wei <longwei27@huawei.com> wrote:
> kho: drop the incoming sub-blob debugfs view
> 
> kho/in/sub_fdts exposes the raw contents of the sub-blobs described by
> the incoming KHO FDT.  KHO does not own those pages: they belong to the
> producers' consumers and have independent lifetimes.  LUO, for example,
> restores and frees its state in early_initcall, before kho_init()
> (fs_initcall) creates the debugfs view, so the blobs point at pages that
> are already back in the buddy allocator.  Reading them triggers a KASAN
> use-after-free in _copy_to_user().
> 
> [...]

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

