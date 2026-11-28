Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858879;
	b=pWxxoiWC7+umOmGBxpOOnoIJlXo0jPN0M9IijQy4aHVgZLk0I2JWSwTMLx9eRFTQ0DL0
	 AWRDYTb48mZ1AK06zqZpRYyFbZnL6rQ9COhgtDatyOOBkOucOhwLHL1FOQaej2e1i7bNr
	 Lcuyx4J4A7jA1TS0OAcCNTSJCLnzuatICeI7Qg0FO0AVQSxrRGjtxKmoMBsrvzDGblm+u
	 jPe3XVBf8JXrMhU35BiU8eRDz2ZpR3YjU5TmgGaKSbnnqFSvymWLN3kC3yDn1YZ3g2/ON
	 orboS3mp0vYLCQHk9zXNOrRH2CuUqgkafsit+37Yg5JKJik7SDi1ZrPFrYSoeKXt73Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858879;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=yePN8PrpbPCiSC1tx7kZdmQB5SvKUp1UQQpP2aC4bic=;
	b=ftpQDiAqOTCzXO0r6ZWCoZlh0Fs5DTylug9XDRT2B8N1gAGD59Ul4u6BlDwbXqsI657q
	 JB6FpUB3mQft57nkaSpyu81CKYq0tTBbmgbeStobgBsgy5SfGsicDDtjtwZ6e/UwJCeM/
	 5wiBTcBAWLT+YRX5g3Czlo59U19IpLlbZXMICGk58fN1tXITTd5mG4eueE3wceXeIG1kw
	 EqSR2oa2isxTA88ZuOvpgWAynyB7q/poHUXmW8ClmUj3fTFtkb/cS3PV/x/hKtHcgo8en
	 KaQp/cW9IEg+DSuG6ojb9Av7ATPqzBrOk90zRHEaO6nQjhqV6dyI5FH9UqPmx81mtOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gDUhwJNx;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87215606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87215606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gDUhwJNx
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0807;
	Sat, 28 Nov 2026 17:41:14 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: tglx@kernel.org,
	nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	ioana.ciornei@nxp.com,
	alexander.stein@ew.tq-group.com,
	maz@kernel.org,
	lokeshvutla@ti.com,
	yamada.masahiro@socionext.com,
	robh@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] irqchip: Remove interrupt domains on driver teardown
Date: Sat, 28 Nov 2026 17:41:13 +0800
Message-ID: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa22187c13903a1kunm4b7c333f451d3d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQk8eVhkdHh4ZGEpOGR4aTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gDUhwJNx/10G5WAdgRfZlXHC0rzugbnq06FnMDv4SBG3+/AEHl3t2y2ni2bTFmltlVLhIvbfMClqxFAQprGBrCQPgNoOtS4a4K2S+jbol627KlzMzxZ244DICU9bTC0xE1x2GPC2B6NryPERcYar/k36JT4+9VZRXSVZ9UIT/I0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=yePN8PrpbPCiSC1tx7kZdmQB5SvKUp1UQQpP2aC4bic=;
	h=date:mime-version:subject:message-id:from;

Pair domain creation with removal in the LS external interrupt, TI SCI
interrupt and UniPhier AIDET drivers.

Guangshuo Li (3):
  irqchip/ls-extirq: Remove the interrupt domain on unbind
  irqchip/ti-sci-intr: Remove the interrupt domain on unbind
  irqchip/uniphier-aidet: Remove the interrupt domain on unbind

base-commit: 1aed0e209f0c3bb1f28d4d69c2fc23528d30981e
