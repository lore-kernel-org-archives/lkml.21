Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477121;
	b=d2rkOunX8WLKOiZEK8F3MRR38wzynH5h84MVjtcWqAJ60lTT9GYv5ki22GepX4ahIz1O
	 xKXjGzzbh4YirvlMIQiyxek2V0zoqiKzO/Aoq5Fh2b20yD8FzMWNjBLL9KPb9DCO5A3Py
	 tgn/fwZSQgMYLuIr7Ep0SW9DBEGNyXuvJkqaRSh458CP7nTQJpYssNLB+uw5Uy6w9uUDo
	 8DAO6klCCqykdS32vGNTxUy9pFsT8jpsL7PDKdBbfzU+tFifrMVtVuOrD0JbXu4UWd0HJ
	 GvZT0HE5e4gu3SoV6/s47sUf9i1VxIlp+APRYhsZjqvmleLHzEMdeb3PYIo4A8Pc7Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Einr74sQAkzSbj9sKOtqtREzhhtG9m3Nk6hF0w3+ejI=;
	b=h01ma0LPkMY9OJfTohi9cvWQwqQontE4BhK70nXNpquhPutXpxviSVIM42YldMpQOUX0
	 i8rotfg7YtoVvfHFEfczd4Z8C62p/gFy3rPKWPIe6ZvgOffzfMHVgZtKGgwV3gJSqEUnf
	 Thzt8k1vwlgLsXNYxmX1zBg05bbqu6YX2C0fB2duZstBIn/9SHM/wUxWB3NJasLW81z89
	 fQQuQEa3lzC6kuoE0A3aGn2Cy26sTU3hfRQ4m7vwYp+EQMqS9Gpvo/KDQ0M9Dt2bkF+Mb
	 a1oJtIYBSWZJBu4JDWZmD1OERXRf7Zh729Q+hS4XC0hFI0ddQ6dQoC7TEAiUzFopkgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2kDb4oF;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F14D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2kDb4oF
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1815127f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477120; x=1796081920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Einr74sQAkzSbj9sKOtqtREzhhtG9m3Nk6hF0w3+ejI=;
        b=K2kDb4oFcl8uIzhkHqPyyooFU/ORVtCA8gIAQaZ0+/ogLwMZqenSGdt13Q/0FBxG40
         meG9gVtdg+T2gIVESWdJjgBQ5MccPS0J6oFCkR1KHI2xuQiAUeeMy97WrkzlPFIEqh6T
         il0U4uJZiRFADtxUja2zf8M9w08HB9JKaCunP8NEwA/xJ1MQBNcmZXyahieC0Wy2zO7e
         SkbBSdM25sm1TltETJvwMOoYeUi8MFqdJtfHjo9uQSubhZjjnuHC/29gL8mv8Cjx+x0Z
         Hzp+u6geGHGaTZpcyi2nXG1wd9R/59aavLsI+61hxoecXcHCsN776K3m6ZDJZ0si1gJG
         a8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477120; x=1796081920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Einr74sQAkzSbj9sKOtqtREzhhtG9m3Nk6hF0w3+ejI=;
        b=b620/toaK2omacM5Df7TwgHcZrH3qV6YLlJNUUgftZrLQb8h0gUKpsy1MfBqhiZB4j
         4WsKmOCvximsRB0F8iLiefIJLsanI62zqumTo0p/Pz8tMotAnpHyn011a30IaK5UWn3O
         Jjxp/ledvJdeTWNLKyesMXHltZSq/+pdCFbJpmLBHiuzrxI6zytIIJMwb6sUByEb6Tit
         J20ydewahSp6Wx5t/PvcyLR/cvY3NCEkXfwcKFfEmqgWsYNlasYK9I0eHk4UCyiaqTKI
         ocInrJjhxsRJxhUm+YHg4VO1VFO+hPyV1+YqdFR0RQcltW7Tymm4EC2rZQNyu1o41euF
         ySuQ==
X-Forwarded-Encrypted: i=1; AL+hErEa9hbTxAsHaDZ1VxaRXnDUI2Ac2oqXDIjeujtbPk8INZfGgtUy3JlVEVqqv3s2NjU0vrtdCVlDIGKdO3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ho598Y6Rb5mJiQ5f1UmT4USAxtiDT5ga3GXa2cIIyAHcJpS7Z
	YYC0pT6I5npQNzJYzCW2vFIeEtum5fd9LSN+s7pd3UU+AcmBaMcf4vgGiGQvKiH58Uc=
