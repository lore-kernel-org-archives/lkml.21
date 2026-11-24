Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507670;
	b=woh6Y9OmuGCHiVliXxyonabDeb4ciMypJAPY0/9izBJJ9n4k/CJblPkonPlsWTjBsgnN
	 OKSXHLRkVIJM6xwKYYyTfUU24NJY1yKelGfGRWzWz3ilbIi0RGxo+ZssDZkwFMAlh1N8N
	 6/h3Z2VLfkj9i1A+w+yDa4VTjqIS+o7W9q3b6LltFQeTgwWozwop5iBrVXEjSge7pvqV/
	 hvNSu+P0N/x5gBtinIrFXznWTJJPmxSWUrpyNGTiUqas/H0ZRqFCsRgRGNtXqhxXFq5VL
	 YaUeiHU7AJB2ROIUCdxY6D5EtQr12LKtwlFwG9OavbV9Ev2j6ymK9qeF6Qi3P48h+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SAzq4Pj8e0zb3UHPXLnIAc9Sz0C1D/vwNL2mT0uaK9c=;
	b=vmB4+ESFe4Id4zWxvh3sx+VGDH2VKEhGVHppN7WW/+qx3V8XMynjsaKzvRc6gYFRzxa6
	 tXzo7IJVLzjKzR7IP84VR0NTXWzxcYXubiA+f5LNunUEo4xMCGyrMSpHyfjlROJByDoZt
	 aEf7LeDg0OnshzWbbeRSKl0TWwENRjYURd4KTyCytxZPiK2/Sj/XKFboKUywd3MAVi0yC
	 dAZzaQxAEyGLClchmdpqvx70VsumgtQSFU6sSEr4OhcEm/QHHn7lUyDncdV9+aIYq40sB
	 nXDy9Ma+B0JwN7m/6AYnC0fzfsr+5ef4YBh7Xr8mDlsObNlAuwib8d+LXTKc9s3xdeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URHcDCqN;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE908606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE908606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URHcDCqN
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso46007325e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795507668; x=1796112468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAzq4Pj8e0zb3UHPXLnIAc9Sz0C1D/vwNL2mT0uaK9c=;
        b=URHcDCqNAj/K1RTMqvqTmP6m6Hstou5AK0HpoYfuZEGc0Wsb42mg6qK87kW8Mv0Hki
         EO784cMZRk28KDzVrHDXUUZHYm+x4Qp9H3Mj0jBUi5TaQk58/aCooJTpv7oXd90yNpvB
         OVgJklYVX/Yzkw+GwX8Kuc8TFoHaIU7yCZEzIA9epj1W/G71WYWfLiKHpixgRK2d9syT
         Mb0vqzsdiHFHlZ9GHg/3z9apyvNlwg+6ig17U4c5nvPQUPfbli9Tusq3/WPFsOPMrftG
         a1kKe+yFSTUFaxDECAXF9WhxQCsAiYU+2QwF2f9e6vlvmJ5C1ACrh2+Nrq6tX/bO9ST7
         bkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507668; x=1796112468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAzq4Pj8e0zb3UHPXLnIAc9Sz0C1D/vwNL2mT0uaK9c=;
        b=1hiRxdXA5E6d303+9a4sXKFAc1WjmZIOs73IKQQnlQzFN6i7RRzWRWqAd3f1bY0wgb
         H3w1uE0JOmOYuq/0Eru/kUydcT1v9Ymciw7hDxlrTCw15yW/neF9VH660JMJ8lT9Jbzo
         0LLUb1wUT/GmAv5iGtWFU1GhfkfDqHpT3+J2bQAab23YgKV/I9znNm8lTzChAbYOKD8K
         D6M+kQweDxYBnz9QS32zpGGv468FmlLs5k1GCIXzwspZD/SuY44pj4h5XW73SFeRV95A
         5iU0+1B4YGxmdh7O33JUbgvdcJ20nBkgrX0BSGvxUZrM3mUAm7KEudTiByXL6HAX52LA
         AasQ==
