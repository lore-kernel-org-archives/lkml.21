Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271018;
	b=R5nFKcF6PJamU3DYkZe5Au+l4m71goiQPHHY57MapGo400JVqD3JDIR86kkiyyeoxf3z
	 dpdSQfOfNzXOKYOmIKflFAYd7d05YUg1zVRpEeU15IM3pPRpgmtbz2e4D9UCBwoPveRwL
	 qEb/iEr/1ht0TyTEtpIdFpIjCppq1J0hAhDFK6zCj2ck67n5iiLUBnP0hvjqxDJNlJqUk
	 PB4DYjeAvXoxTYefep5kHTtOxB7P/uuL1jBrnRTn8bKqJOZj6mSsV1cafmcTrIq+6DXlE
	 sPrSzNpzifjLByX84CXNvJL/pYtA1HUk3/84NkDcmrKgimlLgsU98l0a3IWOcSj57iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GgpdGs6wYexFLhnGl6N5YwJitX2Rvk/QL/OITtCuAhQ=;
	b=bEdMO8BqHq93oqSHoDSImWUnN/17DyZhmQiinv85ORc+wsl/vrnCJUYOFeiKZhlIecWd
	 TRHwLoDFn28ciIRf8Vv6omHy57rp5Z1s+nZ62/suZbm8I4xI5Jem3fFH7ZCSlljsMI0Di
	 wXe0TL/P9aBRBQjo5MQhAMz/gp1jXAXRcSTYaQAHhaRB2dDJe1kPTjvwh26y6gQhDrn8K
	 VNcjqMhzsGRr90NxHMvPqAYLeMRsNXiWupU89to7It2EZuUaNI3nMXCdZJYy3P6ev13xD
	 vw5FwIaYn4mKVnkusd4x6TcxuUL5eO21ym9SGqeiH7KYbt3iin2bL2mcb/aGeQoMRQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKYaC4ok;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21CD606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F21CD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKYaC4ok
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso1880634c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271016; x=1795875816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgpdGs6wYexFLhnGl6N5YwJitX2Rvk/QL/OITtCuAhQ=;
        b=gKYaC4ok/C2c9lz49B5CysAZhena2jm5Q4lnJiwcV38pm+bhXMSvmiD0LRvYy37stZ
         h6DyiuVQ8zp3ZpMd0hj4AYhsxeIeE8nfSM8o/faZQCgPr2QuoqsqfechgnmywDh6sG90
         y3bD6bDSl/lwQpx0O9BddO+H3WSiN+FkKsvsymXkd/+QXbNa+FNDyxLb1AIMeEcablA5
         JLS5BsUVdlPNBBah6DXVABe6rvysMkxgPKBS+dH6Ed3TR2Tm5znajGlK2jOT7fRiZR34
         1mhNg0B4UdZ5b/rt1Fb1QhLKcqr9iVaZIo9q5ZsVm3eQZMiwJFSkwFsReREVouDLUW90
         YNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271016; x=1795875816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgpdGs6wYexFLhnGl6N5YwJitX2Rvk/QL/OITtCuAhQ=;
        b=yQrQh4EosofyZFFolGeOsK3Lozhcwnlu0d720tUL4iqx9UffMr21yJIgbG0bCN0dJK
         CDJ39W/wVhqJ6oo0Uxvm6HpLG5XRWaTjK+Bkon6s9TTlSLHsyc9CghRrGhpjSOJq0oSh
         mkshyu56ZK94uJOO7tvRcYGylYhRwW2bSryDb7yKBuIP0YHWxTGI7L5CTYDFaAnKEjgb
         Tu70fJkPLp5LJK36TecJ5mMcjFuhB9+iYrcNxCPb5qiqsJ4dJGTwffaGxbXw6P0/Wxly
         4neeclZ+Z7RGr2K/uyoTu6LunWvrBu5Gk+dUTgpFjQvSaqGz3g5z967riyjEWiit53qc
         p14g==
X-Forwarded-Encrypted: i=1; AL+hErHjHAqc5KUzxNKbknKN/ND6in4zf7P/4+g7Gkq2yLJxu31HsI8iRmEtfb0q0GD0INcJHUwqtEfU33v0FPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o03w9p2KpjSRF1MOLZXbsROBiUX3CUNuSeRBmD4DEV/TvtEWZ
	gfvbxwleZT+tpcB9HUXK8pi1Ufj5WFLm2YiZ4t7CYRYT+DVZoApbekMl
