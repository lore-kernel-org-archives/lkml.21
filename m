Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183972;
	b=bvZCwTo5NKrs5ffYueil80/WA1pNZWTfp+Pg3M7TV0HNYh08LeIUjXlZUiGEoW4OGp+N
	 2xAmswBnzvUJuuWU4bdOuUzwbbRNdwZZ3eCO0UOHymwyKBJhnNirWNTU6hmvkM4zZzVkz
	 2evfzptWWLhmBkgTKxiC6mOVu7ziXbRusDQ34RBxxsdClBa3Ei+5nrwBWmYaR1wRyxeTg
	 Hs+IqykCAbELh1jxUQbwegb6V9Hy2z2F4JsW7Eg/rAS0FJy2rJ31uT9gXREU7DJPph3RM
	 b9XHqWtNIMM4SNDLhmfZDAwzxP1SnqIfUSRtdSIhtctkLN4oIJjy4gLhUO425Im+bbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NRsPqc1sWk3utVGhpgkPro0yilWSwaU21f7Ua9Mar54=;
	b=F7Ivssy+Zyx2k69xeuylZ67HJ9jKDoBL6g2oBtUpDHEHDP+jYf2sZUZ72ZooaXybb10F
	 C/2WBgbcPoJS1Q5jV3btRqHvHF6Jkorj8ncANdQncvV/AuofFb1seToku1wJzS7aD67Ld
	 IFJs7FkPqOzQ3ICGfc+A90JxPvjOGupjpQmJHwCBogSGt99Dl6HVi+azwM8R6CtUBShtv
	 v6Z/jyXXvMAPrCm0P7O1QrQJTDYTk4edCfBPIkbYXsS6z9+00zX1AuMa+GZzVZR+yZ+FN
	 5KOJLCnBy6CQRjzVy6HL/TdDSMKE6YQeI0UL742mz8HYurf3IMeE/R7K4UViq/iB4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=Vj9B4OJC;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89578606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89578606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=Vj9B4OJC
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3866a784546so409484eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795183971; x=1795788771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRsPqc1sWk3utVGhpgkPro0yilWSwaU21f7Ua9Mar54=;
        b=Vj9B4OJCUx7qGlAZwrGAGT4KmwAMBHbSg6b5zwapZ0p40mZKAfRs5eAsuwDTA7e30B
         yKCQ/cNph7+X4ud8ongTzJoM0atCjo5+mi15Ku6j0v2eAWqJMCrtil/ziDteNySh1jnv
         KUTKOatCOs07B2djKWsPFisBl7rC4P80qmHE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183971; x=1795788771;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NRsPqc1sWk3utVGhpgkPro0yilWSwaU21f7Ua9Mar54=;
        b=S+GdnZimb67QmJwLJHfEo9y3XjiIgWqfJu3lkY6VKL/1nQXodtggqA/bi+QuVXWyFN
         tEGDvDhw3IgDB4/5xLUplsS3WzabywLtvQLSZDzhHmb3iyhKPcpV7vjl/iLV3vs8YXD3
         b3Mn1UdpSfNwfrB5ONI0RiNO6xsJoNHXRnxhrDfLelWU+PacUh/d2Ade0mSBZw9k+1Z7
         SyntFAU7M/XIsCiAJBWGe5WzUdbVNKTiwU2s7MCgvmImtxQu3NpfKyJzWa68FUWEAJMI
         3+DNeTJPCW0s5s5E8xdmcUxJg2LdoUNBHqhLTOyZbNEKZYaG/IRIIUeLv0m1p2T+sPv6
         clMw==
X-Forwarded-Encrypted: i=1; AL+hErE1UVlsPD1n3CTkyvPMHqPGwpV3+KwFM5vjjXEM+MUHMnJlc8erJsUkJ/CdwirN8irkmQfKdkYjHJd/F3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H67toTy4jAiM8xhcdylCChqfaTWDNze87lfFHASkMDdTVA5fG
	SDppLnsm+Nl73H/hjfL5ttj5NBZEBRUqmEKW/HYBU/r380mhuQJe1tFBCN+MpUlnvb4=
