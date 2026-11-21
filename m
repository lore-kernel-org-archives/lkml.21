Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279601;
	b=bW6I2sYZJTPH1BeQK3ZywBeH0Anqkbu1WhMYF1Xz9dW9JnmjeqOJ/3iAwBOnm26K+MfH
	 rvfMrKx41xT4jnmQg6qXLuqdZTbsSIyZUQ3tfQxAi4aoY+e/HOycxzkURXDJ9CWGerxRW
	 8bk/MDx4iTG7fIkAwWWcErtq4FfhPT1CEF36tEJjN51d/mckZvqHEwGSw3XhAZvwOj4gD
	 BH/Rmk5lJYJjoNiNQw8RvreMsy2V1EvNKQld2C2gdh87q8XliwS3UdIcUxH0pC32sJMel
	 zKt/O1UVaj0RP9TQYjEgfNqvUhsQPjda392rjhjgiUxTPA3QK0fS4tBiA6GilxHRw0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
	b=I+aHfsGdQ5Ac05cArDYE6gtDYBzrA6VebEzcJifAAmls36hLLWPTBzmKzgMruUyVapkr
	 bdrGbVbwjbPODLlmMs34qxaXLeeaTyxpTd2451eKLsn+B4n/G2AsbpweNICxSA587NVbT
	 AFrw66+dx2Rf3nEQ1v7dv7+V+JCEjhTs7r1bBRlH2s+aUykd/XzVsJPtUeL7e4JH63wYX
	 pQguWYKlc+eB8YMI7DwtzPBpZBWrZs/3vmYdLRxtiNWpOynhucHGo0FpVXwd5vZC2VR0k
	 ifcyvYON4DMFciD9dzeEM+5LwnSJRiR5p82fnBwQMEHuqXdAglWXrFsz1C8YcoCWaLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JuGADNsl;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E51606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E51606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JuGADNsl
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so289378566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795279599; x=1795884399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
        b=JuGADNsl9TUMT7yDaFS/ab9hGycHQVyzfEYELymbXEuLx0NmeYYvhpljikqtxMqPPG
         ZGqNweZLvfa8mMiCL8QCfUjjJ+UuTrCqgC48uZKPlb9mr0daTQ6yQ56Lq/jq7xZlIhkS
         gO/WOYZovZ/nmV94m+BnEMbh+bqFQiIKCnl6umDl9QNIrepWA4yLc1MkPQCoe0WbH/RZ
         oYDkChPQGNiPzjoYuy7iQP85D5S3sZyW1GsHTC5+9MrD5UUTQlDRD0/J4HZT1XuoBLEc
         l74DhbY+RM1PA98AMIBjHE6CCOt2EQVvI5BrlIE3NPlQWPkpmRV9Nx3csGCgrLiDpGBD
         618Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279599; x=1795884399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
        b=mvuSRfNxmnDGiRqjoeu8/w6f/G70YnN3s17VDmDV0snQmuzvJO4/h8Ujxpj9/zEwZn
         /FXgXRmEZ25fRQ7tspHk46T6ndpPrD+q/q/6Qp26SO0YSOxJTxMRe2jp7r+hurcl2YV6
         XOzU/X6nJgLO9xVP+ENB3K4+sB+HfpzjU4RNZCXoQEniRgP/LNAhKlXasbC/G9scaYsy
         XxjpKt3vBXqiqQr/cOz7yPmM5HRdIWW0zOZEZj1BKAmJpuczBzcZ+YP0ObSaE0q/WJXV
         aiO6gwQ3bKcoa8qMLMkkoaW7TmoiVejHEpoUGwXKFy7WKa2ZcWZq+wTUbUfegjirA77j
         rJKw==
