Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616068;
	b=Bpfba/yb47VAXjTGU9S2JDElhW2bOaoAUpu3A8BdFEMWzMLaqLM7pgMe4fGYfZXKsCaU
	 vOxw1Bu0X4TFtZl/DLrRmyyVbbqx1bvdwpekKUmtvD5Ek/xAx5vv0onfDspTHEcNf2aWF
	 PGisJpIzpUcl2i+2CibC8sYgIY4IUtjr0MCYJy9gN3/A+qRmcvoQJHaG9RkNTciOEm/bf
	 FGUdcIV4+8p1Xj4DnbrNZDpflCstAeH1ls//BmSGZO9SSVOn9DBp9+G6NBMk2sAKfkK+F
	 RLZqJvArKpjwzNpwilePtVIlL9SDo7o5EC6VTLpBvyJsiTt/NM3wdeg6UgadOIdsdkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=I2DpsDtmwlnqqaorb1yvKqGbKiNq2jJLn9vN0lJSvMQ=;
	b=p9CZGBtWxnAkfJlaw5lOETGsxgD9x0K2HeFvSf4SANtvNVolQy+6JT2xe7r1ep59Rdz4
	 +rEKqIeJiV6NQ/Dg4CPv5UIcclZ/QpCPVmWgB8smg7p1cj+pLw73vckGRrGIX+cGEXaOL
	 7jP/w2GWwhCVw9NTMLlZVftNGv/tiNCNA+DsndYvOwbPg5rvwTFGgZ5fCngquPyub+jKP
	 ZI+0WmSaJUNpoHnfOXtTj3YXq50g2V7iwrwKSuMZYejoMIsomV5qTBWpjCcTjig24lok3
	 yrOuQCp+zKTG2+/6Pwr1pju7pNA+KgtI0qlLBSutqCtz5MkUXjsu05//sft9XBkRtWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDYIHxzo;
	arc=none smtp.remote-ip=74.125.227.198
