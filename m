Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195668;
	b=thjr5pSMhhVo30htybi/lKNdSIofAXxshoPa2eNCKi3+0s8u63WZhGnlHsj2JIhWvvzF
	 DnJXpKvk+fOc742x5vOvc+pCUe0psEJVYyZYBl2XrNrMtoJsRxZCdm7NzBh8nFtN1KukC
	 m3a0fmF2E1rwCF5c8Ee9mXQCh236LOPRS0xp1/f2B0Zyq3VDllZvwe7O7E4O06D0xj9UZ
	 7biV5b4B91yM4c9MYhp6+IdF6SYp8r1C23JEOcUg+q2a+k1is+F23HFjQ6zG43DfhubG7
	 caU9ZjIjG3fVcqRI4WIU/TireApEG4Az+g8EGK3WphAsiWc9dV0ikVtLadZF/Q5iQ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
	b=vT2XZc52lcDdvYvW1IeNAJP7q89nFMJYVh94AHuQl6sh4qI1BcFruEanZqIh0uI3y1lc
	 AgoDg3lb2y2sNJmGB2UHZLIyC6iOCXT0gBkXD0UR4gH1IcBXEpzvYwe+TIjwI5ImShExK
	 DWNa+WtUAHSlzRsYgaqxanAK21msm0vsTXxTY9dCjg6BhX559UG+jzKxso9xLrFRbZTqj
	 lyuTuV7DeSyMBkMrg3kia2kAZEGvt5Ws3pfPgCzuRQIgxpnVx3vMgwE4fgdnDPGkQj2XQ
	 AQHhJZdI4DsowUGGHnc/RaufdGOOWdI5Ez+bn9sYATNE/IErwCpyMlTFEaz6b4n4AoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7d1Z3rc;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25B3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7d1Z3rc
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4e4a4d77e5bso1643878b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795195666; x=1795800466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
        b=r7d1Z3rcU80Ftfsq8u4pPrTWtL5a2QJWqXuQn0sj5yw3f7cL/WZIG5XkJqNSOm7qff
         Fa8lXfMkaa18EL7CIrW/qCDwpp6ppb7YhXJWhKglUiMkyISqXdbV5etgPGa8r83fq3Wf
         jaNDGMk9n86YtTvhK54DUNaoGCJB1NSWlmeVo/49RbzwcdruJz0q9d2h8MfFncGLVuOC
         kNcvMS3t/mU+onD2BPtS1Bx2k6dZsaYrkbzaDUhkoWfsUQjkcUYe9XYWs1p76wbLpqGB
         5UfF3zsUUnkQEztUqvvSSS/U/rXiO1/8yM/RA1ayotKkQu8k1ljxL9kqhCX84QLJg4p4
         u0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195666; x=1795800466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
        b=YWKHA4EUSn0UV5ctNC2lddX0KOWuAdRNr5e/7HjxyOMsjkZkCAAeq6XGGHHC20Ravu
         bnYuSO0+X4zvrpj0rGUF1MZDIwMajD8gsGtjFK7+vMIklpaHOToOb63fTbM1bEBBTtvH
         1hk3jOKuy17ksJlgAQcEFTL9qDMELA10ERa9bjZdMuRKgACTZwVQiTx+2na1TBxCuTSJ
         ZmUMgYXEg+QsK7+Nr6B3xqEfNgwBWmsmjPPZVHnsoe3i1fDxcNt86muPbY73ptJLAd+g
         VhwHq9hlhA9iLixmxghSltRiGCUQEZ0dYrfG1E63QC52pIb0n/ZHRf6icT7uNFKVYMLm
         nnTg==
X-Forwarded-Encrypted: i=1; AL+hErHaYpvfpN/q0jihey+Nb8pajWuWoBeaEFsLhxYnz96mAiNE6NcIBDyW0GdrOnRJyO3ySOdMZFVmxR6dvNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z84adWN4e2An+L6kRkgg0yu2/641UHpJ6vGFIf43DiCCDJ2zVn3
	pDV/YQJei1fYR+KMhWSWZ9MXLWcHkBnR/bWxC28Jah5VHVoz3HPBb8TD
X-Gm-Gg: AYBFou197956MvvIsKzfCqs3TfzyxBfjZTMN+ZEL8QUduyM+dnHlYGZsjJiKn0PlFqe
	dIb4fx6Xn/YP7Y1bB0aum7sh5ufMC/KOfEc2lKzldCYEsG4b+nqmOZ0/qJBsVM91MGVAx4PANOJ
	7CrYr1KFPYmZGnEyUuSZHrjNXOmWphyWWzgMfYyUHM2dJVXxP4b7JMqFrm4ra2pW7xzuFmtlsmO
	hs1Eu455pDtXZkfdZ2h6iaNKmIoGN9EqgtVZO/pKdXDYzov6/EJFM+AiBF+6Lfoij7/c/JxtdeZ
	eSv9yZnx7H76h4Sp53FHBFkFSEAGWqVNCfB/EOiIoq5uWqWVsjL03+RGizi3e3F/073nXwV8z8s
	NBaDxQemw87MwgNa55BlzC+S0W59t6pKGXCJIGz5w3Y5c+w63eV5bzpx2ehRnOgZI/3QPbXPax+
	EB1FRJOygVYdAH4DnnmKCEHYTIJ6TRogFyCshTfZpziVuIwCMu0fI+8fMlNpCTf/oBXr+Uu5Ptr
	fNitY60dfZ1uxXVzD0jSYInPLNYOQ1UkhpGuJZfk/DbojG4t6+UE7TXR+4I26K6set0wihqt7OT
	7Kz37G1ESXLz1qGUr74lu2s=
X-Received: by 2002:a05:6808:4f08:b0:4b8:46e3:e223 with SMTP id 5614622812f47-57a0a113076mr2651142b6e.15.1795195666573;
        Fri, 20 Nov 2026 09:27:46 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm2473520b6e.9.2026.11.20.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:27:46 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Suyash Mahar <smahar@meta.com>,
	Amir Ayupov <aaupov@fb.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is throttled
Date: Fri, 20 Nov 2026 09:27:39 -0800
Message-ID: <20261120172739.1843303-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
References: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 16/10/2026 14:46, James Clark wrote:
> Reviewed-by: James Clark <james.clark@linaro.org>

Hi Suzuki, Mike, James, Leo,

Could this go in alone as a v7.4 fix, with Cc: stable@vger.kernel.org?
It does not depend on the rest of the series and applies cleanly to
v7.4-rc3.

Thanks,
Vlad
