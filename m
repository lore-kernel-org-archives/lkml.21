Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729682;
	b=DxpJ4nzgX1RExox3C4T1EZrEo4L2HhiFflgNgxByQf+UrthczqYw7UY+9lI8M4zR+hXb
	 OIc5R8/7UIibfIDeHMXlrNLGZ1R3/bMeDwOzz2OnuLG3eEb3otI5OvauHIqOSCZptHhc/
	 N2fBFybt1SNL9Z+Wx3vj+FI1lxFFHEVaAKV20bIygjRh3vyNUl+fCyOqV3qza6sFdnqMG
	 J5iC8rrK/aloTBq5Rd4nNJqS3eABj7Te5JTBmAMQDLvc3VeGuj8GPfBbws2VN1wk3C2T7
	 go+CvAIgvgoMVh1sztYhEqD05Wc85Nh7joVZJ1SOo3grEHjvXy4sTxV0jz1ouL9s3tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=88wO5kQpybJ/beFK+Rs0eIReDQhcfH9A53/2Ga7sliE=;
	b=jRR6x4Gt67/3CPYEntiqtwmlJe4Cspn1JcSuzBBXeeIgSSfBo1axnLbMQvd8q3jE2xTY
	 m2V+ZuWzp0P1B5AO82zAxId1XMz/+MZNoCYSupTuSnDGnqa1L/97aLNEbx962SPSqsi1x
	 ct6C/5+AiVWGxjzAxNOLGkbBwJe9qoyUnwMeo5PbvotlJIzJw7vIhBRJWLt/nLvQ+xuv3
	 ggC4aXMjdb9ebD7hjoXc4vSBH1eZs1IN2MYwQiSFQzNtiyhjJCMATLlLrqKD/J+4E4Qfj
	 mSFunI5PMSBWay9rQaF4ooUzgxOgOFqk8mv9+pmDYLWIR2Z/6X64MzgfsZpnO7y3sfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwUrkFTC;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D1606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2D1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwUrkFTC
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso3796109a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729681; x=1796334481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=88wO5kQpybJ/beFK+Rs0eIReDQhcfH9A53/2Ga7sliE=;
        b=KwUrkFTCKPd6KLpLjFH+lWDV+IlcqS12aXb4Ysyvx1A6729PEeOx/zqr1XPGMzgkXW
         QoHutuAETVZa1JYymPzcPpLdaYZY14csGayQC3PR+7cKOoqBD6C0Ho+JXXp+HNV4p1E/
         JFyxIdWmwQBhyMPa/eBqmgm5fm6NF1FEO1kktYTUAS8OmMyFRqVNN5cRM3pioL8QKlg7
         l/t6q4bcOU1/yP280nrqKPANKbMmbcJZ4uSDqw2N+zcZQzj5g4vunhue6XcuaGbTj7xR
         mQJna0tckJdfFSusgs82ngaYuBvcQj9XCCtcFIR8ACID8/QevBeVOXS2VV7rGR+NMxGM
         ltFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729681; x=1796334481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88wO5kQpybJ/beFK+Rs0eIReDQhcfH9A53/2Ga7sliE=;
        b=PmNkP8iDPgf6DqSPjNbANaoRJKJVLekrn5DHJo0SFZNaj0OOLOnHm2gU05p98WW+dc
         rx9RvSBnaH19UC5feuP7m0HyBr5ikY36Q+ba7/HYwn+NT9Hu6IIcJFGXxtCX0x13Suhn
         SiygXiUILTYMFvQJduDVIETN99FypRY9es3AQQYcbMLCS7ZzBxDwp+484Wz4R8MN9Vky
         kozthi7/woOVwt+xF4ScFD/2u4WExm5AcNE8kocPzggaUBWTRrl/KbO7B4V8Ie2Z+2Kc
         rBSP3RngAWgKqZokpId5LmNOOsQkamuXsNcjJe7gHHDdmzVUmeRKdM63dMEVAUw7kIjy
         LHYA==
X-Forwarded-Encrypted: i=1; AL+hErEcI28dBfGwBMuG0t7R5uIbf/p+Tm+VhN+J6cFnntkfVM7NVRMyyJx4JXcMpQpVHbTjsYJLSDqLkbjm08o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rys49Y2+d2NYJ+x0Nwa7fHjPXPVGgZqyk2NubBhapQ7FyLnZL
	KOQJhUQjEJMo4g1WNDe5QH87aS7avTeM31g6LckvjKVtHZNfugCbqYBA
X-Gm-Gg: AZFdTZfcmuH37WRq6dVBPvwN6c7w1gpZdyUbzvxPlb8F924IQvnvRfIH5efE/08A5y6
	BEpRHCmiRqbsfNcyy8ftoafYGihGQyjLMp6Lk2wLhJ+k/+4cTNIzUe5oV57flmKtG431Ds+hYlg
	OquAgm65MMOnncuNUFh34h8U9OD5InzBTaM4Ie+lo15L74m6OwnvIzGzIPcWyp1mSYES7w0dIMH
	fELzCkH87s7NbdFijqK9kv6uOSY76r97tgUUyUiBMdhlJslgs5I4n2IYyDXg0yOk9hONU4C6CaA
	RVyzEF0y2zcs9w9qNKZ+vkn1E0l63n15J7z+dj/lbFMrIOO5YYGYCG46Our41eHa7vc9JGGKP71
	3bN7x4J9V0O0M0qoxrEowO7XIiw2JV9qI0SKeYFEfrYR/2Td/uP5auOEPnJ/OugWPL2ntBzszPD
	PvKGLl7PBavfaXVxtWX9PPEols/sR/qzXgsvT0k5BPYszmUz2oigmOWPiw34UBpyEue8Ftvz3/9
	IvJKXTZVOO+2hjVAz98KGF78GdTCAcgROwQ8kfkI7Cir6f9Y94PppERpGyePqDcIZguD+q5pUOC
	p1hyJF8mMacqZeAOOPVGCWbqHszc/+Z6yBoehQWSZ5V+Ex/s9w==
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b704:119c with SMTP id 98e67ed59e1d1-3b41c938935mr20334429a91.37.1795729680792;
        Thu, 26 Nov 2026 13:48:00 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm34636414a91.8.2026.11.26.13.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:47:59 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 0/4] ata: add missing newlines to error messages
Date: Thu, 26 Nov 2026 15:47:52 -0600
Message-ID: <20261126214756.39027-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series adds missing trailing newlines to error and warning messages
in four ATA drivers.

The changes are formatting-only and do not alter driver behaviour.

Changes in v3:
- Carry Damien's Reviewed-by tag on all four patches; it was
  inadvertently included only on the sata_dwc_460ex patch in v2.

Changes in v2:
- Fix an additional missing newline in sata_dwc_error_intr(), as pointed
  out by Damien Le Moal.
- Add Damien's Reviewed-by tag to the sata_dwc_460ex patch.

Artem Novak (4):
  ata: pata_arasan_cf: add missing newline to warning
  ata: pata_pxa: add missing newline to DMA warning
  ata: sata_dwc_460ex: add missing newlines to error messages
  ata: sata_gemini: add missing newlines to error messages

 drivers/ata/pata_arasan_cf.c |  2 +-
 drivers/ata/pata_pxa.c       |  2 +-
 drivers/ata/sata_dwc_460ex.c | 10 +++++-----
 drivers/ata/sata_gemini.c    |  4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.56.1

