Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391218;
	b=1vxZt2LEGLFtv040F0fVzjff+sYkSHGJMbnQQPBfPy4oM/J12KDr2Csw125YOhnbyLXP
	 bNtXTWagNeaV+2EDdSevNi/3Gs6RO4VcyTOT5LI0REbp7mbuMNrf8f1/6I31iwkqOUHen
	 XpzvuMj8A7r6IDXq/8MhRRdA/kOZ52zOaDv3mtE/ijbDdk9OxmQneu3ZRyoV/49l6aVjM
	 kiyMUXKu/RCdhVUc5dyK5IrCWctUWdeFgrcr/gsWydl2Hzn+tzp1ygg3jE4seNypTBDw6
	 U2SADPq/dhOMI9wgueoawt7xkqEpDOMzEIpejhaWlildSqg5sjjjmxTtQSeiryXKHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5SMUhQZLvGIWMEWzTIwqLJCO1x/4SePRxnBTKofe0h8=;
	b=1rdQMGGj03KvWjPDSsaXHa/Z9KROo14pGF77eUdbJHiusC7GTu3nz27M+glXKJ3AR8Mu
	 4Sck/gqMwIEK46SA1I6pK22n/M587WSQBukIUxjMkqlGC9G4vk+EtM8rsfllZ41eAzthL
	 1Ww8LjVVOSIsXzQo0P0NgQxujVoryq1a/1b3EHy3zqgmCh8z3FOSP/fC6RkeMbp1ypAPU
	 HSEZCSS+wHNY9WIEMVhCtGGJ51tGW/ZiMZX+lvtIUOBikZAs2LiRzSvZm7tcNpya2BTwF
	 l9YEL8XfB38zwiiQK6d2HubeKcA4w2kSJsxCXqt/ea8u/LrjaLZdSKCroARIzvOjoug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FelwzqAP;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA4606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FelwzqAP
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccca948203aso2658446a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795391218; x=1795996018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SMUhQZLvGIWMEWzTIwqLJCO1x/4SePRxnBTKofe0h8=;
        b=FelwzqAPtTFCbjVrrO+tp0DLyT+8WMkuEr+5+drt7XHK+6+huy4f9a7NNvcGXWndWf
         yOfE/ljy2SETkZATyB+6IExeU8K5LdpdmQvHIRrnBvWfQH3wd13V2oXfl/bHJ1P7Urcb
         zTS2TBP4GqJBS1JKAs/46GegA0+6qvMocvNHEIe1nXmUJdAE6Peh2nHYhqi1eulnMyFA
         MkOr5FeuCVqbD0OKTCikwHucX0GNQ0NHQsaCAR3kNwZFLiDez9an9hqcBKfbA9Gbnv05
         FDINlUM2Tq2MWDJYOgGqlxlVDnrBF68/icPcqWqBMH+E8n28H0ElWzaE4I/9Xq9w037V
         DcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391218; x=1795996018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SMUhQZLvGIWMEWzTIwqLJCO1x/4SePRxnBTKofe0h8=;
        b=MOsGNRvVWYt57pVKuf8lsu2tOKt3a6+Yqneyn41khB3qexMi15Iijm9LWAZYOn7PyO
         zFj0MMWggFtXG1PL26bjjz3fzX2X71bqnpXnO9mVVkHfUoqAScqCbJSPcv/3n57fhZsb
         ajDdr/1BHo3ykW7PEJftZeoDYxYqus4CpVPpK4Cb+t7u8MEyqsyogV8jfVjxbZtbQ6EF
         Mgs5EG/KLz+W030h5leSCBr8cXQboB4I5+1BUXLmx6gVWVdyXOhYR+Xn7aKtduNFBWkC
         0HTiI/PMrrlME53Fg3M3dojKiRBeykVmukeyt/5FsZzF9BExkOUQe+3Lq4BzUkfhKczy
         deJQ==