X-Gm-Gg: AZFdTZekxUODyn/4jkm3EezITPk+3GrO8VnN/UXGhls9qAGcAF3dRTIs2d5lrbCB1DT
	DZeEhFRBUHnc+uj6Z9qjgaVG94G94LRsS+wHBhuiFj59uspvbnprIgEr6+KFdi+O6YYw1f6oazg
	/wZ9xLi35GRPWmd5/sYLHsSiO+/cpWc9MkV71+LxCoRAyRcmwM8w1JOJ/NX9Y7V3f+zUO8hy/ss
	QYjNSLCz2N/YLDgFCj83Z0oYS2fpsspGa2IICm51Wle7NK7zFJFln+gEBzYaEp/47j8wQPAi842
	npghyIqAcIeQlphHcskdLW9BJ1duQZfi5rFRmFurssf2IZ0sKuKoRwhoVKnN6qLiI8JhKNIb29h
	YOR137xwtuqQDaleFqWvhtXTtagdliWApM73SQV13VjlgV+efP/cZNKC8RBt2L1MOf9cCxSY80D
	c0p1OOpf+AUD9o/7DPlklIxA5h7f2LewnY3dsUUyQJGmyuRz97OqULHPE3fkJ4/k5WOQRnJHkkX
	j3ZUUjXnxVU48UqcHtB0LwBdBSZ/nZTrM1aWj/qYNHNxuKQ8WMy4fuLoAjIl+dmB7iF9ki7+I32
	WRs+8LqTRvieDVzycoaU37jXXkbGocE6c7fZIy7gXd5kNiOBHiaLAo6u+lt1pR+nCOcfILNSIUl
	9gSEbQeDrbr4r
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr3507628eec.35.1795183971339;
        Fri, 20 Nov 2026 06:12:51 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm11244434eec.5.2026.11.20.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:12:50 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v6 0/2] accel/rocket: Report NPU usage through fdinfo
Date: Fri, 20 Nov 2026 23:12:23 +0900
Message-ID: <20261120141225.789350-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
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

Report how much of the NPU each client uses through fdinfo. Patch 1
exports the runtime the scheduler already accounts per entity, and patch
2 uses it for rocket's drm-engine-npu key.

v6: Rename the getter to drm_sched_entity_get_runtime_ns() (Maíra
    Canal). Report rdev->num_cores, the cores that are bound, as the
    capacity instead of rdev->max_cores, and skip the key once no core
    is left as a capacity of zero is not allowed (Maíra Canal). Add
    tags.
v5: Use the entity runtime from the new drm_sched_entity_get_runtime()
    instead of a counter in rocket (Tvrtko Ursulin). Reviewed-by tags
    are not carried as the accounting changed. Based on drm-misc-next.
v4: Single drm-engine-npu key with drm-engine-capacity-npu, and
    documentation (Tomeu Vizoso).
v3: Add a rocket_engine_usage_create() helper (Gyeyoung Baek).
v2: Size the per-core counters by rdev->max_cores.

Link to v5: https://lore.kernel.org/all/20261112171144.3151554-1-sidong.yang@furiosa.ai/
Link to v4: https://lore.kernel.org/all/20261103155338.1949294-1-sidong.yang@furiosa.ai/
Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1-sidong.yang@furiosa.ai/
Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/

Sidong Yang (2):
  drm/sched: Add drm_sched_entity_get_runtime_ns()
  accel/rocket: Report NPU usage through fdinfo

 Documentation/accel/rocket/index.rst     | 29 ++++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst    |  1 +
 drivers/accel/rocket/rocket_drv.c        | 25 +++++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 5 files changed, 80 insertions(+), 1 deletion(-)


base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
-- 
2.53.0

