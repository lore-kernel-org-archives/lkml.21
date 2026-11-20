Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174469;
	b=eCTwvNRCl18ql437aQxJWjry6jmLkpFwGmJtkflER8wYg1FT3+d/BzFlTcLUm74+lkPY
	 l4Svv1ohu4T+oTtixfDE/uun+4rs9rpMcUYWJGVpCwpYDRMiWCNYxNJSLZtNg1AegPihP
	 pUvo+5eAaIuV2EbVUyEZ7QwFfrKfZbqJtorydhbUryO1tlFmoh7zQFDjzKKe+cK/sKsBc
	 IBs9Dy0vdQ8OlNPhvmQMSzO7UvcjeE9kzVe+eFLPPAM0Cz8KZosQf1vSN1qxkqi/w9yGU
	 2CEd6t+UsmrBXrVj09vGxIDX6fqNb1L3HofYs2GkI5rOFumQzEJy83U/ATUqKJuFayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=p88I+ufcbb1/OSltaJfPCQVDpb3NiwH1xeR78g2IsYl0FCidMBEcUADKE8I61E5kr7UP
	 vaBfyALNCHV5aowVTgWa0df/JXsa840QZd5k2j0PwX4KOZDT/idXe6TtUyWtHpKkZef4u
	 9ZcnCIIVAOBjiCvT+xeSCbN0eFR1HX2pYFRM99DjyaQcMzjnUsQaetFBYcXpLLOT6sfFB
	 1PKLxQcCNMRWg7RL0uAOnd/BjqUbyTnT5B2IcVS7Vxz04MwL5xhV9CbP4n3G1rxzWIpgj
	 +CzH9ul19XVp5bQTuITr8K0lX6cg0fPn/ce7GyJbiY/M+cAdp654FQAvMK0SqGuhN7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JEjh0Mo2;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9F7606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JEjh0Mo2
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04f61282dso1070175ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174468; x=1795779268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=JEjh0Mo2J0GsDfI03WQPh3umBFOzvFjidFR4Q0F/wRq9gw/lREToR6fv6Ed1SmdVjq
         aIaEGXVO5lH71Uhn+sO7s6PbFMOtP7Ph7MY9NT7YHhni5hO6FdDjR3w8vAvXaEGjxshl
         fCz73IBjqrqbz5Aybo/TpNzG4g6zEvGv4oFLSIw1ddfVNEDOX9qQH0/BUT+Y63pFiZND
         YKAPIYRCSmjIA5MXwFMY6sXc4yhQaJSzTxx02/hQHNPfI6jmBzWf3OUBrrIfYmYuSajW
         cYZf5O2ySA7exWa0uL2I8uss4OWF2FE9uSn9wl5N6FxDQJNtQYhYC8ve6bTTxQZIzm5q
         PhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174468; x=1795779268;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=l7x21LwdhQxhu4sIe4nkmzL1o+hVZ+TQhgayroz7zCES75CUQeMDN8tuHoDgSer+Mp
         nCa3kXH8ElCi/dcXfwXMV4liz9VP/Cgl+1+KUabnH3iecVJ1JCTOjxw+C+loT5dH3U12
         IKmQf2ioKA7dSx77G5G6iIIPwTRMUTRJhy92Hc1LXLNn+5eEUOYQLPbgYkU7rA1YGIUM
         EnzcqRV9+Pb6wS4qyRxikp9SumHGSqH/efHTxoFxsasVT2IpWR8GYHUwuLal5ohlEtfm
         NQHhSw3L/DyrMwFngI+4Eb55VUGD3qu/zs03qfIdbSOwTnqOLeigLz/fB10REDEQsOIk
         Tgeg==
X-Forwarded-Encrypted: i=1; AL+hErGodN1WVFSlaF6fen19ySgTR6wIRpRwr1x9o4duBDpZT1XUELYU/Cl8mLRewKt6gsXM6OV/cQLF7fCh+pI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bc3MCpHJWvxCWgbniTKICo52xa8HxUcY+b7PVUDCWcuk6ayIJ
	aDKg80w4gYg5E/nYA14YqTpE5BtcfXPWzPZpFWtDFHDaC4LPMh0nwnT9xNNquIWyysg=
X-Gm-Gg: AZFdTZeg7HXGzrtrzxJMd45XQCQUpZGsXuuekfXPzJ/6VLMh4uFqq5H1WCshR6oZ618
	trvAptDcLLp+YdWexZ7lYSImj265XczP94bJr8Ky/+sIkhI9x/wFP3GmEcOZzAgR7ESlAkxF6QG
	gj4YvQYHNP9haVNT3q0zyK2BIV/1+PAaA2KEDcd+3UckloRjeyGtEtHrwx+QZoOtA5fyen19YIJ
	Xe71F2ZpIgxwMB4VP3ylpR8769M3qIP2WmMU0fzFFmCDqbz3GdatbDe61C17retFojRTjxvPiD8
	PX5xJHh8KhUHEDxlAMX2lv9XxVl6G3r1cuUZrDvZhsNYhjy4e6jdV4dzwmYvA4hYzZbTaait0N2
	Excxn4+EmO91h3yiqJIWR4rEpceOBxFnXqc1r5b3da70wwbqkShfbWL6QTcOwSRnLH0PlWJNtFW
	LNKF8atKjQqGL6dCpWxOOU2VmkoRAuu3wISLI2tY2OFZAhZv/qhVZQ26onwcq4rgSnRf5cMljEI
	7sulAXj3i6wGC2Rp0zmM6htnrBgrNS1ZOJIrEDJfjUFrXFFwPn3Lmf+tbwMm3Ev6IgpaMrfWGcR
	s9eTXdGkuFd/fKsbR0o6A4FQ5nqm1qkk7ApjvzMJF9TNxKfSii4EVyEDP4WZGG88iZfjjddNhcI
	TZafkJsEbeXPtjseqRtcVxhhr/Qx1J0Q1japWySqJIbe/T+vzIgRzb/zAsQ==
X-Received: by 2002:a17:902:ec82:b0:2ef:f3ce:1e91 with SMTP id d9443c01a7336-2f03f17ce3emr31129885ad.9.1795174468638;
        Fri, 20 Nov 2026 03:34:28 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04913a77csm5741675ad.34.2026.11.20.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:28 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:34:23 +0900
Message-ID: <20261120113423.3069216-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