X-Gm-Gg: AZFdTZerrEme02zyzyGQrdT0N/kAVRIOqwC4UHOFt89uAnE7SK3UJM4q6/dofBnCF9X
	EGVqJnhCHOtvxdnz/fqNecMWZjUeKNFt49bAf4yqAMp7/G/l1QYwAGjTok+RNDqSfkqqn56vlvA
	3w6hbou07swJd2mzxZY35tQCvZ5BrOkHPxP+2ZxfjUm98GRufZOF0KGos9Jzco4HAwps+MHuSt/
	7GGiUeoDTndMG/o3aa4yC2wxZTPEA8k++wp67PYIQsc8JFULZg9GiEhkkWTWR7qfEujVWYpqdKf
	5N7Aaef9NKfkYhXNrsN3FPOkGBNFXYx+whETCQmIUrFQBw/YBS0pQMYre23Uc3bF6i/h3RjN4Mb
	0egnu1vLljf6eK/xvVBHSZ240gv8JEb/Jvue7pxraV29fMYwW6K9+4yafuUk8BOekisJlB3BDIJ
	G9uL3QGMUVNYwA6+c9j86dKO6b+0Ofjg35PHeQUhsnsKolNEuu9WLcFreDMNDddvOa5bBlQQe/Y
	qU0TgI9yEe8+WHEpYbQhF3TW4GbDCeX2tP98Zby/zXE7qn+o5MXhYJYsKZ8w+/nDBlkmM1Nw32l
	j938osi0yNnltwlAIBlnOh9QDGTCMoDReebzJQ86t2jsYICinIt5vCqyME4=
X-Received: by 2002:a05:7022:290:b0:191:444:425 with SMTP id a92af1059eb24-1b5567c0fbdmr5704524c88.2.1795271015705;
        Sat, 21 Nov 2026 06:23:35 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm15183003c88.12.2026.11.21.06.23.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 06:23:35 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Brian Norris <briannorris@chromium.org>,
	Jeff Chen <chunfan.chen@gmail.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Pengpeng Hou <hppiscas@163.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: mwifiex: validate event lengths before copying bodies
Date: Sat, 21 Nov 2026 22:22:54 +0800
Message-ID: <20261121142254.99326-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260731141600.2-mwifiex-v4-pengpeng@iscas.ac.cn>
References: <20260731141600.2-mwifiex-v4-pengpeng@iscas.ac.cn>
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

On Fri, Jul 31, 2026 at 10:20:02PM +0800, Pengpeng Hou wrote:
> +		if (skb->len < MWIFIEX_EVENT_HEADER_LEN ||
> +		    skb->len - MWIFIEX_EVENT_HEADER_LEN > MAX_EVENT_SIZE) {

One concern with v4: dropping SDIO events whose body is larger than
MAX_EVENT_SIZE (2048) would also drop events that do not use
adapter->event_body[]. SDIO command-port reads can reach 4 KiB,
and events such as EVENT_EXT_SCAN_REPORT are parsed directly from
adapter->event_skb->data. Rejecting skb->len < 4 and clamping the
memcpy() into event_body[] to MAX_EVENT_SIZE would protect event_body[]
without discarding > 2048-byte skbs.

However, clamping instead of dropping exposes a separate bug in
EVENT_RXBA_SYNC (which v4 happens to mask on SDIO). Both sta_event.c
and uap_event.c pass adapter->event_body paired with the untruncated
adapter->event_skb->len - sizeof(eventcause) as the u16 length to
mwifiex_11n_rxba_sync_event():

- When event_skb->len > 2052 (possible on SDIO, up to 4092 bytes),
  the TLV walk reads past event_body[2047] into the following
  mwifiex_adapter fields.
- On PCIe (untouched by v4), mwifiex_pcie_process_event_ready() has no
  lower bound on evt_len: for evt_len 0..7 event_skb->len ends up at
  0..3, and the u16 length argument wraps to 0xFFFC..0xFFFF.

nxpwifi (SDIO only) has the same RXBA_SYNC callers, and its SDIO copy
already clamps to MAX_EVENT_SIZE, so only the length argument is
unbounded there.

Checking event_skb->len >= sizeof(eventcause) and parsing RXBA_SYNC
from event_skb->data + sizeof(eventcause) (as the TDLS parser does)
would fix both the over-read and the u16 wrap across all transports,
without waiting for the PCIe buffer-return rework discussed in October.

Are you planning a v5, and would it make sense for me to send separate
fixes for EVENT_RXBA_SYNC in mwifiex and nxpwifi?

Thanks,
Zhao