X-Gm-Gg: AZFdTZfTUdRqN80xrxk6YUre1Lyf8QVByb83vqSEF5zldCwi1loBbotjg8fL3ezDgaE
	xU3Ugzf4SaGmgr/xneS7H3zj64oCBfZRXYHbexUvar1VnTcSCI8Z5egknnvTCV7NJV+J0Z8okDe
	WMIcWiWxsinsZcIt1PdMiepf9xekKkihFb0fF3TpxP+e5bBxP3WHW+Wk4beUtYvOdZtgHcLFTyo
	Y6Cjnzx2kHaBa9pMD7OT4L2q9Ls8z0/jXd8aUp8/SkdVb8eCMksqG3PWDg8QBZWChHsjEMR3gpk
	Bwxv+KT9EDv1zHJ8jNSsDgzeIBl6ddDukSjwb1ZVRWTWoNxoUactUi2chBgLW2Ptb9y1a/wzq/8
	OYBVqMkfvJ+CqqsMtj/9qz1BIKS0HFl1uaerC9ygRrwuJVtFn3ZGNkHihAtYw+F02Ryn4nEMzdH
	+OtMk8eUaLHmh6rlrTv7Ul9pPAbEckDNnsi7a2UuDlwDeKWQB2QDqOvyzD5W5fdLvyxAvebx377
	1hGZf0yqd3mV+UvhfLt3m4bjn3pd/M2rI+6Q/tT0yLYSjum4YrVCIl5PrnHCDynqjAiY405GhtW
	HogApemXidzLrtzRPxzQxp3+37qrYfs9B0pj0NVRHkBEB5jBJ/cFATBCZ7NL2oLr5kF5xNBJrg=
	=
X-Received: by 2002:a05:6000:2902:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4b58a524c2fmr5339919f8f.13.1795477119458;
        Mon, 23 Nov 2026 15:38:39 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da883.dynamic.tele-ag.de. [5.61.168.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm22701252f8f.23.2026.11.23.15.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:38:38 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: masneyb@kernel.org
Cc: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	andrea.porta@suse.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: rp1: allow the clock provider to be probed again
Date: Mon, 23 Nov 2026 23:38:27 +0000
Message-ID: <20261123233827.61587-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179545567027.246915.947299820828330388.b4-review@b4>
References: <179545567027.246915.947299820828330388.b4-review@b4>
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

Hi Brian,

On Mon, Nov 23, 2026 at 12:41:10PM -0500, Brian Masney wrote:
> There's presumably other drivers that will have the same issue as well.
> Rather than having drivers all try to fix this themselves, let's see if
> we can fix this in the core for everyone. Can you try this completely
> untested patch? If that works, then you can take it over. It will need a
> kunit test.

Thanks a lot, it works. I tested it on my Raspberry Pi CM5 (currently
6.18.64 with the Raspberry Pi downstream patches) with your patch
instead of the clk-rp1 change. Unbinding and binding the RP1 PCI device
again, which oopsed in __clk_register() before, now brings all RP1
peripherals back without any warning.

I also wrote three KUnit tests for the following:

- registering, unregistering and registering the same clk_hw again;
- hw->init being restored when registration fails (-EEXIST on a
  duplicate name);
- a parent referenced through clk_parent_data.hw being an orphan after
  it has been unregistered, and reparented once it is registered again.

They pass on the CM5 and on QEMU x86_64 with KASAN. Without your patch,
the first two oops on the NULL init data, and the third reports a
slab-use-after-free in __clk_register().

I noticed two things while reading it:

- clk_unregister() now writes to the clk_hw. So far it only touched it
  through ops->terminate, so a driver that frees its clk_hw before
  unregistering it may now write to freed memory.

- hw->init is also restored when the clk_init_data was on the stack of
  the registering function, so after unregistering it can point to a
  dead stack frame. That only matters for a driver that registers the
  clk_hw again without setting hw->init first, as the updated comment
  in clk-provider.h says.

On the CM5, clk-rp1 also keeps a cached rate per clock that survives a
rebind, so I added a small clk-rp1 patch that resets it on probe.

I'll rebase on clk-next and send a series with your change, the tests
and the clk-rp1 patch. How would you like to be credited for the core
change? If you add your Signed-off-by, I'll keep you as the author;
otherwise I'll use Suggested-by.

Thanks,
Joshua
