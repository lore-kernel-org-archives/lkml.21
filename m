Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593065;
	b=kfoxH/x8tQc9ZRmVO11JOxe483nUShHQe8kaK6qmYyzjy1DLrbcS0ygSB/Iixmi1m7kO
	 o+XhC+tlR2hFF/+WBKkAJnCxSzYu+I8bdW+V7r12Ut1XBrGOUumSKxIr20TChsSkZb+vP
	 TOkIaiFLCQhzuvJeimLEYXmsa/Aqn5ru4bKoJbRzwIrppeIgUoL/+E/O0sTyKSz/wJA/G
	 FDYig5gVWZevimxxWC94E129DFMSRmn8ewD/ZXVD+ZnwkmQxZ/XWQgOo86UyxUzQnEkvR
	 ixLBL27qe8VTk7bgNnSpSauIl0aD2uVcgyt+ET9GjpWbh1sj2V8CkWa2IZE8Dzu9FSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CvAjV0S+oO0YGxdmFbKoXiKIWCesLPGwRDNvZl4jprQ=;
	b=Mv7WLV4j2pPG1LMeKpHanbJ/0s6WKlLp3IW0Rs9Y5bCdWHvENxWFBS9U6lYphApz+rBI
	 FbE1WLzXR6tT2vvIaCtbCnns82awGaAGfltzpMXFwg2aztp3gPY2+LBGAnxuGzXaE17lL
	 keLM42FRa2MsfNDVbSxsh5NfUgYuFyaUP/tX706UQXBrRAVDqgW+ItTcZsLxZlzNpbNH/
	 08VlsWVcWhAznlCptqeBdQKgZWfL4kZHX60P+qoPdRQ2FALnDiVEaNJ3Mn0dyMYRIZpwO
	 low38ZjBFvOoItw/OMgaz8qMHjBWsQ84Etikgcsfw44V9hcjHoFTvK3ULcvLWCwamsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFqko7p5;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC8D606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFqko7p5
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3b411059cd2so1230520a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593065; x=1796197865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CvAjV0S+oO0YGxdmFbKoXiKIWCesLPGwRDNvZl4jprQ=;
        b=zFqko7p5m+zohQoNl5FgNLHWrDGTuOAae/lxM/3iRDil0k0nCuKQQ45aIyogl4s+eV
         2eBdL+zTBhWLsOHDnJbwqKioxMih/+IRCgGQ7sI4Wh/OMjzf2GDVOAFHoPsZIwUbV7dI
         COWuQFyYhMg9cg5yOiHmHdVMo7KDfjZnnN8q3k8yj10oKjDDR8dMr85xDSd5OSDxgllK
         lHmHNVFEosZbtynQVfCIBUr8LZp5d5mHJmB5xQC2TaefiFtdLjs/06tz9R2aPFsYN9YL
         YdAB6FwSApuk5qQktw8vr4pzVnszotzkAUTzLB+VIeb74DUajvQTUThFW/4x6xaXzNlO
         uDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593065; x=1796197865;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvAjV0S+oO0YGxdmFbKoXiKIWCesLPGwRDNvZl4jprQ=;
        b=m2KZLXI7wedDsk/Ke/dqUZxWR3GBUl+4q7fwqOdbNVwDzyp/YOhDhkwi8lJ/1erAxh
         7OvwZfPo2gXzb3jCay/r/q8D1+kTdt41e7s/eXEJjzJzB0D+wiwQi/3VN3jrPm8wp63X
         M7n0846GNf2/6kyGSbaXHS/c2vm9zR6QxScIcmLmSdM63+KddCbvFN1jNZSbh3iHgb+w
         hZruXPFX7eIbCT3UfSfWiw6ItGPOSThnKVtxXy1in2IFLSybq8QxPkHwwnJhtXSXrV1w
         uKULkUq4s0+5Xm7A6AA4NFq1qgsmbWOnPWcMu1MeT8V4P9sjDWBd5pdNDBED02zDhFwd
         vaiA==
X-Forwarded-Encrypted: i=1; AL+hErGaNVSHckG4eNXpuKz/LGBLc1sDOxaRtjFL39LSwvpUO1qb4VFKAdOPgnn+S9maktesRfvX1fKxP8MPU/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KKN8Op7T61OuTnQrzF24FmMFWaZIBCLYgtKYoN9qoDGAA86l5
	iBuWnezEvpIQvvuFn4cXy3iyFMeWXkwA5HhlCv+ehhriBfLIZIEJsgyp
X-Gm-Gg: AZFdTZebGlRLcD8F/WsrFlj3tg74fXh1gw4t1r+wJHocvwSCniha/jS3lac63P9HJSn
	Ickb4TP381kT5TiEYvrsJoXjyP4sz+kv4OT1M409vLSF8kPIk+I5aPS0HYybPOcbAIXdf6mFGez
	2eYgfuZ18CSKGUfDExug8JC7hZHvrH+16p50LH0W4qZd7Q+ziXf14radN3Kh0uSPCMxyT6fEg1W
	TjmXdIqWrMwBb0syKUZhxaFzCluGOyh7Nh8VVScsfGIViOpuyZooKJFLNgzcM9IX6fjclGNo+wo
	9wEzIxWT0W8KhST1UgfJ6u+aQp10/X0jJsTztBBxplEHz3CwPmPK4Lc58hu3qNeG/xSpk2v95Gu
	zD9+NcCVPVoRbh1k5J+EWgbtWV3oh+7OKF3YARYwg8UIMnwMg8pfW+SU6xokgY3KbuJJJZZsLLt
	uL5qpV7qopTm9nCeElHdp1jlArG96bs9LMRCIgMG655i7r0b2fvJNG1CqPGAuBsWUM8Q7jXjLH1
	nf82I8XeLBeGdDVJ0124aYR4xdEGGIwjTO9uEwCMf2Pw6NLGzagFlu3DfcWbbwY/W1wO+MHg7Ia
	NvQ/iOVcoyZ1WUvrQ+B9kyPqXw==
X-Received: by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b41caead33mr14614340a91.38.1795593064735;
        Tue, 24 Nov 2026 23:51:04 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm12341521a91.4.2026.11.24.23.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:51:04 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Zixin Wang <w1355457260@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Documentation: real-time: Add boot parameters and task isolation section
Date: Wed, 25 Nov 2026 07:49:43 +0000
Message-ID: <20261125075037.33630-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <awXN9RY3x5xEGFe4@lx-t490>
References: <20261124163202.56921-1-w1355457260@gmail.com> <awXN9RY3x5xEGFe4@lx-t490>
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

Hi Ahmed,

Thanks for the review and for pointing out the scope issue.  I have sent v6,
which moves the runtime tuning material out of kernel-configuration.rst into
a new Documentation/core-api/real-time/runtime-tuning.rst, and keeps the
configuration guide focused on Kconfig options.

The existing CONFIG_* section headings and anchors in kernel-configuration.rst
are unchanged, so the documentation links generated by kconfig-checker remain
valid.  I ran the preempt_rt rules from your v1 checker (reconstructed in the
7.3.5 tree, since the tool is not merged there): all 12 generated
documentation URLs resolve to anchors in the built HTML.

The C-state, EFI runtime, CPU isolation, RCU offload, and interrupt affinity
content from v5 is now in the runtime tuning guide, and the configuration
guide links to the relevant sections.

Thanks,
Zixin