X-Forwarded-Encrypted: i=1; AL+hErF21lickQCGiLlcMrjZTByp6yT6D4sG1vY1T89zd1rslA0GAnaZdvyjf9tHG+deSwT23eye+bhTvucisb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+fGpx3lrt6d+98c5PC7u0EdZkxxrC5gMg52b3PWF8W4MYfWif
	7HO4+75zQTStUi2l4EGpgTXxk5z78J/t6ISpK/Z00kqx6/vDeTkC5M2K
X-Gm-Gg: AZFdTZeX3vku76q9fhEHDfg0jJIk8I/Co2/rb0cR1uFOKG9LXMgA/PzKSd1zWBDTM1Z
	fG+pqpqrv3NhGashVm1mL0FjVJ1R0hl3x+FaQhgk1/aV+gcQnvGSaihdU/KkGgBmqcNmURZjZOc
	MWKXTzG9cBJ8zq2s5LCSki/51NLx0wUaINt/FWKKhX/QAHb3xGnolr6IpNRmtQttCW5IIxWzsnC
	t4Ge2aw3NhZA/VwWtJTfpMPF/+0RA5Y9Hcwa/92P5Gcroq8SmT2zpPm6r9NSz0vldPR+GXMYqPv
	0Pk+UYwYA0GzU1HMQPOXQLtnSAlOyrpHmQHl/Kwb3nWxIZ7CMzBTFsaLMCIJrHn8CSCW7bPW2+6
	OU0w4Y5FBqe6K1ImWjXgSIGSGi6Y3K8PbusXU4eurbwpLB7Dgc8XnGQ1UbsFB6rdQDoYSVlc62Q
	yfdCDoYdSlbRUo83zEwE+fkcGxGAwYQnOPrVgq1peqxtEmtN9gABAIWNuXESERTrarv0c5giPZt
	YFqo10MGem70r0xFag4z+1E4Jec59Qg/4oP86zjbGsFEXZ7QV54o0I19xujhsqQixAyScYDNtUN
	OAM6i/ZuxTNr9Osu3FrhJayt7mEUiuxwGBPVgDysA0Kwx9swrziPS0XlBxb51yqZB6kyZ27ag7M
	Rad2epEAFR1Ofb1E9AVPoda7A6ISKDfXN+64mKJ1Pv1kOFk6ZYPZ1oz/WFahHwd2lzTRpyRgeS4
	/3
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr8676680a91.26.1795391217624;
        Sun, 22 Nov 2026 15:46:57 -0800 (PST)
Received: from localhost.localdomain (180.36.101.34.bc.googleusercontent.com. [34.101.36.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm15052556a91.10.2026.11.22.15.46.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 15:46:57 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/damon/core: do not overwrite wmarks.activated in damos_commit()
Date: Sun, 22 Nov 2026 15:46:32 -0800
Message-Id: <20261122234633.89529-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261122012222.148520-1-sj@kernel.org>
References: <20261122012222.148520-1-sj@kernel.org>
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

On Sat, 21 Nov 2026 17:22:22 -0800 SJ Park <sj@kernel.org> wrote:

[...]
> > Do not restore
> > it for DAMOS_WMARK_NONE, because nothing sets it again in that case and
> > the scheme would stay off.
>
> Is this really necessary?  If not, I'd prefer restoring it always for
> simplicity.

Thanks for the quick review.

I think it is needed.  With DAMOS_WMARK_NONE, damos_wmark_wait_us()
returns 0 before it touches 'activated'.  So if the scheme is
deactivated when the metric is changed to none, nothing activates it
again.

I tried restoring it always.  I deactivated a scheme by the watermarks
(free memory rate above high), then set the metric to none and
committed.  After that update_schemes_tried_regions never returned on
my test kernel (it does not have the damos_walk() fix yet).  With the
check, the scheme is applied again after the commit.

Thanks,
Yifan
