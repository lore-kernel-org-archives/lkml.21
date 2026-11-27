Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787335;
	b=FAAi0qitjOLTxpWfC/+8pfWWp75jdmZEZO36B4ohiibYPMqkNtABXOu9kTh1KMTDlaic
	 9U3ItF4B8nOpQRhUYW4WO4U70F8q9/qMjttqoPOvxZggQ1l16XZv9y5GuK3VCGtMCkdRT
	 e3KrVpiDOf8pPMZwzFkZa/OsJL7Rnj6oKCQrhpaggvIh1Pz7hbiHPLyN47jW/X3clDGLv
	 51yZI/JwXjK6CD3VvcCBUH1U5OA+TTVDxCLyd1Hr51FTTM4o8V7OccVkB4camCL7FC7tN
	 JouKPaINU5LEtpZR2utBS9J6cccW4eWRcQ1bWC7rUH8BTuJRYJSzBlPouAy7Ulzkpdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787335;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uMApDK+8TfYZIJAzU/8/HXKKeBoWrrjUmZ6z7WM2CTM=;
	b=fPaS0McujfM+bdZjvark6B0FYoltGYZcE26nqtKs6bnvnLrJts0YtDX49I2oasMkXBaU
	 lxW45IHuXVfgmUEiBqH7ED10ksVOWoxMrklAZ9gm9IzSB+ibn148LBvc3ma5MHxqYQOrb
	 5HqQgq/B/IOU2VNWrLT7f5EpI7SMM/r5OFgcZa3s2+cxM2iHcSB05uJ7n8onWbWlJvfll
	 ARZ7zmO2cufIhnYw4H5urIQyVm7ml7LmdBg+La8k8gyrhUbbKaDksL5sPNsHaON3QfSL6
	 jUmzYabzb2up9uHbg3q3tML3xCGmHHHhkHhL8K87ivrpEkMB37ILKS3PeVzgb9z4Z3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=qfuog0VW;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93C0606A6B7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E93C0606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=qfuog0VW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795787327;
	bh=uMApDK+8TfYZIJAzU/8/HXKKeBoWrrjUmZ6z7WM2CTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qfuog0VW26fc8rISOdpJoy5nxQwIiFTxbjZikj3hNrAkwbfZrVs2dxN0cJyY+uUGV
	 rxzTAxNASrwQAJJOfflxG47VoWUOfJRHTLnVxvxt6tO+0cVZHfdWny3kGZu0eZTs8W
	 aIOP/GsrvlgzX9c+rD6w0kihxGE4ALDvK5h58oCze5i2eDQKzmennIzYlo3QFH5cYF
	 tY/g1mYunv/wZ1iggMVhfV+LWSLgntA8FCr4YqcU9Deo2sjI3SubK4O01wzUdzLi7D
	 0zZrXSWFqHEr34rC2wGHW6Hc1/inktZYjNV/5S+8MUSzANYoYoPvLRrYsPitp2/pRT
	 uQX3dJZzGjJ8w==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbZWg6Pw2zXPG;
	Fri, 27 Nov 2026 08:48:47 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 42/43] selftests/sched: Test parameter changes in deadline_bw_test
Date: Fri, 27 Nov 2026 08:48:43 -0500
Message-ID: <20261127134846.114774-15-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-234599@kernel.org>
References: <f4340ebcf4ff6e789ad8c5272eb798b3180265d4.1795646915.git.mathieu.desnoyers@efficios.com> <sashiko-outbox-234599@kernel.org>
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

> Can measured() probe cg_p before rr_t's 0-lag time at 500ms and report a
> false bandwidth leak?

It could. In v12, reenter_runnable_in_gap() will wait for the 0-lag
time of T before the probe. That is its next period, plus the time to
pay back its overrun.

> Can ob_waiter preempt ob_rival before ob_rival enters SCHED_DEADLINE?

Yes. In v12, the main thread will wait until the rival C (ob_rival) is
a deadline task before it lets W (ob_waiter) run.

Thanks,

Mathieu
