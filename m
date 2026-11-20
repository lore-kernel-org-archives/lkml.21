Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151662;
	b=DjoS7Bh0fhsU2Dyv4G1IFW9zYtRmb9Z5XRUO1opT/c1f2KusBL3gpItM/NNzSjGWfuCK
	 Gm5huiifMEFedRYmwWBG9OO4KQdKKCjx6Q6uOh2/wNSaScnfHQJNyn1rs+kw1PaOmVqs8
	 XHZzWJo/RMznYjPLugF/lVh1f0ELakQrD30mNtDqWw11e3uAGpwDXuqe6/oK+3zpxfLDd
	 2oqB49sXEwwKtgyO4BuR/YU9CfzwaLZ+704dSkBp01UoiXKWx4X7alPiohn/q8jrmdzvV
	 CZO5/OXXMn2aVj946rYxhYw4deZ32Ou2jns1ZZ2xBXA3MWVHFx4OCl873WvthgIPiqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nt5EZs18M4zZiQfV3aUfiyS5m61HCPh6kyVQE3PZq3g=;
	b=jguo1Ps/roDJqg2RSKvOyCd7vsqvD5ewkH/5gnr97NvwTRaPo8b2B/rBJFW6ls7X0Ugh
	 KEKF7sKUTnT3WoaWgLPITLPVfxnF9PIGl9PNTPFVxsma/h4/u89vIzrLwPDrQO0Nn+ZoQ
	 r+vEQZyTHXbISBEMjGrXFihMw39pq3uiiu7UcVlwVlN+jwbPH3TxXu4nYHf1cCOz/nx6p
	 yXPQLQ8oPaMWhLw5oQKhKYixC3nFd7NLUWiO6/oRQLL7DiwQw0QeJRdk4NxDF1IpzfL4y
	 dzJNlYa5Tx8cy8UZ3rISUwFP0uCv8fSRvL9wHNw+qFfN4BuD+8nHGWagfgC3vM32uyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRirLGS6;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDFC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRirLGS6
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f02f04a426so3838115ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795151661; x=1795756461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nt5EZs18M4zZiQfV3aUfiyS5m61HCPh6kyVQE3PZq3g=;
        b=aRirLGS6KA1N4RStL0BFcL45rvworOHsAs3NUqLj3y2QwwxNLSCBBU6TSpEz+292RH
         vXq/1O5Ix+FKRJdBCZWZIl9nuipjId0QHjiB9jIotMg+pwj37sivdYyECSUx/9lNmgrm
         XcIdXoJcCYiAEaZnQmuA+9JdoFaT6A11prcpdDtvqc8On+5m45WBN/oMUEAbMKa1/oXS
         XFTjqz4/rtJs7PWM2P+rvPEG+hn4Vh0QyUlqqkvAC4tIpASebynuJSYRTXsDFQJM+4CU
         GkqrOEuvwxWTfJ+GTAo4ib4Fjz6KG4pNNJND4W5d8FncTVGIdseQiRXF+lPkL3c7QKs6
         DNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151661; x=1795756461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nt5EZs18M4zZiQfV3aUfiyS5m61HCPh6kyVQE3PZq3g=;
        b=SqsCx8HLBaFs4RMvzkVv//dedZV2B6VU9qvnqYeUw/GKihjGnoRKquqTxCqUsIF8J0
         /83Z/iQEPfpRvIacKMLw6jqINp6kjxcgDrZIos3+FYnUIOGFmkQl8XR85brlSIFm1Z2h
         p/jmdnh+t6tm11Jza5msztYhyM0SNAvyvM2CO/ru+p5mzix/tR+OJSqozJP6pYCDsW6t
         WvKKF/xbmsV5RebnMLm5/MbsPPkz5K0TLQScP1aPC3XIcUgIRARg50/1sIjyIQ9awoyt
         NxP7moWYR8gQlt5j4lm0ayJyU+gbFDamDqiCoC63dBDzCNAJaf0Rd+MWXH8Jhi5Bcrf8
         N7ew==