X-Forwarded-Encrypted: i=1; AL+hErFqyFyHi+uDepbliCFA2nGHeiez7YocGkFfDrcAynryrXabQ6JeSVJ2ZhYPrv/eyOAC+9319Sttp7Gmzvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QqfwDk1OaZTtOeWHBBW5yVOj0weWPII6ihBoCIynwg3BzMLBK
	XU4m6lW7zvrOFPZOH2O4glxntS38rJJZ5iLBYjGzW+qkmE8zyFG6vF6g
X-Gm-Gg: AZFdTZewTSLgkSVW2aUgXPl1+F1smfMHCx2XntMe731Wn10pWUcy8+SVRoZqYlbHWS2
	e0BZDI6GugKGvwvxGzkUSrRd1EJQa5piewiY2oMahPd8IHyP3I8Jj2vqWoqEnB5CPDGZUy5AzkJ
	5XtdP8wW6fflkC1vKJ4k2uAsXn4O1ezZbHk/EUHK++gTjjPIDT6zoqDGuqjW9qNGNABleNBikHV
	qlmCwakPBnvORGJP0zqVTwvfuknWxN5+DhLY5rpKYMR4Pnl9aXFS1bOr2SFsR6x3qFGJeMvvLHS
	PHeH33gqru9+Q458xy7E7kEr6j3VzNuOPyYKLznh1CfdAeoyp+B17xcC0bEqTAY3kQoKLYYAJEN
	LJan6WxSxXxxvxr6Cd/BXkoEJ9BszLHVoWeL726QzSFvltCmIuQWmqaE5c4CG5P8X7Mj4sfKWMw
	QxhjAlcK/BWFCeXL/t3zj8jOm87X0fzxtK1EMpIuWf/TL0I0kTvolAetVYMyrsaIjzX8Hb6Mwmk
	Ly8A7QoPjhihTsLzloM3iA/93SRA2wFWxyu/1hFzUFvFO4o+Bvq68Td1c9VG6EHxpC46HASKlj4
	ynLZxnJPcYF3pdeGfdhGYt7+IqcbBka1+MA/Nfk+J+tnl721bUxDyQlOp28IBFmfLjezFMXscwX
	5QSDbxabcBg9bkz7pBtI1Mz3mpggEvkschhkmRlhEUyCCQD3IHE91W07M7kiA82HFS7uNKR2vjh
	Vnrg==
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr280133265e9.13.1795507667915;
        Tue, 24 Nov 2026 00:07:47 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-002-108-156.77.2.pool.telefonica.de. [77.2.108.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm24898020f8f.26.2026.11.24.00.07.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 00:07:47 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Fernand Sieber <sieberf@amazon.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Don <joshdon@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	nh-open-source@amazon.com,
	Fahad Mubeen <fmubeen@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Misha Karataiev <karataev@amazon.com>,
	Hendrik Borghorst <hborghor@amazon.de>,
	Ibrahim Elshahed <lshahed@amazon.de>
Subject: Re: [PATCH 4/5] sched/deadline: Don't charge core-sched forced idle to the DL servers
Date: Tue, 24 Nov 2026 09:07:37 +0100
Message-Id: <20261124080737.1988-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261112161548.78189-5-sieberf@amazon.com>
References: <20261112161548.78189-1-sieberf@amazon.com> <20261112161548.78189-5-sieberf@amazon.com>
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

On Thu, 12 Nov 2026 18:15:47 +0200, Fernand Sieber wrote:
> +	/*
> +	 * Forced idle was not time available to any class on this rq, so
> +	 * don't let the deferred servers consume their runtime on it.
> +	 */
> +	if (forced_idle_rq(rq))
> +		return;

When forced idle ends because the sibling's cookied task blocks,
pick_next_task() clears core_forceidle_count before the idle CPU runs
update_curr_idle() in put_prev_task_idle().

forced_idle_rq(rq) sees 0 and charges the forced-idle time since
idle->se.exec_start to the server.

cs_dl_server_test passes because its FIFO child never blocks. 

With a 1000 Hz tick on tip/sched/core c47af8566706 in a 2-core, 2-thread KVM
guest, letting the FIFO task spin 800 us and sleep 10 us drops the CFS share
from 5.0% to 1.7%.

Thanks,
Karl
