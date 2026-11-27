Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787334;
	b=oyQdXXji1XcCRvRardv7zFHKwKuey8pURVDD3xEkYh07E+XSMd0gJoDISyy5GQ7rXEzt
	 UpUqF/hwWjFMntzo9HXzkD1fVSNtabW5SDDGP2K/K2/DY+ew7Tb6DIA6eKnS/xfkCVfSg
	 9mc1FrFmyr4U7HHQ+ueK7+youyNYR/KArOPmcRppwnUYY9Ww9LX6vnX932lgUzSvy4Tub
	 jPt7LaKUt2KrQTPNG3CVi/iCEm/TpX+2UeU2oECD2LquEDbXfbCybOBCWpXAG/gVrQAcJ
	 HGhTSzMWVQsNSPyHY8EunMyRv0RMzNRtifQNahUDCsWOHn1M6CGMaU7XSW1Xv3XJTtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787334;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qwPwKmjMqQQQhSgMw5xJtC7JBqnKv6VaeMBWExXMuvs=;
	b=2ogzshSqygDfYzfH8dZEWeHLt2KPnbsnp+snw5rI4srGvicc/dX2F2K7c/A0zplsMwKO
	 LaOf8h7uSzy7H8jQ+tp6YtL5WNloZRTZKhDltb28L5J5+oAgHi4ZT7K3vjWAOmZ4Iq3oD
	 Fp8r09YObhn27cEs8mNPfVepSWPjpCLbVDqNG2icNnjr8kpUGDR+ySYUJnICApyCyIoi8
	 xI3XPWUEGnfyKh76p1ImuUdMP90zo1UIyQ+r1Y6z5M0Asb/DtrYf2Si8aDREVRgNjy0Gr
	 olq+QLf6ywxdpV1KTgunuSWuv4ph7XuUY+pCvvpm1L/2qH5kHlfS6dx+t1ewni93Auw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=AGtONesW;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9963606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9963606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=AGtONesW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795787326;
	bh=qwPwKmjMqQQQhSgMw5xJtC7JBqnKv6VaeMBWExXMuvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AGtONesWW1wgEvpCp+QZF+UxYuDsOaBJ6aJS+F7FCp6brWCUhVs1LOA1OMujcDLPR
	 gpdincj75nv82TSL4VwcFyDGeU0c4lgkXt2aG9cNgVQYnJVCb45OWGuI/mjyzb4s+o
	 y0eli6InoKs9CGctq6xOU7i+2UiEuSOCJfU7rmTayhAEMCM7hXV0hQqLcOUoeXCU8L
	 WsaCJrjDSR0hLGfg0cgmhy/+iW1f4XIIn9MO3s/AziexXiOMAH0vusaqhWd0DtX34e
	 a3fPazrgWh1dqMudjKpNyZr+30r5+qYlrY2i5Igtzq7PqqEQMB3q1IRMsSHqWLmoPz
	 xt2MEl6LUmxXQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbZWf5NYvzX28;
	Fri, 27 Nov 2026 08:48:46 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 25/43] sched/deadline: Count the 0-lag time from the next period
Date: Fri, 27 Nov 2026 08:48:33 -0500
Message-ID: <20261127134846.114774-5-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-234565@kernel.org>
References: <1d535c0c45a21d94ebadfce2883ce8d8b6789c44.1795646914.git.mathieu.desnoyers@efficios.com> <sashiko-outbox-234565@kernel.org>
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

> Can dl_time_to_zerolag() return a positive delay when dl_se->deadline is 0?

Yes, in the first dl_period after boot. A task with no period yet then
keeps its bandwidth until that time. v12 will return -1 for a deadline
of 0.

Thanks,

Mathieu