Received: from mail-pi2-f6.google.com (mail-pi2-f6.google.com [74.125.227.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D87606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D87606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDYIHxzo
Received: by mail-pi2-f6.google.com with SMTP id 41be03b00d2f7-cde0148b2abso264443a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616067; x=1796220867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2DpsDtmwlnqqaorb1yvKqGbKiNq2jJLn9vN0lJSvMQ=;
        b=RDYIHxzoMlHxkFOSAbCfAyeuldO+24TCDP30YQu+Dx0GyHEsW4hucRZrhHtVlXY31M
         Y4F8piuLNlZtiMrOzErisYyBUpe/fwRTFHhbhHh00Lx+bMosSD5obxH0dIgoCWd14IAF
         bgTVBqcngPw8hBgMk9B4bByu2Km4GvT78sKue6Hz57gihXg9ffkxfwCa3adR31WfpmtY
         /zUoswsb0vS5Vko1C7oGXhJFIj9+I5RpaT6kBMD9C0vug/HCPmAzZp2+j3kNm6OdY4c0
         9n6WTjCq0EKfqXXCZNLJB+sf+zkyj2VFlIewiJNbePM4JYHRJt230TT6hmkJZLyhXL7j
         5l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616067; x=1796220867;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2DpsDtmwlnqqaorb1yvKqGbKiNq2jJLn9vN0lJSvMQ=;
        b=eB0XYQDgslCgWvSDKCi1cdWScm0bBvWiPD6d+aNxLorrz74m54ICeI3uWyF01OdgBZ
         LCz3IrqBfrNhD/MfhLDKgcbFHVTgRd09Y7L82SzqT9ddWolOGucJoTz9niuqq05A0XUw
         /LOYKAqMGUqGfgyEhLYsRgFK85Bh+nsEgIYqIDZ8vKon+Gc4zXw+MYCberLO9K5E6cJQ
         zPBN6HOlDG+hpFmUiDTAVMn2k9xjQgrrIwhkEHz3TRVEkvGQkRAy7CJh7+N35cfD6qc2
         jQyAiupFoVTqG6+/QsZQ+5uVuiGqwo8vjSFPzWDJiBLJV5r7Hqi8ghjvCd1hU4/oY92Z
         kfOg==
X-Forwarded-Encrypted: i=1; AL+hErHIU8mQz+9XJpQzSBOqcopLGq1txzn9GWPaCElpQM0x/ix2FrsUvzQda7AfpC7zNAgZKsaxxojNYTr3QrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kcdsOP8vdgq5UO0jkW6Ud25dQqS3AtXrzBW9fPdn/znAmavAG
	FBk72MMwOo6Ly780lurBZUyaZ7hTo5/qfzzBohHTDQGRQtsIaC8Gts0TsXXHggUo5jnB3Q==
X-Gm-Gg: AZFdTZdji50rnMSJPC8ObeYwiCSKxaz/jhfpwbu9ekDXdVwZ1xoRZpvBs2nIyIuOPWO
	eaE5qZwFbDCDPgfHorYZCpy62XaClaf1todBbepOWo8JCyZgv8mg0xLdRg8iYC/viGvkyIgpO3x
	COy1jO0bv5dOH01lCOXIipyJOWNYwCbxHETTeEZF/YC7njAmg0E4lFHejwz//8Ylcn2XAFHL2Sz
	ZHZnDndnlGGAAfe/a+VNz6EnVAAgwn8zhNUTDhKinUOzYnZVNn6e12c+UKF/O+4chUwynAHv4e4
	+qE7rBLHOZw/1utHx6zXhofkzJMVj+GrR5dGE/xbzC1m1aP3xnrWzBgWrs7z0KKyzOZtmyVNQEi
	fWBtUiiaeNOmQd0L7f2tv6zUtj7r798g49WEm3YVACmm/PNU/FOLWGZqDPzDLyEHngN8wjQe+Ua
	Bj0qizQGpSHJElSZ+nCgWM/K+gvvY/9BfZRu3ANNGiyfR03fEpamzMa6Yjnj6Kz8zWUitkkIL+h
	B2z7KY046bR7S/p6sjobvYPPFKlE5Vrdiybl5O0ybsLPyI2mL0/gOFDzNOw5JpmKV+hPL2s2Z/G
	dYdyd8o9UxZzkaAUhkdhI0Rt9PU=
X-Received: by 2002:aa7:9311:0:b0:8a0:3ed7:93a7 with SMTP id d2e1a72fcca58-8c87c38b689mr16164612b3a.32.1795616067259;
        Wed, 25 Nov 2026 06:14:27 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87392d408sm8903369b3a.44.2026.11.25.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:14:26 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: frederic@kernel.org
Cc: Zixin Wang <w1355457260@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Date: Wed, 25 Nov 2026 14:14:09 +0000
Message-ID: <20261125141409.330411-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <awbgq0xQyJATel0_@localhost.localdomain>
References: <20261125074658.33117-1-w1355457260@gmail.com> <awbgq0xQyJATel0_@localhost.localdomain>
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

Hi Frederic,

Thanks for the review.  You are correct: the CPU isolation section
duplicated Documentation/admin-guide/cpu-isolation.rst.  I checked the
remaining runtime tuning content for similar overlap with other
documentation and will keep the canonical material referenced instead of
duplicated.

On the second point, I ran a local QEMU test with the PREEMPT_RT kernel
(7.3.5, HZ=1000).  The guest had 8 vCPUs; the test process was pinned to
CPU 6 with:

  isolcpus=domain,nohz,6-7 nohz_full=6-7 rcu_nocbs=6-7 irqaffinity=0-5

The only difference between the two runs was the presence of
rcu_nocb_poll.  The workload repeatedly created and closed perf events and
epoll instances, which enqueued RCU callbacks on CPU 6; I traced
rcu_callback, rcu_invoke_callback, and rcu_nocb_wake, and measured
enqueue-to-invocation latency (including the grace period).  I ran three
80-iteration guest runs per mode, giving 480 callbacks per mode.

  without rcu_nocb_poll:
    median 4.012 ms, p95 4.203 ms, max 7.040 ms
  with rcu_nocb_poll:
    median 7.003 ms, p95 9.971 ms, max 12.542 ms

The polling mode showed Poll/WakeNotPoll events and no WakeEmpty/DoWake
events.  Thus, in this test, polling did not improve real-time response;
it made callback invocation latency worse.

I have updated the guide accordingly: the CPU isolation details now point
to Documentation/admin-guide/cpu-isolation.rst instead of being
duplicated, and the rcu_nocb_poll description no longer claims a real-time
benefit.  It now states that the kthreads poll every jiffy and can delay
callback and grace-period processing.

So far only you and Sebastian have replied to this patch.  I am waiting
for more reviewer feedback before sending v7.

The kernel-parameters.txt entry still says that rcu_nocb_poll improves
real-time response; I left that file untouched in this patch, but it may
need a separate correction.

The test logs and summary are available locally; I can share them if
useful.

Thanks,
Zixin
