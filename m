Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950080;
	b=tpLHV2vo+vPTUgWTwa2hfiUfQJ526Vk86jWuqa4pFBno8UTeh7xxVaF9og4XCGMGR9l+
	 xRpbnIcEyv9TDVxMej6/upeFO31EPhC1QYSHtkYurFlUfC0yhZlCyoJvRxx5TGly8rz52
	 yHRpBxdbF395GKPmaToWerf/a5+OX89nlUQLTEl+oUQdQ46b9Hvme5uwkBehrPZSEi4Ib
	 F2vPsLUp4luy5R4JPkksb1Ogfbis9oKxb+NPyOD9J0rXoZ3ACUHL6/QM9r4eGY/iHZxnK
	 K92tBHtb5yufjf/TM0nZhzyonuBgcP7oJX8bkyLAZU1GrVHzAiFAW7bwabzo1O6f4Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gOmWnIVUUMx6YsAjuSSvOratSZLICH45prFU4/tE+Tk=;
	b=gILAfe1+w4twedSENKaiewrvcR5MKqLEmGd1XgVB3nRNI3gB7l1fmKF32oPN346gVJa2
	 diwhlEjOp3MEbB7uKM9usYwUT1ffrtf/BNegqpXk2rBvS+m90WV9mLw3yREOuX1h9XbGv
	 WoYnPOmWPXRCtGG95YzTdQ8JR8v0p8TKuJA3SQ6EkZ25xV0ndoe2sDz43FRlJB5FxwTmF
	 rrrF3mppJFhvXpPVpTOUauZLZjZFegaU4Q3RYyrptRXrUR/BV6G8txsBsdXVl8hJmb/y2
	 ZlPgUHTFI/OHdmnaaMDYEnVxp+gva11SYHLbsF4dgwu5CgM3rdjR2UH8mFjFnVQcJEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=krYuILsW;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FE3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=krYuILsW
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso93233a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794950080; x=1795554880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gOmWnIVUUMx6YsAjuSSvOratSZLICH45prFU4/tE+Tk=;
        b=krYuILsWHqhA5Gmq9FY8UN0IZeD26nP56MxavkHr6MCBWjGrWmjBYCd9Za4K6QPFHq
         VdVPj4+g5OMw3YwQVoJTC17H8r8wtxnoNxb5g8/JF8RQWj+Kfq1hwLjq88OJwjeSyS/t
         nskWICf1Om/CYkF9tortc/3/c+HAFHyjtUEbSxwyxXBE2CnanaEN4BOgvNWtjGH2tFHB
         085tHqjKWG++JuwSoX0S7e67Jc0PShzi9i1w8RSYwOhyCKBHau5WhouqdM5BFgDJSm/W
         4ySxJE0Xd+66TWbiTgQ3wcCxAnwWrpxCW2ESUSBvAX5y2D36oX7Qwl9FY2oszoaVugCe
         tqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950080; x=1795554880;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOmWnIVUUMx6YsAjuSSvOratSZLICH45prFU4/tE+Tk=;
        b=0fnxq//PBVNILJ8zUOxLtGgGKSYysa3ZFiD9UNgrDOLl+DSIjTLBZ5ffYYMjA/vqLt
         N73W9HqRsnNgzRME7ataM6afLHNesqMBZfhDtq/nrcRI2WK8C0uWJe62Z/4Z0wBbqu7i
         TuHqZAfn7DD2ebn/69TZYouEjNshfOZJOcG2NbeEwmFpAGC1rc6D8zVzdHjzGuayitc0
         HhlAyUbPPHC4KMEzqcmMnQorvtsnPNaABlg7PiinCRCpC83jP2n4DtI0IwDDZlgwLuu4
         trDFLDjBnbvIsCjjWC5oncc/AfZ6Y9ZAAav/tRDEiCGPDpc60Um/zjg0+8ILXvF4eRGn
         YSQg==
X-Forwarded-Encrypted: i=1; AL+hErGt4eEWQw6HT0Ihc46Dld4Dokj+McdCgAdFK1k8X75XByrjTvJ3PCaIM4PDTWa+P2cFZs2mNXA3q5Ssnpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S4rLQ5ML8q+QskeTRsEyPZSatdDd+jbEBFjyFIdXkat0MPMkE
	YbfF7yVszFzfpPxpfowQ/+IfRqHfW/fV7dsdI7+m+ckasnNuXQQJbCY9mLSfBjRM7pQ=
X-Gm-Gg: AZFdTZcf+knNnSxj8Vn/7R7UaG2FoPKucjQTaqHZYoHMUFF5B5xLZon+/hFkMw+7WbL
	SjSJvFWrXJ+riMcnS9odH7/0RSVqIovCBs3glWCMaCssp2/jkm4unSM4EJpDD9SRq/vmK46Qd1s
	EgiGe8sRRzTNArDuXceffKs0Kwc+FCHfIJGt+Of85w4R61Wdk4VvBU38A6llR4RiRzCq0v5ypDO
	Q/5lp2Zz/zzEJeVnPxMBkt/HDxBWz51+wfPj0jw0hwwRDtGuQZZxaRLbp70xO78mvheV98c9mn7
	lhq29nTCr99RjnDfapk7ultmOXHab45tKPWbpRSr0JY5BnPszVsrt+x8CyHgLcO4cZa3+6V3Ec5
	8yWvAUPQNq7YbvZPGItGVISTpBA30AgLFqeKoySpAu/dVTaVitRppdvDJe8hQ/rCO9oeo5Vgt3D
	vfhqmC/htY6YmAQcl7YUR1Uig3W9983N4KYlJV6oXp56uDYk4WbPUMy9t7K0GfVuakgIodPwDWg
	JIE5stiRX9YU3IWY0/YdI8HOlEKmVBlqSLbwKEmLt4marsGPKGDGNyL8O1X2YaedljITVZUm6R2
	pEQ1fSTi0klAIY7heyq+xpN9wIEe7sH721Z5CTQQSyzOdnMOw6KQ+TfRevIUyDx9WnbDR86bmd4
	Q+0eIIYhewRfyZR8AvEcGvYP/+wJ6aBcjRQNp00n5nNsMHNDk4UEx/XTcApA=
X-Received: by 2002:a17:90b:2b4b:b0:3b3:be94:8dd9 with SMTP id 98e67ed59e1d1-3b3d07b923dmr540431a91.27.1794950079690;
        Tue, 17 Nov 2026 13:14:39 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm5772336a91.10.2026.11.17.13.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:14:39 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: michael.christie@oracle.com,
	bvanassche@acm.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: target: iscsi: run the Time2Retain handler in process context
Date: Wed, 18 Nov 2026 06:14:31 +0900
Message-ID: <20261117211431.2132978-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114920.1955697-1-yhlee@isslab.korea.ac.kr>
References: <20261117114920.1955697-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v3:
  https://lore.kernel.org/all/20261117211346.2132827-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
