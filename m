Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260718;
	b=IYaOvE7i0bKrkJRNcraRFxjEjDk2KutfYSSd7wP5ctFN+XEkRj1rdjJEjf/mmEhR1Ld9
	 m6Uf+i3qO0LJ/qKunlsnlRFwds6523d37HhMwMFFzqz/z5kNeNyI1H0bg5qgxUzoW+nMJ
	 cer2gTnL9LdlnKCA6ZVBtnSrTvw3Q0sDpOZArHI121RK4tzcVMqBhjG9IXH0j4MT14RlF
	 y4ByR1OhqrCtOBo7lKuKclhPKQBMMqATvRsq0j0davUX6mQHiAumVihYDwHHCEv024Shn
	 u5511D8D1SJ6NeaYZIbDxCA9Iq0R3Ew4Sry3obuK+CeN2MpI3Y2nBfLNp+jd9r9Fd7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uJoUjIzEXNDAEnMIiFt3mSA+8sQT++LiAspTJMDWhHo=;
	b=B0tukVa3RiHOVounvq9Dif4HckgFhfMiLy9BupYDibHXCz2jsbjOvXWnZ8fnYNlMcToY
	 slN+0oixs7OdOGxW+Dm4eDQ/j4pNDo0sHTPEIu7BOVR1s/sGxx2LOOVCSZQfn8lQF9RLn
	 8pmTF4zLX2k2bLMgN2D2p78Yr4K2EPdw0ynQpTYzjzaaAQIkeYx7XgEHvTcPUUoo2PA/a
	 oHDEy7vyu1PtjM0TwueWCdT5Ho03EPOvyJpHE7Ukv0zAzrPvUaTI6UZ2HVnXnM3oicNVB
	 fT/YJ7QYqV67gv+1sXaaAD/NUzDPsB9R9P8BLGocBvLAImA6UL7iATk7LHgt3c+287A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBa0FiB8;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D637606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D637606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBa0FiB8
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso992302a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260716; x=1795865516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJoUjIzEXNDAEnMIiFt3mSA+8sQT++LiAspTJMDWhHo=;
        b=gBa0FiB8PsNe4JTanW7Fjep20sFS/J0Lxxjo+fUS4Z29TG8+k8dcKaC+mTrimd06M8
         NCqqzeTcFuaWEjjnU5757rQLxeK3C0VCwKXPqdAT8+kobLrwNMfwsZDFavvDZ/Q3f8wR
         tf/o8FXd4+eSP833CY4cRGeYRBWZwzKFfRu7IGrXu89t/p6TX5zgaVR2/4lTLtxVJa6f
         GQM9xKXIg6LdJmha+5kseGkvP0DTy+Q7u3t6QbsQFH+zMLj/d8y/zFTixyTQqKNw4g+I
         cYN5psGHnDALoyqx9UqPJ34ozKyxRkHN9Nr4nffJlQdsh/sIzJ9bXc9tZSHSPPOt7rEo
         cKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260716; x=1795865516;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJoUjIzEXNDAEnMIiFt3mSA+8sQT++LiAspTJMDWhHo=;
        b=0rHZMXM8kivM2OX4bUCtFwqhlqwn+KUhBZEoykGE4jYmmbvtJS/t11fyPDF2syMIOk
         JvBRCCNQ4SoAqDa8/xGGrg10xhaGRmWshmL7b3wbYxKqrDOawEhNqTGgij6ZPEXqvV7T
         /0KA2/aUnxB2etIchDQPWtKq/RERgeIWLarHf3myqEQR08R1BwLbeEePmUY2OWBN8ro+
         6Cqb7pqleYAiVZNeH8KJXGiambaHIbYmG+YUaSj1JOpl0SFfWeWIbjyeAD3q4h697EO/
         fQvQRBNI/vzi612Gj9ZJyIL4AWGTICZ6A5/a4jCHmh17nCwpgjPUlB98+hwxKRytOWDs
         XPwA==
