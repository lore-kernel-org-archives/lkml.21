Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186722;
	b=ATIRYL9lf2OD+md15IQbodoLoJqHZuMu3/N5QIflxQUhfDZBk27XlJ8btNHHZDPsH28G
	 Tyw4aDT2eyD+A+OtVqN4DxgTu0n7kWFQeVy+izm0VIVyHYXWH8cL4fc7vkHF+TvRlKw6G
	 hzZk6XaFQe5eZ2a2BKkvcXOT5r5g89OxK0JdV4W6PvU9J7eYAdQQ1p7wNZ6zyCk1EoO9P
	 ezmsdLrmEw7ARJNCN4IEWTthgsD8s163PRJP5Tdiizpgv5P+pWJiY4PV+hos98LzQv0Nd
	 CQVZ9JFXBb8ymVPavu2/EG+hztZq5sdO0uAIGPDTPOe2Bga2uS70C3EcOPbWGEuRu0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XdoRtQhHoyHImXneWx/psMei/x18HxmV1jWcBPR1VTA=;
	b=v98Z2qh1amziBWUHgcv8iuDiR5iVEkl5AGZIFSX31/9lLO25bdF6a/U1pT7lhTTWBw15
	 8ujvc8P4vvtICp6s2bBBBGd5SN0lWX1AoNcnsNU3GV0qR1C8436ug+fEQYh79HwaURjKi
	 hudrtSyLh7c85EdgKrnvCmtgHfYa80vznGBQzPUzzziohYOcDSNGXUgtDOc+jKTQrjKzj
	 Ht4iBUwKxiZKOIEmFwoVec0HlfgssqxHwK0i1/klDRxRJ1XL+u8IUxYpkoo8Qo0DjJtMD
	 7SNnJ8yzeG0zviOtg7cVbgxiCMNk2YbsdjonqnBPqa3RtAS5vKXDdajvA+l3QFLBNBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TAM82AbG;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19B260A260C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19B260A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TAM82AbG
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f04f61282dso2195795ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186721; x=1795791521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XdoRtQhHoyHImXneWx/psMei/x18HxmV1jWcBPR1VTA=;
        b=TAM82AbGbrL6t41u5NLlu7pp/fSxNbY3VEmtbHwc67s7Fe5iIO6uEPOH4AGW9HsEl1
         PqW5FdoV6Dy1jyYEW61TvwRD4KSK7XZFvm5QmfgC7nuIUh/qcCEZGdXl0Wm5isOobxLM
         jZOUtbCJCgfJy1R13t2VpCsza2EGqxaOUwNBzA9CIPXENbaJ8u43KB5/dEKKDuOlyJvL
         n/+FT1PFnGcZ2nNqPD65jO2yhFzGJHiRP8HrjQ3HnMS+uGy90T5mHtA4nm2aArPWAlIL
         yPB9IeEl3WGYP4BKNCpyn6YE34sRCSMfm4OGyxKdyQ/9hflvXSo/TRAZK5NPQ0eY2ZQR
         74ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186721; x=1795791521;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdoRtQhHoyHImXneWx/psMei/x18HxmV1jWcBPR1VTA=;
        b=Ap37q6oVE70QO/knQTNXVFhOOUZfTKfpqj02ZIIaiCXpqlQz4A6DciWcLcp8GMDbDs
         t3eSnOstb3YlM9lEylyCv2C+VRfNTthScD8BR3plWwxP0CtR/a1KWKVLOvCjDkmbFg5Z
         +4qNVGcSX8psXTSMRbuPeDBIfpmP7vrFwfCDgVj6u/cHUr5bj/eXWiBONNXoIbqtyY9l
         uGqFPWD9PHZg7OP7h6G+soCiEAyGSuc/5ztNLaJGeCqLbL87ZwNP9wgNnRy6u8k0xz+j
         DSJmzBXlabjmqcqtpEt4sFb9fFrR1cfHDDUgKMrZRK4OsNqDe6H3ZaGTzxxI8sEs3uCz
         lwiw==
X-Forwarded-Encrypted: i=1; AL+hErHb6TBA9t9HIzabWm6LgJ+tK4CU1HoREOkbqrwnBua4bfBpPQgJMn2haQxDvZS7IAepE+RQwhCarU4EY60=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K6VchxIyGDwpGmVZ0P+TZjDaUfaM7w8kqiixG/d3qv8EaviOk
	ngPg4x67334OsvDSCPTHfWmel5CObAbcHm4WPG1pQqhnBuwZlJajEfYwGkhxQSSdNoE=
X-Gm-Gg: AZFdTZdKvtVfniXbayEK5QXj12qb7SE6dDrpQ6A5o8qLCCRGCEWc6ormUl1OAeA62O5
	QEOxWXiZLjEQJuSNKpboY5GyAYeHWtZDCxpJ68ZipaWP6FBshS69f0kiRqWUBhQQZEPmrE9gTXp
	6nscfue49pTMBroQLoiZ9d35+3HEnnhX3HY28ioXK0YrVJAy3S+OK3j2/exzV98Zqo6zTJ7FTno
	jZQlFim9D2V3Dwkx/WxDR/7btQDH8BXXA5E6ASgvJu3R57XcxzaFeNUxiP0FxH6cj5ssQ5IwxFq
	OjvqO1kC8UQwEv5re9Q4roO44PdZwoAQNc3X8J6wrkU3MrdxVwHehs5d95brdd/AqJ4niNDAe1+
	8EPtnZF+mPqhrym2qw4eZABQtuNcc/zLta1X8LoaugYorijhk/L8RCi5p/i5xnE1HVVNFnnem1g
	M0pYM9MFp3+6aPdwbRuSd7V/II1PMniVkJpXUKoN2rk8PlwvdSoVJlp3ucXmZIemk9e3LnOUf4O
	TgzN4+JJIrxRs+Ht3y/I6p+Yxm75yy+Ej5IWey8IbhQ9HzQnPn+mjnMNsZ9Lu5MNA+J75dI9tnS
	moAc2ALktCLl/1HJCVjem1CwWrdgXstssqitRR3Y6NJMp+aF/uDynKDMHD+2m0yZV7a56ylGs3t
	F2t2fJjeTYiVNXW7G3GrZ9XJa0olhgRBxTH9t
X-Received: by 2002:a17:902:f543:b0:2df:a0f0:6625 with SMTP id d9443c01a7336-2f03f17d1a2mr38645095ad.17.1795186721178;
        Fri, 20 Nov 2026 06:58:41 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f108205sm15372495ad.44.2026.11.20.06.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:58:40 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-rdma@vger.kernel.org
Cc: bvanassche@acm.org,
	jgg@ziepe.ca,
	leon@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/srp: fix use-after-free of a request in srp_destroy_qp()
Date: Fri, 20 Nov 2026 23:58:36 +0900
Message-ID: <20261120145836.3127736-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812190418.200337-1-yhlee@isslab.korea.ac.kr>
References: <20260812190418.200337-1-yhlee@isslab.korea.ac.kr>
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

On Thu, Aug 13, 2026 at 04:04:18AM +0900, Yehyeong Lee wrote:
> srp_destroy_qp() drains the send queue before destroying the queue pair.
> For the fast registration and invalidation work requests, the wr_cqe it
> finds there is &req->reg_cqe, which lives in the blk-mq request pool.
> srp_remove_target() frees that pool first, through scsi_remove_host():
> page_owner records the page freed by blk_mq_free_tags_callback() while
> that call is running.  __ib_process_cq() then calls wc->wr_cqe->done on

This is superseded by v2:
  https://lore.kernel.org/all/20260818035229.505098-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