X-Forwarded-Encrypted: i=1; AL+hErGbkw9bx5q2o8BhuzCtSnMdSwXwi8U9a9ZxYKeME3kMkQliwpzyaY3A2W6EtP1W92uwjLWJMJRBaqMIyIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nTR2o8thX0hTet9KL/YJ0mKAwRNBf+KQgCO4O8DFQ4gcNTMUU
	DRMjBzmvgF7oY53aobhDjN1tlsGdFAXQ61o/vrCFFVg7vj29DH7WD5+j
X-Gm-Gg: AZFdTZcLTbrZQBB9uiJKEGmGYmHhLNPFoVDGAC+XgRw9pIH+TgS78A8Gi+RKuVxi6Xr
	pnPwC1kAXI0h3B6zhfonZDBOObY7c6YC0KHTnCDp+f+ZDsZnyEfp6U7iVDdDF9WttG8hsPZirIv
	pLTsqflfZ7Tq1CVOpxOjTNsuICYAz7No7VIc7cSxYI3IyTwxv0btYNPrLGKq1xL/J2LqCKXvmCQ
	lWH4/wqZoWj3TtoNli2sKZK8wkeL/e5CVv+I3R6IYapICF5+zLbCVs9Pfk5S9tGpzLAsQCUrch9
	I2tlLpq1b0I26VN2+LLpHqvwS7dN7BTMlOEmHKvKfQx/TjqP+chCsJ119ElooJR/hCMqtDpjUW6
	nBvJupHTH5ZPB4g7gW+KnBSK57VIETeVaEiW2ntp2GWPjRtWzQkKJOgo2hddiq2d3gY/baTvrDq
	RKgfJYZ+5oS0MEa/VyoYRcg0e7wyiDKlJy2FO4xs8UuD5CB3KUwHFzXo8CLVfLby8cXf9GqKDj/
	Cys/QWSFC+IFi9R0qLGimP6uE+yUDzZ9BWSyVYVNpIaV8hI7r6kjgakf4TgO9vo1WSx1j+fabdB
	NB5PwU/1WiwAa5C+SnpvgbhBEmFCJtlpEavkoQynlzd/PDLvh9zzD8ya8Q67S5wNANPo/sk=
X-Received: by 2002:a17:902:e802:b0:2e9:a16b:c251 with SMTP id d9443c01a7336-2f03efb1099mr22074575ad.3.1795151661365;
        Thu, 19 Nov 2026 21:14:21 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm8432675ad.58.2026.11.19.21.14.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 21:14:20 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: Ma Wupeng <mawupeng1@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ding Feng <dingf3ng@gmail.com>
Subject: Re: [PATCH v5 4/4] mm/msync: return ENOMEM if len overflows for msync
Date: Fri, 20 Nov 2026 13:14:13 +0800
Message-ID: <20261120051413.46167-1-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20230321074035.1526157-5-mawupeng1@huawei.com>
References: <20230321074035.1526157-5-mawupeng1@huawei.com>
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

Hi,

This patch seems to have stalled with the mlock discussion on v4, but
the msync part does not depend on it: a range whose page-aligned length
wraps to 0 always covers unmapped addresses, so msync(2)'s "ENOMEM The
indicated memory (or part of it) was not mapped" applies.

It is still reproducible on v7.4-rc3 (65e4fd942), and the patch applies
cleanly there. On a one-page anonymous mapping p (arm64, QEMU):

  call                              unpatched   patched
  msync(p, SIZE_MAX - 4094, MS_SYNC)   0           ENOMEM
  msync(p, 1UL << 40, MS_SYNC)         ENOMEM      ENOMEM
  msync(p, 4096, MS_SYNC)              0           0
  msync(p, 0, MS_SYNC)                 0           0

Tested-by: Ding Feng <dingf3ng@gmail.com>

Andrew, could this one go in on its own?

Thanks,
Ding Feng
