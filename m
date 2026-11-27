Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787334;
	b=FhfhQ19xJuuXpD67uRFJusOzNzkVqE8erPngQrpLmm/H8RGK57xGEKth91b7UWSIwovK
	 yl48tWG6ZMQaAqLgO2Vm88tHxrwMNEadvFNBUedSOpx+bNpU5IKh0nHKyzmHZ7gH/FBon
	 Ha5ul0l8Vk4CywkN/bLdHKRqquKz+kFdZVBYwfQr6hREKQwspm1v3dAQVDOWPr39P7AIS
	 GOb2tnx7OGEyf/GPRK4ivBtrnxY15nWU3BUaqnv43P+IX4orjn9h0GWeyzfo4eYjpk98s
	 JlePcXqRan2NGpUYxS3c6QR/InKiwNZMwreHBKg1elHyW1VauDX9mmL8zDrkqCqq9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787334;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TA9o1HaPGYQ9hk9TwiWiYgRLrZATc1mGRJzf2NZUV5o=;
	b=3AIlDWIU7NOmfau+rcLJvbPU7qu453/4qHFkpQh6k5vvw3ehqFONu9AWXPPhzOP/j7NA
	 sy2zby5xewVBpJi2iDALEavrQVpCx+DHWSDdirPjDmHDsEJoyVA764LnYJf9LN3K9zONT
	 l6eSfuultqLnAVKpxSZthsFeaj8hqo/FEZsejD7n1nS2pjB7aiaeGiKMbC+Htgg2wzNhj
	 Db97GkKAMpo9MfnV28rw1lsBYrqsCOJPd/mkcj2y8SMViYdIwvUFHDVZpnWxd/sRWRX7d
	 GRsim1XZ8I6wey9WTpkuyUmikwr5Lnaawgc4q3j8S+0nnQ1yLyo2chsbUuA8vPSDkaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=CJ+hBH+m;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DE1606A690
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DE1606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=CJ+hBH+m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795787327;
	bh=TA9o1HaPGYQ9hk9TwiWiYgRLrZATc1mGRJzf2NZUV5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CJ+hBH+mdPVov1otsLnvz2ufqSYxcYharsrZccdh7+Zr0fxf26/de/6Qwvi8BzD2m
	 XlgRy6cdmIgJrdZU2U8cDfmfheinKnY891SLHaXfW+VNoaQgMXZeM/yPp5TMq/13Mu
	 nXdJMrRr9JpMuEm6/6tCPDR300gjT6qsHJBvMeVyfsBzkHq7FLLeLWUpOHrZy1TUVx
	 GSmVD1zDv2RJIuVk9uAetxi6AWl6POqcrlXz/DshwBirG6q5gna9tQmczHTrav86VC
	 E1QF3hnB73R8u+mmCHNxh1Lbcac6U9/q1Xo4opwPpB/zft+LlHac3VXwLfEIcw7b50
	 nJWpAaIQu/VZQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbZWg3DsBzXSD;
	Fri, 27 Nov 2026 08:48:47 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 34/43] sched/deadline: Cancel the replenishment timer with the parameters
Date: Fri, 27 Nov 2026 08:48:39 -0500
Message-ID: <20261127134846.114774-11-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-234583@kernel.org>
References: <85ae6bb1ce221469c21c31a352a703aceed394ed.1795646914.git.mathieu.desnoyers@efficios.com> <sashiko-outbox-234583@kernel.org>
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

> Can dl_task_timer() fire before inactive_task_timer() at
> dl_next_period(dl_se) for a departed constrained-deadline task, pushing
> its bandwidth release and parameter reset out by an extra period?

Yes. This is the same as on patch 26, and it errs on the safe side:
see my reply there.

Thanks,

Mathieu