X-Forwarded-Encrypted: i=1; AL+hErFl9A9pLMNLNNp6aLPABIJXgTUVJwf5vSRh8kCPXgAnDMR+f2XXEpmq+lvTusWSfQrMPnm9e/+oG0Uhfeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LgD3MYvI3K6yAt+uHKop4Rh5I75UNk9uo0uqT4krjSi+Oeo6d
	T4tCmCv4zzILMBO7QQGHxyzcRc07UrpAdh62nTufUdiLGnBlI2s4q9GMXIMrNw==
X-Gm-Gg: AZFdTZeO30gXwjSjK3qJfZLLifVaywRasE7yv9aIQSDDZjcVThp/eOSHV4x4W/pRGvt
	fzBuVTWIUthcKlzqURpO5VVSww86cxXw+eOnq1qBPmoL9dTdPwKl87dM5UlQxosEZA2c2Yj5C3L
	DcD6/7yt9TqCu/SLIc00zYbfnoU3QJqEADPiFT255lICepJLecOX+51k85NXVzbgOBU1TiSH4Y2
	tU98npOjBS4yoj8/mrZ1nfOEXQ+dIEDd2f4d2dBGumcRZVhuR0v/pBt7rYww4Q2znwx22xky2fJ
	WT5mDUVE/MJ59xKVwuJhqtXePfbexp19DMNweKjKDuEvNSEl5fnu5ZIyXA3tyi2uk5x+oDwAxhT
	0HaH2X76vIJ6flobgCbQ+rvZ9XLuQqq5QFL6TNl3K+gB4FHBb0bnW6HO1alt68+hQNWsFLk9gWJ
	feMmGlUwRJiBHuKlIxCZLjvKQIame9VMsnQJbk2lH1rLq5L/yHsAaO8QT33xZkD2KE3kRSvud5y
	HchkoWaVfr1cCWq3XkTqMUlmiJZPzbOX65RxCamR5ge7jaUT6HAlJPon89z5nz9t//dHZyCE7qx
	0ehxKEV6tAWkf2GJu/x7SE5XrBvuXPRo7RGHWks1hA==
X-Received: by 2002:a17:90a:d885:b0:3b4:6094:2f9e with SMTP id 98e67ed59e1d1-3b4609433d7mr512432a91.46.1795260716393;
        Sat, 21 Nov 2026 03:31:56 -0800 (PST)
Received: from [127.0.1.1] ([220.196.193.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm11100535a91.7.2026.11.21.03.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:31:55 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] verification/rvgen: validate the monitor type
Date: Sat, 21 Nov 2026 19:31:27 +0800
Message-ID: <cover.1795252297.git.chaosheng.qu.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

rvgen takes the monitor type on the command line and pastes it into the
generated monitor as RV_MON_<TYPE>.  Nothing validates it, so a typo
produces a monitor that cannot build while the tool still exits 0.
Monitor.monitor_types already holds the accepted set; pass it to
argparse as choices.  Patch 2 covers the rejection next to the other
error tests.

v2:
- Thread the series; 2/2 replies to this cover letter.
- Tag both patches verification/rvgen: and capitalise the subject.
- Patch content unchanged.

Link: https://lore.kernel.org/linux-trace-kernel/179447882046.254241.15114935256138596418@gmail.com/
Link: https://lore.kernel.org/linux-trace-kernel/179447882047.254241.3226415982233977960@gmail.com/

Testing: make check in tools/verification/rvgen -- 31/31 pass.

Chaosheng Qu (2):
  verification/rvgen: Validate the monitor type
  verification/rvgen: Cover an invalid monitor type

 tools/verification/rvgen/__main__.py           | 1 +
 tools/verification/rvgen/tests/rvgen_monitor.t | 4 ++++
 2 files changed, 5 insertions(+)

-- 
2.43.0


