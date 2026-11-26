Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660488;
	b=Wj0lwLeBtlFZKqFiu+7bPBifUbjsDE+1t+YBdW2QCaUGtDgnAt2tIcIPpaNiWwdlK84e
	 YWhFBEjzgfd9M0pOj89XCSwOyTMbWQQ352YmRn78zSqTdCVExii+g/blzaYJksk+mclEM
	 bJ54WWB48UCfc0w6+ZZzebPdElhfIyzGVcTY+ewLMDQ08Vft89WbQOFddjC8nKEsCUOC0
	 4Z+O0dAmmRyS31Vku+tK6SbHcll0boMgJLds91dqg9u/svToi26UjGiwgAZHGR09JLy4B
	 M7JQEC/qMQCiIskbFCX6CaMmr6OTNgxcRps+fDdJ/kR3GfBADL5RWsO6DV0xpxR1feg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=o8J9LgNaOdUC46WHWDlfzHDnkRTN/ql1qdkuGk8pFsc=;
	b=cE+HhvdyKSJBGxXRq445ixZS5awG0JqDi8qJVoxenlWTltR0odZo8l1NXsV3jI8fPWVK
	 pXC+Wq5AUC0JhgyoogC8DQawW7Myh+r6IZF8pdXgx7wvorPnnScoPTJg4kd85x01m4rAj
	 Azj/7wmlkv6nhMoVEiHiUai+MuXtyrxXrYjTQgCsJeSOpzgu90iYvAAsx7WOLVZiSWFBD
	 qqWsTLBfRNzGsbi4AQrfwerqOKrqN2ubKyC21MNDGKJyPV0YxCeX5Ddfeogx5zXKlpkmf
	 kbFJeyOq/tBzL3GpUQNT5O+RsG56zeKV4TB6Uq5me8FE/fQr6Dbgv3pj96hb0jzSoiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DKieMBUw;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DKieMBUw
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67990a45e02so6607646d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795660486; x=1796265286; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o8J9LgNaOdUC46WHWDlfzHDnkRTN/ql1qdkuGk8pFsc=;
        b=DKieMBUwIXK1Du7nNws3K1cWBDItLe9blorA2CHh+HazEu+PARsK+BsD9aOAlUs9Bn
         s5RYV0OAi/qfVnljTPHwhemFInICn7zykTUXCnOU0Y6d5pFh1qRC8FHhrxT0KBeW+rgK
         y6vrpALNJ+E1cqgUHzbBP9EMA1lDXkBPpsJbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660486; x=1796265286;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8J9LgNaOdUC46WHWDlfzHDnkRTN/ql1qdkuGk8pFsc=;
        b=ndPVvh2T4ClktFUbKUdfYLrP2f/jnHirSrUvyQzQLHKW7PdiLCggvF2YekpANrKb5d
         24SNSjM9q+BAVYokUN/BqOdxtKjmz6D+DQf7weZUESw2MAVOV9SEoDaewTtfjeUFNOT6
         tqKUIDwUpBZVK5tSEaIRito+Rfdf+SOXriwTFnWB2eomkBG7t7t7bRfHoDPH6cGHaD0l
         iDS9I0DA+b56sx2VgmH1hCpB1X4rdvja/tLDCXljnv1vKeQsqHWOGOS0fFsICWph1Ny9
         7SGOl5IevCCB7Cde4UNB9oBGH8zYHcSAmGV/AqQYEkfdSzFxILQCupaPNs+SY8cOor/l
         lD/w==
X-Forwarded-Encrypted: i=1; AL+hErGBap1adpqdKXRGe7JAUB0NNdgxmVN6f6hDTa2SQC49qs8oA7cskoSQu6mxg2suz6DZthtIyfaSinQ/Th0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/itGq3HjXUbtwPLdg0M+If3CHsstR6gcTzk5pL5cB8/cejM5h5
	HkaarHjvqyBKl89t80Wu1kd17Iyt7jY2d+wZNxvPgrR8e0TwA+WWRxJDw+qzrwxcGb0=
X-Gm-Gg: AZFdTZc8WNBgeb5wao3LaIa9ezJfYuG62juwE9DeW18FrUTjIM9dpw7eLQxySHZ74B2
	AAScIfvCRNqAXJYdClCVS1+xpaLPg6BedTzAAnY1u/MPVacLZaGSRrP2HVUscYpJq8nVo3orMAb
	Dwi1l4BnTFFOuy+GlWsAljE3Tpf+vJr642KSXpc6rAtV7r7d7uDroNqTtsnXxTQlPbBzEmK9MN3
	Y8dD3DkwlgLLmtxeNTHIKnybZYHNdkgZOWNakm0ApSgEALxySeqDWWMGQ3OqZsevMk/PzthTd68
	Pece3cHQWhyfFXwEPPLdsrPXQz58sLALxF4GGN+gqdAjejZdfiAvToe/iZPtL+ZWGkpgTm02uOX
	bFb340wa2mHn0ib9Uvy9Xg/E7iQwdDarYAMhiu6wwzzrkLMtEhY+fr5N/3sc6gkHQnaaVZUcZEv
	com6e2Lof9oR3RzrdGp4t5lohGx/X7fXcaG06sArxY/yzgaDqNpMqaMaAG1V7fSbjz1NEmEEIm3
	mcYkRC29kfxwnyc/SJL1fz5FblvdJggbHIwyLalo9j1tKypxmpp5w3nKXtaY4zCLSu4mrtzpXRs
	TSHjkNK3oVf/LFGg6sayJ6xdk8NbC5O2M1Jh/oDV2MnPXd6NO19ac94lA+twJXh1mjz4odvaGxa
	kkOS3maiQ6k22yBK5YgthKSAv2gvnrXW98pP9BZK3GcUznsyLBNm64T/PVmnwHk2x9SszggyjrO
	llolFY6PHUlJ7fDOlkHYnB5h5rgboN2WCBOUU4LozJBGN05TNoiDfiFtYoKwWDmAQqZJ5z3el5E
	/Gg6+tD9xCQgJTPKWvB65c=
X-Received: by 2002:a05:690e:4188:b0:67d:ba77:6ef8 with SMTP id 956f58d0204a3-67df441dadbmr6760137d50.43.1795660486244;
        Wed, 25 Nov 2026 18:34:46 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3354415sm9646045d50.11.2026.11.25.18.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:34:45 -0800 (PST)
Date: Wed, 25 Nov 2026 18:34:42 -0800
From: Chris Down <chris@chrisdown.name>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, apopple@nvidia.com,
	byungchul@sk.com, david@kernel.org, gourry@gourry.net, jannh@google.com,
	joshua.hahnjy@gmail.com, liam@infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
	matthew.brost@intel.com, mhocko@suse.com, pfalcato@suse.de, rppt@kernel.org,
	surenb@google.com, vbabka@kernel.org, ying.huang@linux.alibaba.com,
	ziy@nvidia.com, kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com,
	shakeel.butt@linux.dev, kernel-team@meta.com, baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v3 0/5] mm: fixes for THP migration, swap-in and
	device-private smaps
In-Reply-To: <20261123163301.1568240-1-usama.arif@linux.dev>
References: <20261123163301.1568240-1-usama.arif@linux.dev>
Message-ID: <aweawqOejY8Jyrbb@chrisdown.name>
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Usama,

Thanks, these all look good to me. I reproduced each of the problems on
7.4-rc4 and have verified that the series fixes them.

As such:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
