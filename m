Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787333;
	b=1rbjv+lvhv5XIpjhsZpGbajNfdCs7vykKjBf7c6vZxeD7DPuxeIPbkRDxPlwbGEaR1Sk
	 Xj+Q+FUemWDwmzERDGIxVVNgmEbA1K1OL6OTyWHQKjcL/lrCD1n3bl+zxsir/3WzT0Ie+
	 4KRX4sZWEp9aVK1NdCXngi/0qdDDEEepGBgZkQ73Uycm7aHJiEqLnlhQLDEAaBmir7uPX
	 B8naKZmg4Xul+OIy+zHTg8//loIxAQrEJ1MdQMwoIxkMKGGlK8/0S+GDSnNvWGHqd0Llw
	 eXdiWyQXHWtwt8oMjdJ0545K69pvg6LmrPcW6uUA6yjTkbxQ7xd6on01dJcR3lzHVKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787333;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LWonx9SWofZH7HpXqR71LiMp0otZZf4iBhXMB4Hmx4Q=;
	b=zIR572zr4xa7G5ynilLxJ0SxCMW5fW565mFfSVQQqI+S0QLdkZTZQMbJi/bHiyyCbN8d
	 D4XdCEs2dRKKO63Dx25hGi8j42fC886VZcrXIB8k2thCACRRDHabubyipr7ibnOtxernk
	 kBz1CJQZ/zEQgU5ygbGTUQqIEei7SAmYa+vIBFIhHqQlQmGfcRx96hgpIyjFcWHAVhPfF
	 TTNYzCUIhJ1GxS0TCeXamTZk9hfXbLR7C4ez2aW3C3Wzpd9b9QFyGgQvUTumUAbAklesX
	 K8MMjv4+HIBBg77IQFZfkGuRXsfaapYWPc+gOqBtYmNmJfMIGt9C2HpdjVPa7Rg1vew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=oxcf85qL;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103C606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E103C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=oxcf85qL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795787326;
	bh=LWonx9SWofZH7HpXqR71LiMp0otZZf4iBhXMB4Hmx4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxcf85qLQuX821Vy5nJtWOtrlGxbEPpwNQeE7YjmuCRpI9pgTwdnf1NiN4u4kDCLx
	 SYV1sioc8CgyP9hxJBxB80QTf3ITWew5KI1WLXgwGoCDbJq5HbHKLyGder/fIwkMx6
	 0OV+iHm89aNzXOkHdGVCTSlqEcM/n9lfiDJAVnhrofPZq+YdS07/IfNQNa4RUhg+vq
	 +Onc3wp04t5CFw0fxX7aIIYkNB9ujmbB6leMEjs2z+Uh0GlFC1u7rLbaP2rvuVKBFx
	 J91I0ZQeWTjEwR/H4UgLRB+exAASdZgdo2gm8bObn99fAt/MnsRe+9JGMb5hrppygb
	 rD0fg1ELAe0aQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbZWf274dzXCN;
	Fri, 27 Nov 2026 08:48:46 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 15/43] sched/deadline: Keep a task in the root domain that counts its bandwidth
Date: Fri, 27 Nov 2026 08:48:29 -0500
Message-ID: <20261127134846.114774-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-234570@kernel.org>
References: <1b7d48df779794ceece2155c0080722932f2c3cd.1795646914.git.mathieu.desnoyers@efficios.com> <sashiko-outbox-234570@kernel.org>
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

> Does this overwrite p->wake_cpu for a sleeping deadline task even when
> its existing p->wake_cpu is still valid in ctx->new_mask and span?

Yes. v12 will keep p->wake_cpu when the new mask still allows it, and
when it is in the root domain that counts the task's bandwidth.

> Does this early return bypass the local NUMA node search in
> select_fallback_rq() for deadline tasks?

Yes. In v12, select_fallback_rq() will first try the CPUs of the root
domain on the node of @cpu, then the whole root domain.

Thanks,

Mathieu