X-Forwarded-Encrypted: i=1; AL+hErGXtHiI+dJVrRtr+lVx+CDhlVlbFVJvva7KHLQpDvGimMlIHESd14tbiCb9kto4ydx8I2YP6wnuWqIqbhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88sfXReBnOhuFbt1N5/wQOHB2fcB6oJ7mPkSpWLjJ0jNNc8IeO
	vs2rT3ZqieFXXYjuuZ8UnuEvxxBXrO0nTzEBBcjrz92ZEVcIysbgk2OvWFVlooF81g==
X-Gm-Gg: AZFdTZfJkdhVl9zG7MKXaLkprUgqZU1CAQvd3pHmeLZKzsvaX9TtDpTEWfBAktGmP6s
	6i56ctPvm6/iERfPtbzi9rJ9Ilw/ccxVIu3X2LJybNADRcKYDaiFkAX2amRM+bmj8dSNyX2F8Cd
	sKdK4JHhDbT79vu6a7MIEnRJhTzIImhp5kE05zHW1tXEo7xPH2btIISWcp4FAYV9h3qHDERCNNj
	Z6XsAagqDKM5vDmWrZe0ETwLP89yeBirGw/0a+xiLNfYL1bRvR0FSxSFEniUSvsEaTKeILMjnhw
	dtAgKFyePRYRrqTCVHyTy7zxQ/lL5SkzTZ/GahAK+xk4Y59bpcAsYQw4uQDC6yV1N0o6Ci3x3eX
	ok4KfqLV5LKzE8vb0ZnseC/ppFyDjAZAXcuNZb87VLCIDfEYefHALlHs0zC9B4iir/ezOD/ZVRQ
	XT0aNdbNS8mlFDP9LR9K8B6elpCnqTUFXY0L27uYACraziE3Ah+4/XLub3bcetQ/goIZJ9ms6YS
	XPpAqkx3g6A60dx8p/uPNPJWv+j4rCf0nvGp6ZX9uBHKuo9MyR3wmViRArLPjplONJ07rbYT4f/
	CpUJbklY+1b9lQ5FtN+3GKRgFdPxuRQNypppujbyds/9DjPzWoBnGRmxVEGqdW+m9YYTtr+rHeJ
	BFS5BCReosaXvBT6J5ep2muHb4hoBHJxa/nJmO088ar/nNtJnFiOjT9KQJWyaMgCVa4uhg1vZg6
	6Po2geReOyDr8gH6S3jThIDIoYR18Dra+mOezBVi4oV4fcFc2Hz4EgopGZE6v4iEqULLEomJuHM
	uxFobzD0rgspg8T1Zmp+/FnhzR9jng3SrToC9Co5ZVLWavcY60wkScEeT094ij0yZz2+IA+l+Ow
	bVCqfVyRWP1ZOE6PefRkB7AfFY3M8zNCRNPA4mmTy7fMUcVU/Ij8HV+07o0j/vGwFEXLPx1BqDS
	/zg==
X-Received: by 2002:a17:906:3e1b:b0:c50:93b6:52ed with SMTP id a640c23a62f3a-c513aab27ccmr426031766b.40.1795279598346;
        Sat, 21 Nov 2026 08:46:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470da3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:a300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm213796366b.40.2026.11.21.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:46:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	kvalo@kernel.org
Subject: Re: [PATCH RFC ath-next] wifi: ath11k: advance the TX PN of keys reinstalled after a firmware restart
Date: Sat, 21 Nov 2026 17:46:36 +0100
Message-ID: <20261121164636.3949260-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210212.1926073-1-julius@bairaktaris.de>
References: <20261018210212.1926073-1-julius@bairaktaris.de>
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

On Sun, 18 Oct 2026 23:02:12 +0200 Julius Bairaktaris wrote:
> Which command or field sets the TX PN of an installed key on this
> firmware? Without one the stations need new keys after a restart.

Please drop this RFC. With key_tsc_counter set in
WMI_VDEV_INSTALL_KEY_CMDID, WLAN.HK.2.9.0.1-02146 still started the data
frames at PN 0 after the restart (1 run), so the patch does not do what
its subject says.

Julius
